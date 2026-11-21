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

  if (!perfil.onboarded_at) return vistaPaso1();
  return vistaHoy();
}

document.getElementById('salir').addEventListener('click', async () => {
  await db.auth.signOut();
  location.reload();
});

const navHoy = document.getElementById('nav-hoy');
const navLibros = document.getElementById('nav-libros');

function marcarNav(cual) {
  navHoy.setAttribute('aria-current', cual === 'hoy' ? 'page' : 'false');
  navLibros.setAttribute('aria-current', cual === 'libros' ? 'page' : 'false');
}

navHoy.addEventListener('click', () => { marcarNav('hoy'); vistaHoy(); });
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
    tipo: 'texto',
    opcional: true,
    ej: 'Que arranque con halagos, que me liste diez opciones cuando pedí una, que me diga que consulte a un profesional.'
  }
];

const respuestas = {};
const elegidas = { usa: new Set(), quiere: new Set() };
let leccion1Id = null;

function vistaPaso1() {
  pintar(
    el('p', { class: 'paso', text: 'Paso 1' }),
    el('h1', { text: 'Armemos tus instrucciones' }),
    el('p', { class: 'bajada', text: 'Cada vez que abrís una conversación con una IA, empieza de cero: no sabe quién sos ni cómo te gusta que te hablen. Eso se arregla una sola vez y queda para siempre.' }),
    el('div', { class: 'aviso', text: `Son ${PREGUNTAS.length} preguntas cortas. Al final te vas con un texto listo para pegar en tu herramienta, y vas a ver la diferencia con tus propios ojos.` }),
    el('button', { class: 'primario', onclick: vistaHerramientas, text: 'Empezar' })
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
  const q = PREGUNTAS[i];
  const nodos = [
    el('p', { class: 'paso', text: `Pregunta ${i + 1} de ${PREGUNTAS.length}` }),
    el('h1', { text: q.pregunta })
  ];
  if (q.ayuda) nodos.push(el('p', { class: 'bajada', text: q.ayuda }));

  const seguir = (valor) => {
    if (valor !== undefined) respuestas[q.key] = valor;
    i + 1 < PREGUNTAS.length ? vistaPregunta(i + 1) : vistaInstrucciones();
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

async function vistaInstrucciones() {
  const texto = armarInstrucciones(respuestas);
  const nivel = parseInt(respuestas.uso_mas_complejo || '0', 10);

  // Guardado: respuestas de la entrevista, perfil derivado y herramientas.
  // El perfil derivado (context_summary) es lo que después permite traducir
  // cada lección al contexto real de la persona.
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
    level_source: 'onboarding',
    level_updated_at: new Date().toISOString(),
    lang: respuestas.idioma === 'en' ? 'en' : 'es'
  }).eq('id', perfil.id);

  perfil.level = nivel;
  perfil.personal_instructions = texto;

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
        if (leccion1Id) {
          await db.from('lesson_state').upsert({
            profile_id: perfil.id,
            lesson_id: leccion1Id,
            status: 'hecha',
            answered_at: new Date().toISOString()
          }, { onConflict: 'profile_id,lesson_id' });
        }

        await db.from('profiles').update({ onboarded_at: new Date().toISOString() }).eq('id', perfil.id);
        perfil.onboarded_at = new Date().toISOString();
        await marcarActividad('leccion');
        vistaHoy();
      }
    })
  );
}

// ============================================================
// Hoy
// ============================================================
async function vistaHoy() {
  // Ruteo: solo lecciones dentro del nivel de la persona, en orden del
  // track, y que no haya contestado todavía.
  const { data: hechas } = await db
    .from('lesson_state').select('lesson_id').eq('profile_id', perfil.id).not('answered_at', 'is', null);
  const ya = (hechas || []).map(r => r.lesson_id);

  let q = db.from('lessons')
    .select('id, slug, track_order, level_floor')
    .eq('kind', 'fundamento')
    .eq('published', true)
    .lte('level_floor', perfil.level)
    .gte('level_ceiling', perfil.level)
    .order('track_order');

  if (ya.length) q = q.not('id', 'in', `(${ya.join(',')})`);

  const { data: candidatas } = await q;

  // Una lección sin contenido escrito todavía no es un error: simplemente
  // no existe para la persona. Se pasa a la siguiente que sí lo tenga.
  let prox = null, cont = null;
  for (const c of candidatas || []) {
    const { data } = await db
      .from('lesson_contents').select('*')
      .eq('lesson_id', c.id).eq('lang', perfil.lang).is('tool_id', null).maybeSingle();
    if (data) { prox = c; cont = data; break; }
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
    el('p', { class: 'paso', text: 'Hoy' }),
    el('h1', { text: cont.title }),
    cont.hook ? el('p', { class: 'bajada', text: cont.hook }) : null,
    el('p', { class: 'ayuda', text: `${cont.minutes} minutos` }),
    el('button', { class: 'primario', onclick: () => vistaLeccion(prox.id, cont), text: 'Leer' })
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
    const dias = (estado.comprension ?? 10) <= 6 ? [2, 7, 21] : [3, 10, 30];
    await db.from('reviews').upsert(dias.map((d, i) => {
      const f = new Date();
      f.setDate(f.getDate() + d);
      return { profile_id: perfil.id, lesson_id: lessonId, stage: i, due_on: f.toISOString().slice(0, 10) };
    }), { onConflict: 'profile_id,lesson_id,stage' });

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

arrancar().catch(e => pintar(error('Algo se rompió: ' + e.message)));
