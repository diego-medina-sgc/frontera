// ============================================================
// Frontera - qué libro conviene escribir después
// ============================================================
// Mismo patrón que el radar: la máquina junta y ordena, el criterio
// decide y redacta. Esto NO escribe piezas ni resume libros.
//
// Por qué no los escribe solo: una pieza de libro se escribe con la
// fuente leída. Un job no puede leer el libro, así que escribiría de
// memoria, que es exactamente de donde salió el único error de datos
// que tuvo la biblioteca (la atribución a Kahneman de 2017, corregida
// en db/049). Lo que sí puede hacer una máquina es mirar en qué temas
// la gente levantó el pulgar y decir por dónde conviene seguir.
//
// Y por qué el ranking es para Diego y no una cola para el lector: la
// segunda promesa de la app es que nada se acumula. Una cola de libros
// sugeridos es la carpeta de newsletters que nadie abre. Al lector le
// llega una sugerencia cuando termina algo que le gustó, y nada más.
//
// Uso:
//   node jobs/libros.mjs
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

const cab = { apikey: env.SUPABASE_SECRET_KEY, Authorization: `Bearer ${env.SUPABASE_SECRET_KEY}` };
async function traer(ruta) {
  const r = await fetch(`${env.SUPABASE_URL}/rest/v1/${ruta}`, { headers: cab });
  if (!r.ok) throw new Error(`${ruta}: HTTP ${r.status}`);
  return r.json();
}

const [libros, piezas, estados, lectura] = await Promise.all([
  traer('books?select=id,slug,title,author,themes'),
  traer('book_pieces?select=id,book_id,lang,for_read_state'),
  traer('book_piece_state?select=profile_id,piece_id,comprension,interes'),
  traer('book_state?select=profile_id,book_id,read_state')
]);

const libroDe = Object.fromEntries(piezas.map(p => [p.id, p.book_id]));
const porId = Object.fromEntries(libros.map(l => [l.id, l]));

// ------------------------------------------------------------
// El pulgar, por tema y por libro
// ------------------------------------------------------------
const temaPulgar = {};
const temaGente = {};
const libroPulgar = {};
const comprensiones = {};

for (const e of estados) {
  const bid = libroDe[e.piece_id];
  const libro = porId[bid];
  if (!libro) continue;

  if (e.interes) {
    libroPulgar[bid] = (libroPulgar[bid] || 0) + e.interes;
    for (const t of libro.themes || []) {
      temaPulgar[t] = (temaPulgar[t] || 0) + e.interes;
      (temaGente[t] ||= new Set()).add(e.profile_id);
    }
  }
  if (e.comprension != null) (comprensiones[bid] ||= []).push(e.comprension);
}

const media = (xs) => (xs?.length ? Math.round((xs.reduce((a, b) => a + b, 0) / xs.length) * 10) / 10 : null);

// ------------------------------------------------------------
// Cuánta biblioteca hay por tema, y cuánta se agotó
// ------------------------------------------------------------
const librosPorTema = {};
for (const l of libros) for (const t of l.themes || []) (librosPorTema[t] ||= []).push(l.slug);

// Agotado por persona: no le queda ninguna pieza sin contestar para el
// estado de lectura que declaró.
const contestadasPor = {};
for (const e of estados) (contestadasPor[e.profile_id] ||= new Set()).add(e.piece_id);

const agotadosPor = {};
for (const s of lectura) {
  const suyas = piezas.filter(p => p.book_id === s.book_id && p.for_read_state === s.read_state && p.lang === 'es');
  if (!suyas.length) continue;
  const hechas = contestadasPor[s.profile_id] || new Set();
  if (suyas.every(p => hechas.has(p.id))) (agotadosPor[s.profile_id] ||= new Set()).add(s.book_id);
}

// ------------------------------------------------------------
// Informe
// ------------------------------------------------------------
console.log('Frontera · qué libro conviene escribir después\n');
console.log(`${libros.length} libros · ${piezas.filter(p => p.lang === 'es').length} piezas en español · ${estados.length} piezas contestadas\n`);

// Sin `process.exit` a esta altura: en Windows, salir con los sockets
// del fetch todavía abiertos revienta libuv con un assert y el job
// termina mal aunque haya hecho todo bien.
const sinDatos = !estados.length;

if (sinDatos) {
  console.log('Todavía nadie contestó una pieza de libro. Sin pulgares no hay nada que ordenar:');
  console.log('el ranking se construye con lo que la gente marca al cerrar cada pieza.\n');
}

const temas = Object.keys(temaPulgar).sort((a, b) => temaPulgar[b] - temaPulgar[a]);

if (!sinDatos) {
console.log('Temas, por pulgar neto:');
for (const t of temas) {
  const n = temaPulgar[t];
  const gente = temaGente[t]?.size ?? 0;
  const cuantos = librosPorTema[t]?.length ?? 0;
  const marca = n <= -3 ? '  (apagado: no se le trae más)' : '';
  console.log(`  ${n > 0 ? '+' : ''}${n}  ${t}  ·  ${gente} persona(s) · ${cuantos} libro(s) en la biblioteca${marca}`);
}

console.log('\nLibros, por pulgar neto:');
for (const l of [...libros].sort((a, b) => (libroPulgar[b.id] || 0) - (libroPulgar[a.id] || 0))) {
  const n = libroPulgar[l.id] || 0;
  const c = media(comprensiones[l.id]);
  console.log(`  ${n > 0 ? '+' : ''}${n}  ${l.title}${c != null ? `  · comprensión media ${c}` : '  · sin datos'}`);
}

// La recomendación: el tema que más pegó y menos biblioteca tiene. Un
// tema con tres libros ya tiene por dónde seguir; uno con uno solo, no.
const candidatos = temas
  .filter(t => temaPulgar[t] > 0)
  .map(t => ({ tema: t, pulgar: temaPulgar[t], libros: librosPorTema[t]?.length ?? 0 }))
  // Empate: gana el que menos biblioteca tiene. Un tema que pegó y
  // tiene un solo libro es por donde conviene seguir; uno que pegó y
  // ya tiene tres, puede esperar.
  .sort((a, b) => (b.pulgar / (b.libros + 1)) - (a.pulgar / (a.libros + 1)) || a.libros - b.libros);

console.log('\nPor dónde conviene seguir:');
if (!candidatos.length) {
  console.log('  Ningún tema con pulgar positivo todavía. Con tan pocos datos, elegí vos.');
} else {
  for (const c of candidatos.slice(0, 3)) {
    console.log(`  · ${c.tema}: pulgar ${c.pulgar} con ${c.libros} libro(s). ${c.libros <= 1 ? 'Le pegó y casi no hay de dónde seguir.' : 'Ya tiene por dónde seguir.'}`);
  }
  console.log(`\n  El próximo libro conviene que sea de "${candidatos[0].tema}".`);
}

const agotaronTodo = Object.entries(agotadosPor)
  .filter(([pid]) => (lectura.filter(s => s.profile_id === pid).length || 0) === (agotadosPor[pid]?.size || 0))
  .map(([pid]) => pid.slice(0, 8));

if (agotaronTodo.length) {
  console.log(`\nAgotaron todo lo que declararon: ${agotaronTodo.join(', ')}. Para ésos la biblioteca ya no tiene qué servir.`);
}
}

console.log('\nEsto no escribe nada. La estructura de una pieza que enseña está en');
console.log('db/027_grove_pieza_1.sql y el criterio, en la nota de traspaso.');
