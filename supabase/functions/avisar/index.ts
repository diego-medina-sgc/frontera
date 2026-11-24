// ============================================================
// Frontera - avisar: el aviso de la mañana
// ============================================================
// La llama un cron de la base (migración 064) los días hábiles a las
// 9 de Argentina. Decide a quién avisar y le manda UN aviso:
//
//   · sólo lunes a viernes, entre 8:30 y 10:30 de Argentina;
//   · uno por día como máximo por persona (`ultimo_aviso`);
//   · sólo si ese día todavía no hizo nada en la app (`activity`);
//   · sin números, sin rachas, sin "te quedaron pendientes". Si ayer
//     dejó un compromiso sin responder, pregunta por eso; si no, avisa
//     que hay cinco minutos para ella.
//
// Las reglas están acá y no en el cron a propósito: llamar esta
// función de más (a mano, dos veces, o alguien que encuentre la
// dirección) no puede mandar más avisos de los que corresponden. Por
// eso no necesita ninguna clave para que la llamen, y se despliega
// con "Verify JWT" apagado.
//
// Secretos (Edge Functions → Secrets en el dashboard):
//   VAPID_PUBLIC_KEY, VAPID_PRIVATE_KEY
// La secret key de Supabase la inyecta Supabase sola.
//
// Desplegar: Edge Functions → Deploy a new function → Via Editor.
// Nombre exacto `avisar` ANTES de Deploy. Después, en la función,
// apagar "Enforce JWT verification".
// ============================================================

import { createClient } from 'jsr:@supabase/supabase-js@2';
import webpush from 'npm:web-push@3.6.7';

const URL_SUPA = Deno.env.get('SUPABASE_URL')!;
const SECRETA = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;
const VAPID_PUBLICA = Deno.env.get('VAPID_PUBLIC_KEY') || '';
const VAPID_PRIVADA = Deno.env.get('VAPID_PRIVATE_KEY') || '';

const TEXTOS = {
  es: {
    hoy: 'Hoy hay cinco minutos para vos.',
    compromiso: 'Ayer dijiste que ibas a probar algo. ¿Cómo salió?'
  },
  en: {
    hoy: 'There are five minutes for you today.',
    compromiso: 'Yesterday you said you\'d try something. How did it go?'
  }
};

const responder = (estado: number, cuerpo: Record<string, unknown>) =>
  new Response(JSON.stringify(cuerpo), { status: estado, headers: { 'Content-Type': 'application/json' } });

// La hora de Argentina sin depender de la zona del servidor:
// UTC-3 todo el año.
function ahoraEnArgentina() {
  const d = new Date(Date.now() - 3 * 3600 * 1000);
  return {
    dia: d.toISOString().slice(0, 10),
    diaSemana: d.getUTCDay(),               // 0 domingo … 6 sábado
    minutos: d.getUTCHours() * 60 + d.getUTCMinutes()
  };
}

Deno.serve(async () => {
  const { dia, diaSemana, minutos } = ahoraEnArgentina();

  if (diaSemana === 0 || diaSemana === 6) return responder(200, { ok: true, mandados: 0, motivo: 'fin de semana' });
  if (minutos < 8 * 60 + 30 || minutos > 10 * 60 + 30) return responder(200, { ok: true, mandados: 0, motivo: 'fuera de horario' });
  if (!VAPID_PUBLICA || !VAPID_PRIVADA) return responder(500, { error: 'Faltan las claves VAPID.' });

  webpush.setVapidDetails('https://frontera-bhv.pages.dev', VAPID_PUBLICA, VAPID_PRIVADA);
  const admin = createClient(URL_SUPA, SECRETA, { auth: { persistSession: false } });

  const { data: subs, error: eSubs } = await admin
    .from('push_subscriptions').select('id, profile_id, endpoint, p256dh, auth, ultimo_aviso');
  if (eSubs) return responder(500, { error: 'No pude leer las suscripciones.' });
  if (!subs?.length) return responder(200, { ok: true, mandados: 0 });

  // Por persona: si ya se le avisó hoy en algún dispositivo, no va.
  const porPerfil = new Map<string, typeof subs>();
  for (const s of subs) {
    if (!porPerfil.has(s.profile_id)) porPerfil.set(s.profile_id, []);
    porPerfil.get(s.profile_id)!.push(s);
  }
  const candidatos = [...porPerfil.entries()]
    .filter(([, ss]) => !ss.some(s => s.ultimo_aviso === dia))
    .map(([id]) => id);
  if (!candidatos.length) return responder(200, { ok: true, mandados: 0 });

  // Lo que hace falta para decidir, de una vez.
  const [{ data: perfiles }, { data: hoy }, { data: compromisos }] = await Promise.all([
    admin.from('profiles').select('id, lang, onboarded_at').in('id', candidatos),
    admin.from('activity').select('profile_id').eq('day', dia).in('profile_id', candidatos),
    admin.from('lesson_state').select('profile_id, compromiso_at')
      .in('profile_id', candidatos).not('compromiso_at', 'is', null).is('compromiso_hecho', null)
  ]);

  const activosHoy = new Set((hoy || []).map(r => r.profile_id));
  // Un compromiso de un día anterior que todavía no se respondió.
  const conCompromiso = new Set((compromisos || [])
    .filter(c => String(c.compromiso_at).slice(0, 10) < dia)
    .map(c => c.profile_id));

  let mandados = 0;
  for (const p of perfiles || []) {
    if (!p.onboarded_at || activosHoy.has(p.id)) continue;
    const t = TEXTOS[p.lang === 'en' ? 'en' : 'es'];
    const carga = JSON.stringify({
      titulo: 'Frontera',
      cuerpo: conCompromiso.has(p.id) ? t.compromiso : t.hoy,
      url: './'
    });

    for (const s of porPerfil.get(p.id) || []) {
      try {
        await webpush.sendNotification(
          { endpoint: s.endpoint, keys: { p256dh: s.p256dh, auth: s.auth } },
          carga,
          { TTL: 4 * 3600 }
        );
        await admin.from('push_subscriptions').update({ ultimo_aviso: dia }).eq('id', s.id);
        mandados++;
      } catch (e) {
        // 404 y 410: el navegador dio de baja la suscripción. Se borra.
        const estado = (e as { statusCode?: number }).statusCode;
        if (estado === 404 || estado === 410) {
          await admin.from('push_subscriptions').delete().eq('id', s.id);
        }
      }
    }
  }

  return responder(200, { ok: true, mandados });
});
