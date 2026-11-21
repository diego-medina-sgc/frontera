// ============================================================
// Frontera - publicador de lecciones de radar
// ============================================================
// Toma el archivo de lecciones que escribió la segunda etapa y las deja
// en la base. Si hay credenciales en jobs/.env, escribe directo. Si no,
// genera el SQL para pegar en el editor de Supabase, así el ciclo
// funciona igual sin configurar nada.
//
// Uso:
//   node jobs/publicar.mjs                       -> toma el del día
//   node jobs/publicar.mjs ruta/al/archivo.json
// ============================================================

import { readFileSync, writeFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { createHash } from 'node:crypto';

const AQUI = dirname(fileURLToPath(import.meta.url));
const HOY = new Date().toISOString().slice(0, 10);

const entrada = process.argv[2] || join(AQUI, 'salida', `lecciones-${HOY}.json`);

if (!existsSync(entrada)) {
  console.log(`No encontré ${entrada}`);
  console.log('La segunda etapa tiene que dejar ahí las lecciones escritas.');
  process.exit(1);
}

const { lecciones } = JSON.parse(readFileSync(entrada, 'utf8'));

if (!lecciones?.length) {
  console.log('El archivo no trae lecciones. Hay días en que el mundo no produce nada: está bien.');
  process.exit(0);
}

// ------------------------------------------------------------
// Validación: más vale frenar acá que publicar algo roto
// ------------------------------------------------------------
const NODOS_VALIDOS = new Set([
  'fundamentos', 'instrucciones', 'como-pedir', 'limites', 'privacidad',
  'archivos', 'contexto', 'modalidades', 'automatizacion', 'agentes',
  'evals', 'asincronico', 'modelos', 'negocios', 'producto', 'diseno',
  'contexto-largo'
]);

const problemas = [];
for (const [i, l] of lecciones.entries()) {
  const d = `lección ${i + 1}`;
  if (!l.slug?.startsWith('r-')) problemas.push(`${d}: el slug tiene que empezar con r-`);
  if (!NODOS_VALIDOS.has(l.nodo)) problemas.push(`${d}: nodo desconocido (${l.nodo})`);
  if (!l.titulo || !l.cuerpo) problemas.push(`${d}: falta título o cuerpo`);
  if (!Array.isArray(l.nivel) || l.nivel.length !== 2) problemas.push(`${d}: nivel tiene que ser [piso, techo]`);
  if (l.cuerpo?.includes('$md$')) problemas.push(`${d}: el cuerpo contiene $md$ y rompe el SQL`);
  if (!l.senal?.url) problemas.push(`${d}: falta la señal de la que nació`);
  if (l.cuerpo && l.cuerpo.length < 600) problemas.push(`${d}: el cuerpo es sospechosamente corto`);
}

if (problemas.length) {
  console.log('No publiqué nada. Problemas:\n');
  for (const p of problemas) console.log(`  · ${p}`);
  process.exit(1);
}

// ------------------------------------------------------------
// SQL
// ------------------------------------------------------------
const esc = (s) => String(s).replace(/'/g, "''");

function sqlDe(l) {
  const hash = createHash('md5').update(l.senal.url).digest('hex');
  return `
-- ${l.titulo}
insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published)
select '${esc(l.slug)}', t.id, 'radar', ${l.nivel[0]}, ${l.nivel[1]}, true
from topics t where t.slug = '${esc(l.nodo)}'
on conflict (slug) do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, '${esc(l.lang || 'es')}', null,
  '${esc(l.titulo)}',
  ${l.hook ? `'${esc(l.hook)}'` : 'null'},
$md$${l.cuerpo}$md$,
  ${l.minutos || 7}, 'radar'
from lessons l where l.slug = '${esc(l.slug)}'
on conflict do nothing;

insert into signals (url, url_hash, title, summary, published_at, status, topic_id)
select '${esc(l.senal.url)}', '${hash}', '${esc(l.senal.titulo || l.titulo)}',
  ${l.senal.resumen ? `'${esc(l.senal.resumen)}'` : 'null'},
  ${l.senal.fecha ? `'${esc(l.senal.fecha)}'` : 'null'},
  'promovida', t.id
from topics t where t.slug = '${esc(l.nodo)}'
on conflict (url_hash) do nothing;
`;
}

const sql = [
  `-- Frontera · lecciones de radar del ${HOY}`,
  `-- ${lecciones.length} ${lecciones.length === 1 ? 'lección' : 'lecciones'}`,
  ...lecciones.map(sqlDe)
].join('\n');

// ------------------------------------------------------------
// Escritura directa, si hay credenciales
// ------------------------------------------------------------
function credenciales() {
  const ruta = join(AQUI, '.env');
  if (!existsSync(ruta)) return null;
  const env = {};
  for (const linea of readFileSync(ruta, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
  return env.SUPABASE_URL && env.SUPABASE_SECRET_KEY ? env : null;
}

const cred = credenciales();

if (!cred) {
  const salida = join(AQUI, 'salida', `lecciones-${HOY}.sql`);
  writeFileSync(salida, sql, 'utf8');
  console.log(`Sin credenciales en jobs/.env, así que dejé el SQL listo para pegar:\n  ${salida}`);
  console.log('\nVa al editor de Supabase:');
  console.log('  https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/sql/new');
  process.exit(0);
}

// Inserciones normales, una tabla por vez. Nada de mandar SQL armado a
// la base: no hace falta y abre una puerta que no quiero abierta.
const cab = {
  'apikey': cred.SUPABASE_SECRET_KEY,
  'Authorization': `Bearer ${cred.SUPABASE_SECRET_KEY}`,
  'Content-Type': 'application/json'
};

const api = async (ruta, opciones = {}) => {
  const r = await fetch(`${cred.SUPABASE_URL}/rest/v1/${ruta}`, { ...opciones, headers: { ...cab, ...opciones.headers } });
  if (!r.ok) throw new Error(`${ruta}: HTTP ${r.status} ${await r.text()}`);
  return r.status === 204 ? null : r.json();
};

try {
  let publicadas = 0;

  for (const l of lecciones) {
    const topics = await api(`topics?slug=eq.${encodeURIComponent(l.nodo)}&select=id`);
    if (!topics.length) throw new Error(`el nodo ${l.nodo} no existe en la base`);
    const topic_id = topics[0].id;

    const [leccion] = await api('lessons', {
      method: 'POST',
      headers: { 'Prefer': 'return=representation,resolution=merge-duplicates' },
      body: JSON.stringify({
        slug: l.slug, topic_id, kind: 'radar',
        level_floor: l.nivel[0], level_ceiling: l.nivel[1], published: true
      })
    });

    await api('lesson_contents', {
      method: 'POST',
      headers: { 'Prefer': 'return=minimal,resolution=ignore-duplicates' },
      body: JSON.stringify({
        lesson_id: leccion.id, lang: l.lang || 'es', tool_id: null,
        title: l.titulo, hook: l.hook || null, body_md: l.cuerpo,
        minutes: l.minutos || 7, generated_by: 'radar'
      })
    });

    await api('signals?on_conflict=url_hash', {
      method: 'POST',
      headers: { 'Prefer': 'return=minimal,resolution=ignore-duplicates' },
      body: JSON.stringify({
        url: l.senal.url,
        url_hash: createHash('md5').update(l.senal.url).digest('hex'),
        title: l.senal.titulo || l.titulo,
        summary: l.senal.resumen || null,
        published_at: l.senal.fecha || null,
        status: 'promovida', topic_id
      })
    });

    publicadas++;
    console.log(`  · ${l.titulo}`);
  }

  console.log(`\nPublicadas ${publicadas}.`);
} catch (e) {
  const salida = join(AQUI, 'salida', `lecciones-${HOY}.sql`);
  writeFileSync(salida, sql, 'utf8');
  console.log(`\nLa escritura directa falló: ${e.message}`);
  console.log(`Dejé el SQL para pegar a mano en:\n  ${salida}`);
}
