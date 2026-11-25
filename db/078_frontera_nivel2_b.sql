-- ============================================================
-- 078 · Frontera: cuatro lecciones más para el nivel 2
-- ============================================================
-- Para quien ya usa la IA en su trabajo real y empieza a integrarla.
-- Cuatro temas que el catálogo no tocaba:
--
--   negocios:       fr-presentaciones
--   diseno:         fr-imagenes
--   modelos:        fr-audio
--   automatizacion: fr-primera-automatizacion
--
-- Estructura aprobada: la idea, el caso trabajado con números
-- (hipotéticos, se dice en cada caso), el borde, la recuperación con
-- la respuesta escondida y qué hacer esta semana.
-- No se repite lo de fr-diseno, fr-guia-de-estilo, fr-planillas,
-- fr-dos-veces ni fr-paralelo. Agnósticas de herramienta.
-- Español e inglés británico en el mismo archivo.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 2, 4, true, v.creada::timestamptz
from (values
  ('fr-presentaciones',         'negocios',       '2026-11-15 12:00:00+00'),
  ('fr-imagenes',               'diseno',         '2026-11-15 11:00:00+00'),
  ('fr-audio',                  'modelos',        '2026-11-15 10:00:00+00'),
  ('fr-primera-automatizacion', 'automatizacion', '2026-11-15 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-presentaciones · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Primero el mensaje, después las diapositivas',
  'Si le pedís la presentación entera de una vez, sale prolija y no dice nada. El trabajo está antes: qué tiene que decidir quien la ve.',
$md$
Pedirle a la IA "armame una presentación sobre admisiones" da, en un minuto, quince diapositivas prolijas. El problema se ve recién en la reunión: nadie sabe qué se esperaba de ellos.

La idea de esta lección: **una presentación se arma de atrás para adelante: primero qué tiene que decidir o saber quien la ve, después la frase que lo sostiene en cada diapositiva, y recién al final las diapositivas.** La IA sirve en los tres pasos, pero si le salteás los dos primeros, los completa con el promedio de todas las presentaciones parecidas que vio. Por eso salen genéricas: títulos como "Contexto", "Desafíos", "Próximos pasos", que podrían ser de cualquier colegio.

## El caso, con números

Un equipo de admisiones tiene 20 minutos en el consejo directivo. Los números son hipotéticos.

**Versión A, de una vez.** El pedido es "presentación sobre el ciclo de admisiones 2027". Salen **16 diapositivas**: historia del colegio, tendencias del sector, misión, embudo, y en la número 13 aparece lo que importaba. Corregirla lleva dos horas, y en la reunión se acaba el tiempo antes de llegar a la 13.

**Versión B, el mensaje primero.** Antes de abrir nada, tres líneas escritas a mano:

- Quién la ve: el consejo directivo.
- Qué tiene que decidir: si aprueba una segunda jornada de puertas abiertas en marzo.
- Qué necesita saber para decidir: que las consultas bajaron de 250 a 205 (un 18% menos) y que en la primera jornada, de 120 familias que vinieron, 30 se inscribieron (el 25%).

Con eso, se le pide a la IA **sólo la secuencia de titulares**: una frase afirmativa por diapositiva. Salen 6, del tipo "Las consultas cayeron un 18% y la jornada es lo que mejor convierte". Se leen los 6 titulares seguidos, sin nada más: si cuentan la historia y terminan en la decisión, recién ahí se pide el desarrollo de cada una.

Tiempo: 15 minutos en las tres líneas, 10 en ajustar los titulares, 30 en el resto. **55 minutos contra dos horas**, y la decisión se toma en la reunión.

## Dónde no aplica

**Material de consulta.** Un manual de procedimientos o una guía para familias nuevas no busca una decisión: se consulta por partes. Ahí ordenar por temas está bien.

**Cuando el mensaje ya está.** Si ya tenés el texto escrito y aprobado y sólo falta pasarlo a diapositivas, pedirlas de una vez sirve. Lo que se saltea no es el armado: es pensar.

**Formatos institucionales fijos.** Si la plantilla obliga a ciertas secciones, el mensaje va dentro de ellas. Igual conviene que cada título diga algo, aunque la sección se llame "Resultados".

## Probá que lo entendiste

¿Cuál de estos pedidos arranca bien?

1. "Armame 10 diapositivas sobre nuestra estrategia de redes, con un diseño moderno."
2. "Lo ven los jefes de área. Tienen que decidir si dejamos de publicar en una red que trae el 3% de las consultas. Proponeme 5 titulares, una frase cada uno, que lleven a esa decisión."
3. "Pasá este documento ya aprobado a diapositivas, una por sección."

:::Ver la respuesta
**La 2.** Dice quién la ve, qué tiene que decidir y pide titulares antes que diapositivas.

**La 1** no tiene mensaje: van a salir diez diapositivas sobre redes que podrían ser de cualquiera.

**La 3 también está bien**, por otra razón: el mensaje ya está pensado y aprobado. Ahí la IA sólo da forma.
:::

## Qué hacer esta semana

Antes de tu próxima presentación, escribí las tres líneas (quién la ve, qué tiene que decidir o saber, qué necesita para eso) y pedile a la IA sólo los titulares. Leelos seguidos en voz alta: si no cuentan la historia, todavía no hay diapositivas que armar.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-presentaciones'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-imagenes · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Una imagen que nadie pueda leer como engaño',
  'Una imagen generada suma cuando se nota que es una ilustración. Resta cuando una familia puede creer que es una foto de algo que existe.',
$md$
Generar una imagen lleva segundos, y por eso la tentación es usarla para todo: el folleto, el posteo, la portada del informe. Algunas veces suma. Otras, le saca a la institución algo que cuesta mucho recuperar: que le crean lo que muestra.

La idea de esta lección: **una imagen generada sirve cuando quien la ve entiende que es una ilustración; resta cuando alguien puede creer que es una foto de algo que existe.** La prueba es simple: si una familia puede mirarla y pensar "eso es el colegio" o "ese es un alumno de ahí", tiene que ser una foto real, o una ilustración que se note que lo es.

## Dónde suma y dónde resta

Suma en:

- Ilustrar una idea: una puerta abierta para la jornada de puertas abiertas, un mapa estilizado del recorrido.
- Fondos, texturas, íconos, elementos de diseño que nadie lee como realidad.
- Bocetos para mostrarle a quien diseña lo que tenés en la cabeza.

Resta en:

- **Personas reales**: la cara de un alumno, de una docente, de quien dirige. Nunca se genera ni se modifica a alguien que existe.
- **Lugares reales**: una foto que parece del edificio, del patio o del laboratorio, pero que muestra algo que no está. La familia que viene de visita lo compara.
- **Hechos**: "el acto de fin de año" ilustrado con una escena que no pasó.
- **Personas genéricas fotorrealistas presentadas como propias**: "nuestros alumnos" con chicos que no existen.

## El caso, con números

Un colegio prepara la pieza para su jornada de puertas abiertas. Los números son hipotéticos.

**Primer intento, pedido vago:** "una imagen linda para la jornada de puertas abiertas". En **12 intentos** sale lo mismo: chicos sonrientes fotorrealistas frente a un edificio de ladrillo que no es el del colegio. **Ninguna se puede usar**, y alguna se publica casi por cansancio.

**Segundo intento, con referencias concretas:**

- Estilo: ilustración plana, que se note dibujada, sin personas.
- Colores: los dos de la institución, con su código exacto.
- Elementos: una puerta entreabierta, una mochila, luz de mañana.
- Formato: horizontal, con el tercio izquierdo vacío para el texto.
- Una imagen de referencia de una pieza anterior que les gustó.

En **4 intentos salen 3 usables**. Ninguna puede confundirse con una foto del colegio. Para la foto del edificio, usan la que sacó alguien del equipo un día de sol.

## Dónde no aplica

**Uso interno.** Un boceto para una reunión, una ilustración para una presentación al equipo: nadie se engaña, porque todos saben de dónde salió.

**Retoques menores de una foto real.** Sacar un cable, enderezar el horizonte o mejorar la luz no cambia lo que la foto muestra. Agregar un árbol, un aula o una persona, sí.

**Ilustración evidente con personas.** Un dibujo de una familia, en un estilo claramente no fotográfico, no se lee como un alumno real. El problema es el fotorrealismo, no la figura humana.

## Probá que lo entendiste

¿Generada, foto real o ninguna?

1. La portada del folleto de admisiones, que muestra el frente del colegio.
2. Un ícono para cada uno de los cinco pasos de la inscripción.
3. Un posteo de "conocé a nuestros docentes" con caras generadas, porque no hay fotos.

:::Ver la respuesta
**1. Foto real.** La familia va a comparar con lo que ve cuando llega. Una imagen generada del frente es, aunque no sea la intención, una promesa falsa.

**2. Generada, sin problema.** Nadie lee un ícono como realidad.

**3. Ninguna generada.** Si no hay fotos, se sacan, o el posteo se hace sin caras. Presentar a personas que no existen como docentes del colegio es exactamente lo que una familia lee como engaño.
:::

## Qué hacer esta semana

Revisá las últimas cinco imágenes generadas que usaste para algo que vio gente de afuera. Para cada una, hacete la pregunta: ¿alguien podría creer que es una foto de algo que existe? Si alguna dice que sí, reemplazala. Y para la próxima, escribí el pedido con estilo, colores, elementos, formato y una referencia antes de generar nada.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-imagenes'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-audio · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Lo que la transcripción escucha mal',
  'Transcribir una reunión y resumirla lleva minutos. Los errores caen justo en los nombres y los números, y el resumen los repite sin avisar.',
$md$
Grabar una reunión (con el permiso de todos, dicho al empezar), transcribirla y pedir un resumen es de lo más útil que se puede hacer con IA. La transcripción sale casi perfecta, y por eso se confía de más.

La idea de esta lección: **los errores de una transcripción no se reparten parejo: se juntan en nombres propios, números y en quién dijo qué. Y el resumen elige justamente eso, porque son las decisiones.** Por eso no se verifica la transcripción entera: se verifica cada nombre y cada número del resumen contra el audio.

## El caso, con números

Una reunión de admisiones de 45 minutos. Unas 6.000 palabras. Los números son hipotéticos.

Supongamos que la transcripción acierta el **97% de las palabras**. Parece mucho, pero el 3% de 6.000 son **180 errores**. De esos, 171 no importan: una muletilla, un "eh", una palabra cambiada por otra que no altera el sentido. **Los otros 9 sí:**

- 4 nombres: un apellido de familia escrito como una palabra común, el nombre de otro colegio que no se reconoce.
- 3 números: "beca del treinta" que queda como "trece", "el jueves 14" que queda "el jueves 4", un monto con un cero de menos.
- 2 atribuciones: la transcripción le asigna a una persona lo que dijo otra.

El resumen tiene 300 palabras y recoge las decisiones de la reunión. **6 de los 9 errores importantes terminan ahí**, porque las decisiones tienen nombres, fechas y montos. En el resumen, el error pasa de ser 1 palabra en 6.000 a una de cada 50.

Verificarlo: el resumen tiene 12 nombres y números. Buscar cada uno en la transcripción y escuchar esos segundos de audio lleva unos 30 segundos por dato: **6 minutos**.

## Lo que se pierde aunque esté todo bien escrito

- **El tono.** Un "sí, claro" irónico se transcribe igual que uno convencido.
- **Las dudas.** Un "y... bueno, puede ser" queda como un acuerdo.
- **Lo que se dijo encima.** Cuando dos hablan a la vez, una de las dos frases suele desaparecer.
- **Lo que no se dijo.** El silencio cuando alguien propuso algo no aparece en ningún lado.

Por eso, las decisiones del resumen se confirman con los participantes, no sólo con el audio.

## Cómo pedirlo mejor

Antes de transcribir, dale una lista de los nombres propios que van a aparecer (personas, lugares, programas). Pedile que en el resumen marque cada número y cada decisión con el minuto en que se dijo, así ir a verificar es directo.

## Dónde no aplica

**Notas de voz propias.** Si te grabás para acordarte de una idea, un error cuesta poco: vos sabés qué quisiste decir.

**Transcripción para buscar.** Si la usás para encontrar en qué parte de una entrevista se habló de algo, no hace falta que sea exacta: después escuchás esa parte.

**Cuando no hubo permiso.** Si alguien no sabía que se grababa, no hay verificación que lo arregle. No se usa.

## Probá que lo entendiste

¿Qué verificás contra el audio antes de mandar el resumen?

1. "Se acordó ofrecer la beca del 30% a la familia del alumno que viene del otro colegio."
2. "La reunión fue productiva y hubo buen clima."
3. "Laura se comprometió a mandar el informe el jueves 14."

:::Ver la respuesta
**La 1 y la 3.** La 1 tiene un número y una decisión; la 3, un nombre, un compromiso y una fecha: justo lo que la transcripción confunde. Y las dos se confirman con quienes estuvieron.

**La 2 no se verifica contra el audio.** Es una impresión, no un dato. Si no aporta, sacala del resumen.
:::

## Qué hacer esta semana

Tomá el próximo resumen de una reunión grabada. Subrayá cada nombre, número y fecha, y verificalos contra el audio. Contá cuántos estaban mal: ese número te dice cuánto confiar la próxima vez.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-audio'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-primera-automatizacion · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Tu primera automatización',
  'La primera no es la que más tiempo ahorra. Es la que, si falla, no se entera nadie de afuera.',
$md$
Hoy se pueden conectar dos herramientas sin programar: cuando llega un formulario, que se cargue una fila, que salga un aviso, que se cree una tarea. Lo difícil no es armarla. Es elegir cuál armar primero.

La idea de esta lección: **la primera automatización tiene que ser frecuente, con una regla clara, y con un resultado que se quede adentro del equipo: si falla, que se pierda una fila o un aviso, no que le llegue algo equivocado a una familia.** La que más tiempo ahorra suele ser la que más daño hace cuando falla, y la primera es la que te enseña cómo fallan.

## El caso, con números

Un equipo de admisiones tiene tres candidatas. Los números son hipotéticos.

**A. Cuando llega una consulta por el formulario web, cargar una fila en la planilla de seguimiento y avisar en el chat del equipo.** Llegan 60 por mes; a mano lleva 2 minutos cada una: **120 minutos por mes**.

**B. Cuando llega una consulta, que la IA escriba y mande una respuesta personalizada a la familia.** Mismas 60; a mano, 6 minutos: **360 minutos por mes**.

**C. Cuando se confirma una inscripción, dar de alta al alumno en tres sistemas.** Son 8 por mes, 15 minutos cada una: **120 minutos por mes**.

La B ahorra el triple. Pero mirá qué pasa cuando falla:

- **A falla:** falta una fila o un aviso. Se ve contando: 60 respuestas en el formulario, 59 filas en la planilla. Se carga a mano y listo.
- **B falla:** una familia recibe un mail con el nombre de otro chico o un dato equivocado. No se puede deshacer, y se entera primero la familia.
- **C falla:** un alumno queda dado de alta en dos sistemas de tres. Con 8 casos por mes, el error puede tardar semanas en aparecer, y desarmarlo cuesta.

La primera es la **A**. Ahorra 2 horas por mes, y en el camino aprendés cómo se rompe una conexión: un campo del formulario que alguien renombró, una planilla que cambió de lugar, un permiso que venció.

## Las cuatro preguntas antes de armarla

1. **¿Pasa seguido?** Si pasa dos veces por mes, no vale el armado.
2. **¿La regla es clara?** "Cuando llega, cargá estos campos" es una regla. "Cuando llega, fijate si es importante" es un juicio.
3. **¿El resultado queda adentro?** Una planilla, un aviso al equipo, una tarea: se corrigen. Un mensaje a alguien de afuera, no.
4. **¿Te vas a enterar si deja de andar?** Definí un control simple, como comparar cada viernes cuántas respuestas tiene el formulario contra cuántas filas tiene la planilla.

## Dónde no aplica

**Lo interno también puede ser grave.** Si el formulario es el aviso de una alergia o una autorización médica, que se pierda una fila es un problema serio aunque nadie de afuera lo vea. Eso no va primero.

**Si ya sabés automatizar, la regla se afloja.** Con experiencia y controles armados, se puede empezar por algo que sale hacia afuera. La regla es para la primera, no para todas.

**Lo que conviene arreglar antes.** Si el formulario pide datos que nadie usa o la planilla está desordenada, automatizar eso es hacer más rápido algo que está mal. Primero ordená.

## Probá que lo entendiste

Ordená estas tres de la mejor a la peor para empezar:

1. Cuando alguien completa la encuesta de satisfacción, sumar la respuesta a una planilla de resultados.
2. Cuando se paga la matrícula, mandarle a la familia la confirmación con el monto.
3. Una vez por año, cuando cierra el ciclo, archivar las consultas viejas.

:::Ver la respuesta
**Primero la 1.** Es frecuente, la regla es clara y el resultado queda en una planilla interna. Si falta una respuesta, se nota contando.

**Después la 2.** Es frecuente y la regla es clara, pero el resultado sale hacia una familia y lleva un monto: un error ahí no se deshace. Va cuando ya tengas una andando.

**Última la 3.** Pasa una vez por año: no vale el armado, y para cuando vuelva a correr nadie se acuerda cómo funcionaba.
:::

## Qué hacer esta semana

Hacé la lista de las tareas que empiezan con "cuando llega...". Pasá cada una por las cuatro preguntas y elegí la que conteste sí a todas. Antes de armarla, escribí cómo te vas a enterar si un día deja de andar.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-primera-automatizacion'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-presentaciones · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'The message first, the slides after',
  'Ask for the whole presentation in one go and it comes out tidy and says nothing. The work comes before: what the audience has to decide.',
$md$
Asking an AI to "make me a presentation on admissions" gives you, in a minute, fifteen tidy slides. The problem only shows in the meeting: nobody knows what was expected of them.

The idea of this lesson: **a presentation is built backwards: first what the audience has to decide or know, then the sentence that carries it on each slide, and only at the end the slides.** The AI helps at all three steps, but if you skip the first two, it fills them with the average of every similar presentation it has seen. That's why they come out generic: titles like "Background", "Challenges", "Next steps", which could belong to any school.

## The case, with numbers

An admissions team has 20 minutes at the board of governors. The numbers are hypothetical.

**Version A, in one go.** The request is "presentation on the 2027 admissions cycle". Out come **16 slides**: the school's history, sector trends, mission, the funnel, and on slide 13 appears what mattered. Fixing it takes two hours, and in the meeting time runs out before slide 13.

**Version B, message first.** Before opening anything, three lines written by hand:

- Who sees it: the board of governors.
- What they have to decide: whether to approve a second open day in March.
- What they need to know to decide: that enquiries fell from 250 to 205 (18% fewer) and that at the first open day, of 120 families who came, 30 enrolled (25%).

With that, the AI is asked **only for the sequence of headlines**: one assertive sentence per slide. Out come 6, along the lines of "Enquiries fell 18% and the open day is what converts best". The 6 headlines are read in a row, with nothing else: if they tell the story and end at the decision, only then is each one developed.

Time: 15 minutes on the three lines, 10 adjusting the headlines, 30 on the rest. **55 minutes against two hours**, and the decision is made in the meeting.

## Where it doesn't apply

**Reference material.** A procedures manual or a guide for new families isn't after a decision: it's consulted in parts. Organising by topic is fine there.

**When the message already exists.** If you already have the text written and approved and it just needs turning into slides, asking for them in one go works. What gets skipped isn't the building: it's the thinking.

**Fixed institutional formats.** If the template requires certain sections, the message goes inside them. Even so, each title should say something, even if the section is called "Results".

## Check you've got it

Which of these requests starts well?

1. "Make me 10 slides on our social media strategy, with a modern design."
2. "Heads of department will see it. They have to decide whether we stop posting on a network that brings in 3% of enquiries. Suggest 5 headlines, one sentence each, leading to that decision."
3. "Turn this already approved document into slides, one per section."

:::Show the answer
**Number 2.** It says who sees it, what they have to decide, and asks for headlines before slides.

**Number 1** has no message: you'll get ten slides on social media that could be anyone's.

**Number 3 is fine too**, for a different reason: the message has already been thought through and approved. There, the AI only gives it shape.
:::

## What to do this week

Before your next presentation, write the three lines (who sees it, what they have to decide or know, what they need for that) and ask the AI only for the headlines. Read them out loud in a row: if they don't tell the story, there are no slides to build yet.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-presentaciones'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-imagenes · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'An image nobody could read as deception',
  'A generated image helps when it''s clearly an illustration. It hurts when a family could believe it''s a photo of something real.',
$md$
Generating an image takes seconds, so the temptation is to use one for everything: the brochure, the post, the report cover. Sometimes it helps. Other times it takes from the institution something very hard to win back: being believed about what it shows.

The idea of this lesson: **a generated image works when whoever sees it understands it's an illustration; it hurts when someone could believe it's a photo of something that exists.** The test is simple: if a family could look at it and think "that's the school" or "that's one of their pupils", it has to be a real photo, or an illustration that is obviously one.

## Where it helps and where it hurts

It helps with:

- Illustrating an idea: an open door for the open day, a stylised map of the tour.
- Backgrounds, textures, icons, design elements nobody reads as reality.
- Sketches to show a designer what you have in mind.

It hurts with:

- **Real people**: the face of a pupil, a teacher, the head. Someone who exists is never generated or altered.
- **Real places**: a picture that looks like the building, the playground or the lab, but shows something that isn't there. The family that comes to visit will compare.
- **Events**: "the end-of-year assembly" illustrated with a scene that never happened.
- **Generic photorealistic people presented as your own**: "our pupils" shown as children who don't exist.

## The case, with numbers

A school is preparing the piece for its open day. The numbers are hypothetical.

**First attempt, vague request:** "a nice image for the open day". In **12 attempts** the same thing comes out: smiling photorealistic children in front of a brick building that isn't the school's. **None can be used**, and one nearly gets published out of sheer fatigue.

**Second attempt, with concrete references:**

- Style: flat illustration, clearly drawn, no people.
- Colours: the institution's two colours, with their exact codes.
- Elements: a door ajar, a school bag, morning light.
- Format: landscape, with the left third empty for the text.
- A reference image from an earlier piece they liked.

In **4 attempts, 3 are usable**. None could be mistaken for a photo of the school. For the photo of the building, they use the one someone on the team took on a sunny day.

## Where it doesn't apply

**Internal use.** A sketch for a meeting, an illustration for a team presentation: nobody is deceived, because everyone knows where it came from.

**Minor touch-ups to a real photo.** Removing a cable, straightening the horizon or improving the light doesn't change what the photo shows. Adding a tree, a classroom or a person does.

**Obvious illustration with people.** A drawing of a family, in a clearly non-photographic style, isn't read as a real pupil. The problem is photorealism, not the human figure.

## Check you've got it

Generated, real photo, or neither?

1. The cover of the admissions brochure, showing the front of the school.
2. An icon for each of the five steps of enrolment.
3. A "meet our teachers" post with generated faces, because there are no photos.

:::Show the answer
**1. Real photo.** The family will compare it with what they see when they arrive. A generated image of the front is, even if unintended, a false promise.

**2. Generated, no problem.** Nobody reads an icon as reality.

**3. Nothing generated.** If there are no photos, take them, or do the post without faces. Presenting people who don't exist as the school's teachers is exactly what a family reads as deception.
:::

## What to do this week

Go through the last five generated images you used for something outsiders saw. For each one, ask: could someone believe it's a photo of something that exists? If any answer is yes, replace it. And next time, write the request with style, colours, elements, format and a reference before generating anything.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-imagenes'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-audio · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What the transcript mishears',
  'Transcribing a meeting and summarising it takes minutes. The mistakes land right on names and numbers, and the summary repeats them without warning.',
$md$
Recording a meeting (with everyone's permission, stated at the start), transcribing it and asking for a summary is one of the most useful things you can do with AI. The transcript comes out almost perfect, and that's why people trust it too much.

The idea of this lesson: **a transcript's mistakes aren't spread evenly: they cluster in proper names, numbers and who said what. And the summary picks out exactly those, because they're the decisions.** So you don't check the whole transcript: you check every name and every number in the summary against the audio.

## The case, with numbers

A 45-minute admissions meeting. Around 6,000 words. The numbers are hypothetical.

Suppose the transcript gets **97% of the words** right. It sounds like a lot, but 3% of 6,000 is **180 mistakes**. Of those, 171 don't matter: a filler, an "erm", a word swapped for another that doesn't change the meaning. **The other 9 do:**

- 4 names: a family's surname written as an ordinary word, the name of another school that isn't recognised.
- 3 numbers: a "thirty per cent bursary" that becomes "thirteen", "Thursday the 14th" that becomes "Thursday the 4th", an amount with a zero missing.
- 2 attributions: the transcript gives one person what another said.

The summary is 300 words long and gathers the meeting's decisions. **6 of the 9 important mistakes end up there**, because decisions have names, dates and amounts. In the summary, the error rate goes from 1 word in 6,000 to one in every 50.

Checking it: the summary has 12 names and numbers. Finding each one in the transcript and listening to those seconds of audio takes about 30 seconds per item: **6 minutes**.

## What's lost even when everything is written correctly

- **Tone.** An ironic "yes, of course" is transcribed the same as a convinced one.
- **Hesitation.** An "and... well, maybe" ends up as agreement.
- **Talking over each other.** When two people speak at once, one of the sentences usually disappears.
- **What wasn't said.** The silence when someone proposed something appears nowhere.

That's why the summary's decisions are confirmed with the participants, not just with the audio.

## How to ask for it better

Before transcribing, give it a list of the proper names that will come up (people, places, programmes). Ask it to mark each number and each decision in the summary with the minute it was said, so going to check is direct.

## Where it doesn't apply

**Your own voice notes.** If you record yourself to remember an idea, a mistake costs little: you know what you meant.

**Transcripts for searching.** If you use it to find where in an interview something was discussed, it needn't be exact: you listen to that part afterwards.

**When there was no permission.** If someone didn't know they were being recorded, no checking fixes that. It isn't used.

## Check you've got it

What do you check against the audio before sending the summary?

1. "It was agreed to offer the 30% bursary to the family of the pupil coming from the other school."
2. "The meeting was productive and the atmosphere was good."
3. "Laura committed to sending the report on Thursday the 14th."

:::Show the answer
**1 and 3.** Number 1 has a number and a decision; number 3, a name, a commitment and a date: exactly what the transcript mixes up. And both are confirmed with the people who were there.

**Number 2 isn't checked against the audio.** It's an impression, not a fact. If it adds nothing, take it out of the summary.
:::

## What to do this week

Take the next summary of a recorded meeting. Underline every name, number and date, and check them against the audio. Count how many were wrong: that figure tells you how far to trust it next time.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-audio'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-primera-automatizacion · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Your first automation',
  'The first one isn''t the one that saves the most time. It''s the one that, if it fails, nobody outside ever finds out.',
$md$
These days you can connect two tools without coding: when a form comes in, a row gets added, an alert goes out, a task is created. The hard part isn't building it. It's choosing which one to build first.

The idea of this lesson: **the first automation should be frequent, follow a clear rule, and have a result that stays inside the team: if it fails, a row or an alert goes missing, not a wrong message to a family.** The one that saves the most time is usually the one that does the most damage when it fails, and the first one is the one that teaches you how they fail.

## The case, with numbers

An admissions team has three candidates. The numbers are hypothetical.

**A. When an enquiry arrives through the website form, add a row to the tracking spreadsheet and post an alert in the team chat.** 60 arrive a month; by hand it takes 2 minutes each: **120 minutes a month**.

**B. When an enquiry arrives, have the AI write and send a personalised reply to the family.** The same 60; by hand, 6 minutes: **360 minutes a month**.

**C. When an enrolment is confirmed, register the pupil in three systems.** 8 a month, 15 minutes each: **120 minutes a month**.

B saves three times as much. But look at what happens when each one fails:

- **A fails:** a row or an alert is missing. It shows when you count: 60 responses in the form, 59 rows in the spreadsheet. You add it by hand and that's that.
- **B fails:** a family gets an email with another child's name or a wrong detail. It can't be undone, and the family finds out first.
- **C fails:** a pupil ends up registered in two systems out of three. With 8 cases a month, the error can take weeks to surface, and unpicking it is costly.

The first one is **A**. It saves 2 hours a month, and along the way you learn how a connection breaks: a form field someone renamed, a spreadsheet that moved, a permission that expired.

## The four questions before building it

1. **Does it happen often?** If it happens twice a month, it isn't worth the setting up.
2. **Is the rule clear?** "When it arrives, copy these fields" is a rule. "When it arrives, see whether it's important" is a judgement.
3. **Does the result stay inside?** A spreadsheet, a team alert, a task: they can be corrected. A message to someone outside can't.
4. **Will you find out if it stops working?** Set up a simple check, like comparing every Friday how many responses the form has against how many rows the spreadsheet has.

## Where it doesn't apply

**Internal can be serious too.** If the form is how an allergy or a medical consent is reported, a missing row is a serious problem even if nobody outside sees it. That doesn't go first.

**If you already know how to automate, the rule loosens.** With experience and checks in place, you can start with something that goes outside. The rule is for the first one, not for all of them.

**What's worth fixing first.** If the form asks for data nobody uses or the spreadsheet is a mess, automating it means doing something wrong faster. Tidy up first.

## Check you've got it

Rank these three from best to worst to start with:

1. When someone completes the satisfaction survey, add the response to a results spreadsheet.
2. When the registration fee is paid, send the family a confirmation with the amount.
3. Once a year, when the cycle closes, archive old enquiries.

:::Show the answer
**First, number 1.** It's frequent, the rule is clear and the result stays in an internal spreadsheet. If a response is missing, counting shows it.

**Then number 2.** It's frequent and the rule is clear, but the result goes out to a family and carries an amount: a mistake there can't be undone. It comes once you have one running.

**Last, number 3.** It happens once a year: it isn't worth the setting up, and by the time it runs again nobody remembers how it worked.
:::

## What to do this week

List the tasks that begin with "when something arrives...". Put each one through the four questions and pick the one that gets a yes on all four. Before building it, write down how you'll find out if one day it stops working.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-primera-automatizacion'
on conflict do nothing;
