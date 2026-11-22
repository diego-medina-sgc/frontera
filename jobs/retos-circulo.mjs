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
// Después, el reto se inserta en `challenges` con publicar-reto.
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
  traer('profiles?select=id,level,onboarded_at,context_summary&onboarded_at=not.is.null'),
  traer('topics?select=id,slug,name_es,kind,level_floor&order=sort'),
  traer('challenges?select=profile_id,status')
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

const alcance = topics.filter(t => t.level_floor <= p.level);
const huecos = alcance
  .filter(t => t.kind === 'frontera')
  .map(t => ({ nodo: t.slug, nombre: t.name_es, dominio: valorDe(t) }))
  .sort((a, b) => a.dominio - b.dominio);

// Si no hay frontera a su alcance (nivel 0 o 1), el hueco sale del track.
const candidatos = huecos.length ? huecos : alcance
  .map(t => ({ nodo: t.slug, nombre: t.name_es, dominio: valorDe(t) }))
  .sort((a, b) => a.dominio - b.dominio);

if (!candidatos.length || candidatos[0].dominio >= 60) {
  console.log('No hay un hueco claro: todo lo que tiene al alcance está por encima de 60.');
  process.exit(0);
}

const brief = {
  fecha: HOY,
  profile_id: p.id,
  hueco: {
    nodo: candidatos[0].nodo,
    dominio: candidatos[0].dominio,
    por_que: `Nodo con dominio ${candidatos[0].dominio} sobre 100, dentro del alcance de un nivel ${p.level}.`
  },
  nivel: p.level,
  otros_huecos: candidatos.slice(1, 4),
  lecciones_contestadas: estados.length,
  herramientas: usos.map(u => `${u.tool_id}:${u.relation}`),
  contexto: p.context_summary || null,
  instrucciones: [
    'No conocés su trabajo más que por el contexto de arriba: si no alcanza para hacer el reto sobre algo propio, el reto tiene que empezar pidiéndole que elija una tarea real que tenga esta semana.',
    'El hueco elige el TEMA. Lo que ella ya tiene entre manos lo hace PROPIO.',
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
console.log(`Brief: ${salida}`);
