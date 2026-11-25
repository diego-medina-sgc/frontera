-- ============================================================
-- 074 · Libro: Crucial Conversations (Patterson, Grenny, McMillan
--       y Switzler)
-- ============================================================
-- Tema "comunicacion" y "equipos". Completa a Scott y a Voss: Scott
-- enseña a decir una crítica corta y pronto; Voss, a escuchar para
-- negociar; este libro, qué hacer cuando la conversación es de las
-- que importan, hay desacuerdo y las emociones suben, y la meta no es
-- ganar sino decidir juntos con toda la información arriba de la mesa.
--
-- Verificado en Open Library el 24/11:
--   · obra OL282391W, Kerry Patterson, Joseph Grenny, Ron McMillan y
--     Al Switzler. OL marca first_publish_year 2001 (una ficha de
--     McGraw-Hill sin fecha precisa), pero las ediciones con tapa son
--     de junio de 2002 (McGraw-Hill); se usa 2002;
--   · edición en castellano "Conversaciones cruciales" (Empresa
--     Activa, 2004, ISBN 9788495787392, obra OL35324177W); hay
--     ediciones revisadas posteriores de la misma editorial;
--   · tapa 58194, la edición McGraw-Hill de junio de 2002, blanca
--     con letras rojas y prólogo de Stephen R. Covey (mirada).
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto. Los
-- casos con números son hipotéticos y lo dicen. Cinco piezas por
-- idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'crucial-conversations',
  'Crucial Conversations',
  'Kerry Patterson y otros',
  2002,
  array['comunicacion', 'equipos'],
  'Conversaciones cruciales',
  58194,
  array[
    'conversaciones difíciles','conversación difícil','reunión con familias','familias','padres',
    'reclamo','reclamos','conflicto','desacuerdo','discusión','colegas','tensión',
    'acuerdos','seguimiento','decir las cosas','difficult conversations','conflict','disagreement'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Cuándo una conversación es crucial',
$md$
Los cuatro autores trabajaban en consultoría y formación de equipos, y el libro sale de mirar qué hacía distinta a la gente que manejaba bien los momentos tensos. Lo primero que hacen es definir de qué conversaciones hablan. Una conversación es crucial cuando se juntan tres cosas:

- **Las opiniones son distintas.**
- **Hay mucho en juego.**
- **Las emociones están fuertes.**

Con una sola de las tres, es una charla. Con las tres, es justo la conversación que peor manejamos, porque es cuando más nos cuesta pensar.

La idea que ordena todo el libro: **cada persona llega con su propia información, y una buena conversación es la que junta toda esa información en un fondo común antes de decidir.** Los autores lo llaman el fondo común de significado. Cuanto más completo está, mejores son las decisiones, y más se comprometen con ellas quienes participaron, porque pusieron algo.

## Un caso trabajado

Hipotético. Un colegio tiene **4 vacantes** en segundo grado y **9 pedidos** de familias que ya tienen un hijo en el colegio y quieren sumar al hermano. Se reúnen quien coordina admisiones y quien dirige primaria. Las tres condiciones están: no piensan lo mismo, hay familias que se pueden ir, y los dos llegan cansados de discutirlo por mail.

La reunión dura veinte minutos. Admisiones propone abrir un cupo extra; primaria dice que no y se decide que no. Nadie dijo lo que sabía:

- Admisiones sabía que **3 de esas 9 familias** habían dicho que si no entraba el hermano, se llevaban a los dos.
- Primaria sabía que el grado ya tenía **2 chicos con acompañamiento** y que pasar de 28 a 29 alumnos la preocupaba por eso, no por el número.

Con las dos cosas arriba de la mesa, había opciones que nadie vio: priorizar a esas 3 familias en las 4 vacantes, o abrir el cupo extra con una pareja pedagógica. Con el fondo vacío, la decisión salió igual de rápida y peor. Y a los dos meses, cuando una de esas familias se fue, cada uno pensó que el otro tenía la culpa.

## Dónde no aplica

**No toda conversación incómoda es crucial.** Si hay poco en juego, pasarle la herramienta completa es un exceso: alcanza con decirlo y seguir.

**Juntar el fondo no es decidir por consenso.** Que todos pongan lo que saben no quiere decir que todos decidan. Alguien puede tener la última palabra; lo que el libro pide es que la use con toda la información.

**Cuando hay una emergencia,** no hay tiempo para juntar nada. Se actúa, y la conversación viene después.

## Probá que lo entendiste

¿Cuál de estas es una conversación crucial?

1. Decidir con un colega a qué hora empieza la reunión de padres. Ninguno de los dos tiene problema con ninguna hora.
2. Decirle a una familia que su hijo no va a pasar de año, y la familia ya avisó que no lo va a aceptar.
3. Elegir con el equipo el color de las carpetas de la jornada de puertas abiertas. Hay dos opiniones y alguna risa.

:::Ver la respuesta
**Sólo la 2.** Tiene las tres condiciones: opiniones distintas, mucho en juego y emociones fuertes.

**La 1** no tiene ninguna: no hay desacuerdo, no hay nada en juego.

**La 3** tiene opiniones distintas, pero poco en juego y nada de tensión. Es una charla, y hay que tratarla como charla.
:::

## Qué hacer esta semana

Pensá en la próxima conversación difícil que tenés en agenda. Antes de entrar, escribí dos listas: lo que vos sabés y la otra persona probablemente no, y lo que ella sabe y vos no. Si la segunda está vacía, todavía no estás listo para decidir.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Silencio o violencia',
$md$
Cuando una conversación se pone difícil, el libro dice que casi todos hacemos una de dos cosas, y que ninguna sirve:

- **Silencio:** dejar de poner información en el fondo común. Se ve como disimular lo que pensás, cambiar de tema, decir "como quieras" o directamente no ir.
- **Violencia:** intentar meter tu información a la fuerza en el fondo del otro. Se ve como interrumpir, ponerle un rótulo a la persona ("son padres conflictivos"), ironizar o atacar.

La idea central: **las dos son señales de lo mismo. La otra persona (o vos) dejó de sentirse segura.** Y cuando eso pasa, no sirve insistir con el tema: hay que salir un momento del tema y restaurar la seguridad. Después se vuelve.

Los autores dicen que la seguridad depende de dos condiciones:

- **Propósito mutuo:** que el otro crea que te importa lo mismo que a él, o por lo menos que te importan sus objetivos.
- **Respeto mutuo:** que el otro sienta que lo respetás como persona. Si se siente faltado el respeto, la conversación pasa a ser sobre eso.

Para arreglarlo proponen dos herramientas cortas. **Disculparse** cuando de verdad hiciste algo que faltó el respeto. Y **contrastar**: decir qué no querés decir y después qué sí, para despejar un malentendido. "No estoy diciendo que ustedes no se ocupan de su hijo. Estoy diciendo que en el colegio vemos algo que nos preocupa y queremos verlo juntos."

## Un caso trabajado

Hipotético. Reunión de la tutora de quinto con una familia por un conflicto entre chicos en el recreo. A los cinco minutos, el padre dice: "Siempre es lo mismo con este colegio, a nuestro hijo lo tienen marcado." La tutora siente que la acusan y se defiende: le enumera las tres veces que el chico estuvo involucrado este año. El padre se calla y la madre mira el celular.

Ahí hubo violencia (el rótulo "lo tienen marcado") y después silencio (los dos callados). Y la respuesta con los datos, aunque fueran ciertos, empeoró las cosas, porque el padre no se sentía seguro, y escuchó un ataque.

Lo que se podría haber hecho: dejar el tema y restaurar. "No queremos que sientan que lo tenemos marcado. Lo que queremos es que esté bien en el recreo, que creo que es lo mismo que quieren ustedes." Propósito mutuo, dicho en voz alta. Recién después, los hechos.

## Dónde no aplica

**Contrastar no es un truco para decir algo duro.** Si el "no quiero decir" es falso, el otro se da cuenta y la seguridad baja más.

**Restaurar la seguridad no es ceder el tema.** Se sale un momento para volver; si nunca volvés, eso también es silencio.

**Hay agresiones que no se resuelven con diálogo.** Si alguien amenaza o maltrata, lo primero es cortar la reunión y cuidar a las personas, no buscar el propósito mutuo.

## Probá que lo entendiste

¿Silencio, violencia, o ninguna de las dos?

1. Una colega dice "como vos digas" y no vuelve a hablar en la reunión.
2. Un padre dice: "Ustedes no tienen idea de lo que es enseñar."
3. La coordinadora dice: "No te quiero sacar el proyecto. Quiero que lo terminemos antes del cierre, y para eso necesito saber qué te frena."

:::Ver la respuesta
**1. Silencio.** Dejó de poner lo que piensa. El acuerdo es aparente y no va a durar.

**2. Violencia.** Es un rótulo contra las personas, no un dato. Señal de que se siente inseguro, probablemente faltado el respeto.

**3. Ninguna: es contrastar.** Despeja el malentendido (qué no quiere) y nombra el propósito mutuo (qué sí quiere).
:::

## Qué hacer esta semana

En tu próxima reunión tensa, mirá menos el tema y más las señales. La primera vez que veas silencio o violencia, en vos o en el otro, pará y preguntate qué condición se rompió: propósito o respeto. Decí una frase que la restaure antes de seguir.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Tu versión, sin imponerla',
$md$
Restaurar la seguridad no alcanza: en algún momento tenés que decir lo que pensás, y lo que pensás puede ser incómodo. El libro propone un orden para hacerlo, y la idea que lo sostiene es esta: **empezá por los hechos, después decí tu conclusión como tuya y no como verdad, y pedí la del otro.**

Lo explican con un camino que todos recorremos sin darnos cuenta: vemos o escuchamos algo, nos contamos una historia sobre lo que significa, esa historia nos genera una emoción, y actuamos. El problema es que cuando hablamos solemos empezar por el final: por la historia y la emoción. Y la historia es lo más discutible.

El orden que proponen:

- **Compartí los hechos.** Lo que pasó, lo que se puede verificar. Es lo menos discutible y lo que menos ofende.
- **Contá tu historia.** La conclusión que sacaste, dicha como conclusión: "empiezo a pensar que...".
- **Preguntá por la del otro.** De verdad, queriendo escucharla.
- **Hablá en tono tentativo.** No es dudar: es dejar lugar a que estés equivocado.
- **Invitá a que te contradigan.** "Si lo ves distinto, decímelo."

## Un caso trabajado

Hipotético. Quien coordina admisiones siente que secundaria no le da importancia a las entrevistas de ingreso. La versión que le sale primero, la historia: "A ustedes las entrevistas de admisión no les importan."

La versión en orden:

- **Hechos:** "En las últimas cinco semanas pedimos **12 entrevistas** con secundaria y **7** se reprogramaron, cuatro de ellas el mismo día."
- **Historia, como propia:** "Eso me hace pensar que las entrevistas quedan al final de la lista de prioridades."
- **Pregunta:** "¿Cómo lo ves vos? Capaz hay algo que no estoy viendo."

7 de 12 es casi el 60%, y es un número que nadie discute. La conclusión sí se puede discutir, y por eso se dice después. En este caso la otra persona contesta algo que admisiones no sabía: las entrevistas caen siempre en la franja de las reuniones de departamento.

Y el cierre, que el libro trata como parte de la conversación: **quién hace qué y para cuándo, y cómo se va a revisar.** "Vos me pasás el viernes las franjas libres de las próximas seis semanas; yo reagendo las 7 pendientes antes del 15; lo miramos juntos a fin de mes." Sin esa frase, el acuerdo se evapora al salir.

## Dónde no aplica

**Tentativo no quiere decir sin contenido.** Si suavizás tanto que no se entiende lo que pensás, volviste al silencio.

**Hay hechos que no admiten "capaz me equivoco".** Si hay un riesgo para un chico o una falta grave, la conclusión se dice como conclusión.

**El cierre con fechas no sirve si nadie lo revisa.** Lo que se acordó y no se mira, en la práctica, no se acordó.

## Probá que lo entendiste

Ordená estas frases como lo propone el libro:

1. "¿Vos cómo lo ves?"
2. "Me da la sensación de que esto no te parece prioritario."
3. "Las últimas tres planillas llegaron después de la fecha."

:::Ver la respuesta
**3, 2, 1.** Primero el hecho (las planillas, con fecha), después la historia dicha como tuya (la sensación), después la pregunta.

El error típico es empezar por la 2: es lo que más te pesa, pero es lo más discutible, y pone al otro a defenderse antes de saber de qué se habla.
:::

## Qué hacer esta semana

Elegí algo que tengas que decirle a alguien y escribilo en tres renglones: un hecho verificable, tu conclusión con "me hace pensar que", y una pregunta. Al terminar la conversación, cerrá con quién hace qué y para cuándo, y mandalo por escrito ese mismo día.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Qué tres condiciones hacen que una conversación sea crucial?**

:::Ver la respuesta
**Opiniones distintas, mucho en juego y emociones fuertes.** Las tres juntas. Con una sola es una charla, y tratarla como crucial es un exceso.
:::

**2. ¿Qué es el fondo común de significado, y por qué importa?**

:::Ver la respuesta
**La información que cada uno pone sobre la mesa.** Cuanto más completo está, mejores son las decisiones y más se comprometen con ellas quienes participaron. El diálogo, para el libro, es justamente llenar ese fondo.
:::

**3. ¿Cuáles son las dos reacciones típicas cuando la conversación se pone difícil?**

:::Ver la respuesta
**Silencio y violencia.** Silencio es dejar de poner información (disimular, evitar, retirarse). Violencia es meterla a la fuerza (controlar, rotular, atacar). Las dos son señal de que alguien dejó de sentirse seguro.
:::

**4. ¿De qué dos condiciones depende la seguridad?**

:::Ver la respuesta
**Propósito mutuo y respeto mutuo.** Que el otro crea que te importan sus objetivos y que sienta que lo respetás. Si se rompe una, salís del tema, la restaurás y recién después volvés.
:::

**5. ¿En qué orden se cuenta la propia versión?**

:::Ver la respuesta
**Primero los hechos, después tu historia dicha como tuya, después la pregunta por la del otro**, en tono tentativo y pidiendo que te contradigan. Y la conversación termina con quién hace qué, para cuándo y cómo se revisa.
:::

## Lo que suele borrarse

Lo que más se borra es el camino de la historia: entre lo que ves y lo que sentís hay una historia que te contaste vos. Los autores insisten en que esa historia se puede revisar antes de abrir la boca. Si la emoción es muy fuerte, preguntate qué hechos tenés y qué parte es interpretación tuya. Muchas veces la parte que te enoja es la que agregaste.

También se borra que el libro empieza por uno mismo: antes de la conversación, preguntarte qué querés de verdad, para vos, para el otro y para la relación. Sin eso, es fácil terminar queriendo ganar.

## Un caso para aplicarlo

Una colega mandó a las familias un comunicado sobre una salida sin pasártelo, y tenía un error en el horario. Te enteraste por una familia. Lo primero que pensás es "lo hizo a propósito para dejarme afuera". ¿Qué hacés antes de hablar con ella, y cómo empezás?

:::Ver la respuesta
**Antes:** separar el hecho (el comunicado salió sin pasar por vos, con un horario equivocado) de la historia ("lo hizo a propósito"). La historia es tuya y no tenés datos que la confirmen.

**Al empezar:** el hecho primero, la historia como tuya y una pregunta. "El comunicado de la salida salió sin que lo viera, y tenía mal el horario. Me quedé pensando si hay algo en cómo nos coordinamos que no funciona. ¿Qué pasó?" Y cerrar con quién avisa a las familias, cuándo, y cómo se van a pasar los comunicados de acá en adelante.
:::

## Qué hacer esta semana

La próxima vez que algo te enoje en el trabajo, escribí en dos columnas: qué pasó y qué te contaste sobre lo que pasó. Mirá cuánto de la segunda columna está en la primera.
$md$,
  7
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Patterson contra Scott y Voss',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con los otros dos libros de conversaciones difíciles de la biblioteca.

**Scott** (*Radical Candor*): que te importe la persona y desafiarla de frente, las dos cosas juntas. Crítica corta, pronto y en privado.

**Voss** (*Never Split the Difference*): en una negociación, el otro se mueve cuando siente que lo entendiste. Espejos, etiquetas, preguntas abiertas.

Antes de seguir, una prueba. Sin releer: **¿qué tienen en común el propósito mutuo de Patterson y el "que te importe" de Scott?**

:::Ver la respuesta
**Son la misma condición vista de dos lados.** Para Scott, una crítica funciona si la persona sabe que te importa. Para Patterson, una conversación sigue siendo segura si el otro cree que te importan sus objetivos. En los dos, lo que se dice depende de que el otro confíe en para qué lo decís.
:::

## Dónde se tocan, y dónde no

**Con Scott coinciden en no elegir entre franqueza y cuidado.** Los dos rechazan la idea de que hay que elegir entre decir la verdad y cuidar la relación. Patterson le pone nombre a esa falsa elección y propone salir de ella preguntándose cómo conseguir las dos cosas. La diferencia es el tamaño: Scott piensa en la devolución de todos los días, que se resuelve en dos minutos; Patterson, en la conversación grande, con emociones, que hay que preparar.

**Con Voss coinciden en escuchar primero, y difieren en para qué.** Los dos piden explorar lo que el otro piensa antes de convencerlo, y los dos usan algo parecido al espejo y al parafraseo. Pero Voss negocia: hay un otro lado, y escuchar es la forma de conseguir un mejor acuerdo para el tuyo. Patterson busca llenar un fondo común para decidir juntos, y desconfía de cualquier técnica que se use para ganar. Con una familia que reclama, la diferencia importa: no es lo mismo cerrar el reclamo que entender qué pasó.

## Lo que el libro no prueba

Conviene decirlo: la evidencia que presenta viene sobre todo de los propios autores, de sus observaciones y de estudios de su empresa de formación, no de investigación independiente publicada con revisión de pares. Eso no quiere decir que esté mal, pero sí que las afirmaciones de impacto (en resultados, en productividad) hay que leerlas como las de un libro que también vende capacitaciones.

Y el modelo supone que las dos personas pueden hablar de igual a igual. Con una diferencia de poder grande, o cuando alguien no quiere dialogar, las herramientas ayudan menos de lo que el libro sugiere.

## Una situación para decidir

Una familia pide una reunión porque está muy enojada: dice que nadie le avisó que su hija estaba bajando las notas. Tenés que elegir cómo arrancar: (a) mostrar los tres avisos que el colegio mandó por la plataforma, o (b) decir que entendés el enojo y que querés lo mismo que ellos, que a la chica le vaya bien. ¿Qué diría cada autor?

:::Ver la respuesta
**Patterson: la (b) primero.** El enojo es señal de que la familia no se siente segura. Restaurar el propósito mutuo, y recién después los hechos, que incluyen los avisos.

**Voss: también la (b), con una etiqueta.** "Parece que sienten que se enteraron tarde." Y dejar que hablen antes de cualquier explicación.

**Scott: la (b), y sin esconder la (a).** Que te importe, y después decir de frente lo que pasó, avisos incluidos.

Los tres coinciden en que mostrar los avisos primero gana la discusión y pierde a la familia.
:::

## Qué hacer esta semana

De los tres libros, elegí la herramienta que más te falta en las conversaciones con familias y usala en la próxima reunión. Una sola.
$md$,
  8
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'When a conversation is crucial',
$md$
The four authors worked in consulting and team training, and the book comes from watching what set apart the people who handled tense moments well. The first thing they do is define which conversations they mean. A conversation is crucial when three things come together:

- **Opinions differ.**
- **The stakes are high.**
- **Emotions run strong.**

With only one of the three, it's a chat. With all three, it's exactly the conversation we handle worst, because it's when thinking clearly is hardest.

The idea that organises the whole book: **each person arrives with their own information, and a good conversation is one that gathers all of it into a shared pool before deciding.** The authors call it the pool of shared meaning. The fuller it is, the better the decisions, and the more committed the people who took part, because they put something in.

## A worked case

Hypothetical. A school has **4 places** in Year 3 and **9 requests** from families who already have a child at the school and want to add a sibling. The admissions coordinator and the head of primary meet. All three conditions are there: they disagree, families might leave, and both arrive tired of arguing about it by email.

The meeting lasts twenty minutes. Admissions proposes opening an extra place; primary says no, and the answer is no. Nobody said what they knew:

- Admissions knew that **3 of those 9 families** had said that if the sibling didn't get in, they'd take both children elsewhere.
- Primary knew the class already had **2 children with additional support**, and that going from 28 to 29 pupils worried her because of that, not because of the number.

With both on the table, there were options nobody saw: prioritising those 3 families for the 4 places, or opening the extra place with a second adult in the classroom. With the pool empty, the decision came just as quickly and worse. And two months later, when one of those families left, each blamed the other.

## Where it doesn't apply

**Not every uncomfortable conversation is crucial.** If little is at stake, running the full toolkit is overkill: say it and move on.

**Filling the pool isn't deciding by consensus.** Everyone putting in what they know doesn't mean everyone decides. Someone may have the final word; what the book asks is that they use it with all the information.

**In an emergency,** there's no time to gather anything. You act, and the conversation comes afterwards.

## Check you've got it

Which of these is a crucial conversation?

1. Agreeing with a colleague what time the parents' meeting starts. Neither minds which time.
2. Telling a family their child won't move up a year, when the family has already said they won't accept it.
3. Choosing with the team the colour of the folders for the open day. There are two opinions and some laughter.

:::Show the answer
**Only 2.** It has all three conditions: differing opinions, high stakes and strong emotions.

**1** has none: no disagreement, nothing at stake.

**3** has differing opinions, but little at stake and no tension. It's a chat, and should be treated as one.
:::

## What to do this week

Think of the next difficult conversation in your diary. Before you go in, write two lists: what you know that the other person probably doesn't, and what they know that you don't. If the second list is empty, you're not ready to decide yet.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Silence or violence',
$md$
When a conversation turns difficult, the book says almost all of us do one of two things, and neither works:

- **Silence:** no longer putting information into the shared pool. It looks like hiding what you think, changing the subject, saying "whatever you like" or simply not turning up.
- **Violence:** trying to force your information into the other person's pool. It looks like interrupting, labelling the person ("they're difficult parents"), sarcasm or attack.

The central idea: **both are signs of the same thing. The other person (or you) has stopped feeling safe.** And when that happens, pressing on with the topic doesn't help: you step out of the topic for a moment and restore safety. Then you go back.

The authors say safety depends on two conditions:

- **Mutual purpose:** the other person believes you care about the same thing they do, or at least about their goals.
- **Mutual respect:** the other person feels you respect them as a person. If they feel disrespected, the conversation becomes about that.

To fix it they offer two short tools. **Apologise** when you really did something disrespectful. And **contrast**: say what you don't mean and then what you do, to clear up a misunderstanding. "I'm not saying you don't look after your son. I'm saying we're seeing something at school that worries us and we want to look at it together."

## A worked case

Hypothetical. The Year 6 form tutor meets a family about a playground conflict between children. Five minutes in, the father says: "It's always the same with this school, you've got our son marked." The tutor feels accused and defends herself: she lists the three times the boy has been involved this year. The father goes quiet and the mother looks at her phone.

There was violence (the label "you've got him marked") and then silence (both of them quiet). And the answer with the facts, even though they were true, made things worse, because the father didn't feel safe, and he heard an attack.

What could have been done: leave the topic and restore. "We don't want you to feel we've got him marked. What we want is for him to be all right at break, which I think is what you want too." Mutual purpose, said out loud. Only then, the facts.

## Where it doesn't apply

**Contrasting isn't a trick for saying something harsh.** If the "I don't mean" is false, the other person notices and safety drops further.

**Restoring safety isn't giving up the topic.** You step out in order to come back; if you never come back, that's silence too.

**Some aggression can't be solved with dialogue.** If someone threatens or abuses, the first thing is to end the meeting and look after people, not to look for mutual purpose.

## Check you've got it

Silence, violence, or neither?

1. A colleague says "whatever you say" and doesn't speak again in the meeting.
2. A parent says: "You people have no idea what teaching is."
3. The coordinator says: "I don't want to take the project off you. I want us to finish it before the deadline, and for that I need to know what's holding you up."

:::Show the answer
**1. Silence.** She stopped putting in what she thinks. The agreement is only apparent and won't last.

**2. Violence.** It's a label aimed at people, not a fact. A sign he feels unsafe, probably disrespected.

**3. Neither: it's contrasting.** It clears the misunderstanding (what she doesn't want) and names the mutual purpose (what she does).
:::

## What to do this week

In your next tense meeting, watch the topic less and the signs more. The first time you see silence or violence, in yourself or the other person, stop and ask which condition broke: purpose or respect. Say one sentence that restores it before carrying on.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Your view, without imposing it',
$md$
Restoring safety isn't enough: at some point you have to say what you think, and what you think may be uncomfortable. The book proposes an order for doing it, and the idea behind it is this: **start with the facts, then give your conclusion as yours rather than as the truth, and ask for the other person's.**

They explain it with a path we all walk without noticing: we see or hear something, we tell ourselves a story about what it means, that story produces a feeling, and we act. The problem is that when we speak we tend to start at the end: with the story and the feeling. And the story is the most debatable part.

The order they propose:

- **Share the facts.** What happened, what can be checked. It's the least debatable part and the least offensive.
- **Tell your story.** The conclusion you've drawn, said as a conclusion: "I'm starting to think that...".
- **Ask for theirs.** Genuinely, wanting to hear it.
- **Speak tentatively.** It isn't doubting: it's leaving room for you to be wrong.
- **Invite them to disagree.** "If you see it differently, tell me."

## A worked case

Hypothetical. The admissions coordinator feels that the senior school doesn't take entrance interviews seriously. The version that comes out first, the story: "You lot don't care about admissions interviews."

The version in order:

- **Facts:** "Over the last five weeks we requested **12 interviews** with the senior school and **7** were rescheduled, four of them on the day."
- **Story, as their own:** "That makes me think interviews end up at the bottom of the priority list."
- **Question:** "How do you see it? There may be something I'm missing."

7 out of 12 is nearly 60%, and nobody disputes the number. The conclusion can be disputed, which is why it comes second. In this case the other person says something admissions didn't know: the interviews always fall in the slot for department meetings.

And the close, which the book treats as part of the conversation: **who does what by when, and how it will be checked.** "You send me the free slots for the next six weeks by Friday; I rebook the 7 outstanding ones before the 15th; we look at it together at the end of the month." Without that sentence, the agreement evaporates on the way out.

## Where it doesn't apply

**Tentative doesn't mean empty.** If you soften it so much that nobody can tell what you think, you're back to silence.

**Some facts don't allow "I might be wrong".** If a child is at risk or there's serious misconduct, the conclusion is stated as a conclusion.

**A close with dates is useless if nobody checks it.** What was agreed and never looked at, in practice, wasn't agreed.

## Check you've got it

Put these sentences in the order the book proposes:

1. "How do you see it?"
2. "I get the feeling this isn't a priority for you."
3. "The last three spreadsheets arrived after the deadline."

:::Show the answer
**3, 2, 1.** First the fact (the spreadsheets, with a date), then the story said as yours (the feeling), then the question.

The usual mistake is to start with 2: it's what weighs on you most, but it's the most debatable, and it puts the other person on the defensive before they know what it's about.
:::

## What to do this week

Pick something you need to say to someone and write it in three lines: a checkable fact, your conclusion with "that makes me think", and a question. When the conversation ends, close with who does what by when, and put it in writing the same day.
$md$,
  9
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. Which three conditions make a conversation crucial?**

:::Show the answer
**Differing opinions, high stakes and strong emotions.** All three together. With just one it's a chat, and treating it as crucial is overkill.
:::

**2. What is the pool of shared meaning, and why does it matter?**

:::Show the answer
**The information each person puts on the table.** The fuller it is, the better the decisions and the more committed the people who took part. Dialogue, for the book, is precisely filling that pool.
:::

**3. What are the two typical reactions when the conversation turns difficult?**

:::Show the answer
**Silence and violence.** Silence is withholding information (masking, avoiding, withdrawing). Violence is forcing it in (controlling, labelling, attacking). Both are signs that someone has stopped feeling safe.
:::

**4. Which two conditions does safety depend on?**

:::Show the answer
**Mutual purpose and mutual respect.** The other person believes you care about their goals and feels you respect them. If one breaks, you step out of the topic, restore it, and only then go back.
:::

**5. In what order do you give your own view?**

:::Show the answer
**Facts first, then your story said as yours, then the question about theirs**, tentatively and inviting disagreement. And the conversation ends with who does what, by when, and how it will be checked.
:::

## What tends to fade

What fades most is the path of the story: between what you see and what you feel there's a story you told yourself. The authors insist that story can be checked before you open your mouth. If the feeling is very strong, ask yourself which facts you have and which part is your interpretation. Often the part that makes you angry is the part you added.

What also fades is that the book starts with yourself: before the conversation, asking what you really want, for yourself, for the other person and for the relationship. Without that, it's easy to end up wanting to win.

## A case to apply it

A colleague sent families a letter about a trip without showing it to you, and the time on it was wrong. You found out from a family. Your first thought is "she did it on purpose to leave me out". What do you do before speaking to her, and how do you start?

:::Show the answer
**Before:** separate the fact (the letter went out without passing through you, with the wrong time) from the story ("she did it on purpose"). The story is yours and you have no evidence for it.

**To start:** the fact first, the story as yours and a question. "The trip letter went out without my seeing it, and the time was wrong. It made me wonder whether something in how we coordinate isn't working. What happened?" And close with who tells the families, by when, and how letters will be shared from now on.
:::

## What to do this week

Next time something at work makes you angry, write two columns: what happened and what you told yourself about what happened. See how much of the second column is in the first.
$md$,
  7
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Patterson against Scott and Voss',
$md$
If it's fresh in your mind, the most useful thing is to cross it with the other two books on difficult conversations in the library.

**Scott** (*Radical Candor*): care personally and challenge directly, both together. Criticism that's short, prompt and private.

**Voss** (*Never Split the Difference*): in a negotiation, the other side moves when they feel understood. Mirrors, labels, open questions.

Before going on, a test. Without rereading: **what do Patterson's mutual purpose and Scott's "care personally" have in common?**

:::Show the answer
**They're the same condition seen from two sides.** For Scott, criticism works if the person knows you care. For Patterson, a conversation stays safe if the other person believes you care about their goals. In both, what you say depends on the other person trusting why you're saying it.
:::

## Where they meet, and where they don't

**With Scott they agree on not choosing between candour and care.** Both reject the idea that you must choose between telling the truth and protecting the relationship. Patterson gives that false choice a name and proposes escaping it by asking how to get both. The difference is scale: Scott thinks of everyday feedback, sorted in two minutes; Patterson, of the big conversation, with emotions, that needs preparing.

**With Voss they agree on listening first, and differ on why.** Both ask you to explore what the other person thinks before persuading them, and both use something like mirroring and paraphrasing. But Voss negotiates: there's another side, and listening is how you get a better deal for yours. Patterson aims to fill a shared pool in order to decide together, and distrusts any technique used to win. With a family making a complaint, the difference matters: closing the complaint isn't the same as understanding what happened.

## What the book doesn't prove

It's worth saying: the evidence it presents comes mainly from the authors themselves, from their observations and from studies by their own training company, not from independent peer-reviewed research. That doesn't make it wrong, but it does mean the claims about impact (on results, on productivity) should be read as those of a book that also sells training.

And the model assumes both people can speak as equals. With a large power gap, or when someone doesn't want dialogue, the tools help less than the book suggests.

## A situation to decide

A family asks for a meeting because they're very angry: they say nobody told them their daughter's marks were falling. You have to choose how to start: (a) show the three notices the school sent through the platform, or (b) say you understand the anger and want the same as them, for their daughter to do well. What would each author say?

:::Show the answer
**Patterson: (b) first.** The anger is a sign the family doesn't feel safe. Restore mutual purpose, and only then the facts, notices included.

**Voss: also (b), with a label.** "It sounds like you feel you found out late." And let them talk before any explanation.

**Scott: (b), without hiding (a).** Care, and then say directly what happened, notices included.

All three agree that showing the notices first wins the argument and loses the family.
:::

## What to do this week

Of the three books, pick the tool you most lack in conversations with families and use it in your next meeting. Just one.
$md$,
  8
from books b where b.slug = 'crucial-conversations'
on conflict do nothing;
