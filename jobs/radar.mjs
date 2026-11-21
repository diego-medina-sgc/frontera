// ============================================================
// Frontera - ingesta del radar
// ============================================================
// Sale a buscar al mundo una vez por día y deja en la base lo que
// encontró, sin juzgarlo todavía. Juzgar viene después, en el paso de
// triage, que corre con la suscripción de Claude y no con una API paga.
//
// Principios:
//  * Cero dependencias: solo Node. Nada de npm install.
//  * Cero costo: todas las fuentes son gratuitas y sin key.
//  * Jerarquía de primicia: lo primario (paper, changelog, repo) vale
//    más que el eco (comentarios, posts). El eco se usa para confirmar
//    que algo importa, no para enterarse.
//  * Nada se descarta acá. Esto solo junta.
//
// Uso:
//   node jobs/radar.mjs           -> en seco: muestra lo que encontró
//   node jobs/radar.mjs --guardar -> escribe en Supabase (necesita .env)
// ============================================================

import { createHash } from 'node:crypto';
import { readFileSync, existsSync, writeFileSync, mkdirSync } from 'node:fs';
import { fileURLToPath } from 'node:url';
import { dirname, join } from 'node:path';
import { filtrar, informe } from './triage.mjs';

const AQUI = dirname(fileURLToPath(import.meta.url));
const GUARDAR = process.argv.includes('--guardar');
const INFORME = process.argv.includes('--informe');
const DIAS = 3; // ventana: nada más viejo que esto entra al radar

// ------------------------------------------------------------
// Fuentes
// ------------------------------------------------------------
// primacy: 1 = primario (la novedad nace acá) · 2 = secundario
//          3 = eco (alguien contando algo que ya pasó)
const FUENTES = [
  // --- Lo que las empresas efectivamente sacan. Acá nace lo que cambia
  //     cómo trabajás mañana, que no es lo mismo que lo que nace en un paper.
  {
    nombre: 'OpenAI',
    kind: 'atom',
    primacy: 1,
    url: 'https://openai.com/news/rss.xml'
  },
  {
    nombre: 'Google AI',
    kind: 'atom',
    primacy: 1,
    url: 'https://blog.google/technology/ai/rss/'
  },
  {
    nombre: 'Hugging Face',
    kind: 'atom',
    primacy: 1,
    url: 'https://huggingface.co/blog/feed.xml'
  },
  // Anthropic no publica feed. Lo que saca llega igual, con un día de
  // retraso, por Simon Willison y por Hacker News.

  // --- Lo que se está construyendo. Repos NUEVOS, no los consagrados:
  //     ordenar por estrellas sin filtrar por fecha devuelve siempre los
  //     mismos diez proyectos de siempre, que no son noticia.
  {
    nombre: 'GitHub: repos nuevos',
    kind: 'github',
    primacy: 1,
    url: 'https://api.github.com/search/repositories'
       + '?q=topic:ai+created:>{DESDE_MES}&sort=stars&order=desc&per_page=20'
  },

  // --- Dónde nace la investigación. Se mantiene chico a propósito: de
  //     acá sale mucho volumen y poca cosa accionable.
  {
    nombre: 'arXiv cs.AI',
    kind: 'arxiv',
    primacy: 2,
    url: 'http://export.arxiv.org/api/query'
       + '?search_query=cat:cs.AI&sortBy=submittedDate&sortOrder=descending&max_results=15'
  },

  // --- Quien ya filtró por vos.
  {
    nombre: 'Simon Willison',
    kind: 'atom',
    primacy: 2,
    url: 'https://simonwillison.net/atom/everything/'
  },

  // --- Qué se discute.
  {
    nombre: 'Lo que se discute (Hacker News)',
    kind: 'hn',
    primacy: 3,
    url: 'https://hn.algolia.com/api/v1/search_by_date'
       + '?tags=story&numericFilters=points>80&query=AI&hitsPerPage=30'
  }
];

// ------------------------------------------------------------
// Utilidades
// ------------------------------------------------------------
const hash = (url) => createHash('sha256').update(url.trim().toLowerCase()).digest('hex').slice(0, 32);

const desdeISO = () => new Date(Date.now() - DIAS * 864e5).toISOString().slice(0, 10);
const desdeMesISO = () => new Date(Date.now() - 30 * 864e5).toISOString().slice(0, 10);

const limpiar = (s = '') => s
  .replace(/<[^>]*>/g, ' ')
  .replace(/&lt;/g, '<').replace(/&gt;/g, '>')
  .replace(/&amp;/g, '&').replace(/&quot;/g, '"').replace(/&#39;/g, "'")
  .replace(/\s+/g, ' ')
  .trim();

const recortar = (s, n) => (s.length > n ? s.slice(0, n - 1) + '…' : s);

// Extrae bloques <entry> o <item> sin traer un parser entero.
function bloques(xml, tag) {
  const out = [];
  const re = new RegExp(`<${tag}[\\s>][\\s\\S]*?</${tag}>`, 'g');
  for (const m of xml.matchAll(re)) out.push(m[0]);
  return out;
}

function campo(bloque, tag) {
  const m = bloque.match(new RegExp(`<${tag}[^>]*>([\\s\\S]*?)</${tag}>`));
  return m ? limpiar(m[1]) : '';
}

function enlace(bloque) {
  const href = bloque.match(/<link[^>]*rel=["']alternate["'][^>]*href=["']([^"']+)["']/)
            || bloque.match(/<link[^>]*href=["']([^"']+)["'][^>]*\/>/)
            || bloque.match(/<link[^>]*>([^<]+)<\/link>/);
  return href ? href[1].trim() : '';
}

async function traer(url) {
  const r = await fetch(url, {
    headers: {
      // Identificación genérica: nada personal sale de acá.
      'User-Agent': 'frontera-radar/1.0',
      'Accept': 'application/json, application/atom+xml, application/xml, text/xml, */*'
    }
  });
  if (!r.ok) throw new Error(`HTTP ${r.status}`);
  return r.headers.get('content-type')?.includes('json') ? r.json() : r.text();
}

// ------------------------------------------------------------
// Lectores por tipo de fuente
// ------------------------------------------------------------
const LECTORES = {
  arxiv(xml) {
    return bloques(xml, 'entry').map(b => ({
      titulo: campo(b, 'title'),
      resumen: recortar(campo(b, 'summary'), 600),
      url: enlace(b) || campo(b, 'id'),
      fecha: campo(b, 'published') || campo(b, 'updated')
    }));
  },

  atom(xml) {
    const entradas = bloques(xml, 'entry');
    const items = entradas.length ? entradas : bloques(xml, 'item');
    return items.map(b => ({
      titulo: campo(b, 'title'),
      resumen: recortar(campo(b, 'summary') || campo(b, 'description') || campo(b, 'content'), 600),
      url: enlace(b) || campo(b, 'guid'),
      fecha: campo(b, 'published') || campo(b, 'updated') || campo(b, 'pubDate')
    }));
  },

  github(json) {
    return (json.items || []).map(r => ({
      titulo: `${r.full_name} · ${r.stargazers_count.toLocaleString('es-AR')} estrellas`,
      resumen: recortar(limpiar(r.description || ''), 400),
      url: r.html_url,
      fecha: r.pushed_at
    }));
  },

  hn(json) {
    return (json.hits || []).map(h => ({
      titulo: h.title || '',
      resumen: `${h.points} puntos · ${h.num_comments || 0} comentarios`,
      url: h.url || `https://news.ycombinator.com/item?id=${h.objectID}`,
      fecha: h.created_at
    }));
  }
};

// ------------------------------------------------------------
// Recolección
// ------------------------------------------------------------
async function recolectar() {
  const desde = new Date(Date.now() - DIAS * 864e5);
  const todo = [];
  const problemas = [];

  for (const f of FUENTES) {
    const url = f.url
      .replace('{DESDE}', desdeISO())
      .replace('{DESDE_MES}', desdeMesISO());
    try {
      const crudo = await traer(url);
      const items = LECTORES[f.kind](crudo)
        .filter(i => i.titulo && i.url)
        .filter(i => !i.fecha || new Date(i.fecha) >= desde);

      for (const i of items) {
        todo.push({
          fuente: f.nombre,
          primacy: f.primacy,
          titulo: i.titulo,
          resumen: i.resumen,
          url: i.url,
          url_hash: hash(i.url),
          fecha: i.fecha ? new Date(i.fecha).toISOString() : null
        });
      }
      console.log(`  ${f.nombre}: ${items.length}`);
    } catch (e) {
      problemas.push(`${f.nombre}: ${e.message}`);
      console.log(`  ${f.nombre}: FALLÓ (${e.message})`);
    }
  }

  // Deduplicación por URL dentro de esta corrida. La de verdad, contra
  // lo ya ingerido, la hace la base por el índice único de url_hash.
  const vistos = new Set();
  const unicos = todo.filter(s => !vistos.has(s.url_hash) && vistos.add(s.url_hash));

  return { senales: unicos, problemas };
}

// ------------------------------------------------------------
// Guardado
// ------------------------------------------------------------
async function guardar(senales) {
  const env = {};
  const ruta = join(AQUI, '.env');
  if (existsSync(ruta)) {
    for (const linea of readFileSync(ruta, 'utf8').split('\n')) {
      const m = linea.match(/^\s*([A-Z_]+)\s*=\s*(.+?)\s*$/);
      if (m) env[m[1]] = m[2].replace(/^["']|["']$/g, '');
    }
  }

  const URL_BASE = env.SUPABASE_URL || process.env.SUPABASE_URL;
  const LLAVE = env.SUPABASE_SECRET_KEY || process.env.SUPABASE_SECRET_KEY;

  if (!URL_BASE || !LLAVE) {
    console.log('\nFalta jobs/.env con SUPABASE_URL y SUPABASE_SECRET_KEY.');
    console.log('Mirá jobs/.env.example. Por ahora no guardé nada.');
    return;
  }

  // Inserta ignorando los que ya existen: el índice único de url_hash es
  // el que decide qué es nuevo de verdad.
  const r = await fetch(`${URL_BASE}/rest/v1/signals?on_conflict=url_hash`, {
    method: 'POST',
    headers: {
      'apikey': LLAVE,
      'Authorization': `Bearer ${LLAVE}`,
      'Content-Type': 'application/json',
      'Prefer': 'resolution=ignore-duplicates,return=representation'
    },
    body: JSON.stringify(senales.map(s => ({
      url: s.url,
      url_hash: s.url_hash,
      title: recortar(s.titulo, 300),
      summary: s.resumen,
      published_at: s.fecha,
      status: 'nueva'
    })))
  });

  if (!r.ok) {
    console.log(`\nLa base rechazó la escritura: HTTP ${r.status}`);
    console.log(await r.text());
    return;
  }

  const guardadas = await r.json();
  console.log(`\nNuevas en la base: ${guardadas.length} de ${senales.length} (el resto ya estaba).`);
}

// ------------------------------------------------------------
// Principal
// ------------------------------------------------------------
console.log(`Radar · ventana de ${DIAS} días\n`);

const { senales, problemas } = await recolectar();

console.log(`\nTotal recolectado: ${senales.length} señales`);

if (problemas.length) {
  console.log(`Fuentes con problemas: ${problemas.length}`);
}

if (INFORME) {
  const resultado = filtrar(senales);
  const texto = informe(resultado);
  const carpeta = join(AQUI, 'salida');
  mkdirSync(carpeta, { recursive: true });
  const ruta = join(carpeta, `radar-${new Date().toISOString().slice(0, 10)}.md`);
  writeFileSync(ruta, texto, 'utf8');

  console.log(`\nFiltro: ${resultado.descartadas} descartadas, ${resultado.candidatas.length} candidatas\n`);
  for (const [i, s] of resultado.candidatas.entries()) {
    console.log(`${String(i + 1).padStart(2)}. [${String(s.puntos).padStart(2)}] ${recortar(s.titulo, 78)}`);
    console.log(`        ${s.nodo || '—'} · ${s.motivos.join(', ') || 'sin marcas'}`);
  }
  console.log(`\nInforme completo: ${ruta}`);
} else if (GUARDAR) {
  await guardar(senales);
} else {
  console.log('\n--- Muestra (en seco, no se guardó nada) ---');
  for (const f of FUENTES) {
    const suyas = senales.filter(s => s.fuente === f.nombre);
    if (!suyas.length) continue;
    console.log(`\n${f.nombre}  [primicia ${f.primacy}]  ${suyas.length} señales`);
    for (const s of suyas.slice(0, 3)) {
      console.log(`  · ${recortar(s.titulo, 95)}`);
    }
  }
  console.log('\nPara guardar: node jobs/radar.mjs --guardar');
}
