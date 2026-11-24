// ============================================================
// Frontera - borrar-cuenta: que alguien pueda irse
// ============================================================
// Hasta el 24/11 no había forma de borrar una cuenta desde la app.
// Borrar un usuario necesita la secret key, que no puede estar en el
// navegador, así que lo hace esta función, con el mismo esquema que
// `invitar`:
//   · la clave vive en el servidor (Supabase la inyecta sola)
//   · el servidor valida la sesión de quien llama
//   · sólo se borra la cuenta de quien llama: el id sale del token,
//     nunca del cuerpo del pedido
//
// Todo lo de la persona (perfil, lecciones, repasos, retos, libros,
// respuestas) cuelga de `auth.users` con `on delete cascade`, así que
// borrar el usuario borra todo.
//
// Una cuenta con `puede_invitar` no se borra desde acá: es la que
// administra el círculo, y perderla por un toque deja a todos sin
// forma de sumar gente. Se borra a mano, desde el dashboard.
//
// No manda ningún mail.
//
// Desplegar: Edge Functions en el dashboard → Via Editor, nombre
// `borrar-cuenta`, pegar este archivo y Deploy.
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

  // 2. Que lo confirme. La app lo manda sólo después de que la persona
  //    escribió la palabra; esto evita un borrado por un pedido suelto.
  let cuerpo: { confirmo?: boolean };
  try {
    cuerpo = await req.json();
  } catch {
    return responder(400, { error: 'No entendí el pedido.' });
  }
  if (cuerpo.confirmo !== true) return responder(400, { error: 'Falta la confirmación.' });

  // 3. La cuenta que administra el círculo no se borra desde la app.
  const { data: perfil } = await admin
    .from('profiles').select('puede_invitar').eq('id', quien.user.id).maybeSingle();
  if (perfil?.puede_invitar) {
    return responder(403, { error: 'Esta cuenta administra el círculo y no se puede borrar desde la app.' });
  }

  // 4. Borrar. El cascade se lleva todo lo demás.
  const { error: eBorrar } = await admin.auth.admin.deleteUser(quien.user.id);
  if (eBorrar) return responder(500, { error: 'No se pudo borrar la cuenta.' });

  return responder(200, { ok: true });
});
