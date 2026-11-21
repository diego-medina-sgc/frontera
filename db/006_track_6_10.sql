-- ============================================================
-- Frontera - track fundacional, lecciones 6 a 10
-- Incluye capas de ejecucion por herramienta donde hacen falta.
-- ============================================================

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Trabajar con tus propios archivos',
  'Acá es donde la herramienta deja de ser una curiosidad y empieza a resolverte el día.',
$md$
Hasta ahora le pediste cosas de memoria. El salto grande es otro: **darle tu material.**

Un contrato que no entendés, el extracto del banco, un manual de cincuenta páginas, la planilla de gastos, una foto de un formulario, el acta de una reunión. Todo eso se le puede dar y preguntarle encima.

Y hay una razón de fondo para que esto cambie tanto: cuando le das el material, **no tiene que recordar nada**. Lo tiene delante. Es cuando menos inventa y cuando más útil es. El riesgo del que hablamos en la lección 2 baja muchísimo.

## Qué podés darle

Documentos de texto y PDF. Planillas. Imágenes y fotos, incluso de papeles o pantallas: lee lo que dice ahí adentro. Presentaciones. Según la herramienta, también audio.

## Qué preguntarle encima

Lo obvio es "resumime esto". Es lo menos interesante.

Lo que de verdad sirve:

- **"¿Qué dice acá sobre las penalidades por cancelar?"** Buscar una cosa puntual en un documento largo.
- **"Explicame esta cláusula como si no supiera de leyes."** Traducir del idioma difícil al castellano.
- **"¿Qué debería preguntar antes de firmar esto?"** Preparar una conversación.
- **"¿Hay algo raro o que no cierre?"** Revisión. Encuentra inconsistencias que se te pasan leyendo.
- **"Armame una tabla con estos datos, ordenada por fecha."** Reordenar sin trabajo manual.
- **"¿Qué me falta?"** Sobre un plan, una lista o un borrador tuyo.

## Dos advertencias

**Lo que subís sale de tu computadora.** Antes de subir algo, preguntate si te molestaría que estuviera en el servidor de otra empresa. De esto hablamos en serio en la lección 9, que es la más importante del track.

**Verificá los números.** Si le das una planilla y te da totales, chequealos. Es buena leyendo tablas y no es una calculadora.

## Hacelo ahora

Agarrá un documento que tengas pendiente de leer y que te dé fiaca. Subilo y preguntale: **"¿Qué es lo más importante que dice esto para alguien en mi situación?"** —y contale cuál es tu situación.

Eso es, para la mayoría de la gente, el momento en que la ficha cae.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f06-tus-archivos'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que no empiece de cero cada vez',
  'Si cada conversación arranca explicando lo mismo, estás perdiendo la mitad del valor.',
$md$
Ya pusiste tus instrucciones personales, así que la herramienta sabe quién sos en general. Pero hay un segundo nivel que casi nadie usa: **un espacio por tema.**

La idea es simple. Si hay algo en lo que trabajás seguido —un proyecto, una materia, un área, un trámite largo—, podés tener un lugar donde ya estén cargados el contexto y los archivos de ese tema. Cada conversación que abrís ahí empieza sabiendo todo eso.

Las herramientas le ponen nombres distintos y los cambian seguido. El concepto es el mismo en todas, y en la sección de abajo está dónde queda en la tuya.

## Por qué cambia tanto

Sin esto, cada conversación arranca de cero y vos explicás de nuevo quiénes son, qué pasó antes, qué estás tratando de lograr. Son cinco minutos cada vez, y como da fiaca, terminás explicando menos de lo necesario. Y con poco contexto, la respuesta es genérica.

Con un espacio por tema, el contexto ya está. Abrís y preguntás directo. **Y como no cuesta nada, lo usás más.** Ese es el verdadero efecto: no es que la respuesta mejore un poco, es que dejás de evitar la herramienta porque explicar da trabajo.

## Qué conviene poner adentro

**Las instrucciones del espacio.** Qué es este tema, quién participa, qué estás tratando de lograr, qué tener siempre en cuenta, qué no.

**Los archivos de referencia.** Los documentos que una y otra vez tenés que explicar: el reglamento, el plan, la lista de precios, el manual, los apuntes.

## Qué no poner

No mezcles temas. Si metés todo en un solo espacio, el contexto se diluye y vuelve a ser genérico. Mejor tres espacios chicos y nítidos que uno enorme.

Y no pongas ahí lo que no pondrías en ningún lado: lo de la lección 9 vale igual acá.

## Por dónde empezar

No armes cinco. Armá **uno solo**, del tema en el que más seguido estás pidiendo ayuda. Usalo una semana. Vas a notar la diferencia la tercera vez que abrís una conversación y no tenés que explicar nada.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f07-contexto-persistente'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'No es solo escribir',
  'Hablarle, mostrarle una foto, darle una planilla. Tres puertas que la mayoría nunca abre.',
$md$
Casi todo el mundo usa estas herramientas escribiendo, y se pierde tres cosas que para muchas situaciones son mejores.

## Hablarle

Todas las grandes tienen modo de voz en el teléfono. Para mucha gente es la diferencia entre usarla y no usarla, porque escribir en el celular da fiaca y hablar no.

Donde más sirve:

- **Pensar en voz alta.** Contale un problema como se lo contarías a alguien, desordenado, y pedile que te lo ordene. Sale mejor que cuando lo escribís, porque escribiendo te autocensurás y resumís de más.
- **Mientras hacés otra cosa.** Caminando, cocinando, manejando si es manos libres.
- **Practicar una conversación difícil.** Pedile que haga de la otra persona. Es incómodo y funciona.

## Mostrarle

Sacarle una foto a algo y preguntarle encima. Esto es más útil de lo que suena:

- El tablero del auto con una luz prendida.
- Un formulario en papel que no entendés.
- Una pantalla con un mensaje de error.
- La heladera abierta, para que te diga qué podés cocinar.
- Una planta con las hojas feas.
- Una carta de restaurante en otro idioma.

Funciona especialmente bien con cosas donde no sabés ni cómo buscarlo, porque no sabés cómo se llama.

## Darle datos

Si le pasás una planilla o una tabla, no solo la lee: puede ordenarla, sacar totales, cruzar columnas, encontrar lo que se repite y armarte un gráfico.

Para alguien que no domina las fórmulas de las planillas, esto reemplaza una habilidad entera. "De esta lista de gastos, decime en qué se me va la plata por categoría" es una pregunta que antes requería saber hacer una tabla dinámica.

Lo único: **verificá los totales.**

## Probá una

No las tres. Elegí la que más se parezca a tu vida: si escribís poco en el teléfono, la voz. Si tenés papeles encima, la cámara. Si convivís con planillas, los datos.
$md$,
  7, 'curado'
from lessons l where l.slug = 'f08-voz-imagen-datos'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Qué nunca le das',
  'La lección más importante del track, y la que ningún curso te da hasta que ya es tarde.',
$md$
Cuando le escribís algo a una IA, ese texto sale de tu dispositivo y llega a los servidores de una empresa. Eso es todo lo que hay que entender para tomar buenas decisiones. No es motivo de pánico ni de inocencia: es un hecho que cambia qué conviene escribir ahí.

## Lo que no entra nunca

**Contraseñas y claves.** De nada, de ninguna cuenta. Nunca hay una razón válida.

**Datos de tarjetas y cuentas bancarias.** Números completos, códigos de seguridad, claves.

**Documentos de identidad completos** y los de otras personas, siempre.

**Datos de otras personas que te confiaron algo.** Acá está el error más común y el más grave, porque no se siente como un error: la lista de alumnos, la ficha médica de un paciente, el legajo de un empleado, el informe de un cliente. Vos podés decidir sobre tus datos. **Sobre los de otros, no.** Y si esos datos llegaron a vos por tu trabajo, probablemente haya una ley o un contrato que dice qué podés hacer con ellos.

**Material confidencial de tu trabajo** que no pondrías en un mail a alguien de afuera.

## Lo que sí, con cuidado

Si es tuyo y la consecuencia de que se filtre es tolerable, está bien. Tu currículum, tus apuntes, tu borrador, tu problema personal contado sin nombres de terceros.

## El truco que resuelve el 90%

No tenés que elegir entre no usar la herramienta y entregar todo. **Sacale los nombres.**

En vez de "María González, DNI 30.123.456, debe tres cuotas", escribí "una familia con tres cuotas impagas". La ayuda es exactamente la misma, porque lo que necesita entender es la situación, no quién es.

Para una planilla, borrá la columna de nombres antes de subirla. Te lleva diez segundos y cambia por completo el riesgo.

## Las tres preguntas

Antes de escribir algo sensible, tres segundos:

1. **¿Esto es mío o de otro?** Si es de otro, no va.
2. **¿Qué pasa si esto se hace público?** Si la respuesta te hace ruido, no va.
3. **¿Lo necesita para ayudarme?** Casi siempre no. Sacalo.

## Lo que no hay que hacer

No llegar a la conclusión de "entonces no la uso para nada del trabajo". Eso es tirar la herramienta por la ventana por un problema que se resuelve sacando nombres. La gente que decide bien no es la que no la usa: es la que sabe qué sacar antes de apretar enter.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f09-que-nunca-le-das'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Automatizá una cosa chica',
  'El último paso del track, y la puerta de salida: dejar de pedir de a una y empezar a armar algo que se repita.',
$md$
Hasta acá usaste la herramienta de a una: pedís, recibís, listo. Este es el último paso del track y el primero del nivel siguiente: **algo que hacés seguido, resuelto una vez y reusado.**

No hablo de programar nada. Hablo de algo mucho más chico y mucho más útil.

## La idea

Pensá en algo que hacés más o menos igual, más o menos seguido. Un informe semanal. Un mail que repetís con variantes. Pasar notas desordenadas a un resumen prolijo. Clasificar algo que llega siempre con la misma forma.

Ahora, en vez de pedirlo de cero cada vez, escribí **una sola vez** la instrucción completa: qué recibís, qué querés que haga, con qué criterios, en qué formato. Guardá ese texto. La próxima vez, pegalo y agregá los datos nuevos.

Eso es automatizar en su forma más básica, y es el 80% del beneficio con el 5% del trabajo.

## Por qué importa más de lo que parece

Dos razones.

La primera: **mejora con el uso.** Cada vez que el resultado no sale bien, corregís la instrucción, no el resultado. A la quinta vez tenés algo afinado que da bien siempre.

La segunda, más de fondo: cambia tu relación con la herramienta. Pasás de pedir ayuda a **diseñar cómo querés que se haga algo.** Es la diferencia entre usar y construir, y es exactamente el escalón entre el nivel donde estás y el siguiente.

## Elegí bien la primera

Que cumpla tres cosas:

- **La hacés seguido.** Al menos una vez por semana.
- **Es aburrida.** Si te gusta hacerla, no la automatices.
- **Si sale mal, no pasa nada grave.** La primera no es para lo crítico.

## Hacelo ahora, en diez minutos

1. Elegí la tarea.
2. Escribí la instrucción completa como si se la explicaras a alguien que empieza mañana y no sabe nada: qué va a recibir, qué tiene que hacer, qué tener en cuenta, cómo entregarlo.
3. Probala con un caso real.
4. Corregí la instrucción, no el resultado.
5. Guardala donde la vayas a encontrar.

## Y con esto terminás el track

Sabés qué es esto y por qué inventa, cómo pedir, cómo corregir, dónde confiar y dónde no, cómo trabajar con tu material, cómo no empezar de cero, qué podés hacer además de escribir, qué nunca entregar, y cómo dejar algo armado.

Eso es más de lo que maneja la enorme mayoría de la gente que usa IA todos los días. De acá en adelante ya no se trata de aprender la herramienta: se trata de seguirle el ritmo a algo que cambia todas las semanas. Para eso está el resto de Frontera.
$md$,
  8, 'curado'
from lessons l where l.slug = 'f10-automatiza-algo-chico'
on conflict do nothing;

-- ============================================================
-- Capas de ejecucion por herramienta
-- ============================================================
-- Solo donde el "donde queda" cambia de verdad entre herramientas.
-- Los nombres de los menus cambian seguido: el texto lo dice, para que
-- la persona no se frustre si no coincide exactamente.
-- ============================================================

-- ---------- Leccion 6: archivos ----------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'claude', 'Cómo se suben en Claude', null,
$md$
En la caja donde escribís, a la izquierda, hay un **clip**. Desde ahí subís archivos desde tu computadora o teléfono.

También podés arrastrar un archivo directo sobre la conversación, o pegar una imagen copiada.

Lee PDF, documentos, planillas, imágenes y texto. Si el documento es muy largo, no lo rechaza: lo procesa igual, aunque conviene preguntarle cosas puntuales en vez de pedirle todo junto.

Un detalle útil: podés subir varios archivos a la vez y pedirle que los compare entre sí.
$md$, 2, 'curado'
from lessons l where l.slug = 'f06-tus-archivos'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'chatgpt', 'Cómo se suben en ChatGPT', null,
$md$
En la caja donde escribís está el botón de **adjuntar** (un clip o un signo +, según la versión). Desde ahí subís archivos, y también podés conectar tu Google Drive o OneDrive para traerlos de ahí.

También funciona arrastrar el archivo sobre la conversación.

Lee PDF, documentos, planillas e imágenes. Con planillas tiene una ventaja: puede hacer cuentas de verdad sobre los datos en vez de leerlos nomás, así que para números es de las más confiables. Igual, verificá los totales.
$md$, 2, 'curado'
from lessons l where l.slug = 'f06-tus-archivos'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'gemini', 'Cómo se suben en Gemini', null,
$md$
En la caja donde escribís hay un botón de **adjuntar** (un signo + o un clip). Desde ahí subís archivos o sacás una foto directo con la cámara.

La ventaja grande de Gemini es Google Drive: podés traer un documento o una planilla que ya tenés ahí, sin descargar y volver a subir. Si vivís en Drive, es la que menos fricción tiene.

Lee PDF, documentos, planillas e imágenes.
$md$, 2, 'curado'
from lessons l where l.slug = 'f06-tus-archivos'
on conflict do nothing;

-- ---------- Leccion 7: espacios por tema ----------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'claude', 'En Claude se llaman Projects', null,
$md$
En el menú de la izquierda vas a ver **Projects**. Creás uno, le ponés nombre, y adentro tenés dos cosas:

**Las instrucciones del proyecto**, donde escribís de qué se trata el tema y qué tener siempre en cuenta.

**Los archivos del proyecto**, que quedan disponibles para todas las conversaciones que abras ahí adentro, sin volver a subirlos.

Todas las conversaciones que empieces dentro del proyecto arrancan con eso cargado. Las de afuera no lo ven, que es justamente lo que querés: que un tema no contamine a los otros.
$md$, 3, 'curado'
from lessons l where l.slug = 'f07-contexto-persistente'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'chatgpt', 'En ChatGPT hay dos caminos', null,
$md$
**Proyectos**, en el menú de la izquierda. Es lo más parecido a lo que describe la lección: un espacio con sus instrucciones y sus archivos, y las conversaciones que abras adentro los heredan. Para empezar, es este.

**GPTs personalizados**, que son un paso más: un asistente con nombre propio que armás una vez y podés reusar o compartir. Sirve cuando la tarea es siempre igual y la repetís mucho.

La regla: si es un tema donde vas a tener muchas conversaciones distintas, un proyecto. Si es una tarea puntual que repetís idéntica, un GPT.
$md$, 3, 'curado'
from lessons l where l.slug = 'f07-contexto-persistente'
on conflict do nothing;

insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', 'gemini', 'En Gemini se llaman Gems', null,
$md$
En el menú está la sección de **Gems**. Un Gem es un asistente que armás vos: le ponés nombre, le escribís las instrucciones de qué tiene que hacer y qué tener en cuenta, y según la versión también le podés dejar archivos de referencia.

Después lo elegís de la lista cada vez que querés trabajar en ese tema.

Funciona un poco distinto de los proyectos de las otras: está pensado más como "un asistente especializado" que como "una carpeta con contexto". Para el uso que describe la lección, alcanza igual.
$md$, 3, 'curado'
from lessons l where l.slug = 'f07-contexto-persistente'
on conflict do nothing;
