-- ============================================================
-- 080 · Frontera: cuatro lecciones más para el nivel 3 (tanda f)
-- ============================================================
-- Para quien ya construye sistemas con IA. Cuatro temas que no
-- estaban cubiertos:
--
--   producto:       fr-prototipo           (aprender antes de construir)
--   negocios:       fr-conviene-automatizar (armado y mantenimiento contra
--                                            ahorro; no repite fr-cuanto-cuesta,
--                                            que es costo por resultado)
--   modelos:        fr-cambiar-de-modelo   (migrar sin romper; no repite
--                                            fr-paralelo, que es soltar algo
--                                            que hacía una persona)
--   automatizacion: fr-datos-de-entrada    (arreglar la entrada antes que
--                                            la instrucción)
--
-- created_at fechado el 13/11. Números de los casos: hipotéticos,
-- cuentas verificadas. Única atribución: Inspired (Cagan), que está
-- en la biblioteca, en una línea.
-- Español e inglés británico en el mismo archivo.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-prototipo',            'producto',       '2026-11-13 12:00:00+00'),
  ('fr-conviene-automatizar', 'negocios',       '2026-11-13 11:00:00+00'),
  ('fr-cambiar-de-modelo',    'modelos',        '2026-11-13 10:00:00+00'),
  ('fr-datos-de-entrada',     'automatizacion', '2026-11-13 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-prototipo · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Una tarde para aprender antes de construir',
  'Un prototipo no sirve para mostrar lo que vas a hacer. Sirve para descubrir si conviene hacerlo, y eso depende de qué mirás cuando otros lo usan.',
$md$
Cuando ya sabés construir con IA, el riesgo cambia. Antes era no poder; ahora es poder demasiado rápido y pasar tres semanas armando algo que nadie iba a usar.

La idea de esta lección: **un prototipo de una tarde sirve para responder una pregunta que escribiste antes de armarlo, y la respuesta sale de lo que la gente hace con él, no de lo que dice.** Sin pregunta escrita, lo que armaste es una demo: la mostrás, te felicitan y no aprendiste nada.

Es lo que Marty Cagan pone en el centro de *Inspired*: probar barato antes de construir caro. Acá va la versión para quien arma solo, con una tarde y tres personas.

## El caso, con números

Hipotético. Alguien de admisiones quiere un sistema que lea cada consulta de las familias y deje un borrador de respuesta. Estima tres semanas de trabajo, unas **60 horas**.

Antes, una tarde: **4 horas**. Una instrucción, cinco consultas reales sin nombres y los borradores que salen. Nada conectado a nada.

La pregunta, escrita antes: *"¿Quienes contestan usan el borrador con cambios chicos, o lo rehacen?"*

Se lo muestra a las tres personas que contestan consultas. No explica nada: les da los cinco borradores y les pide que respondan como siempre.

- **Primera persona:** "Está buenísimo." Rehace los **5** borradores desde cero.
- **Segunda:** usa **4 de 5** con cambios chicos y pregunta si mañana puede tenerlo con las consultas nuevas.
- **Tercera:** usa **1 de 5**. Dice que escribir no le lleva tiempo; lo que le lleva tiempo es buscar el arancel y las fechas de visita en tres documentos distintos.

Los elogios: **3 de 3**. Los borradores usados: **5 de 15**, un tercio. Con lo que dijeron, construía las 60 horas. Con lo que hicieron, aprendió dos cosas: el borrador le sirve a una persona de tres, y el problema de otra no es redactar sino encontrar el dato. El sistema que conviene armar es otro, y lo supo con 4 horas en vez de 60.

## Qué cuenta como aprendizaje y qué como cortesía

**Aprendizaje** es lo que le cuesta algo a quien lo da: usarlo, pedir tenerlo de nuevo, traer un caso propio para probar, señalar exactamente dónde falla, contar qué hace hoy en lugar de eso.

**Cortesía** es lo que no cuesta nada: "qué bueno", "yo lo usaría", "habría que agregarle tal cosa". La gente es amable con quien le muestra algo que hizo, y más si trabaja con vos. Las opiniones sobre el futuro ("lo usaría") son las menos confiables de todas.

Por eso tres personas alcanzan: no buscás un porcentaje, buscás ver si alguien lo usa sin que lo empujes.

## Dónde no aplica

**Si la pregunta es técnica, una tarde no la responde.** Si lo que no sabés es si aguanta doscientas consultas por día o si se rompe con adjuntos, eso se prueba construyendo, no mostrando.

**Si el usuario sos vos, no hace falta.** Armalo y usalo una semana: tu propio comportamiento es el dato.

**Si construirlo lleva una tarde, el prototipo es la cosa.** El valor está en la diferencia entre las 4 horas y las 60. Sin diferencia, no hay nada que ahorrar.

## Probá que lo entendiste

Tres reacciones después de mostrar un prototipo. ¿Aprendizaje o cortesía?

1. "Esto nos va a cambiar la vida."
2. Quien coordina pregunta si el lunes puede probarlo con las consultas reales de esa semana.
3. "Yo le agregaría que también mande los mensajes por WhatsApp."

:::Ver la respuesta
**La 1, cortesía.** No le cuesta nada decirlo y no te dice qué hacer.

**La 2, aprendizaje.** Quiere poner su tiempo y sus casos reales. Es la señal más fuerte que te puede dar una tarde.

**La 3, cortesía hasta que preguntes.** Un pedido de funcionalidad sin uso es una opinión. Se vuelve aprendizaje si preguntás cuándo fue la última vez que necesitó eso y te cuenta un caso concreto.
:::

## Qué hacer esta semana

Elegí lo próximo que pensás construir. Escribí en una línea la pregunta que tendría que responder. Armá la versión más tosca posible en no más de 4 horas y mostrásela a tres personas sin explicar. Anotá por separado lo que hicieron y lo que dijeron, y decidí sólo con lo primero.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-prototipo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-conviene-automatizar · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cuándo se recupera lo que tardás en armarlo',
  'Automatizar es una inversión: se paga una vez al armarlo y todos los meses al mantenerlo. La cuenta de si conviene tiene cuatro números.',
$md$
Hay tareas que da gusto automatizar y tareas que conviene automatizar, y no son las mismas. Las primeras suelen ser las que molestan; las segundas, las que se repiten.

La idea de esta lección: **automatizar conviene cuando lo que ahorrás por año supera con margen lo que cuesta mantenerlo, y el armado se recupera en un plazo que puedas sostener.** Son cuatro números: horas de armado, minutos ahorrados por vez, veces por año y horas de mantenimiento por año.

- **Ahorro neto por año** = minutos ahorrados por vez × veces por año − mantenimiento.
- **Meses para recuperar** = armado ÷ ahorro neto × 12.

El ahorro por vez sale de medir el costo por resultado, que es otra lección. Esta es sobre lo que se paga antes y lo que se sigue pagando después.

## El caso, con números

Hipotético. Una ONG chica tiene tres candidatas.

**A. Informe semanal para donantes.** Hoy lleva 45 minutos; automatizado, 10 de revisión. Ahorra **35 minutos por vez, 48 veces por año: 1.680 minutos, 28 horas.** Armado: 16 horas. Mantenimiento: media hora por mes, 6 horas por año. Neto: 28 − 6 = **22 horas por año.** Recupera el armado en 16 ÷ 22 × 12 = **unos 9 meses.**

**B. Carga anual de inscriptos al sistema de la federación.** Lleva 6 horas, una vez por año; automatizada, 1 de revisión. Ahorra **5 horas por año.** Armado: 12 horas. Pero el formulario de la federación cambia todos los años, y adaptarlo lleva 3 horas. Neto: 5 − 3 = **2 horas por año. Recupera en 6 años.** Para entonces nadie se acuerda de cómo funcionaba.

**C. Renombrar y archivar comprobantes.** Dos minutos cada uno, 20 por día, 200 días: **8.000 minutos, unas 133 horas.** Armado: 3 horas. Mantenimiento: 1 hora por año. Recupera en **menos de una semana.**

La que más molestaba era B: seis horas seguidas de algo tedioso. La que más rinde es C, que nadie había anotado porque son dos minutos. **La frecuencia pesa más que la duración.**

## El mantenimiento es el número que se olvida

El armado se ve; el mantenimiento llega después y de a poco. Lo genera que cambie la fuente de los datos, que cambie el modelo o la herramienta, que la persona que lo armó se vaya y otra tenga que entenderlo. Si una automatización depende de algo que cambia cada mes, el mantenimiento puede comerse todo el ahorro.

Y el armado casi siempre se estima corto. Una prueba sana: hacé la cuenta con el doble de horas de armado. Si sigue cerrando, adelante.

## Dónde no aplica

**Cuando lo que se gana no es tiempo.** Contestar una consulta en cinco minutos en vez de en dos días puede justificar la automatización aunque ahorre pocas horas, porque lo que cambia es cuántas familias siguen interesadas.

**Cuando el proceso está por cambiar.** Automatizar algo que se va a rediseñar en tres meses es pagar el armado dos veces.

**Cuando todavía no sabés hacerlo a mano.** Las primeras veces se aprende qué es "bien". Automatizar antes congela una versión que todavía no entendés.

## Probá que lo entendiste

Tres candidatas. Calculá el ahorro neto y ordenalas antes de abrir.

1. Ahorra 10 minutos por vez, 5 veces por semana, 40 semanas por año. Armado: 10 horas. Mantenimiento: 4 horas por año.
2. Ahorra 3 horas por vez, 2 veces por año. Armado: 20 horas. Mantenimiento: 4 horas por año.
3. Ahorra 20 minutos por vez, una vez por semana, 40 semanas. Armado: 8 horas. Depende de una página que cambia cada mes: 1 hora de arreglo por mes.

:::Ver la respuesta
**La 1 conviene.** 10 × 200 = 2.000 minutos, unas 33 horas. Menos 4: **29 netas.** Recupera las 10 de armado en unos **4 meses.**

**La 3 parece que sí y no.** 20 × 40 = 800 minutos, unas 13 horas. Menos 12 de mantenimiento: **algo más de una hora neta.** Recuperar 8 horas lleva unos 6 años. El mantenimiento se come el ahorro.

**La 2 no.** 6 horas por año menos 4: **2 netas.** Recuperar 20 lleva 10 años.
:::

## Qué hacer esta semana

Anotá tres tareas que te gustaría automatizar y, al lado de cada una, los cuatro números, aunque sean aproximados. Hacé la cuenta, también con el doble de armado, y arrancá por la que se recupera antes, no por la que más te molesta.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-conviene-automatizar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-cambiar-de-modelo · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cambiar el modelo sin romper lo que anda',
  'Un modelo nuevo puede ser mejor y aun así romperte el sistema. Lo que se rompe casi nunca es la calidad: es la forma.',
$md$
Algo tuyo funciona hace meses. Sale un modelo nuevo, o tu organización cambia de herramienta, o el que usás va a dejar de estar disponible. Cambiarlo parece un trámite: se reemplaza un nombre por otro.

La idea de esta lección: **cambiar el modelo de algo que funciona es cambiar el sistema, no el proveedor.** Se prueba con la misma planilla de casos, corriendo los dos; se compara la forma de la salida además de la calidad; y el viejo queda disponible hasta que el nuevo pase un tiempo con trabajo real.

## El caso, con números

Hipotético. Un sistema lee cada consulta y devuelve una línea con tipo, curso y urgencia, separados por barras. Una planilla parte esa línea en columnas y, según el tipo, la manda a una persona u otra.

Prueban un modelo nuevo con los **40 casos** de la planilla de prueba:

- **Viejo:** acierta **34 de 40** (85%), con el formato correcto en los 40.
- **Nuevo:** acierta **37 de 40** (92,5%). Mejor.

Pero en **6** salidas del nuevo el formato no es el esperado: en algunas agrega una frase amable antes de la línea, en otras escribe el tipo con mayúscula y tilde. La planilla no las reconoce y quedan sin asignar. De esas 6, **5** estaban bien clasificadas.

Lo que de verdad llega a la persona correcta: con el viejo, **34**; con el nuevo, 37 − 5 = **32**. Más inteligente y peor para el sistema.

El arreglo es chico: un ejemplo exacto del formato en la instrucción y una regla en la planilla que avise cuando una línea no tiene la forma esperada. Corren de nuevo: **37 de 40, formato correcto en los 40.** Recién ahí hay un cambio para hacer.

## Qué comparar además de los aciertos

**La forma.** Largo, mayúsculas, separadores, si agrega texto alrededor, si contesta en el idioma pedido. Todo lo que después lee una máquina.

**Lo que tu instrucción compensaba.** La instrucción se fue ajustando al modelo viejo. Algunas frases corregían defectos suyos que el nuevo no tiene, y pueden empujarlo para el otro lado. Releela preguntándote para qué está cada frase.

**Cuándo se niega o se calla.** Un modelo distinto puede negarse a cosas que el anterior hacía, o al revés.

## Convivir un tiempo

La planilla tiene 40 casos; el trabajo real, cientos y más raros. Durante dos semanas corren los dos y se usa el viejo. No hace falta revisar todo, sólo los **desacuerdos**: sobre 300 consultas, si difieren en 18, leés 18. Si en la mayoría tiene razón el nuevo, cambiás. Y guardás la configuración del viejo (modelo, instrucción, fecha) un mes más, para volver en minutos si aparece algo.

## Dónde no aplica

**Si el resultado lo lee sólo una persona**, la forma importa menos: un borrador que alguien edita tolera una frase de más. Ahí mirá tono y largo.

**Si el viejo tiene fecha de baja**, no hay convivencia larga posible. Corré los casos ya y armá la vuelta atrás como plan de una semana, no de un mes.

**Para el uso suelto, en conversación**, cambiá y listo. Nada depende de la salida.

## Probá que lo entendiste

Tres cambios de modelo. ¿Qué mirás primero en cada uno?

1. La salida se pega sola en un formulario de otro sistema.
2. La herramienta escribe borradores de mails que una persona lee y edita antes de enviar.
3. El proveedor avisa que el modelo actual deja de funcionar en tres semanas.

:::Ver la respuesta
**La 1: la forma.** Un acierto con un separador distinto es un error para el formulario. Planilla de casos con los dos y una regla que detecte salidas mal formadas.

**La 2: tono y largo.** La persona absorbe las diferencias de formato, pero si el nuevo escribe el doble, la revisión tarda el doble.

**La 3: correr los casos esta semana.** Con fecha de baja, la convivencia se acorta. La prueba no: sin ella, el cambio te lo hace el proveedor el día que apague el viejo.
:::

## Qué hacer esta semana

Anotá, en cada sistema tuyo que corre con IA, qué modelo usa y qué versión de la instrucción, con fecha. Después elegí uno y corré su planilla de casos con otro modelo, sólo para ver dónde difiere la forma. Si nunca lo probaste, el día que el cambio sea obligatorio lo vas a hacer con prisa.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-cambiar-de-modelo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-datos-de-entrada · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Arreglá lo que le llega antes que lo que le pedís',
  'Hay errores que ninguna instrucción arregla, porque la respuesta correcta no está en lo que le llega. Se arreglan en el formulario.',
$md$
Cuando un sistema con IA se equivoca, el reflejo es tocar la instrucción: aclarar, sumar ejemplos, poner reglas. A veces el problema está ahí. Muchas veces está antes.

La idea de esta lección: **si con la misma entrada una persona atenta tampoco podría acertar, el error no es de la IA: es de la entrada.** Una fecha "3/4/2019" puede ser 3 de abril o 4 de marzo. Ninguna instrucción lo resuelve. Lo resuelve un formulario que no deje escribirla así.

## El caso, con números

Hipotético. El formulario de consulta de un colegio tiene campos de texto libre para "curso al que quiere ingresar" y "fecha de nacimiento". Un sistema lee cada consulta, calcula a qué curso corresponde el chico por edad y la deriva.

Sobre **200 consultas** de un trimestre, **30 errores** (15%). Durante semanas, quien lo armó ajustó la instrucción y bajó de 18% a 15%. Después hizo lo que debió hacer primero: leyó los 30 y, al lado de cada uno, anotó si una persona con esa misma entrada habría acertado.

- **13:** el curso escrito de formas incompatibles. "1ro", "primero", "1° EP", "first grade", "el más chico de los dos".
- **9:** fecha ambigua. Día y mes intercambiables, o sólo el año.
- **5:** dos o tres hermanos en una sola consulta, en un formulario pensado para un chico.
- **3:** errores del modelo con una entrada clara.

13 + 9 + 5 = **27 de 30, el 90%, no tenían arreglo desde la instrucción.** Las semanas de ajustes peleaban contra 3.

El formulario cambia: curso como lista para elegir, fecha con día, mes y año en casillas separadas, y un botón para sumar otro hijo. Las 200 consultas siguientes: **4 errores, el 2%**. Y la instrucción quedó más corta, porque ya no hay que explicarle cómo adivinar.

## Cuando no podés tocar el formulario

A veces la entrada viene de un mail, de otra área o de un sistema ajeno.

**Normalizá antes.** Un paso previo, con reglas fijas y sin IA, que lleve fechas y cursos a una sola forma. Lo que no pueda normalizar, que lo marque.

**Dejale decir "no se puede saber".** Una salida posible tiene que ser "ambiguo, preguntar". Un sistema que adivina una fecha ambigua y sigue es peor que uno que se detiene, porque su error se ve igual que un acierto.

## Dónde no aplica

**El texto libre que es la consulta misma.** "Contanos qué buscan para su hijo" tiene que quedar libre: es donde la IA aporta, leyendo lo que no entra en casillas. Se estructura lo que tiene una respuesta correcta, no lo que es una conversación.

**Cada campo obligatorio tiene un costo.** Un formulario con veinte casillas obligatorias pierde gente a mitad de camino. Estructurá los campos que hoy generan errores, no todos.

**Si una persona con esa entrada sí acertaba**, el problema es la instrucción. Volvé a ella.

## Probá que lo entendiste

Tres errores. ¿Entrada o instrucción?

1. Una familia escribió "para el año que viene" en diciembre y el sistema registró el año en curso.
2. Una familia de otro país escribió "05/06/2020" queriendo decir 6 de mayo, y el sistema lo leyó como 5 de junio.
3. Una consulta por tres hermanos quedó registrada como un solo alumno.

:::Ver la respuesta
**La 1: instrucción.** Con la fecha de la consulta, una persona lo resuelve. Al sistema le falta ese dato o la regla para usarlo: se arregla en lo que le pedís y le pasás.

**La 2: entrada.** Las dos lecturas son válidas. Ninguna instrucción sabe cuál quiso decir la familia; casillas separadas para día, mes y año, sí.

**La 3: entrada.** El formulario tiene lugar para un alumno. El sistema hizo lo que pudo con lo que llegó.
:::

## Qué hacer esta semana

Tomá los últimos veinte o treinta errores de un sistema tuyo. Al lado de cada uno, una sola pregunta: con esta entrada, ¿una persona atenta habría acertado? Contá los "no". Si son la mayoría, la próxima hora no va a la instrucción: va al formulario.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-datos-de-entrada'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-prototipo · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'An afternoon to learn before you build',
  'A prototype isn''t for showing what you''re going to make. It''s for finding out whether it''s worth making, and that depends on what you watch when others use it.',
$md$
Once you know how to build with AI, the risk changes. It used to be not being able to; now it's being able to far too quickly, and spending three weeks building something nobody was going to use.

The idea of this lesson: **an afternoon prototype is for answering a question you wrote down before you built it, and the answer comes from what people do with it, not what they say.** Without a written question, what you've built is a demo: you show it, people congratulate you, and you've learnt nothing.

It's what Marty Cagan puts at the centre of *Inspired*: test cheaply before you build expensively. Here is the version for someone building on their own, with one afternoon and three people.

## The case, with numbers

Hypothetical. Someone in admissions wants a system that reads each enquiry from families and leaves a draft reply. They estimate three weeks of work, about **60 hours**.

First, one afternoon: **4 hours**. An instruction, five real enquiries with the names removed, and the drafts that come out. Nothing connected to anything.

The question, written beforehand: *"Do the people who answer enquiries use the draft with small changes, or rewrite it?"*

They show it to the three people who answer enquiries. They explain nothing: they hand over the five drafts and ask them to reply as they always do.

- **First person:** "This is brilliant." Rewrites all **5** drafts from scratch.
- **Second:** uses **4 of 5** with small changes and asks whether they can have it tomorrow for the new enquiries.
- **Third:** uses **1 of 5**. Says writing doesn't take them long; what takes time is finding the fees and the visit dates across three different documents.

Compliments: **3 of 3**. Drafts used: **5 of 15**, a third. Going by what they said, the 60 hours get built. Going by what they did, two things were learnt: the draft helps one person in three, and another person's problem isn't writing but finding the information. The system worth building is a different one, and that was clear after 4 hours instead of 60.

## What counts as learning and what counts as courtesy

**Learning** is whatever costs the other person something: using it, asking to have it again, bringing a case of their own to try, pointing to exactly where it fails, describing what they do today instead.

**Courtesy** is whatever costs nothing: "how nice", "I'd use that", "you should add such-and-such". People are kind to someone showing them something they made, all the more so if they work together. Opinions about the future ("I'd use it") are the least reliable of all.

That's why three people are enough: you aren't after a percentage, you're looking for whether anyone uses it without being pushed.

## Where it doesn't apply

**If the question is technical, an afternoon won't answer it.** If what you don't know is whether it copes with two hundred enquiries a day or breaks with attachments, that is tested by building, not by showing.

**If the user is you, there's no need.** Build it and use it for a week: your own behaviour is the data.

**If building it takes an afternoon, the prototype is the thing.** The value lies in the gap between 4 hours and 60. With no gap, there's nothing to save.

## Check you've got it

Three reactions after showing a prototype. Learning or courtesy?

1. "This is going to change our lives."
2. The coordinator asks whether they can try it on Monday with that week's real enquiries.
3. "I'd add the option to send the messages by WhatsApp too."

:::Show the answer
**1, courtesy.** It costs nothing to say and doesn't tell you what to do.

**2, learning.** They want to put in their own time and their real cases. It's the strongest signal an afternoon can give you.

**3, courtesy until you ask.** A feature request without use is an opinion. It becomes learning if you ask when they last needed it and they tell you about a specific case.
:::

## What to do this week

Pick the next thing you plan to build. Write, in one line, the question it should answer. Build the roughest possible version in no more than 4 hours and show it to three people without explaining. Note separately what they did and what they said, and decide on the first alone.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-prototipo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-conviene-automatizar · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'When building it pays for itself',
  'Automating is an investment: you pay once to build it and every month to maintain it. Whether it''s worth it comes down to four numbers.',
$md$
Some tasks are satisfying to automate and some are worth automating, and they aren't the same. The first tend to be the annoying ones; the second, the ones that repeat.

The idea of this lesson: **automating pays when what you save each year comfortably exceeds what it costs to maintain, and the build is recovered within a period you can live with.** Four numbers: hours to build, minutes saved each time, times per year, and hours of maintenance per year.

- **Net saving per year** = minutes saved each time × times per year − maintenance.
- **Months to recover** = build ÷ net saving × 12.

The saving each time comes from measuring cost per result, which is another lesson. This one is about what you pay up front and what you keep paying afterwards.

## The case, with numbers

Hypothetical. A small charity has three candidates.

**A. Weekly report for donors.** It takes 45 minutes today; automated, 10 minutes of checking. It saves **35 minutes each time, 48 times a year: 1,680 minutes, 28 hours.** Build: 16 hours. Maintenance: half an hour a month, 6 hours a year. Net: 28 − 6 = **22 hours a year.** The build is recovered in 16 ÷ 22 × 12 = **about 9 months.**

**B. Annual upload of members to the federation's system.** It takes 6 hours, once a year; automated, 1 hour of checking. It saves **5 hours a year.** Build: 12 hours. But the federation's form changes every year, and adapting to it takes 3 hours. Net: 5 − 3 = **2 hours a year. Recovered in 6 years.** By then nobody remembers how it worked.

**C. Renaming and filing receipts.** Two minutes each, 20 a day, 200 days: **8,000 minutes, about 133 hours.** Build: 3 hours. Maintenance: 1 hour a year. Recovered in **less than a week.**

The most irritating was B: six hours straight of something tedious. The best return is C, which nobody had written down because it's two minutes. **Frequency outweighs duration.**

## Maintenance is the forgotten number

The build is visible; maintenance arrives later, a little at a time. It comes from the data source changing, the model or tool changing, the person who built it leaving and someone else having to understand it. If an automation depends on something that changes every month, maintenance can eat the whole saving.

And the build is almost always underestimated. A healthy test: do the sum with double the build hours. If it still works, go ahead.

## Where it doesn't apply

**When what you gain isn't time.** Answering an enquiry in five minutes rather than two days can justify automating even if it saves few hours, because what changes is how many families stay interested.

**When the process is about to change.** Automating something that will be redesigned in three months means paying for the build twice.

**When you can't yet do it by hand.** The first few times are when you learn what "good" is. Automating earlier freezes a version you don't yet understand.

## Check you've got it

Three candidates. Work out the net saving and rank them before you open the answer.

1. Saves 10 minutes each time, 5 times a week, 40 weeks a year. Build: 10 hours. Maintenance: 4 hours a year.
2. Saves 3 hours each time, twice a year. Build: 20 hours. Maintenance: 4 hours a year.
3. Saves 20 minutes each time, once a week, 40 weeks. Build: 8 hours. It depends on a web page that changes every month: 1 hour of fixing a month.

:::Show the answer
**1 is worth it.** 10 × 200 = 2,000 minutes, about 33 hours. Minus 4: **29 net.** It recovers the 10 hours of build in about **4 months.**

**3 looks like a yes and isn't.** 20 × 40 = 800 minutes, about 13 hours. Minus 12 of maintenance: **just over an hour net.** Recovering 8 hours takes about 6 years. Maintenance eats the saving.

**2 isn't.** 6 hours a year minus 4: **2 net.** Recovering 20 takes 10 years.
:::

## What to do this week

Write down three tasks you'd like to automate and, next to each, the four numbers, even if rough. Do the sum, also with double the build, and start with the one that pays back soonest, not the one that annoys you most.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-conviene-automatizar'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-cambiar-de-modelo · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Changing the model without breaking what works',
  'A new model can be better and still break your system. What breaks is rarely the quality: it''s the shape.',
$md$
Something of yours has worked for months. A new model comes out, or your organisation switches tools, or the one you use is about to be withdrawn. Changing it looks like a formality: swap one name for another.

The idea of this lesson: **changing the model behind something that works is changing the system, not the supplier.** You test it with the same set of cases, running both; you compare the shape of the output as well as its quality; and the old one stays available until the new one has spent some time on real work.

## The case, with numbers

Hypothetical. A system reads each enquiry and returns one line with type, year group and urgency, separated by slashes. A spreadsheet splits that line into columns and, depending on the type, sends it to one person or another.

They try a new model on the **40 cases** in the test sheet:

- **Old:** gets **34 of 40** right (85%), with the correct format in all 40.
- **New:** gets **37 of 40** right (92.5%). Better.

But in **6** of the new model's outputs the format isn't what was expected: in some it adds a friendly sentence before the line, in others it writes the type with a capital letter and an accent. The spreadsheet doesn't recognise them and they go unassigned. Of those 6, **5** had been classified correctly.

What actually reaches the right person: with the old model, **34**; with the new one, 37 − 5 = **32**. Cleverer, and worse for the system.

The fix is small: an exact example of the format in the instruction, and a rule in the spreadsheet that flags any line without the expected shape. They run it again: **37 of 40, correct format in all 40.** Only now is there a change worth making.

## What to compare besides the right answers

**The shape.** Length, capitals, separators, whether it adds text around the answer, whether it replies in the language asked for. Anything a machine reads afterwards.

**What your instruction was compensating for.** The instruction was gradually tuned to the old model. Some sentences corrected flaws the new one doesn't have, and can push it the other way. Reread it asking what each sentence is there for.

**When it refuses or goes quiet.** A different model may refuse things the previous one did, or the other way round.

## Living with both for a while

The test sheet has 40 cases; real work has hundreds, and odder ones. For a fortnight both run and the old one is used. There's no need to check everything, only the **disagreements**: across 300 enquiries, if they differ on 18, you read 18. If the new one is right in most of them, you switch. And you keep the old configuration (model, instruction, date) for another month, so you can go back in minutes if something turns up.

## Where it doesn't apply

**If only a person reads the result**, shape matters less: a draft someone edits can take an extra sentence. There, look at tone and length.

**If the old one has a withdrawal date**, there's no room for a long overlap. Run the cases now and plan the way back for a week, not a month.

**For casual use, in conversation**, just switch.

## Check you've got it

Three model changes. What do you look at first in each?

1. The output is pasted automatically into a form in another system.
2. The tool writes email drafts that a person reads and edits before sending.
3. The supplier announces that the current model stops working in three weeks.

:::Show the answer
**1: the shape.** A right answer with a different separator is an error for the form. The case sheet with both models, and a rule that catches malformed outputs.

**2: tone and length.** The person absorbs format differences, but if the new model writes twice as much, checking takes twice as long.

**3: run the cases this week.** With a withdrawal date, the overlap shrinks. The test doesn't: without it, the supplier makes the change for you the day they switch the old one off.
:::

## What to do this week

For each of your systems that runs on AI, write down which model it uses and which version of the instruction, with a date. Then pick one and run its case sheet on another model, just to see where the shape differs. Better now than in a rush, the day the change becomes compulsory.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-cambiar-de-modelo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-datos-de-entrada · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Fix what it receives before what you ask',
  'Some mistakes no instruction can fix, because the right answer isn''t in what reaches it. They''re fixed in the form.',
$md$
When an AI system gets something wrong, the reflex is to touch the instruction: clarify, add examples, set rules. Sometimes that's where the problem is. Often it's earlier.

The idea of this lesson: **if an attentive person with the same input couldn't get it right either, the mistake isn't the AI's: it's the input's.** A date written "3/4/2019" could be 3 April or 4 March. No instruction resolves that. A form that doesn't allow it to be written that way does.

## The case, with numbers

Hypothetical. A school's enquiry form has free-text fields for "year group applying for" and "date of birth". A system reads each enquiry, works out which year group the child belongs in by age, and routes it.

Across **200 enquiries** in a term, **30 mistakes** (15%). For weeks, the person who built it adjusted the instruction and brought it down from 18% to 15%. Then they did what they should have done first: read the 30 and, next to each, noted whether a person with that same input would have got it right.

- **13:** the year group written in incompatible ways. "Y1", "year one", "1st", "first grade", "the younger of the two".
- **9:** ambiguous date. Day and month interchangeable, or only the year.
- **5:** two or three siblings in one enquiry, on a form designed for one child.
- **3:** model errors with clear input.

13 + 9 + 5 = **27 of 30, 90%, could not be fixed from the instruction.** The weeks of tweaking were fighting 3.

The form changes: year group as a list to choose from, date with day, month and year in separate boxes, and a button to add another child. The next 200 enquiries: **4 mistakes, 2%**. And the instruction got shorter, because there's no longer any need to explain how to guess.

## When you can't touch the form

Sometimes the input comes from an email, another department or someone else's system.

**Normalise first.** A step beforehand, with fixed rules and no AI, that brings dates and year groups into one shape. Whatever it can't normalise, it flags.

**Let it say "can't tell".** One possible output has to be "ambiguous, ask". A system that guesses an ambiguous date and carries on is worse than one that stops, because its mistake looks exactly like a right answer.

## Where it doesn't apply

**Free text that is the enquiry itself.** "Tell us what you're looking for for your child" has to stay free: that's where AI earns its keep, reading what doesn't fit in boxes. Structure what has a right answer, not what is a conversation.

**Every compulsory field has a cost.** A form with twenty compulsory boxes loses people halfway. Structure the fields that cause mistakes today, not all of them.

**If a person with that input would have got it right**, the problem is the instruction. Go back to it.

## Check you've got it

Three mistakes. Input or instruction?

1. A family wrote "for next year" in December and the system recorded the current year.
2. A family from another country wrote "05/06/2020" meaning 6 May, and the system read it as 5 June.
3. An enquiry about three siblings was recorded as a single pupil.

:::Show the answer
**1: instruction.** With the date of the enquiry, a person can work it out. The system is missing that information or the rule to use it: fix it in what you ask and what you pass.

**2: input.** Both readings are valid. No instruction knows which one the family meant; separate boxes for day, month and year do.

**3: input.** The form has room for one pupil. The system did what it could with what arrived.
:::

## What to do this week

Take the last twenty or thirty mistakes from one of your systems. Next to each, a single question: with this input, would an attentive person have got it right? Count the "no"s. If they're the majority, the next hour goes not on the instruction but on the form.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-datos-de-entrada'
on conflict do nothing;
