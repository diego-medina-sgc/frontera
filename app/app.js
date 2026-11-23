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
import { setLang, tr } from './i18n.js';

const db = createClient(SUPABASE_URL, SUPABASE_KEY);

const vista = document.getElementById('vista');

// La racha ya no vive en una esquina de arriba: se dibuja en Hoy, al
// lado de la fila de la semana, que es el mismo dato.
let semanasSeguidas = 0;
let mail = null;

let perfil = null;
let herramientas = [];
// Las herramientas que la persona declaró usar. Definen qué capa de
// ejecución se le muestra al pie de cada lección.
let misHerramientas = [];
// Las que dijo que le gustaría aprender. Se le muestra la capa de
// ejecución de esas también, marcada como lo que es.
let quieroHerramientas = [];

// ------------------------------------------------------------
// Utilidades de DOM (nada de innerHTML con texto de la base)
// ------------------------------------------------------------
// Atributos que la persona lee. El resto (class, id, type…) no se toca.
const TEXTO_ATTR = new Set(['placeholder', 'title', 'aria-label', 'alt']);

// Lo que está fijo en index.html no pasa por el(): se traduce una vez
// cuando se conoce el idioma. Con 'es' no cambia nada.
function traducirEstatico() {
  document.documentElement.lang = perfil?.lang === 'en' ? 'en' : 'es';
  const tocar = (nodo) => {
    for (const hijo of nodo.childNodes) {
      if (hijo.nodeType === 3 && hijo.nodeValue.trim()) {
        const original = hijo.__es ?? hijo.nodeValue.trim();
        hijo.__es = original;
        hijo.nodeValue = hijo.nodeValue.replace(hijo.nodeValue.trim(), tr(original));
      } else if (hijo.nodeType === 1 && hijo.tagName !== 'svg') tocar(hijo);
    }
  };
  for (const id of ['version-nueva', 'nav']) {
    const n = document.getElementById(id);
    if (n) tocar(n);
  }
  for (const n of document.querySelectorAll('[aria-label]')) {
    n.__esLabel ??= n.getAttribute('aria-label');
    n.setAttribute('aria-label', tr(n.__esLabel));
  }
  const meta = document.querySelector('meta[name="description"]');
  if (meta) {
    meta.__es ??= meta.content;
    meta.content = tr(meta.__es);
  }
}

// Las capas de ejecución por herramienta: en el idioma de la persona y,
// si esa herramienta todavía no la tiene en ese idioma, en español. Mejor
// una capa en otro idioma que ninguna.
async function capasDe(lessonId, herramientasIds) {
  if (!lessonId || !herramientasIds.length) return [];
  const idiomas = perfil.lang === 'es' ? ['es'] : [perfil.lang, 'es'];
  const { data } = await db
    .from('lesson_contents').select('*')
    .eq('lesson_id', lessonId).in('lang', idiomas).in('tool_id', herramientasIds);
  const mejor = new Map();
  for (const c of data || []) {
    const previa = mejor.get(c.tool_id);
    if (!previa || (c.lang === perfil.lang && previa.lang !== perfil.lang)) mejor.set(c.tool_id, c);
  }
  return [...mejor.values()];
}

// El nombre de un nodo del mapa en el idioma de la persona.
const nombreNodo = (t) => (perfil.lang === 'en' && t.name_en) || t.name_es;

function el(tag, props = {}, hijos = []) {
  const n = document.createElement(tag);
  for (const [k, v] of Object.entries(props)) {
    if (k === 'class') n.className = v;
    else if (k === 'text') n.textContent = tr(v);
    else if (k.startsWith('on')) n.addEventListener(k.slice(2), v);
    else if (v !== null && v !== undefined) {
      n.setAttribute(k, TEXTO_ATTR.has(k) ? tr(v) : v);
    }
  }
  for (const h of [].concat(hijos)) if (h) n.append(h);
  return n;
}

function pintar(...nodos) {
  // Toda pantalla nueva sale del modo lectura. Si es un lector, se
  // vuelve a entrar enseguida.
  salirDelLector();
  vista.replaceChildren(...nodos.filter(Boolean));
  window.scrollTo(0, 0);
}

// Markdown mínimo: ## ### **negrita** y listas. Suficiente para lecciones
// y sin dependencias ni riesgo de inyección.
function markdown(texto) {
  const cont = document.createDocumentFragment();
  let lista = null;

  let tipoLista = null;

  // Bloque plegable: ":::Ver la respuesta" abre y ":::" cierra.
  //
  // Existe por una razón de aprendizaje y no de estilo. Una pregunta
  // con la respuesta dos renglones abajo no es una pregunta: el ojo la
  // lee antes de que el cerebro intente contestar, y leer la respuesta
  // se siente igual que haberla sabido. Escondida, hay un momento en
  // el que la persona tiene que producirla, que es donde se aprende.
  let plegable = null;
  let plegableLineas = null;

  const cerrarPlegable = () => {
    if (plegable === null) return;
    const det = el('details', { class: 'plegable' }, [el('summary', { text: plegable })]);
    det.append(markdown(plegableLineas.join('\n')));
    cont.append(det);
    plegable = null;
    plegableLineas = null;
  };

  // **negrita** primero y, dentro de lo que no quedó en negrita,
  // *itálica*. Sin la itálica, siete pasajes del contenido ya
  // publicado mostraban los asteriscos crudos: títulos de libros,
  // énfasis, y el "(*Saved info*)" de la lección 1, que es de las
  // primeras pantallas que ve cualquiera.
  const enriquecer = (linea, destino) => {
    linea.split(/\*\*(.+?)\*\*/g).forEach((parte, i) => {
      if (!parte) return;
      if (i % 2) { destino.append(el('strong', { text: parte })); return; }
      parte.split(/\*([^*\n]+?)\*/g).forEach((p, j) => {
        if (!p) return;
        destino.append(j % 2 ? el('em', { text: p }) : document.createTextNode(p));
      });
    });
  };

  for (const linea of texto.split('\n')) {
    const t = linea.trim();

    if (t.startsWith(':::')) {
      if (plegable !== null) cerrarPlegable();
      else { plegable = tr(t.slice(3).trim() || 'Ver la respuesta'); plegableLineas = []; lista = null; }
      continue;
    }

    if (plegable !== null) { plegableLineas.push(linea); continue; }

    // Listas con guion y listas numeradas. Las numeradas salían como
    // párrafos sueltos con el "1." adentro.
    const numerada = t.match(/^(\d+)\.\s+(.*)$/);
    if (t.startsWith('- ') || numerada) {
      const tipo = numerada ? 'ol' : 'ul';
      if (!lista || tipoLista !== tipo) {
        lista = el(tipo);
        tipoLista = tipo;
        cont.append(lista);
      }
      const li = el('li');
      enriquecer(numerada ? numerada[2] : t.slice(2), li);
      lista.append(li);
      continue;
    }
    lista = null;
    tipoLista = null;

    if (!t) continue;
    if (t.startsWith('### ')) { cont.append(el('h3', { text: t.slice(4) })); continue; }
    if (t.startsWith('## '))  { cont.append(el('h2', { text: t.slice(3) })); continue; }
    const p = el('p');
    enriquecer(t, p);
    cont.append(p);
  }
  // Un bloque sin cerrar no se pierde: se dibuja igual.
  cerrarPlegable();

  return cont;
}

function error(msg) {
  return el('p', { class: 'error', text: msg });
}

// ============================================================
// El lector
// ============================================================
// Lo que hacen bien los lectores buenos, y que casi ninguna app web
// se toma el trabajo de hacer:
//
//   · dejar elegir el tamaño del texto, que es LA función más usada
//   · ofrecer sepia, que a los veinte minutos se agradece
//   · decir cuánto falta en minutos y no en porcentaje
//   · esconder la interfaz mientras leés y traerla al subir
//   · acordarse de dónde quedaste
//
// Las preferencias viven en el navegador de cada uno: son de ese
// aparato, no de la cuenta. Si el navegador las bloquea, la app
// funciona igual con los valores por defecto.
// ============================================================

// Interlineado y medida van en sentido inverso: la línea corta del
// celular en tamaño grande pide menos aire, no más. Con 1,72 fijo, el
// texto grande quedaba disperso y había que scrollear el doble.
const TAMANOS = {
  chico: { tam: 17.5, alto: 1.74 },
  normal: { tam: 19.5, alto: 1.66 },
  grande: { tam: 21, alto: 1.56 }
};
const PALABRAS_POR_MINUTO = 200;

const prefs = {
  leer(clave, porDefecto) {
    try { return localStorage.getItem('frontera.' + clave) ?? porDefecto; }
    catch { return porDefecto; }
  },
  guardar(clave, valor) {
    try { localStorage.setItem('frontera.' + clave, valor); } catch { /* sin storage, se vive igual */ }
  }
};

// El tamaño es inofensivo fuera del lector: solo afecta al texto largo.
function aplicarTamano() {
  const t = TAMANOS[prefs.leer('tamano', 'normal')] ?? TAMANOS.normal;
  document.documentElement.style.setProperty('--lectura-tam', t.tam + 'px');
  document.documentElement.style.setProperty('--lectura-alto', String(t.alto));
}

// ------------------------------------------------------------
// El acento
// ------------------------------------------------------------
// Seis acentos curados y no un selector libre de color. Un selector
// libre garantiza que tarde o temprano alguien elija algo que no
// contrasta, y el contraste no es cuestión de gusto.
//
// Cada acento trae cuatro valores y no uno: el relleno, el color del
// texto que va encima del relleno, y la versión legible como texto
// sobre fondo claro y sobre fondo oscuro. Los cuatro están medidos
// contra el lienzo de cada tema y ninguno baja de 4,5:1. Derivar todo
// de un solo hex es lo que rompe el contraste en modo oscuro.
//
// Las paletas salen de la referencia que pasó Diego: verdes, ámbares,
// azules, violetas y óxidos.
const ACENTOS = [
  { id: 'lima',    nombre: 'Lima',    relleno: '#d7f24b', sobre: '#17190c', claro: '#4d6b16', oscuro: '#b9d94a' },
  { id: 'bosque',  nombre: 'Bosque',  relleno: '#3e5a3f', sobre: '#ffffff', claro: '#2f5636', oscuro: '#7fbf8a' },
  { id: 'ambar',   nombre: 'Ámbar',   relleno: '#c07a2b', sobre: '#1a1206', claro: '#8a5415', oscuro: '#e0a350' },
  { id: 'oceano',  nombre: 'Océano',  relleno: '#3a506b', sobre: '#ffffff', claro: '#2c4a6b', oscuro: '#85b4e0' },
  { id: 'violeta', nombre: 'Violeta', relleno: '#5a3b8c', sobre: '#ffffff', claro: '#5a3b8c', oscuro: '#b49be0' },
  { id: 'oxido',   nombre: 'Óxido',   relleno: '#a8432f', sobre: '#ffffff', claro: '#96402e', oscuro: '#e89080' }
];

function acentoActual() {
  const id = prefs.leer('acento', 'lima');
  return ACENTOS.find(a => a.id === id) || ACENTOS[0];
}

// A diferencia del tamaño y del fondo, el acento no es del aparato: es
// identidad, y si lo elegiste en el teléfono esperás encontrarlo en la
// computadora. Por eso vive en el perfil y se copia al navegador.
//
// El navegador igual lo guarda, y no por redundancia: aplicarAcento()
// corre al cargar el módulo, mucho antes de que haya perfil. Sin la
// copia local, cada arranque pintaría un segundo de lima antes de
// ponerse del color elegido.
function aplicarAcento() {
  const a = acentoActual();
  const raiz = document.documentElement.style;
  raiz.setProperty('--acento', a.relleno);
  raiz.setProperty('--sobre-acento', a.sobre);
  raiz.setProperty('--acento-texto-claro', a.claro);
  raiz.setProperty('--acento-texto-oscuro', a.oscuro);
}

const esAcento = (id) => ACENTOS.some(a => a.id === id);

// Se llama apenas hay perfil. La columna es nullable a propósito: null
// no quiere decir "eligió lima", quiere decir "todavía no eligió", y
// esos dos casos se resuelven al revés.
function sincronizarAcento() {
  if (esAcento(perfil.accent)) {
    // Gana el perfil: puede venir de otro aparato.
    if (perfil.accent !== prefs.leer('acento', 'lima')) {
      prefs.guardar('acento', perfil.accent);
      aplicarAcento();
    }
    return;
  }

  // Nunca eligió en ningún lado. Si este navegador tiene algo de antes
  // —de cuando el acento era solo local— se sube y queda.
  const local = prefs.leer('acento', null);
  if (esAcento(local)) guardarAcento(local);
}

// La elección ya está aplicada y guardada localmente antes de salir a
// la red: si la subida falla, no se pierde nada y se reintenta al
// entrar la próxima vez.
function guardarAcento(id) {
  prefs.guardar('acento', id);
  aplicarAcento();
  if (!perfil) return;
  perfil.accent = id;
  db.from('profiles').update({ accent: id }).eq('id', perfil.id).then(() => {}, () => {});
}

// El tema de lectura, en cambio, vive SOLO mientras leés. Afuera la app
// sigue el modo del sistema, como hace Apple Books: el sepia es una
// condición de lectura, no una identidad del producto.
const COLOR_DE_TEMA = { claro: '#f1f1ef', sepia: '#f2ead8', oscuro: '#16171a' };
const metasTema = [...document.querySelectorAll('meta[name="theme-color"]')];
const temaOriginal = metasTema.map(m => m.getAttribute('content'));

// Sin esto, elegir sepia u oscuro deja una franja clara arriba de la
// pantalla: la barra de estado se queda con el color del sistema y la
// costura es lo primero que delata que esto es una web.
function pintarBarraDelSistema(color) {
  metasTema.forEach((m, i) => m.setAttribute('content', color ?? temaOriginal[i]));
}

// Antes el fondo valía sólo mientras leías y afuera la app volvía al
// modo del sistema. Era una decisión defendible —el sepia es una
// condición de lectura, no una identidad— pero en la práctica
// confunde: elegís sepia en Ajustes, salís, y no cambió nada. Ahora
// vale en toda la app, como el color.
function aplicarTema() {
  const tema = prefs.leer('tema', 'sistema');
  if (tema === 'sistema') {
    document.documentElement.removeAttribute('data-tema');
    pintarBarraDelSistema(null);
  } else {
    document.documentElement.setAttribute('data-tema', tema);
    pintarBarraDelSistema(COLOR_DE_TEMA[tema]);
  }
}

aplicarTamano();
aplicarAcento();
aplicarTema();

const pieLector = document.getElementById('lector-pie');
const btnVolver = document.getElementById('lector-volver');
const btnAa = document.getElementById('lector-aa');
const elRestante = document.getElementById('lector-restante');
const barraProgreso = document.getElementById('progreso');
let limpiarLector = null;

// Deja la pantalla como estaba antes de entrar a leer.
function salirDelLector() {
  if (limpiarLector) { limpiarLector(); limpiarLector = null; }
  document.body.classList.remove('leyendo', 'mostrar-barra');
  if (pieLector) pieLector.hidden = true;
  if (barraProgreso) { barraProgreso.hidden = true; barraProgreso.style.width = '0'; }
  document.querySelectorAll('.ajustes').forEach(p => p.remove());
}

// `ganchos.antes` devuelve una marca de dónde estaba la persona y
// `ganchos.despues` la usa para devolverla ahí. Sin eso, agrandar el
// texto a mitad de lección te deja trescientos píxeles más abajo, que
// es justo cuando querías mirar el cambio sobre lo que estabas leyendo.
function panelAjustes(ganchos = {}) {
  // En el lector es una hoja de abajo que se abre con el Aa. En Ajustes
  // son las mismas dos filas, sueltas dentro de la pantalla.
  const panel = el('div', {
    class: ganchos.enLinea ? 'ajustes ajustes-suelto' : 'ajustes',
    hidden: ganchos.enLinea ? null : 'true'
  });

  const fila = (etiqueta, clave, opciones, porDefecto) => {
    const f = el('div', { class: 'ajustes-fila' });
    const actual = prefs.leer(clave, porDefecto);
    for (const [valor, texto, clase] of opciones) {
      f.append(el('button', {
        text: texto,
        class: clase || null,
        // Los tres botones de tamaño dicen "A": sin esto, un lector de
        // pantalla lee tres veces lo mismo.
        'aria-label': `${etiqueta} ${valor}`,
        'aria-pressed': String(valor === actual),
        onclick: (ev) => {
          const marca = ganchos.antes?.();
          [...f.querySelectorAll('button')].forEach(b => b.setAttribute('aria-pressed', 'false'));
          ev.currentTarget.setAttribute('aria-pressed', 'true');
          prefs.guardar(clave, valor);
          aplicarTamano();
          aplicarTema();
          ganchos.despues?.(marca);
        }
      }));
    }
    return f;
  };

  panel.append(fila('Texto', 'tamano', [
    ['chico', 'A', 'tam-chico'],
    ['normal', 'A', 'tam-normal'],
    ['grande', 'A', 'tam-grande']
  ], 'normal'));

  panel.append(fila('Fondo', 'tema', [
    ['sistema', 'Auto'], ['claro', 'Claro'], ['sepia', 'Sepia'], ['oscuro', 'Oscuro']
  ], 'sistema'));

  return panel;
}

// `clave` identifica la pieza para recordar dónde quedaste.
function lector({ epigrafe, titulo, bajada, cuerpoMd, extras, pie, cierre, clave, minutos, volver }) {
  const cuerpo = el('article');
  cuerpo.append(markdown(cuerpoMd));

  // El total sale de lo que dice la ficha, no de un cálculo propio: si
  // la tarjeta prometió nueve minutos y el lector dice tres, el que
  // queda mal es el producto.
  const palabras = cuerpoMd.trim().split(/\s+/).length;
  const total = minutos || Math.max(1, Math.round(palabras / PALABRAS_POR_MINUTO));

  // El primer bloque visible del cuerpo. Es el ancla con la que se
  // recuerda la posición y con la que se vuelve después de cambiar el
  // tamaño: una fracción del scroll se rompe en cuanto el texto cambia
  // de tamaño, de tema o de redacción.
  const bloqueVisible = () => {
    const hijos = cuerpo.children;
    for (let i = 0; i < hijos.length; i++) {
      if (hijos[i].getBoundingClientRect().bottom > 90) return i;
    }
    return Math.max(0, hijos.length - 1);
  };

  const irAlBloque = (i) => {
    const n = cuerpo.children[Math.max(0, Math.min(i, cuerpo.children.length - 1))];
    if (n) n.scrollIntoView({ block: 'start' });
  };

  const nodos = [
    epigrafe ? el('p', { class: 'paso', text: epigrafe }) : null,
    el('h1', { text: titulo }),
    bajada ? el('p', { class: 'bajada', text: bajada }) : null
  ];

  // Retomar: solo si quedó a más de un 8% y sin terminar.
  const guardado = parseFloat(prefs.leer('pos.' + clave, '0'));
  const bloqueGuardado = parseInt(prefs.leer('blq.' + clave, '-1'), 10);
  const hayQueRetomar = guardado > 0.08 && guardado < 0.92;

  nodos.push(cuerpo);
  if (extras) nodos.push(extras);
  if (pie) nodos.push(pie);
  if (cierre) nodos.push(cierre);

  pintar(...nodos);

  // ---- comportamiento de lectura ----
  document.body.classList.add('leyendo', 'mostrar-barra');

  const ajustes = panelAjustes({ antes: bloqueVisible, despues: irAlBloque });
  document.body.append(ajustes);

  pieLector.hidden = false;
  if (barraProgreso) barraProgreso.hidden = false;

  // Volver solo a donde quedaste, en vez de pedir permiso para hacerlo.
  // El cartel viejo aparecía arriba del título, empujaba la pieza hacia
  // abajo y te hacía decidir algo antes de haber leído una línea. Los
  // lectores buenos hacen al revés: te devuelven donde estabas y te
  // ofrecen el principio por si no era eso lo que querías.
  let aviso = null;
  const sacarAviso = () => { if (aviso) { aviso.remove(); aviso = null; } };
  let avisoEn = null;

  if (hayQueRetomar) {
    requestAnimationFrame(() => {
      irAlBloque(bloqueGuardado >= 0
        ? bloqueGuardado
        : Math.round(cuerpo.children.length * guardado));

      aviso = el('div', { class: 'volviste' }, [
        el('span', { text: `Volviste al ${Math.round(guardado * 100)}%` }),
        el('button', {
          text: 'Ir al principio',
          onclick: () => { sacarAviso(); window.scrollTo({ top: 0, behavior: 'smooth' }); }
        })
      ]);
      document.body.append(aviso);
      avisoEn = setTimeout(sacarAviso, 7000);
    });
  }

  const alternarAjustes = () => {
    const abrir = ajustes.hidden;
    ajustes.hidden = !abrir;
    btnAa.setAttribute('aria-expanded', String(abrir));
  };

  btnAa.setAttribute('aria-expanded', 'false');
  btnAa.onclick = alternarAjustes;
  btnVolver.onclick = () => (volver ? volver() : vistaHoy());

  const alTeclado = (e) => { if (e.key === 'Escape' && !ajustes.hidden) alternarAjustes(); };

  const alTocarFuera = (e) => {
    if (ajustes.hidden) return;
    if (ajustes.contains(e.target) || btnAa.contains(e.target)) return;
    alternarAjustes();
  };

  // Tocar el texto muestra o esconde la interfaz. Es el gesto de
  // Kindle y de Books, y no pisa la selección de texto.
  const alTocarTexto = () => {
    if ((window.getSelection?.()?.toString() || '').length) return;
    document.body.classList.toggle('mostrar-barra');
  };

  document.addEventListener('keydown', alTeclado);
  document.addEventListener('pointerdown', alTocarFuera);
  cuerpo.addEventListener('click', alTocarTexto);

  let ultimo = window.scrollY;
  let guardarEn = null;

  const alScrollear = () => {
    const alto = cuerpo.offsetHeight;
    const y = window.scrollY;

    // El avance se mide contra la prosa, no contra la página: con la
    // página, el formulario de cierre cuenta como texto por leer y los
    // minutos que faltan mienten siempre para abajo.
    const avance = alto > 0
      ? Math.min(1, Math.max(0, (y + window.innerHeight - cuerpo.offsetTop) / alto))
      : 0;

    if (barraProgreso) barraProgreso.style.width = (avance * 100) + '%';

    const faltan = Math.round(total * (1 - avance));
    if (elRestante) {
      elRestante.textContent = tr(avance > 0.99 ? 'Listo' : `Faltan ${Math.max(1, faltan)} min`);
    }

    // Umbrales asimétricos: mostrar la barra pide un gesto deliberado
    // hacia arriba y esconderla es fácil, que es lo que se quiere en un
    // lector. Con 8px para los dos lados, el rebote de iOS la hacía
    // aparecer y desaparecer sola.
    if (y <= 0 || avance > 0.95 || y < ultimo - 28) document.body.classList.add('mostrar-barra');
    else if (y > ultimo + 14 && y > 80) document.body.classList.remove('mostrar-barra');
    ultimo = y;

    clearTimeout(guardarEn);
    guardarEn = setTimeout(() => {
      prefs.guardar('pos.' + clave, String(avance));
      prefs.guardar('blq.' + clave, String(bloqueVisible()));
    }, 400);
  };

  window.addEventListener('scroll', alScrollear, { passive: true });
  alScrollear();

  limpiarLector = () => {
    clearTimeout(avisoEn);
    sacarAviso();
    window.removeEventListener('scroll', alScrollear);
    document.removeEventListener('keydown', alTeclado);
    document.removeEventListener('pointerdown', alTocarFuera);
    cuerpo.removeEventListener('click', alTocarTexto);
    btnAa.onclick = null;
    btnVolver.onclick = null;
    clearTimeout(guardarEn);
  };
}

// ============================================================
// El cierre
// ============================================================
// Las dos preguntas que sostienen el motor entero: cuánto entendiste y
// si te interesó. Están separadas a propósito —entender y querer no son
// lo mismo— y ninguna bloquea nada: sirven para enrutar, no para
// aprobar.
//
// Aparecen de a una. Antes estaban las tres juntas y ocupaban una
// pantalla entera, que es la forma más rápida de que alguien conteste
// cualquier cosa para salir del paso. Las salidas, en cambio, están
// desde el principio: nadie queda encerrado por no querer responder.
// ============================================================
function cierre({ antes, pasos, accion, salidas, apretado }) {
  const valores = {};
  const caja = el('div', { class: apretado ? 'cierre apretado' : 'cierre' });
  if (antes) caja.append(antes);

  const respondido = (campo) => valores[campo] !== undefined && valores[campo] !== null;

  const nodosPaso = [];
  const nodoAccion = el('div', { class: 'cierre-paso', hidden: 'true' }, [
    el('button', { class: 'primario', text: accion.texto, onclick: () => accion.onclick(valores) })
  ]);

  const mostrar = (n) => {
    if (!n.hidden) return;
    n.hidden = false;
    n.classList.add('aparece');
  };

  const revisar = () => {
    for (let i = 1; i < nodosPaso.length; i++) {
      if (respondido(pasos[i - 1].campo)) mostrar(nodosPaso[i]);
    }
    if (pasos.every(p => respondido(p.campo))) mostrar(nodoAccion);
  };

  const elegir = (grupo, nodoBoton, campo, valor) => {
    [...grupo.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
    nodoBoton.setAttribute('aria-pressed', 'true');
    valores[campo] = valor;
    revisar();
  };

  pasos.forEach((p, i) => {
    const nodo = el('div', { class: 'cierre-paso', hidden: i === 0 ? null : 'true' });
    nodosPaso.push(nodo);

    const pregunta = el('p', { class: 'pregunta', text: p.pregunta });

    if (p.tipo === 'escala') {
      // Una sola línea: diez segmentos dentro de un riel, no diez
      // botones sueltos en dos filas.
      const riel = el('div', { class: 'escala', role: 'group', 'aria-label': p.pregunta });
      for (let n = 1; n <= 10; n++) {
        riel.append(el('button', {
          text: String(n),
          'aria-pressed': 'false',
          onclick: (ev) => elegir(riel, ev.currentTarget, p.campo, n)
        }));
      }
      nodo.append(pregunta, riel, el('div', { class: 'escala-pies' }, [
        el('span', { text: p.izq }),
        el('span', { text: p.der })
      ]));
    } else if (p.tipo === 'texto') {
      // No bloquea: arranca contestado en vacío, así el botón de
      // cerrar aparece igual y se lee como lo que es, opcional.
      valores[p.campo] = '';
      const caja = el('textarea', {
        class: 'compromiso',
        rows: '2',
        placeholder: p.ejemplo || '',
        oninput: (ev) => { valores[p.campo] = ev.currentTarget.value; }
      });
      nodo.append(pregunta, caja);
      if (p.ayuda) nodo.append(el('p', { class: 'ayuda', text: p.ayuda }));
    } else {
      const grupo = el('div', { class: 'pulgares', role: 'group', 'aria-label': p.pregunta });
      for (const [valor, texto] of p.opciones) {
        grupo.append(el('button', {
          text: texto,
          'aria-pressed': 'false',
          onclick: (ev) => elegir(grupo, ev.currentTarget, p.campo, valor)
        }));
      }
      // Dos opciones entran en la misma línea que la pregunta. Tres, no.
      nodo.classList.add(p.opciones.length <= 2 ? 'cierre-fila' : 'apilado');
      nodo.append(pregunta, grupo);
    }

    caja.append(nodo);
  });

  caja.append(nodoAccion);

  if (salidas && salidas.length) {
    const fila = el('div', { class: 'salidas' });
    for (const s of salidas) {
      fila.append(el('button', { text: s.texto, onclick: () => s.onclick(valores) }));
    }
    caja.append(fila);
  }

  return caja;
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
  mail = session.user?.email || null;

  const { data, error: e } = await db
    .from('profiles').select('*').eq('id', session.user.id).single();

  if (e) return pintar(error('No pude leer tu perfil: ' + e.message));
  perfil = data;
  setLang(perfil.lang);
  traducirEstatico();
  sincronizarAcento();

  const { data: tools } = await db
    .from('tools').select('*').eq('active', true).order('sort');
  herramientas = tools || [];

  const { data: mias } = await db
    .from('profile_tools').select('tool_id, relation').eq('profile_id', perfil.id).in('relation', ['usa', 'quiere']);
  misHerramientas = (mias || []).filter(r => r.relation === 'usa').map(r => r.tool_id);
  // La pantalla del Paso 1 promete, textual: "de estas te voy a traer
  // contenido, aunque hoy no las uses". Hasta ahora no lo cumplía
  // nadie: `quiere` se guardaba y no lo leía ni una línea.
  quieroHerramientas = (mias || []).filter(r => r.relation === 'quiere').map(r => r.tool_id);

  await dibujarRacha();

  // Durante el Paso 1 la navegación no existe: con ella a la vista, un
  // toque en "Hoy" saltea el onboarding entero y la persona termina en una
  // lección sin que la app sepa nada de ella.
  navegacion.hidden = !perfil.onboarded_at;

  if (!perfil.onboarded_at) return vistaPaso1();
  return vistaHoy();
}

async function salir() {
  await db.auth.signOut();
  location.reload();
}

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
  semanasSeguidas = data ?? 0;
}

// Lo único que quedó del encabezado de arriba: la marca y la racha, en
// la pantalla donde se las mira y no en la esquina a la que el pulgar
// no llega.
function cabecera() {
  return el('div', { class: 'cabecera' }, [
    el('span', { class: 'marca', text: 'Frontera' }),
    el('div', { class: 'cabecera-fin' }, [
      semanasSeguidas > 0
        ? el('span', {
            class: 'racha',
            title: 'Semanas seguidas aprendiendo',
            text: `${semanasSeguidas} ${semanasSeguidas === 1 ? 'semana' : 'semanas'}`
          })
        : null,
      el('button', { class: 'cabecera-ajustes', text: 'Ajustes', onclick: vistaPerfil })
    ])
  ]);
}

// ============================================================
// Ajustes
// ============================================================
// No hay una quinta pestaña: con cuatro destinos la barra de abajo da
// blancos de 97px y con cinco empieza a tocarse el vecino. Ajustes se
// entra desde Hoy, que es la pantalla que se abre todos los días.
const NOMBRE_IDIOMA = { es: 'Español', en: 'English' };

// Qué idiomas tienen contenido de verdad. Ofrecer uno que no lo tiene
// deja la cuenta sin una sola lección, que es lo que pasaba al elegir
// inglés en el onboarding.
async function idiomasServibles() {
  const { data } = await db.from('lesson_contents').select('lang').is('tool_id', null);
  const hay = [...new Set((data || []).map(r => r.lang))];
  return hay.length ? hay : ['es'];
}

function filaIdioma(idiomas) {
  const fila = el('div', { class: 'ajustes-fila', role: 'group', 'aria-label': 'Idioma' });

  for (const lang of idiomas) {
    fila.append(el('button', {
      text: NOMBRE_IDIOMA[lang] || lang,
      'aria-pressed': String(lang === perfil.lang),
      disabled: idiomas.length < 2 ? 'true' : null,
      onclick: async (ev) => {
        [...fila.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        const { error: e } = await db.from('profiles').update({ lang }).eq('id', perfil.id);
        // Recargar es lo más simple y lo más seguro: toda la interfaz,
        // las vistas ya pintadas y lo estático salen de nuevo en el idioma.
        if (!e) { perfil.lang = lang; location.reload(); }
      }
    }));
  }

  return el('div', { class: 'ajustes ajustes-suelto' }, [fila]);
}

// ------------------------------------------------------------
// Vos: las dos cosas que la app sabe de vos y que no podías ni ver
// ------------------------------------------------------------
// `personal_instructions` y `context_summary` se escribían una vez en
// el Paso 1 y no se volvían a tocar nunca más.
//
// El texto de instrucciones es el primer entregable de la app, lo que
// la persona se lleva y pega en su herramienta. Después del onboarding
// era inalcanzable: si no lo copiaste en el momento, no había pantalla
// en la app que te lo mostrara de nuevo.
//
// El contexto es peor, porque decide: sobre él se arma cada reto y,
// desde la migración 050, de qué lado se le traen las lecciones de
// frontera. Alguien que cambiaba de trabajo quedaba con el contexto de
// otra vida y sin forma de corregirlo. Editarlo acá recalcula los
// intereses en el acto, así que lo que escribe cambia lo que recibe.
function grupoVos() {
  const contexto = el('textarea', {
    id: 'contexto',
    rows: '4',
    placeholder: 'A qué te dedicás, con quién trabajás y para qué usás la IA.'
  });
  contexto.value = perfil.context_summary || '';

  const texto = el('textarea', {
    id: 'mis-instrucciones',
    rows: '10',
    placeholder: 'Si tenés tus instrucciones en otro lado, pegalas acá para tenerlas a mano.'
  });
  texto.value = perfil.personal_instructions || '';

  const dicho = el('p', { class: 'ayuda' });

  const copiar = el('button', {
    class: 'link',
    text: 'Copiar las instrucciones',
    onclick: async (ev) => {
      if (!texto.value.trim()) return;
      try {
        await navigator.clipboard.writeText(texto.value);
        ev.currentTarget.textContent = tr('Copiado ✓');
      } catch {
        ev.currentTarget.textContent = tr('Copialo a mano del cuadro');
      }
    }
  });

  const guardar = el('button', {
    class: 'primario',
    text: 'Guardar',
    onclick: async (ev) => {
      const boton = ev.currentTarget;
      const nuevoContexto = contexto.value.trim() || null;
      const nuevoTexto = texto.value.trim() || null;

      boton.disabled = true;
      dicho.textContent = tr('Guardando…');

      const intereses = await calcularIntereses([nuevoContexto]);
      const { error: e } = await db.from('profiles').update({
        context_summary: nuevoContexto,
        personal_instructions: nuevoTexto,
        interest_topics: intereses
      }).eq('id', perfil.id);

      boton.disabled = false;
      if (e) {
        dicho.textContent = tr('No se pudo guardar. Probá de nuevo.');
        return;
      }

      perfil.context_summary = nuevoContexto;
      perfil.personal_instructions = nuevoTexto;
      perfil.interest_topics = intereses;
      dicho.textContent = tr('Guardado ✓');
    }
  });

  return el('div', { class: 'grupo' }, [
    el('p', { class: 'etiqueta', text: 'Vos' }),

    el('label', { for: 'contexto', text: 'Tu contexto' }),
    el('p', { class: 'ayuda', text: 'Es lo que usa la app para elegir de qué lado traerte las cosas y sobre qué armarte un reto. Si cambiaste de trabajo, cambialo acá.' }),
    contexto,

    el('div', { style: 'height:18px' }),

    el('label', { for: 'mis-instrucciones', text: 'Tus instrucciones' }),
    el('p', {
      class: 'ayuda',
      text: perfil.personal_instructions
        ? 'El texto que armamos en el Paso 1. Es tuyo: copialo cuando lo necesites.'
        : 'Acá no hay nada porque ya tenías las tuyas armadas. Si querés tenerlas a mano, pegalas.'
    }),
    texto,
    copiar,

    el('div', { style: 'height:18px' }),
    guardar,
    dicho
  ]);
}

async function vistaPerfil() {
  marcarNav('ajustes');

  const idiomas = await idiomasServibles();

  const nombre = el('div', { class: 'color-nombre', text: acentoActual().nombre });
  const colores = el('div', { class: 'colores', role: 'group', 'aria-label': 'Color de la app' });

  for (const a of ACENTOS) {
    colores.append(el('button', {
      class: 'color',
      // El relleno y el tilde son del propio acento: la muestra es el
      // color haciendo exactamente lo que va a hacer en la app.
      style: `background:${a.relleno};color:${a.sobre}`,
      title: a.nombre,
      'aria-label': a.nombre,
      'aria-pressed': String(a.id === acentoActual().id),
      onclick: (ev) => {
        [...colores.children].forEach(b => b.setAttribute('aria-pressed', 'false'));
        ev.currentTarget.setAttribute('aria-pressed', 'true');
        guardarAcento(a.id);
        nombre.textContent = tr(a.nombre);
      }
    }, [el('span', { text: '✓', 'aria-hidden': 'true' })]));
  }

  pintar(
    el('p', { class: 'paso', text: 'Ajustes' }),
    el('h1', { text: 'Tu Frontera' }),

    el('div', { class: 'grupo' }, [
      el('p', { class: 'etiqueta', text: 'Color' }),
      colores,
      nombre
    ]),

    el('div', { class: 'grupo' }, [
      el('p', { class: 'etiqueta', text: 'Lectura' }),
      panelAjustes({ enLinea: true }),
      el('p', { class: 'ayuda', text: 'El tamaño vale para los textos largos. El fondo, para toda la app.' })
    ]),

    el('div', { class: 'grupo' }, [
      el('p', { class: 'etiqueta', text: 'Idioma' }),
      filaIdioma(idiomas),
      idiomas.length < 2
        ? el('p', { class: 'ayuda', text: 'Por ahora todo el contenido está en español. Cuando haya en otro idioma, va a aparecer acá.' })
        : null
    ]),

    grupoVos(),

    el('div', { class: 'grupo' }, [
      el('p', { class: 'etiqueta', text: 'Cuenta' }),
      mail ? el('p', { class: 'cuenta-mail', text: mail }) : null,
      el('button', { class: 'link', text: 'Salir de la cuenta', onclick: salir })
    ])
  );

}

// La semana como una fila de días, no como un número en una esquina.
// La idea es de Lightly: ver la semana entera hace que un día vacío sea
// un hueco visible y no un reproche. Por eso los días que faltan se
// dibujan punteados y no en rojo.
async function filaDeLaSemana() {
  const hoy = new Date();
  const lunes = new Date(hoy);
  lunes.setDate(hoy.getDate() - ((hoy.getDay() + 6) % 7));

  const desde = lunes.toISOString().slice(0, 10);
  const { data } = await db
    .from('activity').select('day')
    .eq('profile_id', perfil.id).gte('day', desde);

  const hechos = new Set((data || []).map(r => r.day));
  const fila = el('div', { class: 'semana' });
  const letras = perfil.lang === 'en'
    ? ['M', 'T', 'W', 'T', 'F', 'S', 'S']
    : ['L', 'M', 'M', 'J', 'V', 'S', 'D'];

  for (let i = 0; i < 7; i++) {
    const d = new Date(lunes);
    d.setDate(lunes.getDate() + i);
    const clave = d.toISOString().slice(0, 10);

    const estado = hechos.has(clave) ? 'hecho'
      : clave === hoy.toISOString().slice(0, 10) ? 'hoy'
      : d > hoy ? 'porvenir' : 'vacio';

    fila.append(el('div', { class: 'dia dia-' + estado }, [
      el('div', { class: 'dia-punto', text: estado === 'hecho' ? '✓' : '' }),
      el('div', { class: 'dia-letra', text: letras[i] })
    ]));
  }

  const cuantos = [...hechos].length;
  return el('div', { class: 'semana-caja' }, [
    el('div', { class: 'semana-texto', text: cuantos === 0 ? 'Esta semana' : `${cuantos} ${cuantos === 1 ? 'día' : 'días'} esta semana` }),
    fila
  ]);
}

// ============================================================
// El nivel se mueve
// ============================================================
// Hasta acá el nivel se fijaba una vez en el Paso 1 y después solo lo
// tocaba jobs/evidencia.mjs, que corre en una sola máquina contra un
// solo perfil. Para todos los demás era una constante de por vida, y
// como el ruteo filtra por nivel, quien entraba en 1 no iba a ver
// nunca una lección de frontera ni del radar. La app tenía diez
// lecciones de largo y después "por hoy está" para siempre.
//
// Esto lo mueve con lo que pasa adentro de la app. Deliberadamente
// conservador: sube, nunca baja, y pide evidencia repetida.
//
// "Ya lo sabía" y "entendí todo" son la misma señal dicha de dos
// maneras distintas: esto que me estás dando me queda abajo.
const ASCENSO = { contestadas: 5, señales: 3, retoFacil: 4 };

let ascendio = false;

async function revisarAscenso() {
  if (perfil.level >= 4) return;

  const { data: estados } = await db
    .from('lesson_state')
    .select('lesson_id, status, comprension')
    .eq('profile_id', perfil.id)
    .not('answered_at', 'is', null);

  if (!estados || estados.length < ASCENSO.contestadas) return;

  const { data: ls } = await db
    .from('lessons').select('id, level_floor')
    .in('id', estados.map(e => e.lesson_id));
  const piso = Object.fromEntries((ls || []).map(l => [l.id, l.level_floor]));

  // Solo cuenta lo que estaba a tu altura o más arriba. Terminar diez
  // lecciones de nivel 0 no dice nada sobre si estás listo para el 3.
  const aNivel = estados.filter(e => (piso[e.lesson_id] ?? 0) >= perfil.level);
  if (aNivel.length < ASCENSO.contestadas) return;

  const señales = aNivel.filter(
    e => e.status === 'ya_la_sabia' || (e.comprension ?? 0) >= 8
  ).length;

  // `dificultad` era de las señales que la app pedía y no usaba, y es
  // la más cara de conseguir: media hora de trabajo propio, no un
  // clic. Un reto que cerró y le resultó fácil dice lo mismo que "ya
  // lo sabía", pero sobre hacer y no sobre leer.
  //
  // Vale como UNA señal por más retos fáciles que haya: con un solo
  // reto abierto por persona a la vez, dos retos son semanas, y el
  // ascenso tiene que seguir apoyado en lo que contestó.
  const { data: retosFaciles } = await db
    .from('challenges').select('id')
    .eq('profile_id', perfil.id)
    .eq('status', 'hecho')
    .not('dificultad', 'is', null)
    .lte('dificultad', ASCENSO.retoFacil)
    .limit(1);

  const deRetos = (retosFaciles || []).length ? 1 : 0;
  if (señales + deRetos < ASCENSO.señales) return;

  const nuevo = perfil.level + 1;
  const { error: e } = await db.from('profiles').update({
    level: nuevo,
    level_source: 'desempeno',
    level_updated_at: new Date().toISOString()
  }).eq('id', perfil.id);

  if (e) return;
  perfil.level = nuevo;
  ascendio = true;
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
  navegacion.hidden = true;
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

// Los nodos que la persona nombró sin saber que los nombraba.
//
// `interview_answers` era la señal más caliente que la app recogía y la
// que menos hacía: tres preguntas abiertas donde alguien escribe, con
// sus palabras, a qué se dedica y para qué quiere la IA, guardadas para
// nadie. Esto les da un consumidor.
//
// `topics.terms` (migración 050) tiene por nodo las palabras con las
// que una persona que no es técnica describe su trabajo: "planillas",
// "repetitivo", "redes", "mails". El cruce es por subcadena y sin
// pretensión de precisión: un falso positivo sólo cambia el orden de
// dos lecciones que igual podía leer.
async function calcularIntereses(textos) {
  const texto = textos.filter(Boolean).join(' ').toLowerCase();
  if (!texto.trim()) return [];

  const { data: nodos } = await db.from('topics').select('id, terms');
  const ids = [];
  for (const n of nodos || []) {
    if ((n.terms || []).some(t => t && texto.includes(String(t).toLowerCase()))) ids.push(n.id);
  }
  return ids;
}

// Partición estable: primero las del tema que la persona nombró, y
// después todas las demás en el orden en que venían. No saca nada de la
// lista —nadie pierde acceso a una lección por no haber escrito la
// palabra justa— y si no nombró ningún tema, devuelve lo mismo que
// entró.
function primeroLoSuyo(lista, suyos) {
  if (!suyos || !suyos.length) return lista;
  const propios = new Set(suyos);
  const mios = lista.filter(c => c.topic_id && propios.has(c.topic_id));
  if (!mios.length) return lista;
  return [...mios, ...lista.filter(c => !c.topic_id || !propios.has(c.topic_id))];
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

  const contexto = `${respuestas.rol} ${respuestas.contexto}. Usa IA para: ${respuestas.usos}`;
  const intereses = await calcularIntereses([respuestas.rol, respuestas.contexto, respuestas.usos]);

  await db.from('profiles').update({
    personal_instructions: texto,
    context_summary: contexto,
    interest_topics: intereses,
    level: nivel,
    level_source: fuente,
    level_updated_at: new Date().toISOString(),
    // El idioma de la app NO sale de esta pregunta. La pregunta es
    // sobre cómo querés que te escriba tu herramienta de IA, y sirve
    // para el texto de instrucciones. Usarla para `lang` hacía que
    // elegir "Inglés" dejara la cuenta sin una sola lección —no hay
    // contenido en inglés— y sin forma de volver atrás.
    // El idioma de la app se elige en Ajustes.
    lang: 'es'
  }).eq('id', perfil.id);

  perfil.level = nivel;
  perfil.personal_instructions = texto;
  perfil.context_summary = contexto;
  // Sin esto, el ruteo por intereses recién empieza a valer en la
  // segunda sesión: la primera lección después del Paso 1 es
  // justamente donde más importa.
  perfil.interest_topics = intereses;
  perfil.lang = respuestas.idioma === 'en' ? 'en' : 'es';
  setLang(perfil.lang);
  traducirEstatico();
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

  // Saber que las tenés no es lo mismo que acordarte dónde están. El
  // camino es el mismo lugar donde se ponen, así que se reusa la capa de
  // ejecución de la lección 1, pero plegada: quien se acuerda no la abre.
  const usadas = [...elegidas.usa];
  let ayuda = null;
  if (leccion1Id && usadas.length) {
    const capas = await capasDe(leccion1Id, usadas);

    if (capas?.length) {
      ayuda = el('details', { class: 'plegable' });
      ayuda.append(el('summary', { text: '¿No te acordás dónde las tenés guardadas?' }));
      ayuda.append(el('p', { class: 'ayuda', text: 'Están en el mismo lugar donde se ponen. Este es el camino en las herramientas que marcaste:' }));
      for (const c of capas) {
        const bloque = el('div', { class: 'tarjeta' }, [el('h2', { text: c.title })]);
        const a = el('article');
        a.append(markdown(c.body_md));
        bloque.append(a);
        ayuda.append(bloque);
      }
      if (usadas.length > 1) {
        ayuda.append(el('p', { class: 'ayuda', text: 'Si tenés instrucciones distintas en cada herramienta, pegá las de la que más usás, o juntá todas en el mismo campo.' }));
      }
    }
  }

  pintar(
    el('p', { class: 'paso', text: 'Lo último' }),
    el('h1', { text: 'Pegá las tuyas' }),
    el('p', { class: 'bajada', text: 'Si me las dejás, puedo traducirte lo que te enseñe a tu forma de trabajar en vez de darte lo genérico. Son tuyas y quedan solo en tu cuenta.' }),
    ayuda,
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
        ev.currentTarget.textContent = tr('Copiado ✓');
      } catch {
        ev.currentTarget.textContent = tr('Copialo a mano del cuadro de arriba');
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

  const capas = lec ? await capasDe(lec.id, usadas) : [];

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

        // `before_after` se guardaba desde el primer día y no lo leía
        // nadie. Es, de todo lo que la app recoge, la única evidencia de
        // algo que la persona hizo AFUERA: abrió su herramienta, le
        // pegó las instrucciones, le hizo la pregunta dos veces y
        // comparó las respuestas. Eso no es jugar.
        //
        // Quien entró declarando "nunca la usé en serio" y llega acá
        // con las dos respuestas pegadas está operando, y el nivel 0
        // le iba a dar durante semanas material que ya pasó. El piso
        // sube a 1. Sube, nunca baja, igual que el resto del motor, y
        // no se dice como número: al día siguiente simplemente le
        // llega otra cosa.
        if (perfil.level === 0 && antes.value.trim() && despues.value.trim()) {
          const { error: eNivel } = await db.from('profiles').update({
            level: 1,
            level_source: 'desempeno',
            level_updated_at: new Date().toISOString()
          }).eq('id', perfil.id);
          if (!eNivel) perfil.level = 1;
        }

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
  const caduca = haceDias(DIAS_PARA_CADUCAR);
  const { data } = await db
    .from('reviews')
    .select('id, stage, lesson_id, due_on')
    .eq('profile_id', perfil.id)
    .is('done_at', null)
    .lte('due_on', hoy)
    .gte('due_on', caduca)
    .order('due_on')
    .limit(1);
  return (data || [])[0] || null;
}

// La app promete que nada se acumula y que no hay deuda. La cola de
// repasos era exactamente una deuda: te ibas diez días con ocho
// lecciones hechas y volvías con veinticuatro repasos, obligatorios y
// de a uno por pantalla antes de poder ver lo de hoy.
//
// Un repaso que lleva más de dos semanas vencido ya no mide memoria,
// mide ausencia. Se cierra solo y se marca caducado para que no
// ensucie la medición de si la app enseña algo.
const DIAS_PARA_CADUCAR = 14;

function haceDias(n) {
  const f = new Date();
  f.setDate(f.getDate() - n);
  return f.toISOString().slice(0, 10);
}

async function caducarRepasosViejos() {
  await db.from('reviews')
    .update({ done_at: new Date().toISOString(), caducado: true })
    .eq('profile_id', perfil.id)
    .is('done_at', null)
    .lt('due_on', haceDias(DIAS_PARA_CADUCAR));
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

  const guardar = async (v = {}) => {
    await db.from('reviews').update({
      done_at: new Date().toISOString(),
      recordaba: v.recordaba ?? null,
      uso: v.uso ?? null
    }).eq('id', repaso.id);

    // Si no se acordaba, vuelve antes. Si lo usó de verdad, no hace falta
    // insistir: se salta el resto de la escalera.
    if (v.recordaba === 0) {
      const f = new Date();
      f.setDate(f.getDate() + 2);
      await db.from('reviews').upsert({
        profile_id: perfil.id,
        lesson_id: repaso.lesson_id,
        stage: repaso.stage + 10,
        due_on: f.toISOString().slice(0, 10)
      }, { onConflict: 'profile_id,lesson_id,stage' });
    } else if (v.uso === true) {
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

    cierre({
      pasos: [
        {
          tipo: 'opciones',
          campo: 'recordaba',
          pregunta: '¿Te acordabas?',
          opciones: [[2, 'Sí'], [1, 'Más o menos'], [0, 'No']]
        },
        {
          tipo: 'opciones',
          campo: 'uso',
          pregunta: '¿Lo usaste en algo real?',
          opciones: [[true, 'Sí'], [false, 'Todavía no']]
        }
      ],
      // El repaso es una pantalla corta: acá el cierre no viene después
      // de diez minutos de lectura, viene enseguida.
      apretado: true,
      accion: { texto: 'Listo', onclick: (v) => guardar(v) },
      salidas: [
        // Se le pasa el repaso: si termina la lección, ese repaso
        // queda cerrado. Sin esto, volver a leerla y apretar Listo
        // reagendaba todo y devolvía el mismo repaso, en loop.
        { texto: 'Volver a leerlo', onclick: () => vistaLeccion(repaso.lesson_id, cont, repaso.id) }
      ]
    })
  );
}

// Cuando algo falla de verdad hay que decirlo. El estado de error y el
// de "no hay nada nuevo hoy" eran el mismo píxel, y eso es peor que un
// error: es la app afirmando algo sobre el mundo que no sabe.
function pintarFalla() {
  pintar(
    cabecera(),
    el('p', { class: 'paso', text: 'No pude traer lo de hoy' }),
    el('h1', { text: 'Algo falló de este lado' }),
    el('p', { class: 'bajada', text: 'No es que no haya nada: no pude llegar a la base. Probá de nuevo en un momento.' }),
    el('button', { class: 'primario', text: 'Reintentar', onclick: () => vistaHoy() })
  );
}

// ============================================================
// El compromiso
// ============================================================
// Cada lección termina con una consigna concreta —"elegí la cosa tuya
// que más usa otra gente y pegá diez casos en una planilla"— y la app
// no sabía que esa consigna existía. Esto es lo que convierte leer en
// hacer: lo que escribiste ayer te lo pregunta hoy.
//
// Es, además, la única señal de toda la app sobre algo que pasó afuera
// de la app.
async function compromisoPendiente() {
  const ayer = haceDias(1) + 'T23:59:59Z';
  const { data } = await db
    .from('lesson_state')
    .select('lesson_id, compromiso, compromiso_at')
    .eq('profile_id', perfil.id)
    .not('compromiso', 'is', null)
    .is('compromiso_hecho', null)
    .lte('compromiso_at', ayer)
    .order('compromiso_at')
    .limit(1);
  return (data || [])[0] || null;
}

async function vistaCompromiso(c) {
  const { data: cont } = await db
    .from('lesson_contents').select('title')
    .eq('lesson_id', c.lesson_id).eq('lang', perfil.lang).is('tool_id', null).maybeSingle();

  const responder = async (hecho) => {
    await db.from('lesson_state')
      .update({ compromiso_hecho: hecho })
      .eq('profile_id', perfil.id).eq('lesson_id', c.lesson_id);
    if (hecho) await marcarActividad('compromiso');
    vistaHoy();
  };

  const dias = Math.max(1, Math.round((Date.now() - new Date(c.compromiso_at).getTime()) / 864e5));

  pintar(
    cabecera(),
    el('p', { class: 'paso', text: dias === 1 ? 'Ayer dijiste' : `Hace ${dias} días dijiste` }),
    el('h1', { text: c.compromiso }),
    cont ? el('p', { class: 'bajada', text: `Salió de "${cont.title}".` }) : null,

    cierre({
      apretado: true,
      pasos: [{
        tipo: 'opciones',
        campo: 'hecho',
        pregunta: '¿Lo hiciste?',
        opciones: [[true, 'Sí'], [false, 'Todavía no']]
      }],
      accion: { texto: 'Listo', onclick: (v) => responder(v.hecho === true) },
      salidas: [
        // Sin esta salida, un compromiso que ya no tiene sentido te
        // bloquea la pantalla de hoy para siempre.
        { texto: 'Ya no va', onclick: () => responder(false) }
      ]
    })
  );
}

async function vistaHoy() {
  // Lo que dijiste que ibas a hacer va antes que todo: es lo único de
  // la app que te pregunta por algo que pasó afuera.
  const pendiente = await compromisoPendiente();
  if (pendiente) return vistaCompromiso(pendiente);

  await caducarRepasosViejos();

  // El repaso va primero: son veinte segundos y es lo que evita que todo
  // lo anterior se borre. Después sigue lo nuevo.
  const repaso = await repasoPendiente();
  if (repaso) return vistaRepaso(repaso);

  const semana = await filaDeLaSemana();

  // Ruteo: solo lecciones dentro del nivel de la persona, en orden del
  // track, y que no haya contestado todavía.
  const { data: hechas, error: eHechas } = await db
    .from('lesson_state').select('lesson_id, interes').eq('profile_id', perfil.id).not('answered_at', 'is', null);

  // Si esta consulta falla y seguimos, pasan dos cosas feas: te vuelve
  // a servir algo que ya contestaste, que rompe la promesa central, o
  // te muestra "por hoy está" como si fuera una decisión editorial.
  // Un error de red no puede disfrazarse de afirmación sobre el mundo.
  if (eHechas) return pintarFalla();

  const ya = (hechas || []).map(r => r.lesson_id);

  // El pulgar. Estaba escrito en el esquema desde el primer día —"9 con
  // pulgar abajo deja de traer el tema"— y no existía en el código: se
  // guardaba y no lo leía nadie.
  //
  // Con dieciocho lecciones, nueve es un número de otra app. Tres
  // pulgares abajo netos apagan el tema, y basta con un pulgar arriba
  // para que vuelva a contar: no bloquea nada, rutea.
  //
  // Y sólo apaga radar y frontera. El track es el piso: si alguien
  // pulgarea abajo los fundamentos, el problema no es el tema.
  const apagados = new Set();
  if (ya.length) {
    const { data: deTema } = await db.from('lessons').select('id, topic_id').in('id', ya);
    const saldo = {};
    for (const l of deTema || []) {
      if (!l.topic_id) continue;
      const voto = (hechas.find(h => h.lesson_id === l.id) || {}).interes;
      if (voto) saldo[l.topic_id] = (saldo[l.topic_id] || 0) + voto;
    }
    for (const [tema, n] of Object.entries(saldo)) if (n <= -3) apagados.add(Number(tema));
  }

  // El radar va primero y lo más nuevo arriba: si el mundo produjo algo
  // que te sirve, eso gana sobre seguir el track. El track es el piso,
  // no la agenda.
  let prox = null, cont = null;

  // Orden: lo nuevo del mundo primero, después los temas de frontera que
  // no caducan, y al final el track ordenado de fundamentos.
  // Nada se acumula. El competidor de esta app no es otra app: es la
  // carpeta de newsletters que nadie abre, con la culpa adentro. Por eso
  // una lección de radar que no leíste en diez días desaparece y no deja
  // rastro. No hay pendientes, no hay contador, no hay deuda.
  const vence = new Date(Date.now() - 10 * 864e5).toISOString();

  for (const [kind, columna, asc] of [
    ['radar', 'created_at', false],
    ['frontera', 'created_at', false],
    ['fundamento', 'track_order', true]
  ]) {
    let q = db.from('lessons')
      .select('id, slug, kind, topic_id, track_order, created_at')
      .eq('kind', kind)
      .eq('published', true)
      .lte('level_floor', perfil.level)
      .order(columna, { ascending: asc });

    // El techo solo vale para lo perecedero y para la frontera. En el
    // track no: las lecciones del track tienen techo 1 o 2, así que al
    // subir de nivel a mitad de camino desaparecían para siempre, sin
    // haberlas leído y sin forma de volver a verlas. Mejor que te caiga
    // una que te queda abajo —y la saques con un toque en "ya lo
    // sabía"— que un agujero que no se cierra nunca.
    if (kind !== 'fundamento') q = q.gte('level_ceiling', perfil.level);

    if (kind === 'radar') q = q.gte('created_at', vence);
    if (ya.length) q = q.not('id', 'in', `(${ya.join(',')})`);

    const { data: candidatas, error: eCand } = await q;
    if (eCand) return pintarFalla();

    // Entre dos lecciones de frontera que puede leer hoy, va primero la
    // del tema que ella misma puso sobre la mesa en el Paso 1. Es una
    // partición estable: no saca nada de la lista, cambia el orden.
    //
    // Sólo en frontera. En el radar manda la novedad, que es la
    // promesa de esa sección; en el track manda la escalera, que es
    // pedagógica. Acá el orden era `created_at desc`, o sea el azar de
    // cuándo escribí cada una.
    const lista = kind === 'frontera'
      ? primeroLoSuyo(candidatas || [], perfil.interest_topics)
      : (candidatas || []);

    // Una lección sin contenido escrito todavía no es un error: simplemente
    // no existe para la persona. Se pasa a la siguiente que sí lo tenga.
    for (const c of lista) {
      // El tema apagado por el pulgar no se trae, salvo en el track.
      if (kind !== 'fundamento' && c.topic_id && apagados.has(c.topic_id)) continue;

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
      cabecera(),
      semana,
      el('h1', { text: 'Por hoy está' }),
      el('p', { class: 'bajada', text: 'No hay nada nuevo que valga tus minutos. No quedó nada pendiente: lo que no apareció hoy, no te lo debés.' }),
      el('button', {
        class: 'primario',
        text: 'Mientras tanto, ir a la biblioteca',
        onclick: () => { marcarNav('libros'); vistaBiblioteca(); }
      })
    );
  }

  // El nivel no se dice nunca como número —es interno— pero que se
  // haya movido tiene que notarse, porque si nada cambia por lo que
  // hacés, la app es una biblioteca.
  const avisoAscenso = ascendio
    ? el('p', { class: 'aviso', text: 'Se abrió material nuevo: lo que venías contestando dice que lo de antes te quedaba corto.' })
    : null;
  ascendio = false;

  pintar(
    cabecera(),
    semana,
    avisoAscenso,
    el('p', { class: 'paso', text: { radar: 'Salió esto', frontera: 'Frontera' }[prox.kind] || 'Hoy' }),
    el('h1', { text: cont.title }),
    cont.hook ? el('p', { class: 'bajada', text: cont.hook }) : null,
    el('p', { class: 'ayuda', text: `${cont.minutes} minutos` }),
    el('button', { class: 'primario', onclick: () => vistaLeccion(prox.id, cont), text: 'Leer' }),
    (await retoAbierto()) && (await empujarReto())
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
// `repasoId` llega cuando se entró desde un repaso: al terminar la
// lección ese repaso queda cerrado.
async function vistaLeccion(lessonId, cont, repasoId = null) {
  // La capa de ejecución: lo mismo explicado para la herramienta que la
  // persona usa. Si usa dos, ve las dos. Si no declaró ninguna, no ve
  // ninguna y la lección conceptual se sostiene sola.
  // Las que usa y, detrás, las que dijo que le gustaría aprender.
  const pedidas = [...misHerramientas, ...quieroHerramientas];
  // Primero las que usa de verdad: lo que puede hacer hoy va antes
  // que lo que podría hacer algún día.
  const capas = (await capasDe(lessonId, pedidas)).sort((a, b) =>
    Number(quieroHerramientas.includes(a.tool_id)) - Number(quieroHerramientas.includes(b.tool_id))
  );

  const guardar = async (status, v = {}) => {
    await db.from('lesson_state').upsert({
      profile_id: perfil.id,
      lesson_id: lessonId,
      status,
      comprension: v.comprension ?? null,
      interes: v.interes ?? null,
      compromiso: (v.compromiso || '').trim() || null,
      compromiso_at: (v.compromiso || '').trim() ? new Date().toISOString() : null,
      compromiso_hecho: null,
      answered_at: new Date().toISOString()
    }, { onConflict: 'profile_id,lesson_id' });

    // Repaso espaciado: 3, 10 y 30 días. Lo que se entendió a medias
    // vuelve antes. Nunca como castigo, solo vuelve.
    //
    // Pero a lo que alguien marcó como sabido no se le agenda nada: a
    // una persona avanzada que saltea media docena de lecciones le
    // caerían veinte repasos de cosas que ya domina, y ahí la perdés.
    if (status === 'hecha') {
      const dias = (v.comprension ?? 10) <= 6 ? [2, 7, 21] : [3, 10, 30];
      await db.from('reviews').upsert(dias.map((d, i) => {
        const f = new Date();
        f.setDate(f.getDate() + d);
        return {
          profile_id: perfil.id, lesson_id: lessonId, stage: i,
          due_on: f.toISOString().slice(0, 10),
          // Sin esto, una lección cuyos tres repasos ya se consumieron
          // no se podía volver a armar nunca: el upsert pisaba la
          // fecha pero dejaba el done_at viejo.
          done_at: null, caducado: false, recordaba: null, uso: null
        };
      }), { onConflict: 'profile_id,lesson_id,stage' });
    } else if (status === 'ya_la_sabia') {
      // Si decís que ya lo sabías, lo que estaba agendado deja de
      // tener sentido. Sin esto la app generaba sola el estado que sus
      // propios controles marcan como falla: repasos vivos sobre algo
      // declarado sabido.
      await db.from('reviews')
        .update({ done_at: new Date().toISOString(), caducado: true })
        .eq('profile_id', perfil.id).eq('lesson_id', lessonId).is('done_at', null);
    }

    // El repaso del que se vino, si se vino de uno.
    if (repasoId) {
      await db.from('reviews')
        .update({ done_at: new Date().toISOString(), caducado: true })
        .eq('id', repasoId).is('done_at', null);
    }

    await marcarActividad('leccion');
    await revisarAscenso();
    vistaHoy();
  };

  const ejecucion = el('div');
  for (const c of capas) {
    const futura = quieroHerramientas.includes(c.tool_id);
    const t = el('div', { class: 'tarjeta' }, [
      // Marcada, porque no es lo mismo "así lo hacés" que "así lo
      // harías el día que la uses".
      futura ? el('p', { class: 'paso', text: 'Para cuando la uses' }) : null,
      el('h2', { text: c.title })
    ]);
    const a = el('article');
    a.append(markdown(c.body_md));
    t.append(a);
    ejecucion.append(t);
  }

  lector({
    epigrafe: 'Lección',
    titulo: cont.title,
    bajada: cont.hook || null,
    cuerpoMd: cont.body_md,
    clave: 'leccion.' + lessonId,
    minutos: cont.minutes,
    extras: capas.length ? ejecucion : null,
    cierre: cierre({
      pasos: [
        { tipo: 'escala', campo: 'comprension', pregunta: '¿Cuánto entendiste?', izq: 'Nada', der: 'Todo' },
        { tipo: 'opciones', campo: 'interes', pregunta: '¿Te interesó?', opciones: [[1, '👍 Sí'], [-1, '👎 No']] },
        // Cada lección termina con una consigna concreta y hasta ahora
        // la app no sabía que existía. Esto es lo que convierte leer
        // en hacer: mañana te lo va a preguntar.
        {
          tipo: 'texto',
          campo: 'compromiso',
          pregunta: '¿Qué vas a hacer con esto?',
          ejemplo: 'Una cosa concreta, de esta semana…',
          ayuda: 'Si escribís algo, mañana te lo pregunto. Si no, no pasa nada.'
        }
      ],
      accion: { texto: 'Listo', onclick: (v) => guardar('hecha', v) },
      salidas: [
        { texto: 'Ya lo sabía', onclick: (v) => guardar('ya_la_sabia', v) },
        { texto: 'Dejarlo para después', onclick: () => vistaHoy() }
      ]
    })
  });
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

// El título que se muestra es siempre el original.
//
// La primera versión mostraba el de la edición en español cuando
// existía, y la biblioteca quedaba con cinco títulos en español y tres
// en inglés: peor que cualquiera de las dos cosas sola. Y el español
// no se puede completar sin inventar, porque de Grove, Horowitz y
// Dunford no hay edición en castellano verificable: los únicos que
// usan esos títulos traducidos son sitios de resúmenes.
//
// Así que el original manda —que además es el nombre con el que se
// busca y se compra el libro— y el título en español aparece como
// dato extra en los cinco que lo tienen.
function tituloLibro(libro) {
  return libro.title;
}

// La tapa sale del catálogo público de Open Library. Si no carga —sin
// conexión, o el catálogo caído— la tarjeta se dibuja igual: el alt
// vacío y el display:none del onerror la sacan sin dejar hueco.
function tapaLibro(libro) {
  if (!libro.cover_id) return null;
  return el('img', {
    class: 'tapa',
    src: `https://covers.openlibrary.org/b/id/${libro.cover_id}-M.jpg`,
    alt: '',
    loading: 'lazy',
    onerror: (ev) => { ev.currentTarget.style.display = 'none'; }
  });
}

// ------------------------------------------------------------
// El pulgar de los libros
// ------------------------------------------------------------
// Cada pieza se cierra con los mismos dos clics que una lección, y de
// `book_piece_state` sólo se leía `piece_id`, para saber cuáles ya
// habías contestado. El pulgar y la comprensión se guardaban y no los
// leía nadie: dos señales más, del mismo tipo que las que encontraron
// las auditorías.
//
// El puntaje es por TEMA y no por libro, porque el libro que te gustó
// ya lo leíste: lo que sirve para lo que viene es qué temas te pegaron.
// Mismo umbral que el pulgar de las lecciones —3 netos abajo apagan el
// tema y un pulgar arriba lo revierte— para no inventar un número
// nuevo para la misma idea.
const TEMA_APAGADO = -3;

async function señalDeLibros(libros, estadosPorLibro) {
  const [{ data: contestadas }, { data: piezas }] = await Promise.all([
    db.from('book_piece_state').select('piece_id, interes').eq('profile_id', perfil.id),
    db.from('book_pieces').select('id, book_id, for_read_state').eq('lang', perfil.lang)
  ]);

  const porPieza = Object.fromEntries((piezas || []).map(p => [p.id, p]));
  const temasDe = Object.fromEntries((libros || []).map(l => [l.id, l.themes || []]));

  const hechas = new Set();
  const porTema = {};
  for (const c of contestadas || []) {
    hechas.add(c.piece_id);
    const p = porPieza[c.piece_id];
    if (!p || !c.interes) continue;
    for (const t of temasDe[p.book_id] || []) porTema[t] = (porTema[t] || 0) + c.interes;
  }

  // Un libro está agotado cuando no le queda ninguna pieza sin
  // contestar para el estado de lectura que la persona declaró. No es
  // lo mismo que leído: si cambia el estado, vuelve a tener piezas.
  const agotados = new Set();
  for (const l of libros || []) {
    const estado = estadosPorLibro[l.id]?.read_state;
    if (!estado) continue;
    const suyas = (piezas || []).filter(p => p.book_id === l.id && p.for_read_state === estado);
    if (suyas.length && suyas.every(p => hechas.has(p.id))) agotados.add(l.id);
  }

  const apagados = new Set(
    Object.entries(porTema).filter(([, n]) => n <= TEMA_APAGADO).map(([t]) => t)
  );

  const puntaje = (l) => (l.themes || [])
    .reduce((s, t) => s + (apagados.has(t) ? 0 : (porTema[t] || 0)), 0);

  const apagado = (l) => (l.themes || []).length > 0 && (l.themes || []).every(t => apagados.has(t));

  return { hechas, porTema, agotados, apagados, puntaje, apagado };
}

// El orden de la biblioteca: arriba lo que no agotaste y cuyos temas te
// pegaron, después el resto, al final lo agotado y lo que apagaste. No
// saca nada de la lista: la biblioteca sigue entera.
function ordenarLibros(libros, señal) {
  const rango = (l) => (señal.apagado(l) ? 3 : señal.agotados.has(l.id) ? 2 : señal.puntaje(l) > 0 ? 0 : 1);
  return [...(libros || [])].sort((a, b) =>
    rango(a) - rango(b) || señal.puntaje(b) - señal.puntaje(a) || a.title.localeCompare(b.title));
}

// El otro libro: el que más temas comparte con éste, sin agotar y sin
// apagar. Devuelve uno o ninguno, nunca una lista: una cola de libros
// sugeridos es la carpeta de newsletters que nadie abre, que es
// exactamente lo que esta app promete no ser.
function elegirSugerencia(libro, libros, señal) {
  const comparten = (l) => (l.themes || []).filter(t => (libro.themes || []).includes(t)).length;

  return (libros || [])
    .filter(l => l.id !== libro.id && !señal.agotados.has(l.id) && !señal.apagado(l) && comparten(l) > 0)
    .sort((a, b) => comparten(b) - comparten(a) || señal.puntaje(b) - señal.puntaje(a) || a.title.localeCompare(b.title))[0] || null;
}

// Es una sugerencia, no una cola: aparece cuando terminaste algo que te
// gustó y si no la tomás no queda nada pendiente.
async function otroLibroComo(libro) {
  const { data: libros } = await db.from('books').select('*').order('title');
  const { data: estados } = await db.from('book_state').select('*').eq('profile_id', perfil.id);
  const porLibro = Object.fromEntries((estados || []).map(e => [e.book_id, e]));
  const señal = await señalDeLibros(libros, porLibro);
  return elegirSugerencia(libro, libros, señal);
}

async function vistaBiblioteca() {
  const { data: libros } = await db.from('books').select('*').order('title');
  const { data: estados } = await db.from('book_state').select('*').eq('profile_id', perfil.id);
  const porLibro = Object.fromEntries((estados || []).map(e => [e.book_id, e]));

  const nodos = [
    el('h1', { text: 'Biblioteca' }),
    el('p', { class: 'bajada', text: 'Lo que no caduca. Elegí un libro y decime si lo leíste: según eso cambia por completo lo que te muestro.' })
  ];

  // El orden deja de ser alfabético y pasa a decir algo.
  const ordenados = ordenarLibros(libros, await señalDeLibros(libros, porLibro));

  for (const libro of ordenados) {
    const est = porLibro[libro.id];
    const mostrado = tituloLibro(libro);

    const texto = el('span', { class: 'libro-texto' }, [
      el('span', { class: 'titulo', text: mostrado }),
      el('span', { class: 'autor', text: libro.author + (libro.year ? ` · ${libro.year}` : '') }),
      // El título de la edición en español, donde la haya.
      (perfil?.lang === 'es' && libro.title_es)
        ? el('span', { class: 'original', text: 'En español: ' + libro.title_es })
        : null
    ]);

    if (libro.themes?.length) {
      const temas = el('span', { class: 'temas' });
      for (const t of libro.themes) temas.append(el('span', { class: 'tema', text: t }));
      texto.append(temas);
    }

    if (est) texto.append(el('span', { class: 'marca-leido', text: ESTADOS[est.read_state].t }));

    nodos.push(el('button', { class: 'tarjeta libro', onclick: () => abrirLibro(libro) }, [
      texto,
      tapaLibro(libro)
    ]));
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
    el('h1', { text: tituloLibro(libro) }),
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
    .from('book_piece_state').select('piece_id, interes').eq('profile_id', perfil.id);
  const ya = new Set((hechas || []).map(r => r.piece_id));

  const nodos = [
    el('p', { class: 'paso', text: libro.author }),
    el('h1', { text: tituloLibro(libro) })
  ];

  if (!piezas?.length) {
    nodos.push(el('p', { class: 'bajada', text: 'Este libro todavía no está procesado. Va a estar disponible pronto.' }));
    nodos.push(el('button', { class: 'link', text: 'Volver a la biblioteca', onclick: vistaBiblioteca }));
    return pintar(...nodos);
  }

  const listas = piezas.filter(p => ya.has(p.id)).length;
  nodos.push(el('p', { class: 'avance', text: `${ESTADOS[estado].t} · ${listas} de ${piezas.length} leídas` }));

  for (const p of piezas) {
    nodos.push(el('button', {
      class: 'tarjeta libro',
      onclick: () => vistaPieza(libro, piezas, p, estado)
    }, [
      el('span', { class: 'titulo', text: p.title }),
      el('span', { class: 'autor', text: ya.has(p.id) ? 'Leída' : `${p.minutes} minutos` })
    ]));
  }

  // Terminaste las piezas de este libro y el pulgar dio positivo: ése
  // es el único momento en que una sugerencia no es ruido. Aparece acá,
  // no en Hoy, y no deja nada agendado.
  const terminado = piezas.every(p => ya.has(p.id));
  const neto = (hechas || [])
    .filter(h => piezas.some(p => p.id === h.piece_id))
    .reduce((s, h) => s + (h.interes || 0), 0);

  if (terminado && neto > 0) {
    const otro = await otroLibroComo(libro);
    if (otro) {
      nodos.push(el('p', { class: 'aviso', text: 'Esto te pegó. Si querés seguir por acá:' }));
      nodos.push(el('button', { class: 'tarjeta libro', onclick: () => abrirLibro(otro) }, [
        el('span', { class: 'libro-texto' }, [
          el('span', { class: 'titulo', text: tituloLibro(otro) }),
          el('span', { class: 'autor', text: otro.author })
        ]),
        tapaLibro(otro)
      ]));
    }
  }

  nodos.push(el('button', { class: 'link', text: 'Cambiar si lo leí o no', onclick: () => vistaEstadoLibro(libro, true) }));
  nodos.push(el('button', { class: 'link', text: 'Volver a la biblioteca', onclick: vistaBiblioteca }));
  pintar(...nodos);
}

function vistaPieza(libro, piezas, pieza, estado) {
  lector({
    volver: () => vistaLibro(libro, estado),
    epigrafe: tituloLibro(libro),
    titulo: pieza.title,
    cuerpoMd: pieza.body_md,
    clave: 'pieza.' + pieza.id,
    minutos: pieza.minutes,
    pie: el('p', { class: 'fuente', text: `Las ideas son de ${libro.author}. El texto es una síntesis propia, no un extracto del libro.` }),
    cierre: cierre({
      pasos: [
        { tipo: 'escala', campo: 'comprension', pregunta: '¿Cuánto entendiste?', izq: 'Nada', der: 'Todo' },
        { tipo: 'opciones', campo: 'interes', pregunta: '¿Te interesó?', opciones: [[1, '👍 Sí'], [-1, '👎 No']] }
      ],
      accion: {
        texto: 'Listo',
        onclick: async (v) => {
          await db.from('book_piece_state').upsert({
            profile_id: perfil.id,
            piece_id: pieza.id,
            comprension: v.comprension ?? null,
            interes: v.interes ?? null,
            answered_at: new Date().toISOString()
          }, { onConflict: 'profile_id,piece_id' });
          await marcarActividad('libro');
          vistaLibro(libro, estado);
        }
      },
      salidas: [
        { texto: 'Volver al libro', onclick: () => vistaLibro(libro, estado) }
      ]
    })
  });
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

// `sirvio` era la otra señal escrita y sin leer: dos clics al cerrar un
// reto que no cambiaban nada.
//
// Dos retos seguidos que no le sirvieron son un dato sobre nosotros, no
// sobre ella. Hoy deja de empujar el reto —el aviso al pie de la
// pantalla— y el reto queda en su pestaña, que es donde está si lo
// quiere. Nada se esconde: se deja de insistir. El generador, además,
// cambia de nodo (ver jobs/retos-circulo.mjs).
async function empujarReto() {
  const { data } = await db
    .from('challenges').select('sirvio')
    .eq('profile_id', perfil.id)
    .not('answered_at', 'is', null)
    .order('answered_at', { ascending: false })
    .limit(2);

  const ultimos = data || [];
  return !(ultimos.length === 2 && ultimos.every(r => r.sirvio === -1));
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

  const notas = el('textarea', { id: 'notas', placeholder: 'Qué te salió, qué no, qué aprendiste…' });

  const cerrar = async (status, v = {}) => {
    await db.from('challenges').update({
      status,
      dificultad: v.dificultad ?? null,
      sirvio: v.sirvio ?? null,
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
    cierre({
      antes: el('div', { class: 'cierre-paso' }, [
        el('label', { class: 'pregunta', for: 'notas', text: '¿Cómo te fue?' }),
        notas
      ]),
      pasos: [
        { tipo: 'escala', campo: 'dificultad', pregunta: '¿Cuánto te costó?', izq: 'Fácil', der: 'Durísimo' },
        { tipo: 'opciones', campo: 'sirvio', pregunta: '¿Te sirvió?', opciones: [[1, '👍 Sí'], [-1, '👎 No']] }
      ],
      accion: { texto: 'Lo hice', onclick: (v) => cerrar('hecho', v) },
      salidas: [
        { texto: 'Seguir después', onclick: () => { marcarNav('hoy'); vistaHoy(); } },
        { texto: 'No es para mí', onclick: (v) => cerrar('descartado', v) }
      ]
    })
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
    db.from('topics').select('id, slug, name_es, name_en, kind, level_floor, sort').order('sort'),
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

  const alcanzables = (topics || []).filter(t => t.level_floor <= perfil.level);
  const promedio = alcanzables.length
    ? Math.round(alcanzables.reduce((a, t) => a + valorDe(t), 0) / alcanzables.length)
    : 0;

  const nodos = [
    el('p', { class: 'paso', text: 'Tu posición' }),

    // El número grande como protagonista, igual que en los paneles
    // buenos: un dato que se lee de una y el resto alrededor.
    el('div', { class: 'cifra' }, [
      el('div', { class: 'cifra-numero', text: String(promedio) }),
      el('div', { class: 'cifra-lado' }, [
        el('div', { class: 'cifra-etiqueta', text: 'Dominio promedio' }),
        el('div', { class: 'cifra-detalle', text: `${encendidos} de ${topics?.length ?? 0} nodos encendidos` })
      ])
    ])
  ];

  if (frontera) {
    nodos.push(el('div', { class: 'destacado' }, [
      el('span', { class: 'punto', text: 'Tu frontera' }),
      el('span', { text: perfil.lang === 'en'
        ? `${nombreNodo(frontera)} — where the field moves most and you move least.`
        : `${frontera.name_es} — donde más se mueve el campo y menos te movés vos.` })
    ]));
  }

  for (const kind of ['fundamento', 'frontera']) {
    const grupo = (topics || []).filter(t => t.kind === kind);
    if (!grupo.length) continue;

    nodos.push(el('div', { class: 'grupo-titulo' }, [
      el('span', { text: kind === 'fundamento' ? 'Fundamentos' : 'Frontera' }),
      el('span', { class: 'grupo-cuenta', text: `${grupo.filter(t => valorDe(t) >= 50).length}/${grupo.length}` })
    ]));

    const caja = el('div', { class: 'tarjeta tabla' });

    for (const t of grupo) {
      const valor = valorDe(t);
      const activo = actividad[t.id] || 0;
      const fuera = t.level_floor > perfil.level;

      const fila = el('div', { class: 'nodo' + (fuera ? ' nodo-lejos' : '') });
      fila.append(el('div', { class: 'nodo-nombre', text: nombreNodo(t) }));

      const barra = el('div', { class: 'barra' });
      barra.append(el('div', { class: 'barra-llena', style: `width:${valor}%` }));
      fila.append(barra);

      fila.append(el('div', { class: 'nodo-valor', text: fuera ? '—' : String(valor) }));

      const marcas = el('div', { class: 'nodo-marcas' });
      if (activo) marcas.append(el('span', { class: 'punto', title: `${activo} novedades`, text: `+${activo}` }));
      fila.append(marcas);

      caja.append(fila);
    }

    nodos.push(caja);
  }

  nodos.push(el('p', { class: 'fuente', text: 'Un nodo apagado no significa que no sepas: significa que la app todavía no tiene evidencia de que te muevas ahí. La barra sale de lo que hacés; el número verde, de lo que el campo movió este tiempo.' }));

  pintar(...nodos);
}

arrancar().catch(e => pintar(error('Algo se rompió: ' + e.message)));
