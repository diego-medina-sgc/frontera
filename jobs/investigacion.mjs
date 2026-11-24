// ============================================================
// Frontera - el instrumento de investigación
// ============================================================
// La app junta datos de investigación desde el primer día y nadie los
// leía: estaban como cuatro consultas sueltas en docs/investigacion.md.
// Esto las corre de una vez y las dice en castellano.
//
// Son el contrapeso de lo que la gente cuenta. Con dos perfiles no
// prueban nada; sirven para ver que la medición funciona antes de que
// haya gente, y para leerla cuando la haya.
//
// Sólo cifras. Ningún nombre, mail, contexto, compromiso ni texto que
// haya escrito nadie: el repo es público y esta salida se puede pegar
// en cualquier lado. Las personas aparecen con los primeros 8
// caracteres de su id, igual que en revisar.mjs.
//
// Uso:
//   node jobs/investigacion.mjs
// ============================================================

import { readFileSync, existsSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';

const AQUI = dirname(fileURLToPath(import.meta.url));

const env = {};
const rutaEnv = join(AQUI, '.env');
if (existsSync(rutaEnv)) {
  for (const linea of readFileSync(rutaEnv, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

if (!env.SUPABASE_URL || !env.SUPABASE_SECRET_KEY) {
  console.log('Faltan credenciales en jobs/.env.');
  process.exit(1);
}

const cab = {
  'apikey': env.SUPABASE_SECRET_KEY,
  'Authorization': `Bearer ${env.SUPABASE_SECRET_KEY}`
};

async function traer(ruta) {
  const r = await fetch(`${env.SUPABASE_URL}/rest/v1/${ruta}`, { headers: cab });
  if (!r.ok) throw new Error(`${ruta}: HTTP ${r.status} ${await r.text()}`);
  return r.json();
}

// Sólo las columnas que se cuentan. Nada de texto libre.
const [perfiles, actividad, estados, repasos, retos, lecciones] = await Promise.all([
  traer('profiles?select=id,display_name,level,level_source,lang,onboarded_at,created_at'),
  traer('activity?select=profile_id,day,kind'),
  traer('lesson_state?select=profile_id,lesson_id,status,comprension,interes,answered_at,compromiso_at,compromiso_hecho'),
  traer('reviews?select=profile_id,recordaba,uso,done_at,caducado'),
  traer('challenges?select=profile_id,status,dificultad,sirvio'),
  traer('lessons?select=id,slug,kind,arc,arc_day')
]);

const corto = (id) => id.slice(0, 8);
const quien = (id) => corto(id) + (id === env.PROFILE_ID ? ' (vos)' : '');
const DIA = 86400000;
const hoy = new Date(new Date().toISOString().slice(0, 10));
const dias = (a, b) => Math.round((new Date(b) - new Date(a)) / DIA);
const prom = (xs) => xs.length ? (xs.reduce((s, x) => s + x, 0) / xs.length).toFixed(1) : '—';
const titulo = (t) => console.log(`\n${t}\n${'-'.repeat(t.length)}`);
const fila = (...cols) => console.log('  ' + cols.join('  '));

console.log('Frontera · investigación');
console.log(`${perfiles.length} perfiles · ${hoy.toISOString().slice(0, 10)}`);

// ------------------------------------------------------------
// 1. Onboarding: cuántos entran y no terminan
// ------------------------------------------------------------
titulo('1. Onboarding');
const terminaron = perfiles.filter(p => p.onboarded_at);
fila(`terminaron el Paso 1: ${terminaron.length} de ${perfiles.length}`);
fila(`sin terminar:         ${perfiles.length - terminaron.length}`);
fila(`eligieron un nombre:  ${perfiles.filter(p => p.display_name).length}`);
fila(`en inglés:            ${perfiles.filter(p => p.lang === 'en').length}`);
const niveles = [0, 1, 2, 3, 4].map(n => perfiles.filter(p => p.level === n).length);
fila(`por nivel 0-4:        ${niveles.join(' / ')}`);
fila(`nivel subido por uso: ${perfiles.filter(p => p.level_source === 'desempeno').length}`);

// ------------------------------------------------------------
// 2. Retención: la pregunta de riesgo es si vuelven la segunda semana
// ------------------------------------------------------------
titulo('2. Retención');
const porPersona = new Map();
for (const a of actividad) {
  if (!porPersona.has(a.profile_id)) porPersona.set(a.profile_id, new Set());
  porPersona.get(a.profile_id).add(a.day);
}
let volvieron = 0, elegibles = 0;
for (const p of perfiles) {
  const ds = [...(porPersona.get(p.id) || [])].sort();
  if (!ds.length) { fila(`${quien(p.id).padEnd(16)} sin actividad`); continue; }
  const primero = ds[0], ultimo = ds[ds.length - 1];
  // "Volvió la segunda semana": algún día activo entre el 7 y el 13
  // contando desde el primero. Sólo cuenta para quien ya tuvo dos
  // semanas para hacerlo.
  const segunda = ds.some(d => { const n = dias(primero, d); return n >= 7 && n <= 13; });
  const tuvoTiempo = dias(primero, hoy) >= 14;
  if (tuvoTiempo) { elegibles++; if (segunda) volvieron++; }
  fila(
    `${quien(p.id).padEnd(16)}`,
    `${String(ds.length).padStart(3)} días`,
    `desde ${primero}`,
    `último hace ${dias(ultimo, hoy)} d`,
    tuvoTiempo ? (segunda ? 'volvió la 2.ª semana' : 'NO volvió la 2.ª semana') : 'todavía sin 2 semanas'
  );
}
fila(`volvieron la segunda semana: ${volvieron} de ${elegibles} con dos semanas o más`);

// ------------------------------------------------------------
// 3. Lecciones: dónde se entiende poco y dónde no le importa a nadie
// ------------------------------------------------------------
titulo('3. Lecciones contestadas');
const slugDe = Object.fromEntries(lecciones.map(l => [l.id, l]));
const contestadas = estados.filter(s => s.answered_at);
const cuenta = (st) => contestadas.filter(s => s.status === st).length;
fila(`contestadas: ${contestadas.length} · hechas ${cuenta('hecha')} · ya lo sabía ${cuenta('ya_la_sabia')} · saltadas ${cuenta('saltada')}`);
fila(`comprensión media: ${prom(contestadas.filter(s => s.comprension).map(s => s.comprension))}`);
fila(`pulgar arriba ${contestadas.filter(s => s.interes === 1).length} · abajo ${contestadas.filter(s => s.interes === -1).length}`);

const porLeccion = new Map();
for (const s of contestadas) {
  const l = slugDe[s.lesson_id];
  if (!l) continue;
  if (!porLeccion.has(l.slug)) porLeccion.set(l.slug, []);
  porLeccion.get(l.slug).push(s);
}
const flojas = [...porLeccion.entries()]
  .map(([slug, ss]) => ({
    slug,
    n: ss.length,
    comp: ss.filter(s => s.comprension).map(s => s.comprension),
    abajo: ss.filter(s => s.interes === -1).length
  }))
  .filter(x => (x.comp.length && Number(prom(x.comp)) <= 6) || x.abajo > 0)
  .sort((a, b) => Number(prom(a.comp)) - Number(prom(b.comp)));
if (flojas.length) {
  fila('para mirar (comprensión ≤6 o pulgar abajo):');
  for (const x of flojas) fila(`  ${x.slug.padEnd(34)} ${x.n} resp · comprensión ${prom(x.comp)} · abajo ${x.abajo}`);
} else {
  fila('ninguna lección con comprensión ≤6 ni pulgar abajo');
}

// ------------------------------------------------------------
// 4. Lo que pasó afuera de la app
// ------------------------------------------------------------
titulo('4. Afuera de la app');
const compromisos = estados.filter(s => s.compromiso_at);
fila(`compromisos: ${compromisos.length} · cumplidos ${compromisos.filter(s => s.compromiso_hecho === true).length} · no ${compromisos.filter(s => s.compromiso_hecho === false).length} · sin responder ${compromisos.filter(s => s.compromiso_hecho == null).length}`);

const hechos = repasos.filter(r => r.done_at);
// La cruza más honesta del conjunto: lo que dijo recordar contra lo que
// usó de verdad.
const cruz = (rec, uso) => hechos.filter(r => (r.recordaba ?? null) === rec && (r.uso ?? null) === uso).length;
fila(`repasos hechos: ${hechos.length} · caducados sin hacer: ${repasos.filter(r => r.caducado).length}`);
fila(`  recordaba y lo usó:       ${cruz(1, true)}`);
fila(`  recordaba y no lo usó:    ${cruz(1, false)}`);
fila(`  no recordaba:             ${hechos.filter(r => r.recordaba === 0).length}`);

const retosCerrados = retos.filter(r => r.status === 'hecho');
fila(`retos: ${retos.length} · hechos ${retosCerrados.length} · descartados ${retos.filter(r => r.status === 'descartado').length} · sirvió ${retos.filter(r => r.sirvio === 1).length} · no sirvió ${retos.filter(r => r.sirvio === -1).length}`);

// ------------------------------------------------------------
// 5. Arcos: empezados y terminados
// ------------------------------------------------------------
titulo('5. Arcos');
const arcos = new Map();
for (const l of lecciones.filter(l => l.arc)) {
  if (!arcos.has(l.arc)) arcos.set(l.arc, new Set());
  arcos.get(l.arc).add(l.id);
}
for (const [arc, ids] of arcos) {
  const personas = new Map();
  for (const s of contestadas.filter(s => ids.has(s.lesson_id) && s.status === 'hecha')) {
    personas.set(s.profile_id, (personas.get(s.profile_id) || 0) + 1);
  }
  const terminados = [...personas.values()].filter(n => n >= ids.size).length;
  fila(`${arc.padEnd(18)} empezaron ${personas.size} · terminaron ${terminados} · días ${ids.size}`);
}

console.log('\nCon menos de cinco personas esto no prueba nada: sirve para ver que la medición anda.');
