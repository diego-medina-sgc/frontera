-- ============================================================
-- 075 · Libro: The Mom Test (Rob Fitzpatrick)
-- ============================================================
-- Tema "producto" e "investigacion". Completa a Cagan (el riesgo
-- de valor) y a Dunford (la alternativa real): es el manual de cómo
-- se conversa para averiguar si algo vale la pena antes de armarlo.
--
-- Verificado en Open Library el 24/11:
--   · obra OL23982116W, "The mom test", Rob Fitzpatrick
--     (Open Library da 2014 como primera publicación, edición
--     CreateSpace; el libro circula con fecha 2013, que es la que
--     se usa acá);
--   · edición en castellano: SÍ existe. Obra OL29835742W, edición
--     OL41705867M, título "Mom Test", subtítulo "Cómo mantener
--     conversaciones con tus clientes y validar tu idea de negocio
--     cuando todos te mienten", Independently Published, 2019,
--     ISBN 9781671455351, idioma /languages/spa. title_es = 'Mom Test'
--     (tal cual figura, sin subtítulo);
--   · tapa 10660557, la rosa original en inglés (mirada, 200).
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto.
-- Casos hipotéticos. Cinco piezas por idioma: no_lei 1-3,
-- hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'the-mom-test',
  'The Mom Test',
  'Rob Fitzpatrick',
  2013,
  array['producto', 'investigacion'],
  'Mom Test',
  10660557,
  array[
    'validar','validación','idea nueva','entrevista','entrevistas','encuesta','encuestas',
    'preguntar','clientes','usuarios','familias','servicio nuevo','lanzar','piloto',
    'opiniones','investigar','customer','interview','research'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Preguntá por su vida, no por tu idea',
$md$
Rob Fitzpatrick armó empresas, y el libro sale de un error que dice haber cometido más de una vez: contar una idea, escuchar que a todos les parecía buena, construirla y descubrir que nadie la usaba. El título viene de ahí. Si le contás tu idea a tu madre, te va a decir que es buena porque te quiere. Y el problema no es tu madre: casi cualquiera hace lo mismo cuando le preguntás por tu idea.

La salida no es dejar de preguntar, sino cambiar qué preguntás. **Una buena pregunta es la que no se puede contestar con una mentira amable, aunque la otra persona quiera ser amable.** Eso pasa cuando preguntás por su vida y por lo que ya hizo, no por tu idea ni por lo que haría.

- "¿Usarías una app para esto?" pide una predicción. La gente predice mal su propia conducta, y además quiere caerte bien.
- "Contame la última vez que te pasó esto" pide un hecho. Puede no acordarse de todo, pero adornar un pasado concreto es mucho más difícil que regalarte un "sí".

Fitzpatrick lo baja a tres reglas: no hables de tu idea, preguntá por cosas concretas que ya pasaron y no por opiniones sobre el futuro, y hablá poco.

## Un caso trabajado (hipotético)

Alguien del equipo de admisiones quiere armar una herramienta para que las familias coordinen los traslados compartidos de los chicos. Habla con 16 familias.

**Primera ronda.** Pregunta: "¿usarías una app para organizar quién lleva a los chicos?". Dicen que sí 14 de 16, un 87,5%. Parece validado.

**Segunda ronda,** con las mismas 16 familias y otra pregunta: "¿cómo organizaron los traslados la semana pasada? ¿Hubo algún problema?".

- 10 lo resuelven en un grupo de mensajes que ya funciona y no recuerdan ningún problema.
- 4 no comparten traslados.
- 2 tuvieron un problema concreto: un cambio de horario a último momento que nadie vio a tiempo.

El 87,5% se convierte en 2 de 16, un 12,5%. Y aparece otra cosa: el problema de esas dos familias no es organizar, es enterarse de un cambio. Eso se arregla con mucho menos que una app.

## Dónde no aplica

**Cuando el problema todavía no existe en su vida.** Si lo que proponés es realmente nuevo, no hay pasado que preguntar. Conviene preguntar por lo más cercano que sí hacen hoy, sabiendo que vas a aprender menos.

**Para decidir el diseño fino.** Preguntar por el pasado te dice si el problema existe y cuánto pesa. Si un botón se entiende, lo ves mirando a alguien usarlo, no conversando.

**Cuando ya tenés registros.** Si sabés cuántas consultas o abandonos hay, mirá eso primero. La conversación explica por qué pasa, no cuántas veces.

## Probá que lo entendiste

¿Cuál de estas preguntas sirve?

1. "¿Te parece que a las familias les vendría bien un recordatorio automático de reuniones?"
2. "¿Cuándo fue la última vez que se te pasó una reunión del colegio? ¿Qué pasó después?"
3. "¿Cuánto pagarías por un servicio así?"

:::Ver la respuesta
**La 2.** Pide un hecho del pasado, de su propia vida, y no menciona tu idea.

**La 1** pide una opinión sobre tu idea, y encima sobre otros ("las familias"). La respuesta amable es sí.

**La 3** pide una predicción. Decir un número no le cuesta nada. Mejor: "¿hoy pagás por algo para resolver esto? ¿Por qué?".
:::

## Qué hacer esta semana

Tomá una idea que tengas en carpeta. Escribí la pregunta que pensabas hacer y reescribila empezando por "contame la última vez que...". Hacésela a dos personas sin mencionar tu idea.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Los cumplidos no son datos',
$md$
La segunda idea del libro es sobre lo que te llevás de una charla. Hay respuestas que se sienten como aprobación y no te dicen nada. Fitzpatrick las separa así:

- **Cumplidos:** "me encanta", "qué buena idea", "está buenísimo".
- **Generalidades:** "siempre", "normalmente", "a todos nos pasa", "yo nunca".
- **Promesas a futuro:** "lo usaría", "lo compraría", "avisame cuando esté".

Y suma una cuarta: los pedidos de funciones ("tendría que tener tal cosa"), que tampoco son un requisito sino una pista.

La idea central: **lo que suena a aprobación casi nunca es información; lo que sirve es un hecho concreto que ya pasó.** Cuando aparece una de estas respuestas, no se festeja: se desvía hacia un hecho.

- **Ante un cumplido,** agradecé y volvé a su vida: "gracias; ¿y hoy cómo lo resolvés?".
- **Ante una generalidad,** anclala en un caso: "¿cuándo fue la última vez?".
- **Ante una promesa,** preguntá qué hizo ya: "¿probaste algo para resolverlo?". Si nunca buscó nada, el problema quizás no le pesa tanto.
- **Ante un pedido,** preguntá para qué: "¿qué podrías hacer con eso que hoy no podés?".

## Un caso trabajado (hipotético)

Quien dirige un estudio contable chico armó una plantilla para preparar los informes mensuales a clientes, y quiere ofrecérsela a otros estudios. Charla veinte minutos con una colega y después anota las diez frases que se llevó:

- **4 cumplidos:** "está buenísimo", "qué prolijo", "se nota el trabajo", "me encanta la idea".
- **3 generalidades:** "siempre perdemos tiempo con los informes", "a todos nos pasa", "fin de mes es una locura".
- **2 promesas:** "lo usaría seguro", "pasámelo cuando esté".
- **1 hecho:** "el mes pasado armé 14 informes y tardé dos días, casi todo copiando datos de una planilla a otra".

Volvió contento con 9 frases que no valen nada, y la única útil salió casi de casualidad. Con desvíos, la charla habría sido otra. Ante "siempre perdemos tiempo", la pregunta era "¿cuánto tardaste el mes pasado?". Ante "lo usaría seguro", la pregunta era "¿probaste algo para acelerarlo?". Si la respuesta es "no, nunca busqué", son dos días al mes que a esa colega no le duelen tanto como parece.

## Dónde no aplica

**Desviar no es interrogar.** Si cortás cada frase amable con "¿cuándo fue la última vez?", la charla se vuelve un examen. Se desvía cuando la frase importa para tu decisión.

**Las generalidades orientan.** "A todos nos pasa" no prueba nada, pero te dice dónde buscar un caso concreto.

**Con quien ya lo usa, el elogio pesa algo más.** Viene con uso detrás. Aun así, lo que hace sigue pesando más que lo que dice.

## Probá que lo entendiste

¿Es generalidad, promesa o hecho?

1. "Normalmente las familias preguntan por el comedor."
2. "Si tuvieran ese servicio, seguro los elegiría."
3. "La semana pasada tres familias me preguntaron por el comedor en la entrevista."

:::Ver la respuesta
**1. Generalidad.** Desviala: "¿cuándo fue la última vez que te preguntaron? ¿Qué querían saber?".

**2. Promesa a futuro.** No le cuesta nada decirla. Desviala hacia lo que hizo: "¿qué te hizo elegir el colegio actual?".

**3. Hecho.** Concreto, reciente y contable. Es el tipo de frase que tiene que salir de una buena charla.
:::

## Qué hacer esta semana

Después de tu próxima charla sobre algo que querés armar, anotá las frases que te llevaste y marcá cada una: cumplido, generalidad, promesa o hecho. Contá los hechos. Si son menos de tres, en la siguiente desviá antes.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Que pongan algo',
$md$
La tercera idea del libro es para cuando ya tenés algo que proponer. Ahí, una charla no sirvió porque fue agradable. **Sirvió si la otra persona puso algo en el siguiente paso.** Fitzpatrick habla de tres monedas:

- **Tiempo:** una segunda reunión, probar un piloto, juntarte los datos que necesitás.
- **Reputación:** presentarte a quien decide, recomendarte a un colega, decir en su equipo que lo va a probar.
- **Dinero:** una seña, una preinscripción, una compra anticipada.

Una charla que termina en "qué bueno, avisame" no es un sí. Es una forma amable de no comprometerse, y es la más peligrosa porque se siente bien. El consejo práctico es saber antes de cada charla qué paso concreto vas a pedir al final, y pedirlo.

## Un caso trabajado (hipotético)

Un colegio piensa ofrecer un servicio pago de apoyo escolar por la tarde. Quien lo impulsa habla con 12 familias, les cuenta la propuesta y, al final de cada charla, pide un paso concreto. Resultado:

- **8** dicen "me encanta, avisame cuando arranque". Nada puesto.
- **2** aceptan una segunda reunión con la otra persona que decide en su casa. Tiempo.
- **1** lo presenta a otras tres familias del grado. Reputación.
- **1** deja una preinscripción con seña. Dinero.

Son 8 + 2 + 1 + 1 = 12. Por el tono, 12 de 12 charlas fueron positivas. Por el compromiso, hubo avance en 4 de 12, un 33%, y con dinero en 1 de 12, un 8%.

Lo importante es qué hacer con las 8. No son un no: son un "no sé". Si el plan se arma contando 12 interesadas, se arma sobre humo. Si se arma con 4, el siguiente paso es claro: la reunión con las parejas, las tres familias nuevas y una pregunta para la familia que pagó: ¿qué la convenció?

## Dónde no aplica

**Al principio no hay nada que comprometer.** Si todavía estás entendiendo el problema, pedir una seña es prematuro. En esa etapa la charla sirvió si saliste con hechos.

**Pedir de más espanta.** El paso tiene que ser proporcional a lo que la persona conoce. A quien escuchó la idea hace diez minutos se le pide una segunda charla, no plata.

**Dentro de una organización, la moneda cambia.** Con colegas casi nunca hay dinero en juego. El compromiso es tiempo (probarlo con sus datos reales una semana) o reputación (proponerlo en su reunión de área).

## Probá que lo entendiste

¿Hubo avance?

1. "Mandame la propuesta por mail y lo veo."
2. "Vení el jueves a mostrárselo a mi socio; le pido que reserve una hora."
3. "Me encanta, contá conmigo."

:::Ver la respuesta
**1. Casi nunca.** Suele ser una forma de cerrar la reunión. Se convierte en avance si acordás en ese momento una fecha para charlarlo.

**2. Sí.** Pone tiempo, el suyo y el de su socio, y algo de reputación: te presenta ante alguien.

**3. No.** Es un cumplido con una promesa adentro. No puso nada.
:::

## Qué hacer esta semana

Antes de tu próxima charla sobre algo nuevo, escribí qué paso concreto vas a pedir al final. Después anotá si lo dio. A fin de mes, separá tus charlas en dos columnas: con avance y sin avance.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Por qué el libro se llama así?**

:::Ver la respuesta
Porque si le preguntás a tu madre por tu idea, te va a decir que es buena para no lastimarte. **La prueba es hacer preguntas que ni ella podría contestarte con una mentira amable.** El problema no es la persona: es la pregunta.
:::

**2. ¿Cuáles son las tres reglas para conversar?**

:::Ver la respuesta
**Hablar de su vida y no de tu idea; preguntar por cosas concretas que ya pasaron y no por opiniones o el futuro; hablar poco y escuchar mucho.** La que más se olvida es la tercera: si hablaste más de la mitad del tiempo, estuviste vendiendo.
:::

**3. ¿Qué respuestas se sienten como datos y no lo son?**

:::Ver la respuesta
**Los cumplidos, las generalidades ("siempre", "normalmente") y las promesas a futuro ("lo usaría").** Y los pedidos de funciones, que son pistas y no requisitos. A todas se responde desviando hacia un hecho concreto.
:::

**4. ¿Cuáles son las monedas con que alguien se compromete?**

:::Ver la respuesta
**Tiempo, reputación y dinero.** Una charla con algo para proponer sirvió si la otra persona puso alguna de las tres en el paso siguiente.
:::

**5. Alguien te dice "tendría que tener un botón para exportar". ¿Qué hacés?**

:::Ver la respuesta
**Preguntás para qué.** "¿Qué harías con eso que hoy no podés hacer?". Detrás de un pedido de función hay un problema, y muchas veces se resuelve de otra forma o no pesa tanto como parecía.
:::

## Lo que suele borrarse

Lo que más queda es "preguntá por el pasado". Lo que más se borra es la segunda mitad: que cuando ya tenés algo para proponer, cada charla tiene que terminar pidiendo un paso concreto. Sin eso, podés hacer preguntas impecables y aun así volver con doce charlas lindas y ningún compromiso.

La otra cosa que se borra es el tono. El libro no propone una entrevista formal con guion y grabadora: propone charlas cortas y casuales, donde la otra persona no siente que está evaluando tu proyecto. Cuanto más parece un examen de tu idea, más cumplidos te llevás.

## Un caso para aplicarlo

Te piden que "valides" con diez docentes una herramienta nueva para cargar informes de alumnos. Volvés con un resumen: "a todos les encantó, varios dijeron que la usarían". ¿Qué le falta a ese resumen?

:::Ver la respuesta
**Le falta todo lo que sirve.** Son cumplidos y promesas. Faltan hechos (cuánto tardaron en cargar los informes la última vez, qué usan hoy, qué se les complicó) y falta compromiso: ¿cuántos aceptaron probarla con sus informes reales el próximo trimestre? Si ninguno, lo honesto es decir "no sabemos todavía", no "validado".
:::

## Qué hacer esta semana

Buscá el último resumen de una charla, encuesta o reunión en la que alguien "validó" algo. Tachá los cumplidos y las promesas. Mirá lo que queda.
$md$,
  7
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Fitzpatrick con Cagan y Dunford',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con los dos libros de producto de la biblioteca.

**Cagan** (*Inspired*): todo producto tiene cuatro riesgos (valor, usabilidad, viabilidad técnica y del negocio), el de valor es el que más proyectos mata, y se averigua antes de construir, con prototipos baratos.

**Dunford** (*Obviously Awesome*): posicionar empieza por la alternativa real, que casi nunca es un competidor sino lo que la persona hace hoy.

Antes de seguir, una prueba. Sin releer: **¿qué riesgo de Cagan ataca Fitzpatrick?**

:::Ver la respuesta
**El de valor.** ¿Existe el problema? ¿Le pesa a alguien lo suficiente como para cambiar lo que hace? Cuando pedís dinero como compromiso, también toca algo del de negocio. La usabilidad no: eso no se averigua conversando, se averigua mirando a alguien usar algo.
:::

## Dónde se tocan, y dónde no

**Con Dunford coinciden en la pregunta.** "¿Cómo lo resolvés hoy?" es la pregunta central de Fitzpatrick y es la que te da la alternativa real que Dunford necesita. Un buen ciclo de charlas al estilo del Mom Test te deja, de paso, la materia prima del posicionamiento.

**Con Dunford no coinciden en el momento.** Fitzpatrick pide no presentar tu idea mientras estás aprendiendo. Dunford trata justamente de cómo presentarla. No se contradicen: el método de Dunford arranca con clientes que ya aman el producto, y Fitzpatrick trabaja antes de que esos clientes existan.

**Con Cagan coinciden en desconfiar de lo que la gente dice.** Pero cada uno elige otra salida. Cagan prefiere un prototipo y mirar qué hace la persona. Fitzpatrick prefiere hechos del pasado y compromisos. Hoy que un prototipo se arma en una tarde, la tentación es saltear las charlas. El riesgo es que mostrar un prototipo es presentar tu idea, y lo que vuelve son cumplidos.

## Lo que el libro no prueba

Es un libro de experiencia, no de investigación. Los ejemplos son de emprendimientos de software, no hay datos sobre cuánto mejora las decisiones, y preguntar por conductas pasadas no es invento suyo: la investigación con usuarios lo practica hace décadas. Su aporte es hacerlo práctico.

Tiene dos límites que conviene tener presentes. El pasado también se recuerda mal: la gente reconstruye, redondea y se olvida. Y un compromiso mide intención con costo, no uso: quien deja una seña quiere probar, no necesariamente quedarse. Además, diez charlas con gente que conocés no son una muestra: son las personas que tenías cerca.

## Una situación para decidir

Tenés dos semanas para decidir si armar un servicio de acompañamiento para familias que llegan del exterior. Opciones: (a) diez charlas sobre cómo fue su llegada, (b) armar en una tarde un prototipo de la página del servicio y mostrárselo a diez familias, (c) mandar una encuesta a 300 familias preguntando si les interesaría. ¿Qué haría cada autor?

:::Ver la respuesta
**Fitzpatrick: la (a) primero.** Hechos de su llegada, sin mencionar el servicio. La (b) recién después, terminando cada charla con un pedido concreto.

**Cagan: la (b) le sirve,** siempre que se mire qué hacen con el prototipo y no se les pregunte si les gusta. Las charlas de la (a) le parecerían una buena forma barata de chequear el valor antes.

**Dunford: la (a)** le da la alternativa real (a quién le preguntaron, qué resolvieron solas), que es lo que va a necesitar para presentar el servicio después.

La (c) es la que menos les sirve a los tres: son trescientas promesas a futuro.
:::

## Qué hacer esta semana

Elegí algo que estés por proponer. Escribí las tres preguntas de Fitzpatrick que harías, el prototipo que armaría Cagan y la alternativa real que buscaría Dunford. Empezá por la que te cueste menos.
$md$,
  8
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'Ask about their life, not your idea',
$md$
Rob Fitzpatrick has started companies, and the book grows out of a mistake he says he made more than once: describing an idea, hearing that everyone liked it, building it and finding that nobody used it. The title comes from there. If you tell your mum your idea, she'll say it's good because she loves you. And the problem isn't your mum: almost anyone does the same when you ask them about your idea.

The way out isn't to stop asking, but to change what you ask. **A good question is one that can't be answered with a kind lie, even if the other person wants to be kind.** That happens when you ask about their life and what they've already done, not about your idea or what they would do.

- "Would you use an app for this?" asks for a prediction. People predict their own behaviour badly, and they want you to like them.
- "Tell me about the last time this happened to you" asks for a fact. They may not remember everything, but embellishing a concrete past is much harder than handing you a "yes".

Fitzpatrick boils it down to three rules: don't talk about your idea, ask about specific things that have already happened rather than opinions about the future, and talk little.

## A worked case (hypothetical)

Someone on the admissions team wants to build a tool so families can coordinate shared school runs. They talk to 16 families.

**First round.** The question: "would you use an app to organise who takes the children?" 14 of 16 say yes, 87.5%. It looks validated.

**Second round,** with the same 16 families and a different question: "how did you organise the school run last week? Was there any problem?"

- 10 sort it out in a message group that already works and can't remember any problem.
- 4 don't share school runs.
- 2 had a concrete problem: a last-minute change of time that nobody saw in time.

The 87.5% becomes 2 of 16, 12.5%. And something else appears: those two families' problem isn't organising, it's finding out about a change. That can be fixed with far less than an app.

## Where it doesn't apply

**When the problem doesn't yet exist in their life.** If what you're proposing is genuinely new, there's no past to ask about. Ask about the closest thing they do today, knowing you'll learn less.

**For deciding the fine detail of a design.** Asking about the past tells you whether the problem exists and how much it weighs. Whether a button makes sense you see by watching someone use it, not by chatting.

**When you already have records.** If you know how many enquiries or drop-outs there are, look at that first. The conversation explains why it happens, not how often.

## Check you've got it

Which of these questions is useful?

1. "Do you think families would benefit from an automatic meeting reminder?"
2. "When was the last time you missed a school meeting? What happened afterwards?"
3. "How much would you pay for a service like this?"

:::Show the answer
**Number 2.** It asks for a fact from the past, from their own life, and doesn't mention your idea.

**Number 1** asks for an opinion about your idea, and about other people ("families") on top. The kind answer is yes.

**Number 3** asks for a prediction. Saying a figure costs them nothing. Better: "do you pay for anything to solve this today? Why?"
:::

## What to do this week

Take an idea you've had on the back burner. Write down the question you were planning to ask and rewrite it starting with "tell me about the last time...". Ask it of two people without mentioning your idea.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Compliments aren''t data',
$md$
The book's second idea is about what you take away from a conversation. Some answers feel like approval and tell you nothing. Fitzpatrick sorts them like this:

- **Compliments:** "I love it", "what a good idea", "that's brilliant".
- **Generalities:** "always", "usually", "it happens to all of us", "I never".
- **Promises about the future:** "I'd use it", "I'd buy it", "let me know when it's ready".

And he adds a fourth: feature requests ("it should have such-and-such"), which aren't a requirement either but a clue.

The core idea: **what sounds like approval is almost never information; what helps is a concrete fact that has already happened.** When one of these answers comes up, you don't celebrate it: you steer it towards a fact.

- **Faced with a compliment,** say thanks and go back to their life: "thanks; and how do you handle it today?"
- **Faced with a generality,** anchor it in a case: "when was the last time?"
- **Faced with a promise,** ask what they've already done: "have you tried anything to solve it?" If they've never looked for anything, the problem may not weigh on them that much.
- **Faced with a request,** ask what for: "what could you do with that which you can't do today?"

## A worked case (hypothetical)

Someone who runs a small accountancy practice has built a template for preparing monthly client reports, and wants to offer it to other practices. They chat for twenty minutes with a colleague and afterwards note down the ten phrases they came away with:

- **4 compliments:** "that's brilliant", "very tidy", "you can see the work", "I love the idea".
- **3 generalities:** "we always waste time on reports", "it happens to all of us", "month-end is madness".
- **2 promises:** "I'd definitely use it", "send it over when it's ready".
- **1 fact:** "last month I did 14 reports and it took me two days, mostly copying data from one spreadsheet to another".

They came back pleased with 9 phrases worth nothing, and the only useful one came out almost by chance. With some steering, the conversation would have gone differently. Faced with "we always waste time", the question was "how long did it take you last month?" Faced with "I'd definitely use it", the question was "have you tried anything to speed it up?" If the answer is "no, I've never looked", those are two days a month that don't hurt this colleague as much as it seems.

## Where it doesn't apply

**Steering isn't interrogating.** If you cut off every kind phrase with "when was the last time?", the conversation becomes an exam. You steer when the phrase matters for your decision.

**Generalities point the way.** "It happens to all of us" proves nothing, but it tells you where to look for a concrete case.

**From someone who already uses it, praise weighs a little more.** It comes with use behind it. Even so, what they do still weighs more than what they say.

## Check you've got it

Is it a generality, a promise or a fact?

1. "Families usually ask about the canteen."
2. "If you had that service, I'd definitely choose you."
3. "Last week three families asked me about the canteen at the interview."

:::Show the answer
**1. Generality.** Steer it: "when was the last time someone asked? What did they want to know?"

**2. Promise about the future.** It costs them nothing to say. Steer it towards what they did: "what made you choose your current school?"

**3. Fact.** Concrete, recent and countable. It's the kind of phrase a good conversation should produce.
:::

## What to do this week

After your next conversation about something you want to build, write down the phrases you came away with and mark each one: compliment, generality, promise or fact. Count the facts. If there are fewer than three, steer sooner next time.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Get them to put something in',
$md$
The book's third idea is for when you already have something to propose. At that point, a conversation wasn't useful because it was pleasant. **It was useful if the other person put something into the next step.** Fitzpatrick talks about three currencies:

- **Time:** a second meeting, trying a pilot, gathering the data you need.
- **Reputation:** introducing you to whoever decides, recommending you to a colleague, telling their team they'll try it.
- **Money:** a deposit, a pre-registration, an advance purchase.

A conversation that ends in "how nice, let me know" isn't a yes. It's a polite way of not committing, and it's the most dangerous kind because it feels good. The practical advice is to know before each conversation which concrete step you'll ask for at the end, and to ask for it.

## A worked case (hypothetical)

A school is thinking of offering a paid after-school homework support service. The person driving it talks to 12 families, explains the proposal and, at the end of each conversation, asks for a concrete step. The result:

- **8** say "I love it, let me know when it starts". Nothing put in.
- **2** agree to a second meeting with the other person who decides at home. Time.
- **1** introduces them to three other families in the year group. Reputation.
- **1** leaves a pre-registration with a deposit. Money.

That's 8 + 2 + 1 + 1 = 12. By tone, 12 of 12 conversations were positive. By commitment, there was progress in 4 of 12, 33%, and with money in 1 of 12, 8%.

The important thing is what to do with the 8. They aren't a no: they're an "I don't know". If the plan is built counting 12 interested families, it's built on thin air. If it's built on 4, the next step is clear: the meeting with the partners, the three new families and a question for the family that paid: what convinced them?

## Where it doesn't apply

**At the start there's nothing to commit to.** If you're still understanding the problem, asking for a deposit is premature. At that stage the conversation was useful if you came away with facts.

**Asking for too much scares people off.** The step has to be in proportion to what the person knows. Someone who heard the idea ten minutes ago gets asked for a second chat, not money.

**Inside an organisation, the currency changes.** With colleagues there's rarely money at stake. The commitment is time (trying it with their real data for a week) or reputation (proposing it at their department meeting).

## Check you've got it

Was there progress?

1. "Email me the proposal and I'll have a look."
2. "Come on Thursday to show it to my partner; I'll ask them to keep an hour free."
3. "I love it, count me in."

:::Show the answer
**1. Almost never.** It's usually a way of ending the meeting. It becomes progress if you agree a date to talk it through there and then.

**2. Yes.** It puts in time, theirs and their partner's, and some reputation: they're introducing you to someone.

**3. No.** It's a compliment with a promise inside. Nothing was put in.
:::

## What to do this week

Before your next conversation about something new, write down which concrete step you'll ask for at the end. Afterwards, note whether you got it. At the end of the month, split your conversations into two columns: with progress and without.
$md$,
  9
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. Why is the book called that?**

:::Show the answer
Because if you ask your mum about your idea, she'll tell you it's good so as not to hurt you. **The test is asking questions that even she couldn't answer with a kind lie.** The problem isn't the person: it's the question.
:::

**2. What are the three rules for the conversation?**

:::Show the answer
**Talk about their life, not your idea; ask about specific things that have already happened, not opinions or the future; talk little and listen a lot.** The one most often forgotten is the third: if you talked for more than half the time, you were selling.
:::

**3. Which answers feel like data and aren't?**

:::Show the answer
**Compliments, generalities ("always", "usually") and promises about the future ("I'd use it").** And feature requests, which are clues, not requirements. The response to all of them is to steer towards a concrete fact.
:::

**4. What are the currencies someone commits with?**

:::Show the answer
**Time, reputation and money.** A conversation where you had something to propose was useful if the other person put one of the three into the next step.
:::

**5. Someone tells you "it should have an export button". What do you do?**

:::Show the answer
**Ask what for.** "What would you do with that which you can't do today?" Behind a feature request there's a problem, and it's often solved another way or doesn't weigh as much as it seemed.
:::

## What usually gets forgotten

What sticks most is "ask about the past". What gets lost most is the second half: that once you have something to propose, every conversation has to end by asking for a concrete step. Without it, you can ask flawless questions and still come back with twelve lovely chats and no commitment.

The other thing that gets lost is the tone. The book doesn't propose a formal interview with a script and a recorder: it proposes short, casual conversations, where the other person doesn't feel they're assessing your project. The more it feels like an exam of your idea, the more compliments you come away with.

## A case to apply it to

You're asked to "validate" a new tool for writing pupil reports with ten teachers. You come back with a summary: "everyone loved it, several said they'd use it". What is that summary missing?

:::Show the answer
**Everything useful.** It's compliments and promises. The facts are missing (how long the reports took last time, what they use today, what got complicated) and so is commitment: how many agreed to try it with their real reports next term? If none, the honest summary is "we don't know yet", not "validated".
:::

## What to do this week

Find the last summary of a conversation, survey or meeting in which someone "validated" something. Cross out the compliments and the promises. Look at what's left.
$md$,
  7
from books b where b.slug = 'the-mom-test'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Fitzpatrick with Cagan and Dunford',
$md$
If it's fresh, the most useful thing is to cross it with the library's two product books.

**Cagan** (*Inspired*): every product has four risks (value, usability, technical feasibility and business viability), value is the one that kills most projects, and you find out before building, with cheap prototypes.

**Dunford** (*Obviously Awesome*): positioning starts with the real alternative, which is almost never a competitor but what the person does today.

Before going on, a test. Without rereading: **which of Cagan's risks does Fitzpatrick tackle?**

:::Show the answer
**Value.** Does the problem exist? Does it weigh on someone enough to change what they do? When you ask for money as a commitment, it also touches business viability. Not usability: that isn't found out by talking, it's found out by watching someone use something.
:::

## Where they meet, and where they don't

**With Dunford they agree on the question.** "How do you handle it today?" is Fitzpatrick's central question and it's the one that gives you the real alternative Dunford needs. A good round of Mom Test conversations leaves you, along the way, with the raw material for positioning.

**With Dunford they disagree on timing.** Fitzpatrick asks you not to present your idea while you're learning. Dunford is precisely about how to present it. They don't contradict each other: Dunford's method starts with customers who already love the product, and Fitzpatrick works before those customers exist.

**With Cagan they agree on distrusting what people say.** But each takes a different way out. Cagan prefers a prototype and watching what the person does. Fitzpatrick prefers facts from the past and commitments. Now that a prototype can be built in an afternoon, the temptation is to skip the conversations. The risk is that showing a prototype is presenting your idea, and what comes back is compliments.

## What the book doesn't prove

It's a book of experience, not research. The examples come from software start-ups, there's no data on how much it improves decisions, and asking about past behaviour isn't his invention: user research has practised it for decades. His contribution is making it practical.

It has two limits worth keeping in mind. The past is also remembered badly: people reconstruct, round off and forget. And a commitment measures intention with a cost, not use: someone who leaves a deposit wants to try, not necessarily to stay. Besides, ten conversations with people you know aren't a sample: they're the people who happened to be nearby.

## A situation to decide

You have a fortnight to decide whether to build a support service for families arriving from abroad. Options: (a) ten conversations about how their arrival went, (b) build in an afternoon a prototype of the service's web page and show it to ten families, (c) send a survey to 300 families asking whether they'd be interested. What would each author do?

:::Show the answer
**Fitzpatrick: (a) first.** Facts about their arrival, without mentioning the service. (b) only afterwards, ending each conversation with a concrete request.

**Cagan: (b) works for him,** as long as you watch what they do with the prototype rather than asking whether they like it. He'd see the conversations in (a) as a good, cheap way to check value beforehand.

**Dunford: (a)** gives her the real alternative (whom they asked, what they sorted out alone), which is what she'll need to present the service later.

(c) is the least useful to all three: it's three hundred promises about the future.
:::

## What to do this week

Pick something you're about to propose. Write down the three questions Fitzpatrick would ask, the prototype Cagan would build and the real alternative Dunford would look for. Start with whichever costs you least.
$md$,
  8
from books b where b.slug = 'the-mom-test'
on conflict do nothing;
