// ============================================================
// Frontera - qué cubrió ya el radar
// ============================================================
// La rutina del radar en la nube arranca cada mañana de una copia
// limpia del repo: no ve los jobs/salida/lecciones-*.json de días
// anteriores (están en .gitignore). Para no repetir un tema, mira la
// base: las lecciones de radar que existen, publicadas o en borrador.
//
// Sólo títulos, temas, fechas y fuentes. Nada de personas.
//
// Uso:
//   node jobs/cubierto.mjs          -> últimos 60 días
//   node jobs/cubierto.mjs 30       -> últimos 30
//
// Credenciales: jobs/.env en la notebook; variables de entorno
// SUPABASE_URL y SUPABASE_SECRET_KEY en la nube.
// ============================================================

import { readFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const AQUI = dirname(fileURLToPath(import.meta.url));

const env = {
  SUPABASE_URL: process.env.SUPABASE_URL,
  SUPABASE_SECRET_KEY: process.env.SUPABASE_SECRET_KEY
};
const ruta = join(AQUI, '.env');
if (existsSync(ruta)) {
  for (const linea of readFileSync(ruta, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

if (!env.SUPABASE_URL || !env.SUPABASE_SECRET_KEY) {
  console.log('Faltan SUPABASE_URL y SUPABASE_SECRET_KEY (jobs/.env o variables de entorno).');
  process.exit(1);
}

const dias = Number(process.argv[2]) || 60;
const desde = new Date(Date.now() - dias * 864e5).toISOString();

const r = await fetch(
  `${env.SUPABASE_URL}/rest/v1/lessons?select=slug,published,created_at,fuente_url,topics(slug),lesson_contents(lang,title,tool_id)` +
  `&kind=eq.radar&created_at=gte.${desde}&order=created_at.desc`,
  { headers: { apikey: env.SUPABASE_SECRET_KEY, Authorization: `Bearer ${env.SUPABASE_SECRET_KEY}` } }
);
if (!r.ok) {
  console.log(`No pude leer la base: HTTP ${r.status}`);
  process.exit(1);
}

const lecciones = await r.json();
console.log(`Radar · lo cubierto en los últimos ${dias} días: ${lecciones.length}\n`);
for (const l of lecciones) {
  const es = (l.lesson_contents || []).find(c => c.lang === 'es' && !c.tool_id);
  console.log(`- ${l.created_at.slice(0, 10)} · ${l.published ? 'publicada' : 'borrador'} · ${l.topics?.slug || '?'} · ${es?.title || l.slug}`);
  if (l.fuente_url) console.log(`  fuente: ${l.fuente_url}`);
}
