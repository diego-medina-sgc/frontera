-- ============================================================
-- Frontera - primera lección de radar
-- ============================================================
-- Nace de la señal mejor puntuada del 21/11/2026: Google anunció Tool
-- Retrieval en la Gemini API. La lección no cuenta el anuncio: cuenta el
-- problema que el anuncio revela, que es de todos y no de Google.
-- Nivel 3 y 4: a quien está armando cosas. Abajo de eso no se muestra.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published)
select 'r-2026-11-21-tool-retrieval', t.id, 'radar', 3, 4, true
from topics t where t.slug = 'agentes'
on conflict (slug) do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cuando tenés demasiadas herramientas conectadas',
  'Google acaba de ponerle nombre a un problema que ya tenés y que probablemente no sabías que tenías.',
$md$
El 19 de noviembre Google sacó algo llamado Tool Retrieval en la API de Gemini. Si te quedás en el titular, es una función de una herramienta que no usás. Si mirás qué problema resuelve, es tuyo.

## El problema

Cuando conectás una IA a herramientas externas —tu mail, tu CRM, tu base de datos, tus archivos—, el modelo necesita saber qué puede hacer cada una. Esa descripción completa de cada herramienta, con todos sus parámetros, **viaja en cada pedido que hacés**. No una vez: todas las veces.

Con tres herramientas no se nota. Con veinte, pasan tres cosas, y las tres son malas:

- **Se te va el presupuesto de contexto** en describir herramientas que no vas a usar en esa conversación.
- **Se pone más lento**, porque hay más texto que procesar antes de empezar a pensar.
- Y la peor: **el modelo elige peor**. Cuantas más opciones parecidas tiene delante, más se confunde. Es el mismo efecto que tenés vos con una carta de restaurante de doce páginas.

Ese tercer punto es el que explica cosas que te deben haber pasado sin saber por qué: la IA elige la herramienta equivocada, o inventa una que no existe, o ignora una que sí estaba.

## Qué cambió

La idea nueva: en vez de mandar todo siempre, mandar **solo los nombres** de las herramientas y cargar la descripción completa de una **recién cuando el modelo decide usarla**. El modelo sabe qué hay disponible, pero no carga el manual de cada cosa hasta que lo necesita.

Google lo implementó del lado del servidor, incluso para servidores MCP completos: marcás un servidor entero como diferido y sus herramientas se cargan a demanda en vez de listarse una por una.

## Por qué te importa aunque no uses Gemini

Dos razones.

**La primera, inmediata.** Si tenés muchos servidores MCP conectados a la vez, estás pagando ese costo ahora mismo, en lentitud y en elecciones malas. No necesitás esperar a que tu herramienta implemente esto: la medida que podés tomar hoy es **desconectar lo que no estás usando en esta sesión**. Si estás trabajando en una app, no necesitás tener tu CRM y tu calendario conectados. El problema no es tener muchas herramientas: es tenerlas todas prendidas a la vez.

**La segunda, de fondo.** Esto marca hacia dónde va el diseño de agentes: de "darle todo al modelo y que se arregle" a **administrarle la atención**. Lo mismo que ya pasó con los archivos, con la memoria y con el contexto largo. Cada vez que algo se vuelve demasiado grande para entrar entero, la solución no es un modelo más grande, es traer lo justo en el momento justo. Es el patrón que vas a ver repetirse, y si lo reconocés, entendés la próxima función antes de que la anuncien.

## La letra chica

Está en preview, es solo de Gemini y solo en una API específica. No es algo que puedas usar mañana si trabajás con Claude. Lo que sí podés usar mañana es el diagnóstico: **andá a ver cuántas herramientas tenés conectadas en este momento y cuántas usaste de verdad esta semana.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'r-2026-11-21-tool-retrieval'
on conflict do nothing;

-- La señal queda registrada como promovida, para que el filtro de
-- redundancia la reconozca y no vuelva a traer lo mismo en otra forma.
insert into signals (url, url_hash, title, summary, published_at, status, topic_id)
select
  'https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/',
  md5('https://blog.google/innovation-and-ai/technology/developers-tools/gemini-api-tool-retrieval/'),
  'Introducing Tool Retrieval in the Gemini API',
  'Cargar los esquemas de las herramientas a demanda en vez de mandarlos todos en cada pedido.',
  '2026-11-19',
  'promovida',
  t.id
from topics t where t.slug = 'agentes'
on conflict (url_hash) do nothing;
