// ============================================================
// Frontera - controles automáticos
// ============================================================
// Todo lo que se rompió hasta ahora en este proyecto se descubrió a
// mano y de casualidad: lecciones sin contenido, repasos agendados
// sobre cosas ya sabidas, una subida que devolvía cero en silencio.
//
// Esto es lo que debería haber existido desde el principio: un set de
// invariantes que corre en segundos y avisa. No prueba que la app sea
// buena; prueba que los datos no estén rotos, que es distinto y es lo
// mínimo.
//
// Uso:
//   node jobs/revisar.mjs
//
// Devuelve código 1 si hay algo roto, así se puede encadenar.
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
  'Authorization': `Bearer ${env.SUPABASE_SECRET_KEY}`,
  'Content-Type': 'application/json'
};

async function traer(ruta) {
  const r = await fetch(`${env.SUPABASE_URL}/rest/v1/${ruta}`, { headers: cab });
  if (!r.ok) throw new Error(`${ruta}: HTTP ${r.status} ${await r.text()}`);
  return r.json();
}

// ------------------------------------------------------------
// Los datos, una sola vez
// ------------------------------------------------------------
const [
  topics, lessons, contenidos, libros, piezas,
  perfiles, estados, repasos, retos, senales, estadoLibros
] = await Promise.all([
  traer('topics?select=id,slug,name_es,kind,level_floor,terms'),
  traer('lessons?select=id,slug,kind,topic_id,level_floor,level_ceiling,track_order,published'),
  traer('lesson_contents?select=id,lesson_id,lang,tool_id,title,body_md,minutes'),
  traer('books?select=id,slug,title,themes,terms'),
  traer('book_pieces?select=id,book_id,lang,for_read_state,idx,title,body_md'),
  traer('profiles?select=id,level,level_source,onboarded_at,lang,interest_topics,puede_invitar'),
  traer('lesson_state?select=profile_id,lesson_id,status,comprension,answered_at'),
  traer('reviews?select=id,profile_id,lesson_id,stage,due_on,done_at'),
  traer('challenges?select=id,profile_id,status,title,body_md,nodo:topic_id,dificultad,sirvio,answered_at'),
  traer('signals?select=id,status,topic_id,url_hash,title'),
  traer('book_state?select=profile_id,book_id,read_state')
]);

// ------------------------------------------------------------
// Controles
// ------------------------------------------------------------
const fallas = [];
const avisos = [];

const falla = (q, detalle) => fallas.push({ q, detalle });
const aviso = (q, detalle) => avisos.push({ q, detalle });

const ESTADOS_LECTURA = ['no_lei', 'hace_tiempo', 'fresco'];

// 1. Una lección publicada sin contenido no existe para nadie, pero
//    ocupa lugar en el ruteo y produjo un error rojo en producción.
for (const l of lessons.filter(x => x.published)) {
  const propios = contenidos.filter(c => c.lesson_id === l.id && !c.tool_id);
  if (!propios.length) falla('Lección publicada sin contenido', l.slug);
  else if (!propios.some(c => c.lang === 'es')) falla('Lección sin versión en español', l.slug);
}

// 2. Contenido demasiado corto: casi siempre es un insert a medias.
for (const c of contenidos) {
  if ((c.body_md || '').length < 300 && !c.tool_id) {
    falla('Contenido sospechosamente corto', `${c.title} (${c.body_md?.length ?? 0} caracteres)`);
  }
  if (!c.title?.trim()) falla('Contenido sin título', `id ${c.id}`);
}

// 3. El track fundacional tiene que estar ordenado y sin huecos.
const track = lessons.filter(l => l.kind === 'fundamento' && l.published)
  .map(l => l.track_order).filter(n => n != null).sort((a, b) => a - b);
for (const [i, n] of track.entries()) {
  if (n !== i + 1) { falla('El track tiene huecos o repetidos en el orden', `esperaba ${i + 1}, encontré ${n}`); break; }
}
if (lessons.some(l => l.kind === 'fundamento' && l.published && l.track_order == null)) {
  falla('Lección del track sin orden', 'alguna lección de fundamento no tiene track_order');
}

// 4. Ni el radar ni las lecciones de frontera deben llegarle a alguien
//    de nivel 0 o 1: el estado del arte a quien recién empieza lo
//    abruma y lo pierde.
for (const l of lessons.filter(x => ['radar', 'frontera'].includes(x.kind) && x.published)) {
  if (l.level_floor < 2) falla('Lección de frontera con piso demasiado bajo', `${l.slug} (piso ${l.level_floor})`);
}

// 5. Un libro con estados incompletos deja a alguien sin nada que leer.
for (const b of libros) {
  const suyas = piezas.filter(p => p.book_id === b.id);
  if (!suyas.length) { aviso('Libro sin procesar', b.title); continue; }
  for (const e of ESTADOS_LECTURA) {
    if (!suyas.some(p => p.for_read_state === e)) {
      falla('Libro con un estado de lectura vacío', `${b.title}: falta ${e}`);
    }
  }
}

// 6. El bug real que ya aparecio una vez: repasos agendados sobre
//    lecciones que la persona marcó como sabidas.
const sabidas = new Set(estados.filter(e => e.status === 'ya_la_sabia').map(e => `${e.profile_id}|${e.lesson_id}`));
const repasosDeMas = repasos.filter(r => !r.done_at && sabidas.has(`${r.profile_id}|${r.lesson_id}`));
if (repasosDeMas.length) falla('Repasos agendados sobre lecciones ya sabidas', `${repasosDeMas.length} pendientes`);

// 7. Repasos huérfanos: la lección ya no existe o no está publicada.
const idsLecciones = new Set(lessons.filter(l => l.published).map(l => l.id));
const huerfanos = repasos.filter(r => !r.done_at && !idsLecciones.has(r.lesson_id));
if (huerfanos.length) falla('Repasos pendientes de lecciones que ya no están', `${huerfanos.length}`);

// 8. Un solo reto abierto por persona: dos compiten entre sí y ninguno
//    se hace.
const abiertosPorPersona = {};
for (const c of retos.filter(x => ['propuesto', 'haciendo'].includes(x.status))) {
  abiertosPorPersona[c.profile_id] = (abiertosPorPersona[c.profile_id] || 0) + 1;
}
for (const [p, n] of Object.entries(abiertosPorPersona)) {
  if (n > 1) falla('Más de un reto abierto para la misma persona', `${n} retos`);
}

// 9. Un perfil que terminó el onboarding tiene que tener respuestas.
for (const p of perfiles.filter(x => x.onboarded_at)) {
  if (p.level == null) falla('Perfil sin nivel', p.id.slice(0, 8));
}

// 10. Señales promovidas sin nodo: quedan fuera del mapa.
const promovidasSinNodo = senales.filter(s => s.status === 'promovida' && !s.topic_id);
if (promovidasSinNodo.length) falla('Señales promovidas sin nodo asignado', `${promovidasSinNodo.length}`);

// 11. Nodos del mapa sin nada que mostrar nunca.
const conLeccion = new Set(lessons.filter(l => l.published).map(l => l.topic_id));
const conSenal = new Set(senales.filter(s => s.status === 'promovida').map(s => s.topic_id));
for (const t of topics) {
  if (!conLeccion.has(t.id) && !conSenal.has(t.id)) aviso('Nodo del mapa sin contenido', t.name_es);
}

// 12. Comprensión fuera de rango o estados inconsistentes.
for (const e of estados) {
  if (e.answered_at && e.status === 'servida') {
    falla('Lección contestada pero marcada como servida', `${e.profile_id.slice(0, 8)} / ${e.lesson_id}`);
  }
}

// 13. Estados de lectura de libro inválidos.
for (const s of estadoLibros) {
  if (!ESTADOS_LECTURA.includes(s.read_state)) falla('Estado de lectura inválido', s.read_state);
}

// ------------------------------------------------------------
// Los que faltaban
// ------------------------------------------------------------
// Salieron de dos auditorías. Cada uno caza algo que ya estaba
// pasando y que ningún control miraba.

// 14. La app se vacía a cierto nivel. Es el control que hubiera
//     avisado que para un nivel 3 había ocho lecciones alcanzables y
//     después "por hoy está" para siempre.
for (let nivel = 0; nivel <= 4; nivel++) {
  const alcanzables = lessons.filter(l =>
    l.published &&
    l.level_floor <= nivel &&
    // El track ignora el techo a propósito: ver vistaHoy.
    (l.kind === 'fundamento' || l.level_ceiling >= nivel) &&
    contenidos.some(c => c.lesson_id === l.id && c.lang === 'es' && !c.tool_id)
  ).length;

  if (alcanzables === 0) falla('Nivel sin una sola lección servible', `nivel ${nivel}`);
  else if (alcanzables < 5) aviso('Nivel con poco material', `nivel ${nivel}: ${alcanzables} lecciones`);
}

// 15. Repasos acumulados. La app promete que nada se acumula; una cola
//     de repasos vencidos es exactamente una deuda con contador.
const hoyISO = new Date().toISOString().slice(0, 10);
for (const p of perfiles) {
  const vencidos = repasos.filter(r => r.profile_id === p.id && !r.done_at && r.due_on <= hoyISO);
  if (vencidos.length > 8) falla('Repasos acumulados', `${vencidos.length} vencidos le tapan Hoy a un perfil`);

  const zombis = vencidos.filter(r => (Date.now() - new Date(r.due_on).getTime()) / 864e5 > 30);
  if (zombis.length) aviso('Repasos zombi', `${zombis.length} con más de 30 días vencidos`);
}

// 16. Una lección contestada que no agendó ningún repaso: el upsert de
//     reviews falló en silencio y el motor quedó apagado para esa
//     lección sin que nadie se entere.
for (const e of estados.filter(x => x.status === 'hecha' && x.answered_at)) {
  const tiene = repasos.some(r => r.profile_id === e.profile_id && r.lesson_id === e.lesson_id);
  if (!tiene) falla('Lección hecha sin repasos agendados', `lección ${e.lesson_id}`);
}

// 17. Sintaxis que el renderizador de la app no sabe dibujar. No es
//     cosmético: la persona ve los caracteres crudos. Las itálicas y
//     las listas numeradas ya están soportadas; esto vigila el resto,
//     que es lo que va a traer la próxima lección generada.
const SIN_SOPORTE = [
  [/```/, 'bloque de código'],
  [/^\s*\|/m, 'tabla'],
  [/\]\(https?:/, 'link'],
  [/^\s*>/m, 'cita'],
  [/^\s*#{4,}\s/m, 'título de nivel 4 o más']
];

for (const c of contenidos) {
  for (const [re, que] of SIN_SOPORTE) {
    if (re.test(c.body_md || '')) falla('Sintaxis que la app muestra en crudo', `${c.title}: ${que}`);
  }
}

for (const pz of piezas) {
  for (const [re, que] of SIN_SOPORTE) {
    if (re.test(pz.body_md || '')) falla('Sintaxis que la app muestra en crudo', `${pz.title}: ${que}`);
  }
}

// ------------------------------------------------------------
// Los cables del motor
// ------------------------------------------------------------
// Estos cuatro vigilan las señales que se cablearon después de las dos
// auditorías. Todas fallaron de la misma manera antes: la app las
// guardaba, nadie las leía y nada avisaba.

// 18. Un nodo sin términos no puede aparecer nunca en el ruteo por
//     intereses: lo que la persona escribió en el Paso 1 no lo alcanza.
//     Es data que tiene que existir (migración 050).
for (const t of topics) {
  if (!Array.isArray(t.terms) || !t.terms.length) {
    falla('Nodo del mapa sin términos', `${t.name_es} (no entra nunca al ruteo por intereses)`);
  }
}

// 19. Un perfil con onboarding y sin intereses calculados: el cruce no
//     corrió. No es que no nombró nada —eso es una lista vacía— es que
//     nunca se midió.
for (const p of perfiles.filter(x => x.onboarded_at)) {
  if (p.interest_topics == null) {
    falla('Perfil sin intereses calculados', `${p.id.slice(0, 8)} (corré la migración 050)`);
  }
}

// 20. Intereses que apuntan a un nodo que ya no existe. Pasa si se
//     borra un nodo del mapa y no se limpia.
const idsNodos = new Set(topics.map(t => t.id));
for (const p of perfiles) {
  const fantasmas = (p.interest_topics || []).filter(id => !idsNodos.has(id));
  if (fantasmas.length) falla('Intereses apuntando a nodos que no existen', `${p.id.slice(0, 8)}: ${fantasmas.length}`);
}

// 21b. Quién puede sumar gente. Es el único permiso del proyecto y lo
//      que hace es crear cuentas, así que tiene que estar a la vista en
//      cada corrida y no enterrado en una tabla.
const puedenInvitar = perfiles.filter(p => p.puede_invitar);
if (puedenInvitar.length > 1) {
  aviso('Más de una cuenta puede sumar gente', puedenInvitar.map(p => p.id.slice(0, 8)).join(', '));
}

// 21. Un libro sin temas no entra nunca al ruteo de la biblioteca: no
//     se puede ordenar por lo que te gustó ni sugerir después de él.
for (const b of libros) {
  if (!Array.isArray(b.themes) || !b.themes.length) {
    falla('Libro sin temas', `${b.title} (queda fuera del orden y de las sugerencias)`);
  }
  // Y sin términos no lo alcanza nunca el contexto de nadie: para esa
  // persona el libro sale siempre por azar.
  if (!Array.isArray(b.terms) || !b.terms.length) {
    falla('Libro sin términos', `${b.title} (no lo puede encontrar el contexto de nadie)`);
  }
}

// 22. Un reto marcado como hecho sin dificultad es una señal perdida:
//     la persona trabajó media hora y el calibre del próximo queda a
//     ciegas. No es falla —se puede cerrar sin contestar, las salidas
//     están siempre visibles— pero hay que saberlo.
const hechosSinDato = retos.filter(r => r.status === 'hecho' && r.dificultad == null);
if (hechosSinDato.length) {
  aviso('Retos hechos sin dificultad', `${hechosSinDato.length}: el calibre del próximo va a ciegas`);
}

// ------------------------------------------------------------
// Informe
// ------------------------------------------------------------
console.log(`Frontera · controles\n`);
console.log(`${topics.length} nodos · ${lessons.filter(l => l.published).length} lecciones · ${contenidos.length} contenidos`);
console.log(`${libros.length} libros · ${piezas.length} piezas · ${retos.length} retos · ${senales.length} señales`);
console.log(`${perfiles.length} perfiles · ${repasos.filter(r => !r.done_at).length} repasos pendientes\n`);
console.log(`pueden sumar gente: ${puedenInvitar.length ? puedenInvitar.map(p => p.id.slice(0, 8)).join(', ') : 'nadie'}
`);

if (!fallas.length) {
  console.log('✓ Sin fallas.');
} else {
  console.log(`✗ ${fallas.length} ${fallas.length === 1 ? 'falla' : 'fallas'}:\n`);
  for (const f of fallas) console.log(`  · ${f.q}: ${f.detalle}`);
}

if (avisos.length) {
  console.log(`\n${avisos.length} ${avisos.length === 1 ? 'aviso' : 'avisos'} (no son errores, son cosas a saber):\n`);
  for (const a of avisos) console.log(`  · ${a.q}: ${a.detalle}`);
}

process.exit(fallas.length ? 1 : 0);
