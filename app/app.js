// ============================================================
// Frontera
// ============================================================
// Nota de diseño importante: el Paso 1 NO llama a ninguna IA. Las
// instrucciones se arman con las respuestas de la persona, y la prueba
// antes/después la hace ella en su propia herramienta. Costo cero, y
// encima aprende haciendo en vez de mirando.
// ============================================================

import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js@2.47.10/+esm';
import { SUPABASE_URL, SUPABASE_KEY } from './config.js';

const db = createClient(SUPABASE_URL, SUPABASE_KEY);

const vista = document.getElementById('vista');
const barra = document.getElementById('barra');
const elRacha = document.getElementById('racha');

let perfil = null;
let herramientas = [];
// Las herramientas que la persona declaró usar. Definen qué capa de
// ejecución se le muestra al pie de cada lección.
let misHerramientas = [];

// ------------------------------------------------------------
// Utilidades de DOM (nada de innerHTML con texto de la base)
// ------------------------------------------------------------
function el(tag, props = {}, hijos = []) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (k === 'class') n.className = v;
    else if (k === 'text') n.textContent = v;
    else if (k.startsWith('on')) n.addEventListener(k.slice(2), v);
    else if (v !== null && v !== undefined) n.setAttribute(k, v);
  }
  for (const h of [].concat(hijos)) if (h) n.append(h);
  return n;
}

function pintar(...nodos) {
  vista.replaceChildren(...nodos);
  window.scrollTo(0, 0);
}

// Markdown mínimo: ## ### **negrita** y listas. Suficiente para lecciones
// y sin dependencias ni riesgo de inyección.
function markdown(texto) {
  const cont = document.createDocumentFragment();
  let lista = null;

  const negritas = (linea, destino) => {
    const partes = linea.split(/\*\*(.+?)\*\*/g);
    partes.forEach((p, i) => {
      if (!p) return;
      destino.append(i % 2 ? el('strong', { text: p }) : document.createTextNode(p));
    });
  };

  for (const linea of texto.split('\n')) {
    const t = linea.trim();

    if (t.startsWith('- ')) {
      if (!lista) { lista = el('ul'); cont.append(lista); }
      const li = el('li');
      negritas(t.slice(2), li);
      lista.append(li);
      continue;
    }
    lista = null;

    if (!t) continue;
    if (t.startsWith('### ')) { cont.append(el('h3', { text: t.slice(4) })); continue; }
    if (t.startsWith('## '))  { cont.append(el('h2', { text: t.slice(3) })); continue; }
    const p = el('p');
    negritas(t, p);
    cont.append(p);
  }
  return cont;
}

function error(msg) {
  return el('p', { class: 'error', text: msg });
}

// ============================================================
// Entrada
// ============================================================
async function arrancar() {
  if (SUPABASE_KEY.startsWith('PEGAR')) {
    return pintar(
      el('h1', { text: 'Falta un paso' }),
      el('p', { class: 'bajada', text: 'Hay que pegar la publishable key de Supabase en app/config.js.' })
    );
  }

  const { data: { session } } = await db.auth.getSession();
  if (!session) return vistaEntrar();

  const { data, error: e } = await db
    .from('profiles').select('*').eq('id', session.user.id).single();

  if (e) return pintar(error('No pude leer tu perfil: ' + e.message));
  perfil = data;

  const { data: tools } = await db
    .from('tools').select('*').eq('active', true).order('sort');
  herramientas = tools || [];

  const { data: mias } = await db
    .from('profile_tools').select('tool_id').eq('profile_id', perfil.id).eq('relation', 'usa');
  misHerramientas = (mias || []).map(r => r.tool_id);

  barra.hidden = false;
  await dibujarRacha();

  // Durante el Paso 1 la navegación no existe: con ella a la vista, un
  // toque en "Hoy" saltea el onboarding entero y la persona termina en una
  // lección sin que la app sepa nada de ella.
  navegacion.hidden = !perfil.onboarded_at;

  if (!perfil.onboarded_at) return vistaPaso1();
  return vistaHoy();
}

document.getElementById('salir').addEventListener('click', async () => {
  await db.auth.signOut();
  location.reload();
});

const navegacion = document.getElementById('nav');
const navHoy = document.getElementById('nav-hoy');
const navReto = document.getElementById('nav-reto');
const navMapa = document.getElementById('nav-mapa');
const navLibros = document.getElementById('nav-libros');

function marcarNav(cual) {
  for (const [boton, nombre] of [[navHoy, 'hoy'], [navReto, 'reto'], [navMapa, 'mapa'], [navLibros, 'libros']]) {
    boton.setAttribute('aria-current', cual === nombre ? 'page' : 'false');
  }
}

navHoy.addEventListener('click', () => { marcarNav('hoy'); vistaHoy(); });
navReto.addEventListener('click', async () => { marcarNav('reto'); vistaReto(await retoAbierto()); });
navMapa.addEventListener('click', () => { marcarNav('mapa'); vistaMapa(); });
navLibros.addEventListener('click', () => { marcarNav('libros'); vistaBiblioteca(); });

async function dibujarRacha() {
  const { data } = await db.rpc('racha_semanal', { p_profile: perfil.id });
  const n = data ?? 0;
  elRacha.textContent = n > 0 ? `${n} ${n === 1 ? 'semana' : 'semanas'}` : '';
}

async function marcarActividad(kind) {
  const hoy = new Date().toISOString().slice(0, 10);
  await db.from('activity').upsert(
    { profile_id: perfil.id, day: hoy, kind },
    { onConflict: 'profile_id,day,kind' }
  );
  await dibujarRacha();
}

// ============================================================
// Entrar
// ============================================================
function vistaEntrar() {
  barra.hidden = true;
  const mail = el('input', { type: 'email', id: 'mail', autocomplete: 'email', placeholder: 'tu@mail.com' });
  const clave = el('input', { type: 'password', id: 'clave', autocomplete: 'current-password', placeholder: 'Tu contraseña' });
  const msj = el('div');

  const entrar = async (nuevo) => {
    msj.replaceChildren(el('p', { class: 'ayuda', text: 'Un segundo…' }));
    const creds = { email: mail.value.trim(), password: clave.value };
    const { error: e } = nuevo
      ? await db.auth.signUp(creds)
      : await db.auth.signInWithPassword(creds);

    if (e) {
      // El alta está cerrada a propósito: esto es un círculo chico, no una
      // app abierta. Que no vea un error en inglés el que lo intente.
      const texto = /signup|sign-up|not allowed|disabled/i.test(e.message)
        ? 'El alta de cuentas está cerrada. Pedile a Diego que te habilite una y volvé a entrar acá.'
        : /invalid login|credentials/i.test(e.message)
          ? 'El mail o la contraseña no coinciden.'
          : e.message;
      return msj.replaceChildren(error(texto));
    }

    location.reload();
  };

  pintar(
    el('h1', { text: 'Frontera' }),
    el('p', { class: 'bajada', text: 'Aprender IA al ritmo en que la IA cambia.' }),
    el('label', { for: 'mail', text: 'Tu mail' }), mail,
    el('div', { style: 'height:16px' }),
    el('label', { for: 'clave', text: 'Tu contraseña' }), clave,
    msj,
    el('button', { class: 'primario', onclick: () => entrar(false), text: 'Entrar' }),
    el('button', { class: 'link', onclick: () => entrar(true), text: 'Es mi primera vez, crear cuenta' })
  );
}

// ============================================================
// PASO 1 — Las instrucciones personales
// ============================================================
// Esta es la pieza central del onboarding. Hace cuatro cosas a la vez:
// enseña lo más valioso, perfila a la persona cuando no hay uso previo
// que relevar, le deja algo concreto en la mano, y le demuestra con la
// prueba antes/después que esto le sirve.
// ============================================================

const PREGUNTAS = [
  {
    key: 'rol',
    pregunta: '¿A qué te dedicás?',
    ayuda: 'Como se lo contarías a alguien que recién conocés. No hace falta que sea formal.',
    tipo: 'texto',
    ej: 'Coordino el área de marketing y admisiones de un colegio.'
  },
  {
    key: 'contexto',
    pregunta: '¿Con quién y dónde trabajás?',
    ayuda: 'Si trabajás sola o sola con un equipo, si es una empresa, por tu cuenta, o si es para tus cosas de casa.',
    tipo: 'texto',
    ej: 'En una institución grande, con un equipo de siete personas a cargo.'
  },
  {
    key: 'usos',
    pregunta: '¿Para qué querés usar la IA?',
    ayuda: 'Puede ser más de una cosa. Escribí lo que se te ocurra, aunque suene chico.',
    tipo: 'texto',
    ej: 'Escribir mails, ordenar ideas, entender planillas, preparar reuniones.'
  },
  {
    key: 'uso_mas_complejo',
    pregunta: '¿Qué es lo más complicado que hiciste con IA hasta ahora?',
    ayuda: 'No hay respuesta mala. Esto define por dónde arrancamos, nada más.',
    tipo: 'opciones',
    opciones: [
      { v: '0', t: 'Nunca la usé en serio, o solo para probar y jugar' },
      { v: '1', t: 'Le hago preguntas sueltas y me resuelve cosas del día' },
      { v: '2', t: 'La uso para trabajo real, con mis archivos y mi contexto' },
      { v: '3', t: 'Armé algo con ella: código, una app, una automatización' },
      { v: '4', t: 'Construyo sistemas y decido qué herramientas adoptar' }
    ]
  },
  {
    key: 'largo',
    pregunta: '¿Cómo preferís que te respondan?',
    ayuda: 'Esto es lo que más cambia el resultado de todo lo demás.',
    // Las tres preguntas de estilo solo sirven para redactar el texto.
    // A quien ya tiene sus instrucciones no se las preguntamos.
    soloSiGenera: true,
    tipo: 'opciones',
    opciones: [
      { v: 'corto',    t: 'Corto y al grano. Dame la conclusión' },
      { v: 'detalle',  t: 'Con detalle y explicación del razonamiento' },
      { v: 'pregunta', t: 'Que me pregunte si le falta información, en vez de asumir' }
    ]
  },
  {
    key: 'tono',
    pregunta: '¿Con qué tono?',
    soloSiGenera: true,
    tipo: 'opciones',
    opciones: [
      { v: 'directo', t: 'Directo, sin vueltas ni halagos' },
      { v: 'amable',  t: 'Amable y paciente, que me explique con calma' },
      { v: 'tecnico', t: 'Técnico, que asuma que entiendo del tema' }
    ]
  },
  {
    key: 'idioma',
    pregunta: '¿En qué idioma?',
    tipo: 'opciones',
    opciones: [
      { v: 'es',    t: 'Español' },
      { v: 'en',    t: 'Inglés' },
      { v: 'mixto', t: 'Español, pero los términos técnicos en inglés' }
    ]
  },
  {
    key: 'no_quiero',
    pregunta: '¿Qué te molesta de cómo te responde hoy?',
    ayuda: 'Esta es la que casi nadie escribe y la que más se agradece después. Si no se te ocurre nada, dejala vacía.',
    soloSiGenera: true,
    tipo: 'texto',
    opcional: true,
    ej: 'Que arranque con halagos, que me liste diez opciones cuando pedí una, que me diga que consulte a un profesional.'
  }
];

const respuestas = {};
const elegidas = { usa: new Set(), quiere: new Set() };
let leccion1Id = null;

// El camino define cuánto onboarding hace falta. Quien ya tiene sus
// instrucciones armadas no necesita que le expliquen qué son ni que se las
// redactemos: solo necesitamos conocerlo, que es la otra mitad del Paso 1.
let camino = null;

function generamosTexto() {
  return camino !== 'ya_las_tengo';
}

function preguntasActivas() {
  return PREGUNTAS.filter(q => !q.soloSiGenera || generamosTexto());
}

function vistaPaso1() {
  const elegir = (valor, siguiente) => {
    camino = valor;
    siguiente();
  };

  pintar(
    el('p', { class: 'paso', text: 'Paso 1' }),
    el('h1', { text: 'Tus instrucciones personales' }),
    el('p', { class: 'bajada', text: 'Todas las herramientas de IA tienen un lugar donde dejás escrito, una sola vez, quién sos y cómo querés que te hablen. Antes de arrancar quiero saber en qué punto estás.' }),

    el('button', { class: 'tarjeta libro', onclick: () => elegir('no_se', vistaQueSon) }, [
      el('span', { class: 'titulo', text: 'No sé qué son' }),
      el('span', { class: 'autor', text: 'Te explico para qué sirven y las armamos juntos' })
    ]),

    el('button', { class: 'tarjeta libro', onclick: () => elegir('no_las_tengo', vistaHerramientas) }, [
      el('span', { class: 'titulo', text: 'Sé lo que son, pero no las tengo' }),
      el('span', { class: 'autor', text: 'Vamos directo a armarlas' })
    ]),

    el('button', { class: 'tarjeta libro', onclick: () => elegir('ya_las_tengo', vistaHerramientas) }, [
      el('span', { class: 'titulo', text: 'Ya las tengo armadas' }),
      el('span', { class: 'autor', text: 'Unas pocas preguntas para conocerte y listo' })
    ])
  );
}

function vistaQueSon() {
  pintar(
    el('p', { class: 'paso', text: 'Paso 1' }),
    el('h1', { text: 'Armemos tus instrucciones' }),
    el('p', { class: 'bajada', text: 'Cada vez que abrís una conversación con una IA, empieza de cero: no sabe quién sos ni cómo te gusta que te hablen. Eso se arregla una sola vez y queda para siempre.' }),
    el('div', { class: 'aviso', text: `Son ${preguntasActivas().length} preguntas cortas. Al final te vas con un texto listo para pegar en tu herramienta, y vas a ver la diferencia con tus propios ojos.` }),
    el('button', { class: 'primario', onclick: vistaHerramientas, text: 'Empezar' }),
    el('button', { class: 'link', text: 'Volver', onclick: vistaPaso1 })
  );
}

function vistaHerramientas() {
  const cont = (relation, titulo, ayuda) => {
    const caja = el('div', { class: 'opciones' });
    for (const h of herramientas) {
      const chip = el('button', {
        class: 'chip',
        'aria-pressed': 'false',
        text: h.name,
        onclick: (ev) => {
          const b = ev.currentTarget;
          const on = b.getAttribute('aria-pressed') === 'true';
          b.setAttribute('aria-pressed', on ? 'false' : 'true');
          on ? elegidas[relation].delete(h.id) : elegidas[relation].add(h.id);
        }
      });
      caja.append(chip);
    }
    return [el('label', { text: titulo }), el('p', { class: 'ayuda', text: ayuda }), caja];
  };

  pintar(
    el('p', { class: 'paso', text: 'Antes de empezar' }),
    el('h1', { text: '¿Con qué herramientas andás?' }),
    ...cont('usa', '¿Cuáles usás hoy?', 'Todo lo que te enseñe va a estar explicado para estas. Si no usás ninguna todavía, no marques nada.'),
    ...cont('quiere', '¿Cuáles te gustaría aprender?', 'De estas te voy a traer contenido, aunque hoy no las uses.'),
    el('button', { class: 'primario', onclick: () => vistaPregunta(0), text: 'Seguir' })
  );
}

function vistaPregunta(i) {
  const lista = preguntasActivas();
  const q = lista[i];
  const nodos = [
    el('p', { class: 'paso', text: `Pregunta ${i + 1} de ${lista.length}` }),
    el('h1', { text: q.pregunta })
  ];
  if (q.ayuda) nodos.push(el('p', { class: 'bajada', text: q.ayuda }));

  const seguir = (valor) => {
    if (valor !== undefined) respuestas[q.key] = valor;
    if (i + 1 < lista.length) return vistaPregunta(i + 1);
    return generamosTexto() ? vistaInstrucciones() : vistaPegarLasTuyas();
  };

  if (q.tipo === 'opciones') {
    for (const o of q.opciones) {
      nodos.push(el('button', {
        class: 'chip',
        style: 'display:block;width:100%;text-align:left;margin-bottom:10px;border-radius:14px',
        text: o.t,
        onclick: () => seguir(o.v)
      }));
    }
  } else {
    const ta = el('textarea', { id: 'resp', placeholder: q.ej || '' });
    ta.value = respuestas[q.key] || '';
    nodos.push(ta);
    nodos.push(el('button', {
      class: 'primario',
      text: 'Seguir',
      onclick: () => {
        if (!ta.value.trim() && !q.opcional) {
          return ta.focus();
        }
        seguir(ta.value.trim());
      }
    }));
    if (q.opcional) {
      nodos.push(el('button', { class: 'link', text: 'No se me ocurre nada, saltear', onclick: () => seguir('') }));
    }
  }

  if (i > 0) nodos.push(el('button', { class: 'link', text: 'Volver', onclick: () => vistaPregunta(i - 1) }));
  pintar(...nodos);
}

// ------------------------------------------------------------
// El texto de instrucciones: se arma con las respuestas, sin IA.
// ------------------------------------------------------------
function armarInstrucciones(r) {
  const largo = {
    corto: 'Respondeme corto y al grano. Dame la conclusión primero; si hace falta el detalle, lo pido.',
    detalle: 'Respondeme con detalle y explicame el razonamiento, no solo la conclusión.',
    pregunta: 'Si te falta información para responder bien, preguntame antes de asumir.'
  }[r.largo];

  const tono = {
    directo: 'Hablame directo, sin vueltas, sin halagos y sin introducciones.',
    amable: 'Explicame con calma y paciencia, asumiendo que el tema es nuevo para mí.',
    tecnico: 'Hablame técnico, asumiendo que entiendo del tema. No simplifiques de más.'
  }[r.tono];

  const idioma = {
    es: 'Escribime siempre en español.',
    en: 'Always write to me in English.',
    mixto: 'Escribime en español, pero dejá los términos técnicos en inglés.'
  }[r.idioma];

  const lineas = [
    'QUIÉN SOY',
    r.rol,
    r.contexto,
    '',
    'PARA QUÉ TE USO',
    r.usos,
    '',
    'CÓMO QUIERO QUE ME RESPONDAS',
    '- ' + largo,
    '- ' + tono,
    '- ' + idioma
  ];

  if (r.no_quiero) {
    lineas.push('', 'QUÉ NO QUIERO', r.no_quiero);
  }

  return lineas.join('\n');
}

// Guardado común a los tres caminos: respuestas de la entrevista, perfil
// derivado y herramientas. El context_summary es lo que después permite
// traducir cada lección al contexto real de la persona.
async function guardarPerfil(texto) {
  const declarado = parseInt(respuestas.uso_mas_complejo || '0', 10);

  // La evidencia le gana al autodiagnóstico. Si ya hay un nivel medido
  // sobre lo que la persona hace de verdad, una respuesta en una
  // entrevista no lo baja: la gente se subestima con mucha frecuencia.
  const medido = perfil.level_source === 'evidencia' ? perfil.level : 0;
  const nivel = Math.max(declarado, medido);
  const fuente = nivel === medido && medido > declarado ? 'evidencia' : 'onboarding';

  await db.from('interview_answers').upsert(
    Object.entries(respuestas).map(([q_key, answer]) => ({
      profile_id: perfil.id, q_key, answer: String(answer), updated_at: new Date().toISOString()
    })),
    { onConflict: 'profile_id,q_key' }
  );

  const filas = [];
  for (const rel of ['usa', 'quiere']) {
    for (const tool_id of elegidas[rel]) {
      filas.push({ profile_id: perfil.id, tool_id, relation: rel });
    }
  }
  if (filas.length) {
    await db.from('profile_tools').upsert(filas, { onConflict: 'profile_id,tool_id,relation' });
  }

  await db.from('profiles').update({
    personal_instructions: texto,
    context_summary: `${respuestas.rol} ${respuestas.contexto}. Usa IA para: ${respuestas.usos}`,
    level: nivel,
    level_source: fuente,
    level_updated_at: new Date().toISOString(),
    lang: respuestas.idioma === 'en' ? 'en' : 'es'
  }).eq('id', perfil.id);

  perfil.level = nivel;
  perfil.personal_instructions = texto;
  perfil.lang = respuestas.idioma === 'en' ? 'en' : 'es';
  // Sin esto, la primera lección después del onboarding no muestra la capa
  // de la herramienta recién elegida hasta que la persona recargue.
  misHerramientas = [...elegidas.usa];
}

// Cierre del Paso 1, común a los tres caminos.
async function finalizar(estadoLeccion1) {
  if (leccion1Id) {
    await db.from('lesson_state').upsert({
      profile_id: perfil.id,
      lesson_id: leccion1Id,
      status: estadoLeccion1,
      answered_at: new Date().toISOString()
    }, { onConflict: 'profile_id,lesson_id' });
  }

  const ahora = new Date().toISOString();
  await db.from('profiles').update({ onboarded_at: ahora }).eq('id', perfil.id);
  perfil.onboarded_at = ahora;
  navegacion.hidden = false;
  await marcarActividad('leccion');
  vistaHoy();
}

// ------------------------------------------------------------
// Camino corto: ya tiene sus instrucciones armadas
// ------------------------------------------------------------
async function vistaPegarLasTuyas() {
  await guardarPerfil(null);

  // El id de la lección 1 se necesita para marcarla. En los otros caminos
  // se obtiene al mostrar dónde pegar el texto; acá no pasamos por ahí.
  const { data: lec } = await db
    .from('lessons').select('id').eq('slug', 'f01-instrucciones-personales').single();
  leccion1Id = lec?.id ?? null;

  const ta = el('textarea', {
    id: 'mias',
    style: 'min-height:220px',
    placeholder: 'Pegá acá el texto de tus instrucciones…'
  });

  pintar(
    el('p', { class: 'paso', text: 'Lo último' }),
    el('h1', { text: 'Pegá las tuyas' }),
    el('p', { class: 'bajada', text: 'Si me las dejás, puedo traducirte lo que te enseñe a tu forma de trabajar en vez de darte lo genérico. Son tuyas y quedan solo en tu cuenta.' }),
    el('label', { for: 'mias', text: 'Tus instrucciones personales' }),
    ta,
    el('button', {
      class: 'primario',
      text: 'Guardar y empezar',
      onclick: async () => {
        const texto = ta.value.trim();
        if (texto) {
          await db.from('profiles').update({ personal_instructions: texto }).eq('id', perfil.id);
          perfil.personal_instructions = texto;
        }
        // Ya sabe lo que son: la lección 1 no tiene nada que enseñarle.
        await finalizar('ya_la_sabia');
      }
    }),
    el('button', {
      class: 'link',
      text: 'Ahora no, las pego después',
      onclick: () => finalizar('ya_la_sabia')
    })
  );
}

async function vistaInstrucciones() {
  const texto = armarInstrucciones(respuestas);
  await guardarPerfil(texto);

  const copiar = el('button', {
    text: 'Copiar el texto',
    onclick: async (ev) => {
      try {
        await navigator.clipboard.writeText(texto);
        ev.currentTarget.textContent = 'Copiado ✓';
      } catch {
        ev.currentTarget.textContent = 'Copialo a mano del cuadro de arriba';
      }
    }
  });

  pintar(
    el('p', { class: 'paso', text: 'Tus instrucciones' }),
    el('h1', { text: 'Listo. Esto es tuyo' }),
    el('p', { class: 'bajada', text: 'Este texto resume quién sos y cómo querés que te hablen. Copialo y pegalo en tu herramienta.' }),
    el('div', { class: 'instrucciones', text: texto }),
    copiar,
    el('div', { style: 'height:24px' }),
    el('button', { class: 'primario', onclick: vistaDondePegar, text: '¿Dónde lo pego?' })
  );
}

async function vistaDondePegar() {
  // Capa de ejecución: solo la de la herramienta que la persona usa.
  const usadas = [...elegidas.usa];
  const { data: lec } = await db
    .from('lessons').select('id').eq('slug', 'f01-instrucciones-personales').single();
  leccion1Id = lec?.id ?? null;

  let capas = [];
  if (lec && usadas.length) {
    const { data } = await db
      .from('lesson_contents').select('*')
      .eq('lesson_id', lec.id).eq('lang', 'es').in('tool_id', usadas);
    capas = data || [];
  }

  const nodos = [
    el('p', { class: 'paso', text: 'Dónde va' }),
    el('h1', { text: 'Pegalo acá' })
  ];

  if (!capas.length) {
    nodos.push(el('p', { class: 'bajada', text: 'No marcaste ninguna herramienta, así que no sé dónde mandarte. Guardá el texto: cuando elijas una, te muestro exactamente dónde va.' }));
  }

  for (const c of capas) {
    const t = el('div', { class: 'tarjeta' }, [el('h2', { text: c.title })]);
    t.append(markdown(c.body_md));
    nodos.push(t);
  }

  nodos.push(el('button', { class: 'primario', onclick: vistaPrueba, text: 'Ya lo pegué' }));
  pintar(...nodos);
}

// ------------------------------------------------------------
// La prueba antes/después. Costo cero: la hace la persona en su propia
// herramienta y pega las dos respuestas. Más convincente que un demo.
// ------------------------------------------------------------
const PREGUNTA_PRUEBA = '¿Cómo organizarías mi semana que viene?';

function vistaPrueba() {
  const antes = el('textarea', { id: 'antes', placeholder: 'Pegá acá la respuesta…' });
  const despues = el('textarea', { id: 'despues', placeholder: 'Pegá acá la nueva respuesta…' });

  pintar(
    el('p', { class: 'paso', text: 'La prueba' }),
    el('h1', { text: 'Mirá la diferencia' }),
    el('p', { class: 'bajada', text: 'Hacele esta pregunta a tu herramienta y pegá acá las dos respuestas: la que te dio antes de las instrucciones y la que te da ahora.' }),
    el('div', { class: 'aviso', text: PREGUNTA_PRUEBA }),
    el('label', { for: 'antes', text: 'Lo que te contestaba antes' }),
    el('p', { class: 'ayuda', text: 'Si no la guardaste, dejala vacía y seguí.' }),
    antes,
    el('div', { style: 'height:20px' }),
    el('label', { for: 'despues', text: 'Lo que te contesta ahora' }),
    despues,
    el('button', {
      class: 'primario',
      text: 'Terminar el Paso 1',
      onclick: async () => {
        await db.from('before_after').upsert({
          profile_id: perfil.id,
          prompt: PREGUNTA_PRUEBA,
          answer_before: antes.value.trim() || null,
          answer_after: despues.value.trim() || null
        }, { onConflict: 'profile_id' });

        // El Paso 1 ES la lección 1: se marca hecha para no servirla de nuevo
        // al día siguiente como si no hubiera pasado nada.
        await finalizar('hecha');
      }
    })
  );
}

// ============================================================
// Hoy
// ============================================================
// ============================================================
// Repaso espaciado
// ============================================================
// Lo único que evita que lo aprendido se borre, y casi ninguna app de IA
// lo hace. No vuelve a explicar: pregunta dos cosas y se va. Toma veinte
// segundos y va antes que lo nuevo del día.
// ============================================================
async function repasoPendiente() {
  const hoy = new Date().toISOString().slice(0, 10);
  const { data } = await db
    .from('reviews')
    .select('id, stage, lesson_id, due_on')
    .eq('profile_id', perfil.id)
    .is('done_at', null)
    .lte('due_on', hoy)
    .order('due_on')
    .limit(1);
  return (data || [])[0] || null;
}

async function vistaRepaso(repaso) {
  const { data: cont } = await db
    .from('lesson_contents').select('title, hook, body_md')
    .eq('lesson_id', repaso.lesson_id).eq('lang', perfil.lang).is('tool_id', null).maybeSingle();

  if (!cont) {
    // La lección desapareció o cambió de idioma: el repaso no tiene sentido.
    await db.from('reviews').update({ done_at: new Date().toISOString() }).eq('id', repaso.id);
    return vistaHoy();
  }

  const marca = { recordaba: null, uso: null };

  const grupo = (opciones, campo) => {
    const caja = el('div', { class: 'pulgares' });
    for (const [valor, texto] of opciones) {
      caja.append(el('button', {
        text: texto,
        'aria-pressed': 'false',
        'data-v': valor === true || valor === 2 ? '1' : '-1',
        onclick: (ev) => {
          [...caja.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
          ev.currentTarget.setAttribute('aria-pressed', 'true');
          marca[campo] = valor;
        }
      }));
    }
    return caja;
  };

  const guardar = async () => {
    await db.from('reviews').update({
      done_at: new Date().toISOString(),
      recordaba: marca.recordaba,
      uso: marca.uso
    }).eq('id', repaso.id);

    // Si no se acordaba, vuelve antes. Si lo usó de verdad, no hace falta
    // insistir: se salta el resto de la escalera.
    if (marca.recordaba === 0) {
      const f = new Date();
      f.setDate(f.getDate() + 2);
      await db.from('reviews').upsert({
        profile_id: perfil.id,
        lesson_id: repaso.lesson_id,
        stage: repaso.stage + 10,
        due_on: f.toISOString().slice(0, 10)
      }, { onConflict: 'profile_id,lesson_id,stage' });
    } else if (marca.uso === true) {
      await db.from('reviews')
        .update({ done_at: new Date().toISOString() })
        .eq('profile_id', perfil.id).eq('lesson_id', repaso.lesson_id).is('done_at', null);
    }

    await marcarActividad('repaso');
    vistaHoy();
  };

  const dias = Math.round((Date.now() - new Date(repaso.due_on).getTime()) / 864e5);

  pintar(
    el('p', { class: 'paso', text: 'Repaso' }),
    el('h1', { text: cont.title }),
    cont.hook ? el('p', { class: 'bajada', text: cont.hook }) : null,
    el('p', { class: 'ayuda', text: dias > 0 ? `Lo viste hace unos días` : 'Lo viste hace poco' }),

    el('div', { class: 'cierre', style: 'margin-top:28px' }, [
      el('label', { text: '¿Te acordabas?' }),
      grupo([[2, 'Sí'], [1, 'Más o menos'], [0, 'No']], 'recordaba'),
      el('div', { style: 'height:24px' }),
      el('label', { text: '¿Lo usaste en algo real?' }),
      grupo([[true, 'Sí'], [false, 'Todavía no']], 'uso'),
      el('button', { class: 'primario', text: 'Listo', onclick: guardar }),
      el('div', { class: 'secundarias' }, [
        el('button', {
          text: 'Volver a leerlo',
          onclick: () => vistaLeccion(repaso.lesson_id, cont)
        })
      ])
    ])
  );
}

async function vistaHoy() {
  // El repaso va primero: son veinte segundos y es lo que evita que todo
  // lo anterior se borre. Después sigue lo nuevo.
  const repaso = await repasoPendiente();
  if (repaso) return vistaRepaso(repaso);

  // Ruteo: solo lecciones dentro del nivel de la persona, en orden del
  // track, y que no haya contestado todavía.
  const { data: hechas } = await db
    .from('lesson_state').select('lesson_id').eq('profile_id', perfil.id).not('answered_at', 'is', null);
  const ya = (hechas || []).map(r => r.lesson_id);

  // El radar va primero y lo más nuevo arriba: si el mundo produjo algo
  // que te sirve, eso gana sobre seguir el track. El track es el piso,
  // no la agenda.
  let prox = null, cont = null;

  for (const [kind, columna, asc] of [['radar', 'created_at', false], ['fundamento', 'track_order', true]]) {
    let q = db.from('lessons')
      .select('id, slug, kind, track_order, created_at')
      .eq('kind', kind)
      .eq('published', true)
      .lte('level_floor', perfil.level)
      .gte('level_ceiling', perfil.level)
      .order(columna, { ascending: asc });

    if (ya.length) q = q.not('id', 'in', `(${ya.join(',')})`);

    const { data: candidatas } = await q;

    // Una lección sin contenido escrito todavía no es un error: simplemente
    // no existe para la persona. Se pasa a la siguiente que sí lo tenga.
    for (const c of candidatas || []) {
      const { data } = await db
        .from('lesson_contents').select('*')
        .eq('lesson_id', c.id).eq('lang', perfil.lang).is('tool_id', null).maybeSingle();
      if (data) { prox = c; cont = data; break; }
    }
    if (cont) break;
  }

  if (!cont) {
    // El mundo no produce algo que valga la pena todos los días. Para eso
    // está la biblioteca: lo que no caduca, cuando la frontera está quieta.
    return pintar(
      el('h1', { text: 'Por hoy está' }),
      el('p', { class: 'bajada', text: 'No hay nada nuevo para vos en este momento. Cuando aparezca algo que valga tu tiempo, te va a estar esperando acá.' }),
      el('button', {
        class: 'primario',
        text: 'Mientras tanto, ir a la biblioteca',
        onclick: () => { marcarNav('libros'); vistaBiblioteca(); }
      })
    );
  }

  pintar(
    el('p', { class: 'paso', text: prox.kind === 'radar' ? 'Salió esto' : 'Hoy' }),
    el('h1', { text: cont.title }),
    cont.hook ? el('p', { class: 'bajada', text: cont.hook }) : null,
    el('p', { class: 'ayuda', text: `${cont.minutes} minutos` }),
    el('button', { class: 'primario', onclick: () => vistaLeccion(prox.id, cont), text: 'Leer' }),
    (await retoAbierto())
      ? el('button', {
          class: 'link',
          text: 'Tenés un reto esperando',
          onclick: async () => { marcarNav('reto'); vistaReto(await retoAbierto()); }
        })
      : null
  );
}

// ============================================================
// Lección + los dos clics
// ============================================================
async function vistaLeccion(lessonId, cont) {
  const estado = { comprension: null, interes: null };

  // La capa de ejecución: lo mismo explicado para la herramienta que la
  // persona usa. Si usa dos, ve las dos. Si no declaró ninguna, no ve
  // ninguna y la lección conceptual se sostiene sola.
  let capas = [];
  if (misHerramientas.length) {
    const { data } = await db
      .from('lesson_contents').select('*')
      .eq('lesson_id', lessonId).eq('lang', perfil.lang).in('tool_id', misHerramientas);
    capas = data || [];
  }

  const escala = el('div', { class: 'escala' });
  for (let n = 1; n <= 10; n++) {
    escala.append(el('button', {
      text: String(n),
      'aria-pressed': 'false',
      onclick: (ev) => {
        [...escala.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        estado.comprension = n;
      }
    }));
  }

  const pulgares = el('div', { class: 'pulgares' });
  for (const [v, t] of [['1', '👍 Me interesa'], ['-1', '👎 No es para mí']]) {
    pulgares.append(el('button', {
      'data-v': v,
      text: t,
      'aria-pressed': 'false',
      onclick: (ev) => {
        [...pulgares.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        estado.interes = parseInt(v, 10);
      }
    }));
  }

  const guardar = async (status) => {
    await db.from('lesson_state').upsert({
      profile_id: perfil.id,
      lesson_id: lessonId,
      status,
      comprension: estado.comprension,
      interes: estado.interes,
      answered_at: new Date().toISOString()
    }, { onConflict: 'profile_id,lesson_id' });

    // Repaso espaciado: 3, 10 y 30 días. Lo que se entendió a medias
    // vuelve antes. Nunca como castigo, solo vuelve.
    //
    // Pero a lo que alguien marcó como sabido no se le agenda nada: a
    // una persona avanzada que saltea media docena de lecciones le
    // caerían veinte repasos de cosas que ya domina, y ahí la perdés.
    if (status === 'hecha') {
      const dias = (estado.comprension ?? 10) <= 6 ? [2, 7, 21] : [3, 10, 30];
      await db.from('reviews').upsert(dias.map((d, i) => {
        const f = new Date();
        f.setDate(f.getDate() + d);
        return { profile_id: perfil.id, lesson_id: lessonId, stage: i, due_on: f.toISOString().slice(0, 10) };
      }), { onConflict: 'profile_id,lesson_id,stage' });
    }

    await marcarActividad('leccion');
    vistaHoy();
  };

  const cuerpo = el('article');
  cuerpo.append(markdown(cont.body_md));

  const ejecucion = document.createDocumentFragment();
  for (const c of capas) {
    const t = el('div', { class: 'tarjeta' }, [el('h2', { text: c.title })]);
    const a = el('article');
    a.append(markdown(c.body_md));
    t.append(a);
    ejecucion.append(t);
  }

  pintar(
    el('h1', { text: cont.title }),
    cuerpo,
    ejecucion,
    el('div', { class: 'cierre' }, [
      el('label', { text: 'Del 1 al 10, ¿cuánto entendiste?' }),
      escala,
      el('div', { class: 'escala-pies' }, [
        el('span', { text: 'Nada' }),
        el('span', { text: 'Todo' })
      ]),
      el('label', { text: '¿Te interesó el tema?' }),
      pulgares,
      el('button', { class: 'primario', text: 'Listo', onclick: () => guardar('hecha') }),
      el('div', { class: 'secundarias' }, [
        el('button', { text: 'Esto ya lo sabía', onclick: () => guardar('ya_la_sabia') }),
        el('button', { text: 'Dejarlo para después', onclick: vistaHoy })
      ])
    ])
  );
}

// ============================================================
// Biblioteca
// ============================================================
// La otra mitad del producto. El radar trae lo perecedero; acá vive lo
// que no caduca. Y es lo que la app tiene para dar los días en que el
// mundo no produjo nada que valga la pena.
//
// Nunca se guarda ni se muestra texto de los libros: son las ideas,
// escritas con palabras propias y atribuidas al autor.
// ============================================================

const ESTADOS = {
  no_lei:      { t: 'No lo leí',                  d: 'Las ideas centrales, y qué envejeció mal' },
  hace_tiempo: { t: 'Lo leí hace tiempo',         d: 'Repaso de lo que probablemente se te borró' },
  fresco:      { t: 'Lo leí y lo tengo fresco',   d: 'Nada de resumen: aplicación y discusión' }
};

async function vistaBiblioteca() {
  const { data: libros } = await db.from('books').select('*').order('title');
  const { data: estados } = await db.from('book_state').select('*').eq('profile_id', perfil.id);
  const porLibro = Object.fromEntries((estados || []).map(e => [e.book_id, e]));

  const nodos = [
    el('h1', { text: 'Biblioteca' }),
    el('p', { class: 'bajada', text: 'Lo que no caduca. Elegí un libro y decime si lo leíste: según eso cambia por completo lo que te muestro.' })
  ];

  for (const libro of libros || []) {
    const est = porLibro[libro.id];
    const tarjeta = el('button', { class: 'tarjeta libro', onclick: () => abrirLibro(libro) }, [
      el('span', { class: 'titulo', text: libro.title }),
      el('span', { class: 'autor', text: libro.author + (libro.year ? ` · ${libro.year}` : '') })
    ]);

    if (libro.themes?.length) {
      const temas = el('span', { class: 'temas' });
      for (const t of libro.themes) temas.append(el('span', { class: 'tema', text: t }));
      tarjeta.append(temas);
    }

    if (est) tarjeta.append(el('span', { class: 'marca-leido', text: ESTADOS[est.read_state].t }));
    nodos.push(tarjeta);
  }

  pintar(...nodos);
}

async function abrirLibro(libro) {
  const { data: est } = await db
    .from('book_state').select('*')
    .eq('profile_id', perfil.id).eq('book_id', libro.id).maybeSingle();

  if (est) return vistaLibro(libro, est.read_state);
  return vistaEstadoLibro(libro);
}

// La pregunta que hace que esto no sea Blinkist.
function vistaEstadoLibro(libro, cambiando = false) {
  const nodos = [
    el('p', { class: 'paso', text: libro.author }),
    el('h1', { text: libro.title }),
    el('p', { class: 'bajada', text: cambiando ? '¿Cambió tu situación con este libro?' : 'Antes de empezar: ¿lo leíste?' })
  ];

  for (const [valor, info] of Object.entries(ESTADOS)) {
    nodos.push(el('button', {
      class: 'tarjeta libro',
      onclick: async () => {
        await db.from('book_state').upsert({
          profile_id: perfil.id,
          book_id: libro.id,
          read_state: valor,
          updated_at: new Date().toISOString()
        }, { onConflict: 'profile_id,book_id' });
        vistaLibro(libro, valor);
      }
    }, [
      el('span', { class: 'titulo', text: info.t }),
      el('span', { class: 'autor', text: info.d })
    ]));
  }

  nodos.push(el('button', { class: 'link', text: 'Volver a la biblioteca', onclick: vistaBiblioteca }));
  pintar(...nodos);
}

async function vistaLibro(libro, estado) {
  const { data: piezas } = await db
    .from('book_pieces').select('*')
    .eq('book_id', libro.id).eq('lang', perfil.lang).eq('for_read_state', estado)
    .order('idx');

  const { data: hechas } = await db
    .from('book_piece_state').select('piece_id').eq('profile_id', perfil.id);
  const ya = new Set((hechas || []).map(r => r.piece_id));

  const nodos = [
    el('p', { class: 'paso', text: libro.author }),
    el('h1', { text: libro.title })
  ];

  if (!piezas?.length) {
    nodos.push(el('p', { class: 'bajada', text: 'Este libro todavía no está procesado. Va a estar disponible pronto.' }));
    nodos.push(el('button', { class: 'link', text: 'Volver a la biblioteca', onclick: vistaBiblioteca }));
    return pintar(...nodos);
  }

  const listas = piezas.filter(p => ya.has(p.id)).length;
  nodos.push(el('p', { class: 'progreso', text: `${ESTADOS[estado].t} · ${listas} de ${piezas.length} leídas` }));

  for (const p of piezas) {
    nodos.push(el('button', {
      class: 'tarjeta libro',
      onclick: () => vistaPieza(libro, piezas, p, estado)
    }, [
      el('span', { class: 'titulo', text: p.title }),
      el('span', { class: 'autor', text: ya.has(p.id) ? 'Leída' : `${p.minutes} minutos` })
    ]));
  }

  nodos.push(el('button', { class: 'link', text: 'Cambiar si lo leí o no', onclick: () => vistaEstadoLibro(libro, true) }));
  nodos.push(el('button', { class: 'link', text: 'Volver a la biblioteca', onclick: vistaBiblioteca }));
  pintar(...nodos);
}

function vistaPieza(libro, piezas, pieza, estado) {
  const marca = { comprension: null, interes: null };

  const escala = el('div', { class: 'escala' });
  for (let n = 1; n <= 10; n++) {
    escala.append(el('button', {
      text: String(n),
      'aria-pressed': 'false',
      onclick: (ev) => {
        [...escala.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        marca.comprension = n;
      }
    }));
  }

  const pulgares = el('div', { class: 'pulgares' });
  for (const [v, t] of [['1', '👍 Me interesa'], ['-1', '👎 No es para mí']]) {
    pulgares.append(el('button', {
      'data-v': v,
      text: t,
      'aria-pressed': 'false',
      onclick: (ev) => {
        [...pulgares.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        marca.interes = parseInt(v, 10);
      }
    }));
  }

  const cuerpo = el('article');
  cuerpo.append(markdown(pieza.body_md));

  pintar(
    el('p', { class: 'paso', text: `${libro.title} · ${libro.author}` }),
    el('h1', { text: pieza.title }),
    cuerpo,
    el('p', { class: 'fuente', text: `Las ideas son de ${libro.author}. El texto es una síntesis propia, no un extracto del libro.` }),
    el('div', { class: 'cierre' }, [
      el('label', { text: 'Del 1 al 10, ¿cuánto entendiste?' }),
      escala,
      el('div', { class: 'escala-pies' }, [
        el('span', { text: 'Nada' }),
        el('span', { text: 'Todo' })
      ]),
      el('label', { text: '¿Te interesó?' }),
      pulgares,
      el('button', {
        class: 'primario',
        text: 'Listo',
        onclick: async () => {
          await db.from('book_piece_state').upsert({
            profile_id: perfil.id,
            piece_id: pieza.id,
            comprension: marca.comprension,
            interes: marca.interes,
            answered_at: new Date().toISOString()
          }, { onConflict: 'profile_id,piece_id' });
          await marcarActividad('libro');
          vistaLibro(libro, estado);
        }
      }),
      el('div', { class: 'secundarias' }, [
        el('button', { text: 'Volver al libro', onclick: () => vistaLibro(libro, estado) })
      ])
    ])
  );
}

// ============================================================
// Retos
// ============================================================
// La otra promesa visible: ejercicios sobre tus propios problemas.
// No son compartidos: cada reto es de una persona, porque está hecho
// sobre lo que esa persona tiene entre manos.
// ============================================================
async function retoAbierto() {
  const { data } = await db
    .from('challenges').select('*')
    .eq('profile_id', perfil.id)
    .in('status', ['propuesto', 'haciendo'])
    .order('created_at', { ascending: false })
    .limit(1);
  return (data || [])[0] || null;
}

async function vistaReto(reto) {
  if (!reto) {
    return pintar(
      el('h1', { text: 'Sin retos por ahora' }),
      el('p', { class: 'bajada', text: 'Los retos salen del cruce entre lo que te falta y lo que estás haciendo. Cuando aparezca uno que valga la pena, va a estar acá.' })
    );
  }

  if (reto.status === 'propuesto') {
    await db.from('challenges').update({ status: 'haciendo' }).eq('id', reto.id);
    reto.status = 'haciendo';
  }

  const marca = { dificultad: null, sirvio: null };
  const notas = el('textarea', { id: 'notas', placeholder: 'Qué te salió, qué no, qué aprendiste…' });

  const escala = el('div', { class: 'escala' });
  for (let n = 1; n <= 10; n++) {
    escala.append(el('button', {
      text: String(n), 'aria-pressed': 'false',
      onclick: (ev) => {
        [...escala.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        marca.dificultad = n;
      }
    }));
  }

  const pulgares = el('div', { class: 'pulgares' });
  for (const [v, t] of [['1', '👍 Sirvió'], ['-1', '👎 No sirvió']]) {
    pulgares.append(el('button', {
      'data-v': v, text: t, 'aria-pressed': 'false',
      onclick: (ev) => {
        [...pulgares.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        marca.sirvio = parseInt(v, 10);
      }
    }));
  }

  const cerrar = async (status) => {
    await db.from('challenges').update({
      status,
      dificultad: marca.dificultad,
      sirvio: marca.sirvio,
      notas: notas.value.trim() || null,
      answered_at: new Date().toISOString()
    }).eq('id', reto.id);
    if (status === 'hecho') await marcarActividad('reto');
    marcarNav('hoy');
    vistaHoy();
  };

  const cuerpo = el('article');
  cuerpo.append(markdown(reto.body_md));

  pintar(
    el('p', { class: 'paso', text: 'Reto' }),
    el('h1', { text: reto.title }),
    el('p', { class: 'ayuda', text: `${reto.minutes} minutos` }),
    cuerpo,
    reto.porque ? el('p', { class: 'fuente', text: `Por qué este: ${reto.porque}` }) : null,
    el('div', { class: 'cierre' }, [
      el('label', { for: 'notas', text: '¿Cómo te fue?' }),
      notas,
      el('div', { style: 'height:20px' }),
      el('label', { text: 'Del 1 al 10, ¿cuánto te costó?' }),
      escala,
      el('div', { class: 'escala-pies' }, [
        el('span', { text: 'Fácil' }),
        el('span', { text: 'Durísimo' })
      ]),
      el('label', { text: '¿Te sirvió?' }),
      pulgares,
      el('button', { class: 'primario', text: 'Lo hice', onclick: () => cerrar('hecho') }),
      el('div', { class: 'secundarias' }, [
        el('button', { text: 'Seguir después', onclick: () => { marcarNav('hoy'); vistaHoy(); } }),
        el('button', { text: 'No es para mí', onclick: () => cerrar('descartado') })
      ])
    ])
  );
}

// ============================================================
// Mapa viviente
// ============================================================
// Dos cosas sobre el mismo nodo: cuánto te movés vos ahí, y cuánto se
// mueve el campo. Donde el campo se mueve y vos no, esa es tu frontera.
//
// Es "viviente" porque ninguna de las dos columnas la escribí yo: el
// dominio sale de lo que hacés y la actividad sale de lo que el radar
// encontró en las últimas semanas.
// ============================================================
async function vistaMapa() {
  const [{ data: topics }, { data: dominios }, { data: hechas }, { data: senales }] = await Promise.all([
    db.from('topics').select('id, slug, name_es, kind, level_floor, sort').order('sort'),
    db.from('topic_mastery').select('topic_id, mastery, evidence').eq('profile_id', perfil.id),
    db.from('lesson_state').select('lesson_id, status').eq('profile_id', perfil.id).not('answered_at', 'is', null),
    db.from('signals').select('topic_id').eq('status', 'promovida')
  ]);

  // Dominio por evidencia externa, si lo hay.
  const porEvidencia = Object.fromEntries((dominios || []).map(d => [d.topic_id, d]));

  // Y lo que la app vio por su cuenta: lecciones contestadas por nodo.
  const ids = (hechas || []).map(h => h.lesson_id);
  let porLecciones = {};
  if (ids.length) {
    const { data: ls } = await db.from('lessons').select('id, topic_id').in('id', ids);
    for (const l of ls || []) {
      if (l.topic_id) porLecciones[l.topic_id] = (porLecciones[l.topic_id] || 0) + 1;
    }
  }

  const actividad = {};
  for (const s of senales || []) if (s.topic_id) actividad[s.topic_id] = (actividad[s.topic_id] || 0) + 1;

  const valorDe = (t) => Math.max(
    porEvidencia[t.id]?.mastery ?? 0,
    Math.min(100, (porLecciones[t.id] || 0) * 30)
  );

  const encendidos = (topics || []).filter(t => valorDe(t) >= 50).length;

  // La frontera: donde el campo se mueve más y vos menos.
  const frontera = (topics || [])
    .filter(t => t.kind === 'frontera' && t.level_floor <= perfil.level)
    .map(t => ({ t, brecha: (actividad[t.id] || 0) * 20 + (60 - valorDe(t)) }))
    .sort((a, b) => b.brecha - a.brecha)[0]?.t;

  const nodos = [
    el('h1', { text: 'El mapa' }),
    el('p', { class: 'bajada', text: `Encendiste ${encendidos} de ${topics?.length ?? 0} nodos. La barra es lo que sabés; el punto, lo que se movió el campo este tiempo.` })
  ];

  if (frontera) {
    nodos.push(el('div', { class: 'aviso', text: `Tu frontera está en ${frontera.name_es}: es donde más se mueve el campo y menos te movés vos.` }));
  }

  for (const kind of ['fundamento', 'frontera']) {
    const grupo = (topics || []).filter(t => t.kind === kind);
    if (!grupo.length) continue;

    nodos.push(el('h2', { text: kind === 'fundamento' ? 'Fundamentos' : 'Frontera' }));

    for (const t of grupo) {
      const valor = valorDe(t);
      const activo = actividad[t.id] || 0;
      const fuera = t.level_floor > perfil.level;

      const fila = el('div', { class: 'nodo' + (fuera ? ' nodo-lejos' : '') });
      fila.append(el('div', { class: 'nodo-nombre', text: t.name_es }));

      const barra = el('div', { class: 'barra' });
      barra.append(el('div', { class: 'barra-llena', style: `width:${valor}%` }));
      fila.append(barra);

      const marcas = el('div', { class: 'nodo-marcas' });
      if (activo) marcas.append(el('span', { class: 'punto', title: `${activo} novedades`, text: '●'.repeat(Math.min(activo, 3)) }));
      if (fuera) marcas.append(el('span', { class: 'tema', text: 'más adelante' }));
      fila.append(marcas);

      nodos.push(fila);
    }
  }

  nodos.push(el('p', { class: 'fuente', text: 'Un nodo apagado no significa que no sepas: significa que la app todavía no tiene evidencia de que te muevas ahí.' }));

  pintar(...nodos);
}

arrancar().catch(e => pintar(error('Algo se rompió: ' + e.message)));
