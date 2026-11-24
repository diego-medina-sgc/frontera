-- ============================================================
-- 061 · Las cuatro lecciones de frontera de nivel 2-4, reescritas
-- ============================================================
-- fr-modelos, fr-negocios, fr-producto y fr-diseno (023) son de antes
-- de la estructura aprobada el 22/11: contaban bien la idea, sin caso
-- con números, sin borde y sin recuperación con la respuesta
-- escondida. A un nivel 3 con esos intereses le llegan primero.
--
-- Mismos slugs y títulos. Se reemplaza la capa conceptual (tool_id
-- null) en español y en inglés. Lector de nivel 2 a 4: nada de jerga
-- que no se explique en la misma oración. Los números de modelos van
-- como proporciones, no como precios: los precios cambian cada pocos
-- meses y la proporción es lo que sirve para decidir.
-- ============================================================

-- ------------------------------------------------------------
-- fr-modelos · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Tenés cinco o seis modelos a mano. La decisión no es cuál es mejor, y esa es justamente la pregunta que todo el mundo hace.',
  body_md = $md$
Cada pocas semanas sale un modelo nuevo, alguien publica una tabla comparativa y cambia el orden. Si decidís mirando esa tabla, vas a cambiar de herramienta para siempre sin trabajar mejor.

La idea es una sola: **se elige por la tarea, no por el modelo.** Los modelos se mueven en ejes que no van juntos (cuánto razonan, qué tan rápido contestan, cuánto texto les entra, cuánto cuestan) y el que gana razonando casi siempre es el más lento y el más caro. Cuatro preguntas sobre la tarea deciden:

1. **¿Tiene una respuesta correcta o pide criterio?** Sacar una fecha de un mail tiene respuesta correcta. Decidir si una queja se escala, no.
2. **¿Cuánto texto entra de una vez?** Un mail son dos mil palabras; un reglamento con anexos, ochenta mil. Eso solo ya descarta modelos.
3. **¿Cuántas veces por día?** Una vez por semana, usá el mejor y no lo pienses. Cuatrocientas veces, la diferencia de costo y de tiempo es el proyecto entero.
4. **¿Importa si tarda?** Si estás mirando la pantalla, mucho. Si corre de noche, nada.

## El caso, con números

Un colegio usa IA para tres cosas. Supongamos un modelo grande que tarda unos 20 segundos por pedido y cuesta unas quince veces más que uno chico, que tarda 2. Los números exactos cambian cada pocos meses; la proporción es lo que importa.

**Clasificar 400 consultas por mes.** Respuesta correcta, mucho volumen. Probados sobre 50 consultas reales, el grande acierta 49 y el chico 48. Un caso de diferencia. Con el grande, las 400 son más de dos horas de espera acumulada y quince veces el costo; con el chico, unos 13 minutos. **Gana el chico**, y no por poco.

**Un borrador de respuesta para cada consulta.** Pide algo de criterio, pero es texto corto y lo revisa una persona. Un modelo mediano alcanza.

**Una vez por mes, comparar tres propuestas de proveedores contra cinco criterios.** Pide criterio, tiene varios pasos y pasa doce veces al año. Acá **usá el mejor que tengas**: el costo de doce pedidos no se nota, y un error en esa comparación sí.

Lo que se ve en el caso: el mismo colegio necesita tres modelos distintos, y la tabla comparativa no le dice cuál para qué.

## Dónde no aplica

**Si no podés medir, usá el grande para lo que pasa pocas veces.** Bajar a uno más barato tiene sentido cuando tenés casos para comparar, como los 50 del ejemplo. Sin eso, ahorrás a ciegas.

**Los modelos que piensan antes de responder no ayudan en todo.** En problemas de varios pasos la diferencia se nota. Para reformular un mail no hacen nada: es tiempo y plata por una tarea sin pasos. Regla práctica: si vos la resolverías con lápiz y anotaciones intermedias, usá uno que razone; si la resolverías de corrido, no.

**El modelo de abajo cambia sin avisar.** El mismo pedido, el mismo archivo, y la salida de noviembre no es la de marzo. Si algo tuyo depende de que la respuesta venga con cierta forma, se puede romper en silencio. Por eso conviene tener tus casos de prueba a mano.

## Probá que lo entendiste

¿Qué tipo de modelo elegís para cada una, y qué pregunta decide?

1. Sacar nombre, fecha y curso de 300 formularios por semana.
2. Decidir, una sola vez, cuál de dos borradores de una política responde mejor a las quejas que llegaron este año.
3. Encontrar contradicciones en un reglamento de 80 páginas.

:::Ver la respuesta
**1. Uno rápido y barato.** Manda la pregunta 3: son 300 por semana con respuesta correcta. Probalo con 30 formularios contra el grande; si empatan o pierde por uno, el chico gana.

**2. El mejor que tengas.** Manda la pregunta 1: es puro criterio, y pasa una vez. El costo no importa.

**3. Uno al que le entre todo y que razone.** Mandan la 2 y la 1 juntas: si el reglamento no entra entero, las contradicciones entre la página 5 y la 70 no se ven. Si ninguno lo toma entero, se parte por capítulos y se pide la comparación entre partes.
:::

## Qué hacer esta semana

Anotá las tres cosas que más repetís con IA. Al lado de cada una, cuál de las cuatro preguntas manda.

Lo más probable es que dos de las tres no necesitaran el modelo caro, y que la tercera lo necesitara y no se lo estuvieras dando.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-modelos');

-- ------------------------------------------------------------
-- fr-negocios · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Casi todo piloto de IA funciona. Casi ninguno termina siendo cómo se trabaja al día siguiente.',
  body_md = $md$
El patrón se repite en todos lados. Alguien prueba algo, funciona, lo muestra y todos quedan impresionados. Tres meses después se trabaja igual que antes.

No es falta de voluntad. Es que **un piloto prueba que el modelo puede hacer la tarea, y eso casi siempre da que sí**, porque lo probaste vos, con los casos que elegiste, mirando la salida. No prueba lo que decide si eso vive:

- **Quién es dueño del resultado.** Si sale mal, ¿quién se hace cargo?
- **Qué pasa cuando sale mal.** No si: cuándo.
- **De dónde salen los datos de entrada todos los días.** En el piloto los juntaste a mano. El lunes a las nueve, ¿quién?

A todo eso se le dice pegamento. El modelo casi nunca es el cuello de botella: el pegamento sí.

## El caso, con números

Un colegio prueba borradores de respuesta para las consultas de familias. En la demo, diez borradores salen en cuatro minutos. A mano, cada respuesta lleva unos 6 minutos. Entran 90 consultas por semana: **la promesa son 9 horas por semana.**

Tres meses después se mide de verdad:

- Copiar cada consulta del formulario y pegarla en la herramienta: 1 minuto. Nadie lo había previsto. **90 minutos.**
- Leer el borrador, revisarlo y corregirlo: 4 minutos. **360 minutos.**

Total: 450 minutos, siete horas y media. **El ahorro real es una hora y media por semana**, no nueve. El modelo funcionaba igual de bien que en la demo; lo que se comió el ahorro fue todo lo de alrededor.

Y el arreglo tampoco es el modelo. Se conecta el formulario para que las consultas lleguen solas (pegar pasa a cero) y se marcan los borradores que salen con un dato que hay que verificar, así el resto se revisa en 2 minutos. Ahora son 180 minutos: **6 horas ahorradas**. Pegamento, no inteligencia.

## Dónde no aplica

**No todo piloto tiene que volverse proceso.** Una demo para aprender qué se puede hacer está bien. Conviene llamarla demo, porque a una demo no se le ponen tres meses de calendario ni se le promete un ahorro.

**Lo que pasa pocas veces no paga el pegamento.** Si la tarea es una vez por mes, conectar sistemas cuesta más de lo que devuelve: quedate en conversación.

**Los minutos no son lo único que se cuenta.** A veces el valor es que algo se haga siempre en vez de a veces, o que llegue antes. Pero tiene que ser algo que puedas contar antes y después: si no, la discusión sobre si sirvió la gana quien habla más fuerte.

## Probá que lo entendiste

Tres pilotos, descriptos por quien los lidera. ¿Cuál tiene más chances de seguir vivo en seis meses?

1. "El equipo quedó encantado con la demo, lo vamos a ir usando."
2. "Desde el lunes, la persona que carga las 40 inscripciones semanales deja de hacerlo a mano. Lo controla ella misma en una planilla, y si algo no cierra, lo corrige ahí."
3. "Ahorra muchísimo tiempo, todavía no medimos cuánto."

:::Ver la respuesta
**El 2, por lejos.** Tiene las tres cosas: una dueña (la persona que antes lo hacía), un número que se puede contar antes y después (40 por semana) y qué pasa cuando sale mal (lo ve y lo corrige en la planilla).

**El 1** es entusiasmo. Es real, y no predice nada: "lo vamos a ir usando" significa que nadie es dueño.

**El 3** puede ser cierto, pero sin el número de antes no hay forma de saberlo después.
:::

## Qué hacer esta semana

Elegí un proceso tuyo de los que se repiten y escribí tres líneas: quién lo hace hoy y cuánto tarda, de dónde salen los datos de entrada, y qué pasa cuando el resultado está mal.

La tercera es la que casi nadie puede llenar. Si a vos también te cuesta, ahí está el trabajo, y no en el modelo.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-negocios');

-- ------------------------------------------------------------
-- fr-producto · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Un producto con IA adentro acierta casi siempre. El diseño entero se juega en el casi.',
  body_md = $md$
En el software de siempre, un error es un evento: algo falla y aparece un cartel rojo. Con un modelo adentro eso no existe. **La respuesta equivocada tiene exactamente la misma forma que la correcta**: igual de prolija, igual de segura. Nadie levanta la mano.

Por eso el problema de diseño no es el error en sí. Es que la persona **no sabe cuáles revisar**, y entonces revisa todo (y no ahorró nada) o no revisa nada (y el error viaja). La idea de esta lección: **diseñar para el caso en que se equivoca, no para el caso en que acierta.** Tres cosas lo resuelven:

- **Que se vea de dónde salió.** La fila, el documento, el mail original. No para leerlo siempre: para chequear en diez segundos el que hizo ruido.
- **Que corregir sea más barato que hacerlo a mano.** Si arreglar uno malo cuesta más que escribirlo de cero, el producto resta.
- **Que el sistema avise cuándo no está seguro.** La más difícil y la que más rinde.

## El caso, con números

Un sistema prepara borradores de respuesta y acierta en 90 de cada 100. Hay 10 malos, y no se sabe cuáles.

**Sin ninguna señal:** revisar los 100 a 3 minutos cada uno son **300 minutos**. O no revisar ninguno, y **10 respuestas equivocadas salen**.

**Con un aviso de duda:** el sistema marca 20 borradores como "revisá este". De los 10 malos, 8 están entre esos 20. Se revisan sólo los marcados: **60 minutos y salen 2 errores** en vez de 10.

De 300 minutos a 60, y de 10 errores a 2. El modelo es exactamente el mismo: lo único que cambió es que ahora dice cuándo duda.

**Y el tercer punto:** si corregir un borrador malo lleva 8 minutos porque hay que rehacerlo, y escribirlo de cero lleva 6, esos casos restan. Ahí hace falta poder pedir "rehacelo con este dato" en un toque, no editar a mano un texto que arrancó mal.

## Dónde no aplica

**El aviso tiene que estar calibrado.** Si marca 60 de cada 100 como dudosos, no sirve: volviste a revisar casi todo. Un aviso que suena siempre se ignora igual que uno que nunca suena.

**En lo barato no hace falta todo esto.** Si el sistema te sugiere un título para un documento y se equivoca, lo cambiás y no pasa nada. Este diseño es para lo que sale hacia afuera o se usa para decidir.

**Mostrar la fuente no sirve si abrirla lleva un minuto.** Tiene que estar al lado, a un toque. Si no, nadie la abre.

## Probá que lo entendiste

Tres diseños del mismo producto. ¿Con cuál confía más la gente a los tres meses?

1. Acierta el 95% y responde todo con la misma seguridad.
2. Acierta el 92%, pero marca "revisá esto" y casi todos sus errores caen en lo marcado.
3. Acierta el 97% y esconde que hay un modelo adentro, para que la experiencia sea más mágica.

:::Ver la respuesta
**El 2, aunque acierte menos.** La gente aprende rápido que lo que no está marcado se puede usar, y que lo marcado se mira. Es predecible sobre cuándo falla, y eso es lo que construye confianza.

**El 1** enseña que no se puede confiar en nada, porque no hay forma de distinguir el 5% malo. Termina revisado entero o abandonado.

**El 3** funciona hasta el primer error. Ahí la persona no tiene ninguna explicación de por qué pasó, y la conclusión no es "esta respuesta estaba mal": es "esto no es confiable". Se pierde la confianza en todo por un caso.
:::

## Qué hacer esta semana

Tomá la cosa tuya que más usa otra gente y respondé una sola pregunta: **cuando el resultado está mal, ¿qué ve la persona?**

Si la respuesta es "nada, no se entera", eso es lo próximo que hay que construir, y es más importante que cualquier mejora de calidad que tengas en la lista.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-producto');

-- ------------------------------------------------------------
-- fr-diseno · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Todo el mundo reconoce un texto hecho con IA y casi nadie sabe explicar por qué. Entender el mecanismo es lo que te deja usarla sin que se note.',
  body_md = $md$
El problema no es la calidad. La gramática es correcta y la estructura cierra. Y aún así se nota, y quien lo lee no piensa "esto está mal": deja de leer.

El mecanismo es simple. Un modelo, cuando escribe, **devuelve lo más probable**, y lo más probable es el promedio de todo lo que ya se escribió sobre el tema. Por eso sale competente y anónimo a la vez. No tiene de dónde sacar lo que sólo vos sabés, porque eso no estaba en ningún lado.

La idea de esta lección: **lo que hace que un texto no suene a IA es información, no tono.**

## La prueba del intercambio

Hay una forma de medirlo en un minuto. Leé cada oración y preguntate: **¿esta oración la podría firmar cualquier otro en mi lugar?** Contá cuántas sí.

## El caso, con números

Un colegio tiene que invitar a las familias a una jornada de puertas abiertas.

**Versión A.** El pedido: "escribí un mail invitando a la jornada de puertas abiertas". Sale un texto prolijo de 12 oraciones. Con la prueba del intercambio: **11 de 12 las podría firmar cualquier colegio.** La única propia es la fecha.

**Versión B.** El pedido es el mismo, pero antes van las notas crudas de quien organiza: el año pasado vinieron 140 familias, la pregunta que más se repitió fue cómo es el transporte, este año se puede ver el laboratorio nuevo, la visita dura una hora y media y las familias pueden quedarse a una clase abierta. Con la instrucción de no agregar nada que no esté en las notas. Sale un texto de 14 oraciones: **9 de 14 sólo las puede firmar ese colegio.**

El modelo, la herramienta y el pedido son los mismos. Lo que cambió es el material. Y la segunda versión se lee hasta el final porque contesta lo que la familia se iba a preguntar.

## Las marcas

Una vez que las ves, no se te pasan:

- **Todo viene de a tres.** Tres razones, tres beneficios, tres pasos.
- **El párrafo que resume lo que acabás de leer.**
- **Adjetivos que no eligen nada:** robusto, potente, innovador, clave. Sacalos y la oración dice lo mismo.
- **El cierre que levanta vuelo** y se pone a hablar del futuro.
- **Ningún número propio.**

## Dónde no aplica

**Hay textos que conviene que sean el promedio.** Un aviso de que mañana no hay luz no necesita ser propio: necesita ser claro. La prueba del intercambio es para lo que querés que se lea.

**No es "no uses IA para escribir".** Ordenar y redactar es justo lo que hace bien. El trabajo es al revés de como lo hace casi todo el mundo: no le pidas el texto para después mejorarlo. Dale el material y pedile estructura y redacción sobre eso.

**Sacar las marcas no alcanza.** Un texto sin listas de a tres y sin adjetivos huecos sigue siendo el promedio si no tiene nada propio. Las marcas son el síntoma; la falta de información es la causa.

## Probá que lo entendiste

¿Cuál de estos tres pedidos da un texto que no se nota?

1. "Escribí un posteo sobre la importancia de la lectura, que suene humano."
2. "Con estas notas (tres datos del programa de lectura de este año y lo que dijo una familia en la reunión), armá un posteo de 150 palabras, sin agregar nada que no esté en las notas."
3. "Escribí un posteo sobre la lectura y después le saco yo lo que suena a IA."

:::Ver la respuesta
**El 2.** Es el único con información que no está en internet, y la instrucción impide que el modelo la rellene con promedio.

**El 1** pide tono en lugar de información. Va a cambiar el registro, meter alguna frase coloquial y acortar oraciones, y va a seguir sin tener nada que decir.

**El 3** arranca del promedio y lo maquilla. Le sacás las marcas y queda un promedio sin marcas.
:::

## Qué hacer esta semana

Tomá el último texto que publicaste o mandaste a mucha gente y pasale la prueba del intercambio: cuántas oraciones podría haber firmado cualquier otro.

Si son casi todas, el problema no era la IA. Faltaba el material.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-diseno');

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-modelos · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'You have five or six models within reach. The decision isn''t which one is best, and that''s exactly the question everyone asks.',
  body_md = $md$
Every few weeks a new model comes out, someone publishes a comparison table and the order changes. If you decide by looking at that table, you'll keep switching tools forever without working any better.

The idea is a single one: **you choose by the task, not by the model.** Models move along axes that don't go together (how much they reason, how fast they answer, how much text fits, how much they cost) and the one that wins at reasoning is almost always the slowest and most expensive. Four questions about the task decide:

1. **Does it have a right answer, or does it need judgement?** Pulling a date out of an email has a right answer. Deciding whether a complaint should be escalated doesn't.
2. **How much text goes in at once?** An email is two thousand words; a policy with its appendices, eighty thousand. That alone rules models out.
3. **How many times a day?** Once a week, use the best and don't think about it. Four hundred times, the difference in cost and time is the whole project.
4. **Does it matter if it's slow?** If you're watching the screen, a lot. If it runs overnight, not at all.

## The case, with numbers

A school uses AI for three things. Suppose a large model that takes about 20 seconds per request and costs about fifteen times more than a small one, which takes 2. The exact figures change every few months; the proportion is what matters.

**Sorting 400 enquiries a month.** A right answer, high volume. Tested on 50 real enquiries, the large model gets 49 right and the small one 48. One case apart. With the large one, the 400 add up to more than two hours of waiting and fifteen times the cost; with the small one, about 13 minutes. **The small one wins**, and not narrowly.

**A draft reply for each enquiry.** It needs some judgement, but it's short text and a person reviews it. A mid-sized model is enough.

**Once a month, comparing three suppliers' proposals against five criteria.** It needs judgement, it has several steps and it happens twelve times a year. Here, **use the best you have**: the cost of twelve requests doesn't show, and a mistake in that comparison does.

What the case shows: the same school needs three different models, and the comparison table doesn't tell it which for what.

## Where it doesn't apply

**If you can't measure, use the large model for what happens rarely.** Dropping to a cheaper one makes sense when you have cases to compare, like the 50 in the example. Without them, you're saving blind.

**Models that think before answering don't help with everything.** On multi-step problems the difference shows. For rewording an email they do nothing: it's time and money spent on a task with no steps. Rule of thumb: if you'd solve it with a pencil and working notes, use one that reasons; if you'd solve it in one go, don't.

**The model underneath changes without warning.** Same request, same file, and November's output isn't March's. If something of yours depends on the answer coming back in a certain shape, it can break silently. That's why it pays to keep your test cases to hand.

## Check you've got it

What kind of model do you choose for each, and which question decides?

1. Pulling name, date and year group out of 300 forms a week.
2. Deciding, just once, which of two drafts of a policy better answers this year's complaints.
3. Finding contradictions in an 80-page set of regulations.

:::Show the answer
**1. A fast, cheap one.** Question 3 decides: it's 300 a week, with a right answer. Test it on 30 forms against the large one; if it ties or loses by one, the small one wins.

**2. The best you have.** Question 1 decides: it's pure judgement, and it happens once. Cost doesn't matter.

**3. One that takes it all in and reasons.** Questions 2 and 1 decide together: if the regulations don't fit whole, contradictions between page 5 and page 70 can't be seen. If none takes it whole, split it by chapter and ask for the comparison between parts.
:::

## What to do this week

Write down the three things you repeat most with AI. Next to each, which of the four questions decides.

Most likely, two of the three didn't need the expensive model, and the third needed it and wasn't getting it.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-modelos');

-- ------------------------------------------------------------
-- fr-negocios · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Almost every AI pilot works. Almost none ends up being how the work gets done the next day.',
  body_md = $md$
The pattern repeats everywhere. Someone tries something, it works, they show it and everyone's impressed. Three months later the work is done exactly as before.

It isn't a lack of will. It's that **a pilot proves the model can do the task, and that almost always comes out yes**, because you tested it, with cases you chose, watching the output. It doesn't prove what decides whether it survives:

- **Who owns the result.** If it goes wrong, who deals with it?
- **What happens when it goes wrong.** Not if: when.
- **Where the input comes from every day.** In the pilot you gathered it by hand. At nine on Monday, who does?

All of that is called glue. The model is almost never the bottleneck; the glue is.

## The case, with numbers

A school pilots draft replies to enquiries from families. In the demo, ten drafts come out in four minutes. By hand, each reply takes about 6 minutes. 90 enquiries come in a week: **the promise is 9 hours a week.**

Three months later it's measured properly:

- Copying each enquiry from the form and pasting it into the tool: 1 minute. Nobody had planned for it. **90 minutes.**
- Reading the draft, checking and correcting it: 4 minutes. **360 minutes.**

Total: 450 minutes, seven and a half hours. **The real saving is an hour and a half a week**, not nine. The model worked as well as in the demo; what ate the saving was everything around it.

And the fix isn't the model either. The form is connected so enquiries arrive on their own (pasting drops to zero), and drafts that contain a fact needing checking are flagged, so the rest are reviewed in 2 minutes. Now it's 180 minutes: **6 hours saved**. Glue, not intelligence.

## Where it doesn't apply

**Not every pilot has to become a process.** A demo to learn what's possible is fine. Call it a demo, though, because a demo doesn't get three months of calendar or a promised saving.

**What happens rarely doesn't pay for the glue.** If the task is once a month, connecting systems costs more than it returns: stay in conversation.

**Minutes aren't the only thing worth counting.** Sometimes the value is that something always gets done instead of sometimes, or that it arrives sooner. But it has to be something you can count before and after: otherwise the argument about whether it worked is won by whoever talks loudest.

## Check you've got it

Three pilots, described by whoever leads them. Which is most likely to still be alive in six months?

1. "The team loved the demo, we'll start using it."
2. "From Monday, the person who enters the 40 weekly admissions stops doing it by hand. She checks it herself in a spreadsheet, and if something doesn't add up, she fixes it there."
3. "It saves loads of time, we haven't measured how much yet."

:::Show the answer
**Number 2, by a long way.** It has all three: an owner (the person who used to do it), a figure you can count before and after (40 a week), and what happens when it goes wrong (she sees it and fixes it in the spreadsheet).

**Number 1** is enthusiasm. It's real, and it predicts nothing: "we'll start using it" means nobody owns it.

**Number 3** may be true, but without the before figure there's no way of knowing afterwards.
:::

## What to do this week

Pick a process of yours that repeats and write three lines: who does it today and how long it takes, where the input comes from, and what happens when the result is wrong.

The third is the one almost nobody can fill in. If you struggle too, that's where the work is, not in the model.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-negocios');

-- ------------------------------------------------------------
-- fr-producto · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'A product with AI inside gets it right almost every time. The whole design is decided in the almost.',
  body_md = $md$
In ordinary software, an error is an event: something fails and a red warning appears. With a model inside, that doesn't exist. **The wrong answer has exactly the same shape as the right one**: just as tidy, just as confident. Nobody raises a hand.

So the design problem isn't the error itself. It's that the person **doesn't know which ones to check**, so they check everything (and saved nothing) or check nothing (and the error travels). The idea of this lesson: **design for the case where it's wrong, not the case where it's right.** Three things solve it:

- **You can see where it came from.** The row, the document, the original email. Not to read it every time: to check, in ten seconds, the one that looked off.
- **Correcting is cheaper than doing it by hand.** If fixing a bad one costs more than writing it from scratch, the product subtracts.
- **The system says when it isn't sure.** The hardest, and the one that pays most.

## The case, with numbers

A system prepares draft replies and gets 90 out of 100 right. There are 10 bad ones, and nobody knows which.

**With no signal at all:** checking all 100 at 3 minutes each is **300 minutes**. Or checking none, and **10 wrong replies go out**.

**With a doubt flag:** the system marks 20 drafts "check this one". Of the 10 bad ones, 8 are among those 20. Only the flagged ones are checked: **60 minutes, and 2 errors go out** instead of 10.

From 300 minutes to 60, and from 10 errors to 2. The model is exactly the same: all that changed is that it now says when it's unsure.

**And the third point:** if correcting a bad draft takes 8 minutes because it has to be redone, and writing it from scratch takes 6, those cases subtract. What's needed is being able to ask "redo it with this fact" in one tap, not editing by hand a text that started off wrong.

## Where it doesn't apply

**The flag has to be calibrated.** If it marks 60 out of 100 as doubtful, it's useless: you're back to checking nearly everything. A flag that always goes off is ignored just like one that never does.

**For cheap things, none of this is needed.** If the system suggests a title for a document and gets it wrong, you change it and nothing happens. This design is for what goes outside or is used to decide something.

**Showing the source is no use if opening it takes a minute.** It has to be right there, one tap away. Otherwise nobody opens it.

## Check you've got it

Three designs of the same product. Which one do people trust more after three months?

1. Right 95% of the time, and answers everything with the same confidence.
2. Right 92% of the time, but flags "check this" and nearly all its errors fall within what's flagged.
3. Right 97% of the time, and hides that there's a model inside, to make the experience more magical.

:::Show the answer
**Number 2, even though it's right less often.** People quickly learn that what isn't flagged can be used, and what is flagged gets looked at. It's predictable about when it fails, and that's what builds trust.

**Number 1** teaches that nothing can be trusted, because there's no way to tell the bad 5% apart. It ends up checked in full or abandoned.

**Number 3** works until the first error. Then the person has no explanation for why it happened, and the conclusion isn't "that answer was wrong": it's "this isn't reliable". Trust in the whole thing is lost over one case.
:::

## What to do this week

Take the thing of yours that other people use most and answer a single question: **when the result is wrong, what does the person see?**

If the answer is "nothing, they don't find out", that's the next thing to build, and it matters more than any quality improvement on your list.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-producto');

-- ------------------------------------------------------------
-- fr-diseno · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Everyone recognises a text written with AI and almost nobody can explain why. Understanding the mechanism is what lets you use it without it showing.',
  body_md = $md$
The problem isn't quality. The grammar is correct and the structure holds. And still it shows, and the reader doesn't think "this is wrong": they stop reading.

The mechanism is simple. When a model writes, it **returns the most likely thing**, and the most likely thing is the average of everything already written on the subject. That's why it comes out competent and anonymous at once. It has nowhere to get what only you know, because that wasn't written down anywhere.

The idea of this lesson: **what stops a text sounding like AI is information, not tone.**

## The swap test

There's a way to measure it in a minute. Read each sentence and ask: **could anyone else in my position sign this sentence?** Count how many could.

## The case, with numbers

A school has to invite families to an open day.

**Version A.** The request: "write an email inviting families to the open day". Out comes a tidy 12-sentence text. With the swap test: **11 of the 12 could be signed by any school.** The only one of its own is the date.

**Version B.** Same request, but first come the organiser's raw notes: last year 140 families came, the most repeated question was about transport, this year the new laboratory can be visited, the visit lasts an hour and a half and families can stay for an open lesson. With the instruction to add nothing that isn't in the notes. Out comes a 14-sentence text: **9 of the 14 could only be signed by that school.**

Same model, same tool, same request. What changed is the material. And the second version gets read to the end because it answers what the family was going to ask.

## The tells

Once you see them, you can't miss them:

- **Everything comes in threes.** Three reasons, three benefits, three steps.
- **The paragraph that sums up what you've just read.**
- **Adjectives that choose nothing:** robust, powerful, innovative, key. Take them out and the sentence says the same.
- **The ending that takes off** and starts talking about the future.
- **Not a single figure of its own.**

## Where it doesn't apply

**Some texts should be the average.** A notice that the power will be off tomorrow doesn't need to be distinctive: it needs to be clear. The swap test is for what you want read.

**It isn't "don't use AI to write".** Organising and drafting is exactly what it does well. The work runs the opposite way to how almost everyone does it: don't ask for the text and then improve it. Give it the material and ask for structure and drafting on top of that.

**Removing the tells isn't enough.** A text with no lists of three and no empty adjectives is still the average if it has nothing of its own. The tells are the symptom; missing information is the cause.

## Check you've got it

Which of these three requests produces a text that doesn't show?

1. "Write a post about the importance of reading, make it sound human."
2. "With these notes (three facts about this year's reading programme and what a parent said at the meeting), put together a 150-word post, adding nothing that isn't in the notes."
3. "Write a post about reading and I'll take out whatever sounds like AI afterwards."

:::Show the answer
**Number 2.** It's the only one with information that isn't on the internet, and the instruction stops the model padding it with the average.

**Number 1** asks for tone instead of information. It'll change the register, add the odd colloquial phrase and shorten sentences, and still have nothing to say.

**Number 3** starts from the average and dresses it up. Take out the tells and you're left with an average without tells.
:::

## What to do this week

Take the last text you published or sent to a lot of people and give it the swap test: how many sentences could anyone else have signed.

If it's nearly all of them, the problem wasn't the AI. The material was missing.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-diseno');
