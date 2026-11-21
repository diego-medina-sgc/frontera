// ============================================================
// Frontera - perfil por evidencia
// ============================================================
// Lee tus sesiones locales de Claude Code y deduce en qué temas te
// movés de verdad. No lo que decís que sabés: lo que hacés.
//
// REGLA QUE NO SE ROMPE:
// Todo se procesa acá, en tu máquina. De este script nunca sale una
// línea de texto de tus conversaciones. Lo único que se escribe, y lo
// único que eventualmente sube a la base, son NÚMEROS: cuántas veces
// apareció cada tema, en cuántos proyectos, en qué fechas. Ni una
// oración, ni un nombre, ni un fragmento.
//
// Uso:
//   node jobs/evidencia.mjs              -> muestra el perfil derivado
//   node jobs/evidencia.mjs --guardar    -> además lo sube a la base
// ============================================================

import { createReadStream, readdirSync, statSync, writeFileSync, existsSync, readFileSync } from 'node:fs';
import { createInterface } from 'node:readline';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { homedir } from 'node:os';
import { NODOS } from './lexico.mjs';

const AQUI = dirname(fileURLToPath(import.meta.url));
const GUARDAR = process.argv.includes('--guardar');
const RAIZ = join(homedir(), '.claude', 'projects');

if (!existsSync(RAIZ)) {
  console.log(`No encontré sesiones de Claude Code en ${RAIZ}.`);
  process.exit(0);
}

// ------------------------------------------------------------
// Señales de cómo trabaja alguien, no de qué tema habla.
// Son las que separan los niveles: preguntar cómo se hace algo es
// distinto de diagnosticar por qué algo falla, y muy distinto de
// medir si algo funciona.
// ------------------------------------------------------------
const MODOS = {
  aprende:    [/\bqué es\b/i, /\bcómo (se )?(hace|hago|uso|funciona)\b/i, /\bexplicame\b/i, /\bno entiendo\b/i],
  construye:  [/\bandá\b/i, /\barmá\b/i, /\bhacé\b/i, /\bescribí\b/i, /\bimplementá\b/i, /\bagregá\b/i, /\bcreá\b/i],
  diagnostica:[/\bpor qué\b.*\b(falla|no anda|no funciona|rompe|da error)\b/i, /\bno (anda|funciona)\b/i, /\bse rompió\b/i, /\berror\b/i, /\bfalla\b/i],
  mide:       [/\bverificá\b/i, /\bprobá\b/i, /\btest(e|)á\b/i, /\bchequeá\b/i, /\bcuánto\b/i, /\bmedí\b/i, /\beval\b/i],
  delega:     [/\ben segundo plano\b/i, /\bprogramá\b.*\b(tarea|cron|diario)\b/i, /\bautomatiz/i, /\bsolo,? sin mí\b/i]
};

// ------------------------------------------------------------
// Recorrido
// ------------------------------------------------------------
function archivos(dir) {
  const out = [];
  for (const e of readdirSync(dir, { withFileTypes: true })) {
    const p = join(dir, e.name);
    if (e.isDirectory()) out.push(...archivos(p));
    else if (e.name.endsWith('.jsonl')) out.push(p);
  }
  return out;
}

// Solo las palabras de la persona. Los resultados de herramientas y los
// avisos del sistema no son lo que ella escribió.
function textoDelUsuario(linea) {
  let o;
  try { o = JSON.parse(linea); } catch { return null; }
  if (o?.type !== 'user' || o.isMeta) return null;
  if (o.toolUseResult !== undefined) return null;

  const c = o.message?.content;
  let texto = '';
  if (typeof c === 'string') texto = c;
  else if (Array.isArray(c)) {
    for (const parte of c) {
      if (parte?.type === 'text' && typeof parte.text === 'string') texto += ' ' + parte.text;
    }
  }
  texto = texto.trim();
  if (!texto) return null;
  if (texto.startsWith('<')) return null;          // recordatorios del sistema
  if (texto.includes('tool_use_id')) return null;
  return texto.slice(0, 2000);                      // los pegados largos no deben pesar de más
}

const nodos = Object.fromEntries(Object.keys(NODOS).map(k => [k, { hits: 0, proyectos: new Set() }]));
const modos = Object.fromEntries(Object.keys(MODOS).map(k => [k, 0]));
let mensajes = 0, sesiones = 0, conCodigo = 0;
let primera = null, ultima = null;

const lista = archivos(RAIZ);
console.log(`Leyendo ${lista.length} sesiones…\n`);

for (const ruta of lista) {
  sesiones++;
  const proyecto = ruta.split(/[\\/]/).at(-2);
  const fecha = statSync(ruta).mtime;
  if (!primera || fecha < primera) primera = fecha;
  if (!ultima || fecha > ultima) ultima = fecha;

  const rl = createInterface({ input: createReadStream(ruta, { encoding: 'utf8' }), crlfDelay: Infinity });

  for await (const linea of rl) {
    const texto = textoDelUsuario(linea);
    if (!texto) continue;
    mensajes++;

    const bajo = texto.toLowerCase();
    if (bajo.includes('```') || /\bfunction\b|\bselect \b|\bconst \b/.test(bajo)) conCodigo++;

    for (const [slug, def] of Object.entries(NODOS)) {
      let n = 0;
      for (const t of def.terminos) if (bajo.includes(t)) n++;
      if (n) {
        nodos[slug].hits += n;
        nodos[slug].proyectos.add(proyecto);
      }
    }

    for (const [modo, patrones] of Object.entries(MODOS)) {
      if (patrones.some(p => p.test(texto))) modos[modo]++;
    }
  }
}

// ------------------------------------------------------------
// Derivación
// ------------------------------------------------------------
// Dominio por nodo, de 0 a 100. No es una nota: es cuánta evidencia hay
// de que la persona se mueve ahí. Pesa más aparecer en varios proyectos
// distintos que muchas veces en uno solo: eso distingue haber usado algo
// de haberlo incorporado.
const maxHits = Math.max(1, ...Object.values(nodos).map(n => n.hits));

const dominio = Object.entries(nodos)
  .map(([slug, n]) => ({
    slug,
    hits: n.hits,
    proyectos: n.proyectos.size,
    valor: Math.min(100, Math.round(
      (n.hits / maxHits) * 60 + Math.min(n.proyectos.size, 5) * 8
    ))
  }))
  .filter(n => n.hits > 0)
  .sort((a, b) => b.valor - a.valor);

// Nivel sugerido, por cómo trabaja y no por qué temas toca.
const total = Math.max(1, Object.values(modos).reduce((a, b) => a + b, 0));
const prop = (m) => modos[m] / total;

// Diagnosticar implica haber construido: no se depura lo que no se hizo.
// Por eso pesa más que pedir que se construya, que cualquiera puede hacer.
let nivel = 1;
if (prop('construye') + prop('diagnostica') > 0.15) nivel = 2;
if (prop('diagnostica') > 0.15) nivel = 3;

// El nivel 4 es exigente a propósito. No alcanza con probar que algo
// anda: hay que medir sistemáticamente y dejar trabajo corriendo solo.
// Si la evidencia no lo muestra con holgura, se queda en 3.
if (nivel === 3 && prop('mide') > 0.18 && prop('delega') > 0.06
    && (nodos.evals?.proyectos.size ?? 0) >= 3) nivel = 4;

// ------------------------------------------------------------
// Salida: números y nada más
// ------------------------------------------------------------
const perfil = {
  generado: new Date().toISOString(),
  fuente: 'claude-code-local',
  sesiones,
  mensajes_propios: mensajes,
  desde: primera?.toISOString().slice(0, 10) ?? null,
  hasta: ultima?.toISOString().slice(0, 10) ?? null,
  nivel_sugerido: nivel,
  modos: Object.fromEntries(Object.entries(modos).map(([k, v]) => [k, +(v / total).toFixed(3)])),
  dominio: dominio.map(d => ({ nodo: d.slug, valor: d.valor, proyectos: d.proyectos, apariciones: d.hits }))
};

writeFileSync(join(AQUI, 'salida', 'perfil-evidencia.json'), JSON.stringify(perfil, null, 2), 'utf8');

console.log(`Sesiones leídas: ${sesiones}`);
console.log(`Mensajes tuyos:  ${mensajes}`);
console.log(`Período:         ${perfil.desde} a ${perfil.hasta}\n`);

console.log('Cómo trabajás:');
for (const [m, v] of Object.entries(perfil.modos)) {
  const barra = '█'.repeat(Math.round(v * 40));
  console.log(`  ${m.padEnd(12)} ${String(Math.round(v * 100)).padStart(3)}%  ${barra}`);
}

console.log('\nDónde te movés (0 a 100):');
for (const d of dominio.slice(0, 10)) {
  const barra = '█'.repeat(Math.round(d.valor / 4));
  console.log(`  ${d.slug.padEnd(16)} ${String(d.valor).padStart(3)}  ${barra}  (${d.proyectos} proyectos)`);
}

const ausentes = Object.keys(NODOS).filter(k => !nodos[k].hits);
if (ausentes.length) {
  console.log(`\nSin rastro: ${ausentes.join(', ')}`);
  console.log('Eso no quiere decir que no sepas. Quiere decir que no aparece en lo que hacés.');
}

console.log(`\nNivel sugerido: ${nivel}`);
console.log(`\nPerfil derivado (solo números): jobs/salida/perfil-evidencia.json`);

if (!GUARDAR) {
  console.log('\nNo subí nada. Para subirlo: node jobs/evidencia.mjs --guardar');
  process.exit(0);
}

// ------------------------------------------------------------
// Subida: solo los números derivados
// ------------------------------------------------------------
const env = {};
const ruta = join(AQUI, '.env');
if (existsSync(ruta)) {
  for (const linea of readFileSync(ruta, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

if (!env.SUPABASE_URL || !env.SUPABASE_SECRET_KEY || !env.PROFILE_ID) {
  console.log('\nPara subir hacen falta SUPABASE_URL, SUPABASE_SECRET_KEY y PROFILE_ID en jobs/.env.');
  process.exit(0);
}

const cab = {
  'apikey': env.SUPABASE_SECRET_KEY,
  'Authorization': `Bearer ${env.SUPABASE_SECRET_KEY}`,
  'Content-Type': 'application/json'
};

const topics = await (await fetch(`${env.SUPABASE_URL}/rest/v1/topics?select=id,slug`, { headers: cab })).json();
const porSlug = Object.fromEntries(topics.map(t => [t.slug, t.id]));

const filas = dominio
  .filter(d => porSlug[d.nodo])
  .map(d => ({
    profile_id: env.PROFILE_ID,
    topic_id: porSlug[d.nodo],
    mastery: d.valor,
    evidence: `${d.apariciones} apariciones en ${d.proyectos} proyectos de Claude Code`,
    updated_at: new Date().toISOString()
  }));

const r = await fetch(`${env.SUPABASE_URL}/rest/v1/topic_mastery?on_conflict=profile_id,topic_id`, {
  method: 'POST',
  headers: { ...cab, 'Prefer': 'resolution=merge-duplicates,return=minimal' },
  body: JSON.stringify(filas)
});

if (!r.ok) {
  console.log(`\nNo pude subir: HTTP ${r.status} ${await r.text()}`);
  process.exit(1);
}

await fetch(`${env.SUPABASE_URL}/rest/v1/profiles?id=eq.${env.PROFILE_ID}`, {
  method: 'PATCH',
  headers: { ...cab, 'Prefer': 'return=minimal' },
  body: JSON.stringify({ level: nivel, level_source: 'evidencia', level_updated_at: new Date().toISOString() })
});

console.log(`\nSubidos ${filas.length} nodos y el nivel. Texto crudo subido: cero.`);
