// ============================================================
// Frontera - preparar el reto de alguien del círculo
// ============================================================
// retos.mjs mide con las sesiones de Claude Code de esta máquina, así
// que sólo sirve para Diego. Este hace lo mismo para cualquier persona
// del círculo, pero con lo que la app ya sabe de ella: nivel, lecciones
// contestadas, herramientas y el resumen de contexto del onboarding.
//
// Igual que el original, no escribe el reto: arma el brief para que lo
// escriba quien tiene criterio (skill reto) y lo deja en jobs/salida/.
// Después, el reto se publica con:
//   node jobs/publicar.mjs jobs/salida/reto-circulo-FECHA.json --perfil <profile_id>
//
// Regla de privacidad: el brief lleva nodos, números y el resumen de
// contexto que la persona escribió para esto. NUNCA las instrucciones
// personales ni texto de conversaciones.
//
// Uso:
//   node jobs/retos-circulo.mjs                -> lista a quién le toca
//   node jobs/retos-circulo.mjs <profile_id>   -> arma el brief de esa persona
// ============================================================

import { readFileSync, writeFileSync, existsSync, mkdirSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { calibrar, nodosQuemados } from './calibre.mjs';

const AQUI = dirname(fileURLToPath(import.meta.url));
const HOY = new Date().toISOString().slice(0, 10);

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

const [perfiles, topics, retos] = await Promise.all([
  traer('profiles?select=id,level,onboarded_at,context_summary,interest_topics&onboarded_at=not.is.null'),
  traer('topics?select=id,slug,name_es,kind,level_floor&order=sort'),
  traer('challenges?select=profile_id,status,topic_id,dificultad,sirvio,answered_at')
]);

const abiertos = new Set(retos.filter(r => ['propuesto', 'haciendo'].includes(r.status)).map(r => r.profile_id));
const objetivo = process.argv[2];

// Sin argumento: quién no tiene un reto abierto. Un solo reto por persona.
if (!objetivo) {
  console.log('Personas con onboarding hecho y sin reto abierto:\n');
  const libres = perfiles.filter(p => !abiertos.has(p.id));
  for (const p of libres) console.log(`  ${p.id}  nivel ${p.level}`);
  if (!libres.length) console.log('  ninguna');
  console.log('\nArmar el brief: node jobs/retos-circulo.mjs <profile_id>');
  process.exit(0);
}

const p = perfiles.find(x => x.id === objetivo);
if (!p) { console.log('Ese perfil no existe o no terminó el onboarding.'); process.exit(1); }
if (abiertos.has(p.id)) { console.log('Esa persona ya tiene un reto abierto: dos compiten y ninguno se hace.'); process.exit(1); }

const [dominios, estados, lecciones, usos] = await Promise.all([
  traer(`topic_mastery?profile_id=eq.${p.id}&select=topic_id,mastery`),
  traer(`lesson_state?profile_id=eq.${p.id}&answered_at=not.is.null&select=lesson_id,status,comprension`),
  traer('lessons?select=id,topic_id'),
  traer(`profile_tools?profile_id=eq.${p.id}&select=tool_id,relation`)
]);

// Mismo criterio que el Mapa de la app: lo mayor entre la evidencia
// externa y 30 puntos por lección contestada. Una lección que ya sabía
// no suma dominio nuevo, así que no se cuenta.
const topicDe = Object.fromEntries(lecciones.map(l => [l.id, l.topic_id]));
const porLecciones = {};
for (const e of estados) {
  if (e.status === 'ya_la_sabia') continue;
  const t = topicDe[e.lesson_id];
  if (t) porLecciones[t] = (porLecciones[t] || 0) + 1;
}
const ext = Object.fromEntries(dominios.map(d => [d.topic_id, d.mastery]));
const valorDe = (t) => Math.max(ext[t.id] ?? 0, Math.min(100, (porLecciones[t.id] || 0) * 30));

// ------------------------------------------------------------
// Lo que dijo de los retos anteriores
// ------------------------------------------------------------
// `dificultad` y `sirvio` eran los dos últimos clics que la app pedía
// y no leía nadie. Acá es donde tienen que pesar: el reto siguiente lo
// escribe alguien con criterio, y estos dos números son lo único que
// sabemos de cómo le fue con el anterior.
const cerrados = retos
  .filter(r => r.profile_id === p.id && r.answered_at)
  .sort((a, b) => String(b.answered_at).localeCompare(String(a.answered_at)));

const ultimo = cerrados[0] || null;
const calibre = calibrar(ultimo);
const quemados = nodosQuemados(cerrados, topics.map(t => t.id));

// Los temas que nombró en el onboarding con sus propias palabras
// (profiles.interest_topics, migración 050). No eligen el hueco —el
// hueco es lo que le falta— pero desempatan: entre dos nodos con el
// mismo dominio, el que ella misma puso sobre la mesa.
const suyos = new Set(p.interest_topics || []);

const armar = (t) => ({
  nodo: t.slug,
  nombre: t.name_es,
  dominio: valorDe(t),
  lo_nombro: suyos.has(t.id)
});

const ordenar = (a, b) => (a.dominio - b.dominio) || (Number(b.lo_nombro) - Number(a.lo_nombro));

const alcance = topics.filter(t => t.level_floor <= p.level && !quemados.has(t.id));
const huecos = alcance.filter(t => t.kind === 'frontera').map(armar).sort(ordenar);

// Si no hay frontera a su alcance (nivel 0 o 1), el hueco sale del track.
const candidatos = huecos.length ? huecos : alcance.map(armar).sort(ordenar);

if (!candidatos.length || candidatos[0].dominio >= 60) {
  console.log('No hay un hueco claro: todo lo que tiene al alcance está por encima de 60.');
  if (quemados.size) console.log(`(${quemados.size} nodo(s) quedaron afuera: dos retos seguidos que no le sirvieron.)`);
  process.exit(0);
}

const brief = {
  fecha: HOY,
  profile_id: p.id,
  hueco: {
    nodo: candidatos[0].nodo,
    dominio: candidatos[0].dominio,
    lo_nombro: candidatos[0].lo_nombro,
    por_que: `Nodo con dominio ${candidatos[0].dominio} sobre 100, dentro del alcance de un nivel ${p.level}.`
      + (candidatos[0].lo_nombro ? ' Además es un tema que nombró ella en el Paso 1.' : '')
  },
  nivel: p.level,
  otros_huecos: candidatos.slice(1, 4),
  lecciones_contestadas: estados.length,
  herramientas: usos.map(u => `${u.tool_id}:${u.relation}`),
  contexto: p.context_summary || null,
  temas_que_nombro: topics.filter(t => suyos.has(t.id)).map(t => t.slug),
  // Lo que dijo del reto anterior. Son dos números y cambian el
  // siguiente: para eso se los pedimos al cerrar.
  anterior: ultimo
    ? {
        dificultad: ultimo.dificultad,
        sirvio: ultimo.sirvio,
        cerrado: ultimo.answered_at?.slice(0, 10) || null
      }
    : null,
  calibre,
  nodos_descartados: topics.filter(t => quemados.has(t.id)).map(t => t.slug),
  instrucciones: [
    'No conocés su trabajo más que por el contexto de arriba: si no alcanza para hacer el reto sobre algo propio, el reto tiene que empezar pidiéndole que elija una tarea real que tenga esta semana.',
    'El hueco elige el TEMA. Lo que ella ya tiene entre manos lo hace PROPIO.',
    `Calibre: ${calibre}.`,
    'Si `nodos_descartados` no está vacío, ésos son nodos donde ya le dimos dos retos que no le sirvieron: no vuelvas por ahí ni de costado.',
    'Entre 15 y 30 minutos. Pasos numerados y concretos, cada uno con algo observable al final.',
    'Nada que requiera instalar algo ni pedir permiso. Usá sólo las herramientas de la lista.',
    'Cerrar diciendo qué va a cambiar si le sale, no felicitando.',
    'Escribir el resultado en jobs/salida/reto-circulo-' + HOY + '.json con la forma: { nodo, titulo, cuerpo, porque, minutos }'
  ]
};

mkdirSync(join(AQUI, 'salida'), { recursive: true });
// El nombre no lleva el id completo: el repo es privado pero los nombres
// de archivo viajan a logs y a la historia.
const salida = join(AQUI, 'salida', `brief-reto-circulo-${HOY}.json`);
writeFileSync(salida, JSON.stringify(brief, null, 2), 'utf8');

console.log(`Hueco: ${brief.hueco.nodo} (dominio ${brief.hueco.dominio}), nivel ${p.level}`);
console.log(`Calibre: ${calibre}`);
if (brief.temas_que_nombro.length) console.log(`Temas que nombró: ${brief.temas_que_nombro.join(', ')}`);
if (brief.nodos_descartados.length) console.log(`Nodos descartados (dos retos que no sirvieron): ${brief.nodos_descartados.join(', ')}`);
console.log(`Brief: ${salida}`);
