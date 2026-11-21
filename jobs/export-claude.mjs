// ============================================================
// Frontera - leer el export de claude.ai
// ============================================================
// La otra mitad de la evidencia. Claude Code muestra lo que CONSTRUÍS;
// el export de claude.ai muestra lo que PENSÁS y preguntás, que suele
// ser un conjunto bastante distinto de temas.
//
// Cómo conseguir el archivo:
//   claude.ai -> Settings -> Privacy -> Export data
//   Llega por mail un zip. Adentro hay un conversations.json.
//
// MISMA REGLA QUE SIEMPRE:
// Todo se procesa acá. De este script no sale una línea de texto de tus
// conversaciones: solo conteos por tema. Y el archivo original no se
// copia a ningún lado; se lee y se descarta.
//
// Uso:
//   node jobs/export-claude.mjs ruta/al/conversations.json
//   node jobs/export-claude.mjs ruta/al/conversations.json --guardar
// ============================================================

import { readFileSync, writeFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { NODOS } from './lexico.mjs';

const AQUI = dirname(fileURLToPath(import.meta.url));
const GUARDAR = process.argv.includes('--guardar');
const ruta = process.argv.find(a => a.endsWith('.json') && !a.startsWith('--'));

if (!ruta || !existsSync(ruta)) {
  console.log('Falta el archivo. Uso:');
  console.log('  node jobs/export-claude.mjs ruta/al/conversations.json');
  console.log('\nSe consigue en claude.ai -> Settings -> Privacy -> Export data.');
  console.log('Llega un zip por mail; adentro está conversations.json.');
  process.exit(1);
}

// ------------------------------------------------------------
// Lectura tolerante
// ------------------------------------------------------------
// El formato del export cambió varias veces y puede volver a cambiar.
// En vez de asumir una forma, se recorre la estructura buscando los
// mensajes de la persona donde sea que estén.
function textosDelHumano(nodo, salida = [], profundidad = 0) {
  if (profundidad > 8 || !nodo) return salida;

  if (Array.isArray(nodo)) {
    for (const n of nodo) textosDelHumano(n, salida, profundidad + 1);
    return salida;
  }

  if (typeof nodo !== 'object') return salida;

  const rol = nodo.sender ?? nodo.role ?? nodo.author?.role;
  const esHumano = rol === 'human' || rol === 'user';

  if (esHumano) {
    let texto = '';
    if (typeof nodo.text === 'string') texto += ' ' + nodo.text;
    if (typeof nodo.content === 'string') texto += ' ' + nodo.content;
    if (Array.isArray(nodo.content)) {
      for (const p of nodo.content) {
        if (p?.type === 'text' && typeof p.text === 'string') texto += ' ' + p.text;
      }
    }
    texto = texto.trim();
    if (texto) salida.push(texto.slice(0, 2000));
  }

  for (const v of Object.values(nodo)) {
    if (v && typeof v === 'object') textosDelHumano(v, salida, profundidad + 1);
  }

  return salida;
}

console.log('Leyendo el export…');

let crudo;
try {
  crudo = JSON.parse(readFileSync(ruta, 'utf8'));
} catch (e) {
  console.log(`No pude leer el JSON: ${e.message}`);
  process.exit(1);
}

const conversaciones = Array.isArray(crudo) ? crudo : (crudo.conversations ?? [crudo]);
const mensajes = textosDelHumano(conversaciones);

if (!mensajes.length) {
  console.log('No encontré mensajes tuyos en ese archivo.');
  console.log('Puede que el formato del export haya cambiado. Mandame la estructura');
  console.log('de las primeras claves (no el contenido) y lo adapto.');
  process.exit(1);
}

// ------------------------------------------------------------
// Conteo
// ------------------------------------------------------------
const nodos = Object.fromEntries(Object.keys(NODOS).map(k => [k, 0]));

for (const m of mensajes) {
  const bajo = m.toLowerCase();
  for (const [slug, def] of Object.entries(NODOS)) {
    for (const t of def.terminos) if (bajo.includes(t)) nodos[slug]++;
  }
}

const densidad = (slug) => nodos[slug] / NODOS[slug].terminos.length;
const maxD = Math.max(0.001, ...Object.keys(NODOS).map(densidad));

const dominio = Object.keys(NODOS)
  .map(slug => ({ slug, hits: nodos[slug], valor: Math.min(100, Math.round((densidad(slug) / maxD) * 85)) }))
  .filter(d => d.hits > 0)
  .sort((a, b) => b.valor - a.valor);

const salida = {
  generado: new Date().toISOString(),
  fuente: 'claude-ai-export',
  conversaciones: Array.isArray(conversaciones) ? conversaciones.length : 1,
  mensajes_propios: mensajes.length,
  dominio: dominio.map(d => ({ nodo: d.slug, valor: d.valor, apariciones: d.hits }))
};

writeFileSync(join(AQUI, 'salida', 'perfil-claude-ai.json'), JSON.stringify(salida, null, 2), 'utf8');

console.log(`\nConversaciones: ${salida.conversaciones}`);
console.log(`Mensajes tuyos: ${mensajes.length}\n`);
console.log('De qué hablás en claude.ai:');
for (const d of dominio.slice(0, 10)) {
  console.log(`  ${d.slug.padEnd(16)} ${String(d.valor).padStart(3)}  ${'█'.repeat(Math.round(d.valor / 4))}`);
}

console.log('\nPerfil derivado (solo números): jobs/salida/perfil-claude-ai.json');
console.log('El archivo original no se copió a ningún lado.');

if (!GUARDAR) {
  console.log('\nPara combinarlo con la evidencia de Claude Code y subirlo:');
  console.log('  node jobs/export-claude.mjs <archivo> --guardar');
  process.exit(0);
}

// ------------------------------------------------------------
// Subida combinada
// ------------------------------------------------------------
// No pisa lo de Claude Code: se queda con el mayor de los dos. Son dos
// miradas distintas de la misma persona y ninguna es más verdadera; lo
// que una ve y la otra no, suma.
const env = {};
const rutaEnv = join(AQUI, '.env');
if (existsSync(rutaEnv)) {
  for (const linea of readFileSync(rutaEnv, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

if (!env.SUPABASE_URL || !env.SUPABASE_SECRET_KEY || !env.PROFILE_ID) {
  console.log('\nFaltan SUPABASE_URL, SUPABASE_SECRET_KEY y PROFILE_ID en jobs/.env.');
  process.exit(0);
}

const cab = {
  'apikey': env.SUPABASE_SECRET_KEY,
  'Authorization': `Bearer ${env.SUPABASE_SECRET_KEY}`,
  'Content-Type': 'application/json'
};

const api = async (r) => {
  const res = await fetch(`${env.SUPABASE_URL}/rest/v1/${r}`, { headers: cab });
  if (!res.ok) throw new Error(`${r}: HTTP ${res.status} ${await res.text()}`);
  return res.json();
};

try {
  const topics = await api('topics?select=id,slug');
  const porSlug = Object.fromEntries(topics.map(t => [t.slug, t.id]));

  const actuales = await api(`topic_mastery?profile_id=eq.${env.PROFILE_ID}&select=topic_id,mastery`);
  const previo = Object.fromEntries(actuales.map(a => [a.topic_id, a.mastery]));

  const filas = dominio
    .filter(d => porSlug[d.slug])
    .map(d => ({
      profile_id: env.PROFILE_ID,
      topic_id: porSlug[d.slug],
      mastery: Math.max(d.valor, previo[porSlug[d.slug]] ?? 0),
      evidence: `${d.apariciones} apariciones en claude.ai y lo que ya traía Claude Code`,
      updated_at: new Date().toISOString()
    }));

  if (!filas.length) {
    console.log('\nNingún nodo coincidió con el mapa. No subí nada.');
    process.exit(1);
  }

  const res = await fetch(`${env.SUPABASE_URL}/rest/v1/topic_mastery?on_conflict=profile_id,topic_id`, {
    method: 'POST',
    headers: { ...cab, 'Prefer': 'resolution=merge-duplicates,return=minimal' },
    body: JSON.stringify(filas)
  });

  if (!res.ok) throw new Error(`HTTP ${res.status} ${await res.text()}`);

  console.log(`\nCombinados ${filas.length} nodos. Texto crudo subido: cero.`);
} catch (e) {
  console.log(`\nNo pude subir: ${e.message}`);
  process.exit(1);
}
