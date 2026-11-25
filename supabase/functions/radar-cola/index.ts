// ============================================================
// Frontera - radar-cola: aprobar lo que el radar escribió solo
// ============================================================
// Cada mañana una tarea programada escribe las lecciones del radar y
// las deja como borrador (`published = false`). Esta función es la
// cola: lista los borradores, publica uno o lo descarta.
//
// Mismo esquema que `invitar` y `borrar-cuenta`:
//   · la secret key vive en el servidor (Supabase la inyecta sola);
//   · se valida la sesión de quien llama;
//   · se vuelve a consultar `puede_invitar` con la secret key: sólo
//     quien administra el círculo aprueba contenido. Que la app muestre
//     o no el grupo es cosmético.
//
// Publicar pone `created_at` en ahora: el radar caduca a los 10 días, y
// los diez días empiezan cuando la lección se puede leer, no cuando se
// escribió el borrador.
//
// Desplegar: Edge Functions → Deploy a new function → Via Editor.
// Nombre exacto `radar-cola` ANTES de Deploy.
// ============================================================

import { createClient } from 'jsr:@supabase/supabase-js@2';

const URL_SUPA = Deno.env.get('SUPABASE_URL')!;
const SECRETA = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

const cors = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
  'Access-Control-Allow-Methods': 'POST, OPTIONS'
};

const responder = (estado: number, cuerpo: Record<string, unknown>) =>
  new Response(JSON.stringify(cuerpo), {
    status: estado,
    headers: { ...cors, 'Content-Type': 'application/json' }
  });

Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') return new Response('ok', { headers: cors });
  if (req.method !== 'POST') return responder(405, { error: 'Sólo POST.' });

  const token = (req.headers.get('Authorization') || '').replace(/^Bearer\s+/i, '').trim();
  if (!token) return responder(401, { error: 'Sin sesión.' });

  const admin = createClient(URL_SUPA, SECRETA, { auth: { persistSession: false } });

  const { data: quien, error: eQuien } = await admin.auth.getUser(token);
  if (eQuien || !quien?.user) return responder(401, { error: 'Sesión inválida.' });

  const { data: perfil } = await admin
    .from('profiles').select('puede_invitar').eq('id', quien.user.id).maybeSingle();
  if (!perfil?.puede_invitar) return responder(403, { error: 'Tu cuenta no aprueba contenido.' });

  let cuerpo: { accion?: string; slug?: string };
  try {
    cuerpo = await req.json();
  } catch {
    return responder(400, { error: 'No entendí el pedido.' });
  }

  // ---- Listar los borradores ----
  if (cuerpo.accion === 'listar') {
    const { data, error } = await admin
      .from('lessons')
      .select('slug, level_floor, level_ceiling, fuente_url, created_at, topics(slug, name_es), lesson_contents(lang, title, hook, body_md, minutes, tool_id)')
      .eq('kind', 'radar').eq('published', false)
      .order('created_at', { ascending: false });
    if (error) return responder(500, { error: 'No pude leer los borradores.' });

    const borradores = (data || []).map((l) => {
      const cs = (l.lesson_contents || []).filter((c: { tool_id: string | null }) => !c.tool_id);
      return {
        slug: l.slug,
        nivel: [l.level_floor, l.level_ceiling],
        tema: (l.topics as { name_es?: string } | null)?.name_es || null,
        fuente: l.fuente_url,
        escrita: l.created_at,
        es: cs.find((c: { lang: string }) => c.lang === 'es') || null,
        tieneIngles: cs.some((c: { lang: string }) => c.lang === 'en')
      };
    });
    return responder(200, { ok: true, borradores });
  }

  const slug = (cuerpo.slug || '').trim();
  if (!/^r-[a-z0-9-]+$/.test(slug)) return responder(400, { error: 'Falta la lección.' });

  // Sólo se toca un borrador de radar: nada publicado ni de otro tipo.
  const { data: leccion } = await admin
    .from('lessons').select('id, published, kind').eq('slug', slug).maybeSingle();
  if (!leccion || leccion.kind !== 'radar' || leccion.published) {
    return responder(404, { error: 'Ese borrador ya no está.' });
  }

  // ---- Publicar ----
  if (cuerpo.accion === 'publicar') {
    const { error } = await admin.from('lessons')
      .update({ published: true, created_at: new Date().toISOString() })
      .eq('id', leccion.id);
    if (error) return responder(500, { error: 'No se pudo publicar.' });
    return responder(200, { ok: true });
  }

  // ---- Descartar ----
  if (cuerpo.accion === 'descartar') {
    const { error } = await admin.from('lessons').delete().eq('id', leccion.id);
    if (error) return responder(500, { error: 'No se pudo descartar.' });
    return responder(200, { ok: true });
  }

  return responder(400, { error: 'Acción desconocida.' });
});
