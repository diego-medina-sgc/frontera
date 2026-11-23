// ============================================================
// Frontera - preparar retos
// ============================================================
// No escribe el reto: arma el pedido para que lo escriba quien tiene
// criterio. Cruza el hueco medido con el material real y deja un brief
// en jobs/salida/ para que la segunda etapa lo complete.
//
// Es el mismo patrón del radar: la máquina junta y ordena, el criterio
// decide y redacta.
//
// Uso:
//   node jobs/retos.mjs    -> arma el brief del próximo reto
// ============================================================

import { readFileSync, writeFileSync, existsSync, readdirSync, statSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { homedir } from 'node:os';
import { calibrar } from './calibre.mjs';

const AQUI = dirname(fileURLToPath(import.meta.url));
const HOY = new Date().toISOString().slice(0, 10);
const PERFIL = join(AQUI, 'salida', 'perfil-evidencia.json');

if (!existsSync(PERFIL)) {
  console.log('Primero hace falta el perfil por evidencia:\n  node jobs/evidencia.mjs');
  process.exit(1);
}

const perfil = JSON.parse(readFileSync(PERFIL, 'utf8'));

if (!perfil.huecos?.length) {
  console.log('No hay huecos medidos. Eso puede ser bueno: quiere decir que lo que');
  console.log('tenés al alcance ya lo estás tocando. El próximo reto va a tener que');
  console.log('salir de otro lado.');
  process.exit(0);
}

// ------------------------------------------------------------
// El material: en qué anduvo últimamente y cuánto
// ------------------------------------------------------------
// Solo nombres de carpetas propias y conteos. Ni una línea de contenido.
const RAIZ = join(homedir(), '.claude', 'projects');

function proyectos() {
  if (!existsSync(RAIZ)) return [];
  const out = [];
  for (const e of readdirSync(RAIZ, { withFileTypes: true })) {
    if (!e.isDirectory()) continue;
    const dir = join(RAIZ, e.name);
    const archivos = readdirSync(dir).filter(f => f.endsWith('.jsonl'));
    if (!archivos.length) continue;
    const fechas = archivos.map(f => statSync(join(dir, f)).mtime);
    out.push({
      // El nombre de carpeta que usa Claude Code, limpiado.
      nombre: e.name.replace(/^C--Users-[^-]+-/, '').replace(/-/g, ' ').trim(),
      sesiones: archivos.length,
      ultima: new Date(Math.max(...fechas)).toISOString().slice(0, 10)
    });
  }
  return out.sort((a, b) => (a.ultima < b.ultima ? 1 : -1)).slice(0, 6);
}

const material = proyectos();
const hueco = perfil.huecos[0];

// ------------------------------------------------------------
// Cómo le fue con el anterior
// ------------------------------------------------------------
// Los dos clics del cierre de un reto (dificultad y sirvió) se
// guardaban y no los leía nadie. Calibran el que viene: la regla está
// en calibre.mjs.
//
// Esto es lo único de este job que necesita la base. Si no contesta, el
// brief sale igual sin calibre: un reto sin escribir es peor que un
// reto sin calibrar.
const env = {};
const rutaEnv = join(AQUI, '.env');
if (existsSync(rutaEnv)) {
  for (const linea of readFileSync(rutaEnv, 'utf8').split('\n')) {
    const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
    if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
  }
}

let ultimo = null;
if (env.SUPABASE_URL && env.SUPABASE_SECRET_KEY && env.PROFILE_ID) {
  try {
    const r = await fetch(
      `${env.SUPABASE_URL}/rest/v1/challenges?profile_id=eq.${env.PROFILE_ID}`
      + '&answered_at=not.is.null&select=dificultad,sirvio,answered_at'
      + '&order=answered_at.desc&limit=1',
      {
        headers: {
          apikey: env.SUPABASE_SECRET_KEY,
          Authorization: `Bearer ${env.SUPABASE_SECRET_KEY}`
        }
      }
    );
    if (r.ok) ultimo = (await r.json())[0] || null;
  } catch { /* el brief sale sin calibre */ }
}

const calibre = calibrar(ultimo);

const brief = {
  fecha: HOY,
  hueco: {
    nodo: hueco.nodo,
    dominio: hueco.valor,
    proyectos_donde_aparece: hueco.proyectos,
    por_que: `Nodo de frontera con dominio ${hueco.valor} sobre 100, dentro del alcance de un nivel ${perfil.nivel_sugerido}.`
  },
  nivel: perfil.nivel_sugerido,
  como_trabaja: perfil.modos,
  material_reciente: material,
  fuertes: perfil.dominio.slice(0, 3).map(d => d.nodo),
  anterior: ultimo
    ? { dificultad: ultimo.dificultad, sirvio: ultimo.sirvio, cerrado: ultimo.answered_at?.slice(0, 10) || null }
    : null,
  calibre,
  instrucciones: [
    'El hueco elige el TEMA. El material lo hace PROPIO. Ninguno de los dos solo.',
    `Calibre: ${calibre}.`,
    'El reto tiene que hacerse sobre algo que la persona ya tiene entre manos, no sobre un ejemplo.',
    'Entre 15 y 30 minutos. Si no entra en una sentada, no es un reto: es un proyecto.',
    'Pasos numerados y concretos. Cada paso tiene que terminar en algo observable.',
    'Nada que requiera instalar algo nuevo ni pedir permiso a nadie.',
    'Cerrar diciendo qué va a cambiar si le sale, no felicitando.',
    'Escribir el resultado en jobs/salida/reto-' + HOY + '.json con la forma: ' +
      '{ nodo, titulo, cuerpo, porque, minutos }'
  ]
};

writeFileSync(join(AQUI, 'salida', `brief-reto-${HOY}.json`), JSON.stringify(brief, null, 2), 'utf8');

console.log(`Hueco elegido: ${hueco.nodo} (dominio ${hueco.valor}, en ${hueco.proyectos} proyectos)`);
console.log(`Nivel: ${perfil.nivel_sugerido}`);
console.log(`Calibre: ${calibre}`);
console.log('\nMaterial reciente:');
for (const m of material) console.log(`  · ${m.nombre} — ${m.sesiones} sesiones, última el ${m.ultima}`);
console.log(`\nOtros huecos: ${perfil.huecos.slice(1).map(h => `${h.nodo} (${h.valor})`).join(', ') || 'ninguno'}`);
console.log(`\nBrief: jobs/salida/brief-reto-${HOY}.json`);
console.log('La segunda etapa lo escribe. Mirá el skill: .claude/skills/reto/SKILL.md');
