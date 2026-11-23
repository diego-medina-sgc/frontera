// ============================================================
// Frontera - invitar: dar de alta a alguien del círculo
// ============================================================
// La primera pieza de servidor del proyecto, y existe por una sola
// razón: crear la cuenta de otra persona necesita la secret key, y la
// secret key no puede estar en el navegador. Con la publishable key
// que tiene la app no se puede, y está bien que así sea.
//
// El esquema es el de la regla del 19/11:
//   · la clave vive en el servidor (Supabase la inyecta sola)
//   · el servidor valida la sesión de quien llama (tokeninfo propio)
//   · el servidor vuelve a consultar el permiso, no le cree al cliente
//
// Que la app dibuje o no el formulario es cosmético. Alguien que edite
// el JavaScript y lo haga aparecer no consigue nada: acá se verifica
// `profiles.puede_invitar` con la secret key antes de crear a nadie.
//
// No manda ningún mail. La cuenta queda creada y confirmada, y la
// contraseña la define quien invita (ver db/051_invitar.sql).
//
// Desplegar: Edge Functions en el dashboard, o
//   npx supabase functions deploy invitar --project-ref <ref>
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

  // 1. Quién llama. El token se valida acá, no se le cree al cliente.
  const { data: quien, error: eQuien } = await admin.auth.getUser(token);
  if (eQuien || !quien?.user) return responder(401, { error: 'Sesión inválida.' });

  // 2. Si puede. Es el único permiso del proyecto y se lee con la
  //    secret key: lo que diga el navegador no cuenta.
  const { data: perfil } = await admin
    .from('profiles').select('puede_invitar').eq('id', quien.user.id).maybeSingle();

  if (!perfil?.puede_invitar) return responder(403, { error: 'Tu cuenta no puede sumar gente.' });

  // 3. Qué pide.
  let cuerpo: { mail?: string; clave?: string };
  try {
    cuerpo = await req.json();
  } catch {
    return responder(400, { error: 'No entendí el pedido.' });
  }

  const mail = (cuerpo.mail || '').trim().toLowerCase();
  const clave = cuerpo.clave || '';

  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(mail)) {
    return responder(400, { error: 'Ese mail no parece un mail.' });
  }
  // Mínimo de Supabase, repetido acá para que el error se entienda en
  // castellano y antes de salir a la red.
  if (clave.length < 8) {
    return responder(400, { error: 'La contraseña tiene que tener al menos 8 caracteres.' });
  }

  // 4. Crear. `email_confirm` en true porque el proyecto no manda
  //    mails: la persona tiene que poder entrar enseguida.
  const { data: nuevo, error: eNuevo } = await admin.auth.admin.createUser({
    email: mail,
    password: clave,
    email_confirm: true
  });

  if (eNuevo || !nuevo?.user) {
    const repetido = /already|registered|exists/i.test(eNuevo?.message || '');
    return responder(repetido ? 409 : 400, {
      error: repetido ? 'Ya hay una cuenta con ese mail.' : 'No se pudo crear la cuenta.'
    });
  }

  // 5. El perfil lo crea el trigger `trg_auth_user_created`. Si no
  //    apareció, la persona entraría a una app sin perfil y sin Paso 1,
  //    así que se avisa en vez de dar todo por bueno.
  const { data: fila } = await admin
    .from('profiles').select('id').eq('id', nuevo.user.id).maybeSingle();

  return responder(200, { ok: true, perfil: Boolean(fila) });
});
