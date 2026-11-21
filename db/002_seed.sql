-- ============================================================
-- Frontera - seed inicial
-- Mapa de temas + track fundacional (10 lecciones) + biblioteca
-- ============================================================

-- ------------------------------------------------------------
-- Mapa del campo
-- ------------------------------------------------------------
insert into topics (slug, name_es, name_en, kind, level_floor, sort) values
  ('fundamentos',    'Fundamentos',               'Fundamentals',        'fundamento', 0, 10),
  ('instrucciones',  'Instrucciones personales',  'Personal setup',      'fundamento', 0, 20),
  ('como-pedir',     'Cómo pedir',                'Prompting',           'fundamento', 0, 30),
  ('limites',        'Límites y verificación',    'Limits and checking', 'fundamento', 0, 40),
  ('privacidad',     'Datos y privacidad',        'Data and privacy',    'fundamento', 0, 50),
  ('archivos',       'Trabajar con tus archivos', 'Working with files',  'fundamento', 1, 60),
  ('contexto',       'Contexto persistente',      'Persistent context',  'fundamento', 1, 70),
  ('modalidades',    'Voz, imagen y datos',       'Voice, image, data',  'fundamento', 1, 80),
  ('automatizacion', 'Automatización',            'Automation',          'frontera',   2, 90),
  ('agentes',        'Agentes y MCP',             'Agents and MCP',      'frontera',   3, 100),
  ('evals',          'Medir y evaluar',           'Evals',               'frontera',   3, 110),
  ('asincronico',    'Trabajo asincrónico',       'Async work',          'frontera',   3, 120)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Track fundacional: 10 lecciones, en orden
-- Destilado del camino real de 17 cursos, sin los que no movieron la aguja.
-- ------------------------------------------------------------
insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, track_order, published)
select v.slug, t.id, 'fundamento', v.piso, v.techo, v.orden, true
from (values
  ('f01-instrucciones-personales', 'instrucciones',  0, 1,  1),
  ('f02-por-que-inventa',          'fundamentos',    0, 1,  2),
  ('f03-como-pedir',               'como-pedir',     0, 1,  3),
  ('f04-iterar',                   'como-pedir',     0, 2,  4),
  ('f05-que-puede-y-que-no',       'limites',        0, 2,  5),
  ('f06-tus-archivos',             'archivos',       0, 2,  6),
  ('f07-contexto-persistente',     'contexto',       1, 2,  7),
  ('f08-voz-imagen-datos',         'modalidades',    0, 2,  8),
  ('f09-que-nunca-le-das',         'privacidad',     0, 4,  9),
  ('f10-automatiza-algo-chico',    'automatizacion', 1, 2, 10)
) as v(slug, topico, piso, techo, orden)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Leccion 1 - capa conceptual (agnostica de herramienta)
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Tus instrucciones personales',
  'Noventa y nueve de cada cien personas usan IA sin esto. Es lo que más mejora las respuestas y nadie lo hace.',
$md$
Cada vez que abrís una conversación nueva con una IA, empieza de cero. No sabe quién sos, qué hacés, para qué le estás preguntando ni cómo te gusta que te contesten. Entonces te responde como le respondería a cualquiera: con una respuesta promedio, para una persona promedio, que no sos vos.

Todas las herramientas grandes tienen un lugar donde dejás escrito, una sola vez, quién sos y cómo querés que te hablen. Y ese texto se aplica solo, en cada conversación, para siempre.

**Eso es lo que vamos a armar ahora.** No es configuración técnica: es la diferencia entre una herramienta genérica y una que te conoce.

## Qué cambia en la práctica

Sin instrucciones, si preguntás "¿cómo organizo mi semana?", la IA te da una respuesta de manual de productividad.

Con instrucciones que dicen que coordinás un equipo de siete personas, que tenés reuniones de las que no te podés escapar y que odiás las listas largas, la misma pregunta te devuelve algo que podés usar el lunes.

No es magia. Es que le dijiste con quién está hablando.

## Qué va adentro

Cuatro cosas, y ninguna es técnica:

**Quién sos.** Qué hacés, en qué contexto, con quién trabajás. No un curriculum: lo que necesita saber alguien para ayudarte.

**Para qué la usás.** Si es para trabajo, para estudiar, para escribir, para resolver cosas de tu casa. Puede ser más de una.

**Cómo querés que te conteste.** Y acá está lo que más impacto tiene. ¿Corto o detallado? ¿Directo o con rodeos? ¿En qué idioma? ¿Te explica el razonamiento o te da la conclusión? ¿Te hace preguntas cuando algo no está claro, o asume y sigue?

**Qué no querés.** Esta es la que casi nadie escribe y la que más se agradece. Si te molestan los halagos de arranque, si no querés que te liste diez opciones cuando pediste una, si no querés que te recomiende contratar a un profesional cada vez que preguntás algo.

## La prueba

Al final de este paso vas a hacer algo concreto: le vas a hacer una pregunta a tu herramienta **antes** de poner las instrucciones, vamos a guardar la respuesta, vas a pegar las instrucciones, y le vas a hacer la misma pregunta **después**.

Las dos respuestas, lado a lado. Eso no te lo tengo que explicar: lo vas a ver.

## Una advertencia

Las instrucciones personales se aplican a **todas** tus conversaciones. Por eso no pongas ahí nada que no quieras que aparezca en cualquier contexto, ni datos sensibles de otras personas. De eso hablamos en serio más adelante, en el paso 9.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f01-instrucciones-personales'
on conflict do nothing;

-- ------------------------------------------------------------
-- Leccion 1 - capa de ejecucion por herramienta (perezosa, pero las tres
-- principales van sembradas porque son las que usa todo el mundo)
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'claude',
  'Dónde va en Claude',
  null,
$md$
En Claude las instrucciones personales viven en dos lugares distintos, y conviene saber la diferencia:

**Para todas tus conversaciones.** Hacé clic en tu nombre o inicial, abajo a la izquierda, y entrá a **Settings**. Buscá la sección de preferencias personales (**Personal preferences**) y pegá ahí tu texto. Guardá. Listo: se aplica a todo lo que hagas de ahora en más.

**Para un tema en particular.** Si tenés un proyecto puntual —un trabajo, un estudio, un área— Claude tiene **Projects**. Cada proyecto tiene sus propias instrucciones y sus propios archivos. Lo que va ahí no contamina el resto de tus conversaciones.

La regla simple: lo que es **sobre vos** va en Settings. Lo que es **sobre un tema** va en un Project.
$md$,
  3, 'curado'
from lessons l where l.slug = 'f01-instrucciones-personales'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'chatgpt',
  'Dónde va en ChatGPT',
  null,
$md$
En ChatGPT esto se llama **personalización** y está en dos partes:

**Instrucciones personalizadas.** Hacé clic en tu nombre o foto, abajo a la izquierda, y entrá a **Configuración** → **Personalización**. Ahí vas a encontrar los campos para decir qué querés que ChatGPT sepa de vos y cómo querés que te responda. Pegá tu texto y guardá.

**Memoria.** En el mismo lugar hay una opción de memoria, que va guardando cosas sueltas de tus conversaciones por su cuenta. Es distinta de las instrucciones: la memoria la escribe ChatGPT, las instrucciones las escribís vos. Las instrucciones son más confiables porque las controlás.

Un consejo: revisá la memoria cada tanto. Se acumulan cosas viejas que ya no te representan.
$md$,
  3, 'curado'
from lessons l where l.slug = 'f01-instrucciones-personales'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'gemini',
  'Dónde va en Gemini',
  null,
$md$
En Gemini el lugar es **Información guardada** (*Saved info*):

Abrí el menú de configuración, entrá a **Información guardada** y agregá ahí lo que querés que Gemini tenga en cuenta siempre. Podés sumar varias entradas separadas en lugar de un texto largo: quién sos en una, cómo querés que te responda en otra.

Ojo con una diferencia importante: en Gemini las indicaciones sobre **formato y tono** —cortito, directo, sin listas— a veces hay que repetirlas en la conversación, porque no las sostiene tan firme como las otras herramientas. Si notás que se le olvida, no es tu culpa.
$md$,
  3, 'curado'
from lessons l where l.slug = 'f01-instrucciones-personales'
on conflict do nothing;

-- ------------------------------------------------------------
-- Biblioteca inicial
-- La app ensena las IDEAS con palabras propias y atribuidas al autor.
-- Nunca guarda ni sirve texto de los libros.
-- ------------------------------------------------------------
insert into books (slug, title, author, year, themes) values
  ('leaders-eat-last',      'Leaders Eat Last',           'Simon Sinek',        2014, array['liderazgo','equipos']),
  ('thinking-fast-slow',    'Thinking, Fast and Slow',    'Daniel Kahneman',    2011, array['decisiones','sesgos']),
  ('the-hard-thing',        'The Hard Thing About Hard Things', 'Ben Horowitz', 2014, array['liderazgo','negocios']),
  ('atomic-habits',         'Atomic Habits',              'James Clear',        2018, array['habitos','productividad']),
  ('inspired',              'Inspired',                   'Marty Cagan',        2017, array['producto','negocios']),
  ('made-to-stick',         'Made to Stick',              'Chip y Dan Heath',   2007, array['comunicacion','marketing']),
  ('high-output-management','High Output Management',     'Andrew Grove',       1983, array['liderazgo','operaciones']),
  ('obviously-awesome',     'Obviously Awesome',          'April Dunford',      2019, array['marketing','producto'])
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Fuentes del radar (Fase 1: quedan cargadas, inactivas por ahora)
-- Jerarquia de primicia: 1 primario, 3 eco.
-- ------------------------------------------------------------
insert into sources (kind, url, name, primacy, active) values
  ('docs',   'https://docs.anthropic.com/en/release-notes/overview', 'Anthropic release notes', 1, false),
  ('docs',   'https://platform.openai.com/docs/changelog',           'OpenAI changelog',        1, false),
  ('arxiv',  'http://export.arxiv.org/api/query?search_query=cat:cs.AI', 'arXiv cs.AI',         1, false),
  ('github', 'https://api.github.com/search/repositories',            'GitHub trending IA',     2, false)
on conflict do nothing;
