-- ============================================================
-- 069 · Décimo libro: Radical Candor (Kim Scott)
-- ============================================================
-- Precarga del 24/11. Tema "equipos", el que `libros.mjs` marca con
-- más pulgar y menos libros. Completa a Lencioni: él dice que hace
-- falta conflicto entre pares; ella, cómo se dice una crítica para
-- que sirva.
--
-- Verificado en Open Library el 24/11:
--   · obra OL17803541W, 2017, Kim Scott;
--   · edición en castellano "Franqueza radical" (Planeta Mexicana);
--   · tapa 8088432, la naranja en inglés (mirada).
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto.
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'radical-candor',
  'Radical Candor',
  'Kim Scott',
  2017,
  array['equipos', 'liderazgo'],
  'Franqueza radical',
  8088432,
  array[
    'equipo','equipos','a cargo','personas a cargo','jefe','jefa','coordino','coordinar',
    'devolución','devoluciones','feedback','crítica','evaluación','evaluaciones',
    'conversaciones difíciles','decir las cosas','team','lead','manage'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Que te importe, y decirlo',
$md$
Kim Scott dirigió equipos en Google y en Apple, y el libro sale de una pregunta que cualquiera que coordina gente se hizo alguna vez: ¿por qué es tan difícil decirle a alguien que algo no está bien?

Su respuesta es un cuadro de dos ejes:

- **Que te importe la persona.** No como gesto: que de verdad te importe cómo le va, más allá del trabajo.
- **Desafiarla de frente.** Decirle lo que no está bien, directamente, aunque sea incómodo.

La idea central: **las dos cosas juntas no se restan, se necesitan.** Decirle algo difícil a alguien es una forma de que te importe. Y cruzando los dos ejes salen cuatro formas de comportarse:

- **Franqueza radical:** te importa y lo decís. Es el objetivo.
- **Empatía ruinosa:** te importa, pero no lo decís, para no lastimar. Scott dice que es la más común de todas.
- **Agresión odiosa:** lo decís, pero no te importa la persona. Es la crítica que humilla.
- **Insinceridad manipuladora:** ni te importa ni lo decís. Es el elogio falso y el comentario por la espalda.

## Un caso trabajado

Alguien del equipo de admisiones manda los mails a las familias con un error que se repite: no dice la fecha de la próxima entrevista, y las familias tienen que volver a escribir para preguntarla. Manda unos **8 mails por día**.

Quien coordina lo nota en la primera semana. No dice nada para no incomodar: es nueva, viene esforzándose, ya va a darse cuenta. Eso es empatía ruinosa, y tiene una cuenta. A 8 mails por día, en **seis meses** de días hábiles son unos **960 mails** con el mismo error y casi otros tantos mensajes de vuelta de familias preguntando la fecha.

Y cuando finalmente se lo dicen, en la evaluación de fin de año, la persona pregunta lo obvio: ¿por qué nadie me lo dijo antes?

La conversación de franqueza radical lleva dos minutos, la primera semana, en privado: "Me di cuenta de que en los mails no va la fecha de la próxima entrevista, y las familias vuelven a preguntar. ¿Lo podés sumar?".

## Dónde no aplica

**No es "decir todo lo que pienso".** El eje de que te importe es la mitad del cuadro. Sin él, lo que queda es agresión con una justificación.

**No es para todo.** Lo que se dice tiene que ser algo que la persona pueda cambiar y que importe. Una manía tuya sobre la puntuación no merece una conversación.

**Las palabras cambian según dónde estás.** Lo que en un equipo se lee como directo, en otro se lee como brusco. Scott insiste en que lo que se mide es cómo lo recibe el otro, no cómo lo dijiste vos.

## Probá que lo entendiste

¿En qué cuadrante está cada una?

1. "Muy bien la presentación", a alguien cuya presentación tuvo un error grave en los números, para no desanimarlo.
2. "Esto es un desastre, ¿cómo puede ser que no lo revisaste?", delante del equipo.
3. "Los números de la diapositiva 4 no coinciden con la planilla. ¿Lo revisamos juntos antes de mandarla?", en privado.

:::Ver la respuesta
**1. Empatía ruinosa.** Te importa cómo se siente hoy y por eso no le decís lo que necesita saber. El error se va a repetir.

**2. Agresión odiosa.** Lo dice, pero delante de todos y contra la persona, no contra el trabajo. Lo que se aprende es a esconder los errores.

**3. Franqueza radical.** Concreto, sobre el trabajo, en privado, y con una oferta de ayuda que muestra que importa.
:::

## Qué hacer esta semana

Pensá en algo que hace alguien de tu equipo y que no le dijiste por no incomodar. Calculá cuántas veces se va a repetir en un mes si no se lo decís. Si el número es grande, esta semana son dos minutos en privado.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Empezá pidiéndola',
$md$
El consejo más práctico del libro es el menos intuitivo: **antes de dar críticas, pedilas.** Si quien coordina pide que le digan lo que hace mal, y reacciona bien cuando se lo dicen, el resto aprende que en ese equipo se puede hablar. Si arranca dando críticas, lo que se aprende es que hay alguien que juzga.

Pedirlas parece fácil y no lo es. La primera vez que preguntás "¿hay algo que haga mal?", te van a decir que no. Scott propone tres cosas para que funcione:

- **Una pregunta concreta, que no se contesta con sí o no.** Algo como "¿qué es una cosa que podría hacer o dejar de hacer para que te resulte más fácil trabajar conmigo?".
- **Aguantar el silencio.** Después de preguntar, callarse. Contar mentalmente hasta seis si hace falta. El silencio incómodo es lo que hace que la otra persona hable.
- **Premiar lo que te dicen.** Agradecer, no defenderse, y que se note que cambiaste algo. Si te defendés, es la última vez que te lo dicen.

## Un caso trabajado

Quien coordina un equipo de seis empieza a hacer la pregunta al final de cada uno a uno, una vez por semana.

- **Semana 1:** las seis personas dicen que está todo bien.
- **Semana 2:** igual, pero esta vez aguanta el silencio. Una persona dice que las reuniones de los lunes son largas.
- **Semana 3:** cambia el formato del lunes a treinta minutos y lo dice: "lo cambié porque me lo dijeron". Esa semana, dos personas más le dicen algo.
- **Semana 4:** cuatro de seis le dijeron por lo menos una cosa concreta.

Lo que cambió entre la semana 1 y la 4 no es la pregunta: es que el equipo vio que decirlo servía y no costaba.

## Dónde no aplica

**No es una encuesta anónima.** Las encuestas sirven para otras cosas, pero no construyen lo que busca el libro: que se pueda decir cara a cara.

**Pedirla no te obliga a hacer todo lo que te digan.** Hay que agradecer siempre; cambiar, sólo lo que tenga sentido. Pero si nunca cambiás nada, el agradecimiento suena hueco.

**Si hay un problema de poder serio,** la pregunta no alcanza. Nadie le va a decir algo incómodo a quien decide si renueva su contrato, por más silencio que aguante. Ahí el trabajo es otro antes de este.

## Probá que lo entendiste

¿Qué pregunta tiene más chances de que te digan algo útil?

1. "¿Tenés alguna crítica para hacerme?"
2. "¿Qué es una cosa que podría hacer distinto para que te resulte más fácil trabajar conmigo?"
3. "¿Estás conforme con cómo vienen las cosas?"

:::Ver la respuesta
**La 2.** Pide una cosa concreta, no se contesta con sí o no, y pone el foco en algo que vos podés cambiar.

**La 1** se contesta con "no" en un segundo, y la palabra "crítica" pone a la defensiva a cualquiera.

**La 3** pregunta por conformidad, y la respuesta socialmente esperada es que sí.
:::

## Qué hacer esta semana

En tus próximas tres conversaciones de uno a uno, hacé la pregunta concreta al final y aguantá el silencio. Anotá qué te dijeron. Si te dicen algo, cambiá una cosa y avisá que la cambiaste porque te lo dijeron.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Corto, pronto y sobre el trabajo',
$md$
La tercera idea del libro es sobre la forma. Una crítica útil, según Scott, tiene cuatro rasgos:

- **Humilde.** Lo decís como tu lectura, no como una sentencia. Podés estar equivocado.
- **Útil.** Dice qué cambiar, no sólo qué está mal.
- **Inmediata.** En el momento o lo antes posible, no guardada para la evaluación.
- **En privado si es crítica, en público si es elogio.** Y en persona cuando se puede: por escrito, el tono se pierde.

Y una quinta que atraviesa todas: **sobre el trabajo, no sobre la persona.** "Este informe tiene un error" se puede escuchar. "Sos desprolijo" no se puede cambiar.

Scott también insiste en que el elogio importa tanto como la crítica, y que tiene que ser igual de concreto: "muy bien" no le dice a nadie qué repetir.

## Un caso trabajado

Dos formas de dar la misma devolución, en un mismo trimestre.

**Guardada para la evaluación:** quien coordina anota en marzo que una persona del equipo arma las presentaciones sin revisar los números contra la planilla. Lo dice en la evaluación de junio. Entre medio, esa persona armó **12 presentaciones**; **5** salieron con algún número mal. En la evaluación, además, se siente emboscada: ¿por qué nadie me lo dijo en marzo?

**En el momento:** la misma observación, la primera vez, en dos minutos después de la reunión: "En la diapositiva 3 el total no coincide con la planilla; antes de mandar, ¿podés cruzarlos?". De las siguientes 11 presentaciones, **1** sale con un error.

Cinco contra uno, y una evaluación en junio donde no hay sorpresas, que es lo que Scott dice que tiene que pasar: si alguien se sorprende en una evaluación, las conversaciones del año no ocurrieron.

## Dónde no aplica

**Inmediata no es en caliente.** Si estás enojado, esperá a que se te pase. Pronto quiere decir el mismo día o el siguiente, no en el pasillo con la voz alterada.

**En privado no es en secreto.** Si un error afectó a todo el equipo, el equipo tiene que saber que se habló y qué cambia. Lo que no hace falta es exponer a la persona.

**Por escrito a veces es mejor.** Si la otra persona prefiere procesar sola antes de hablar, un mensaje breve y después una charla puede funcionar mejor que la conversación en frío.

## Probá que lo entendiste

¿Cuál de estas devoluciones cumple con todo?

1. En la evaluación anual: "Este año a veces te faltó prolijidad."
2. Al día siguiente, en privado: "En el mail a la familia Pérez faltó la fecha de la entrevista. ¿Lo podés completar y sumarlo a la plantilla?"
3. En la reunión de equipo: "Algunos están mandando mails incompletos. Presten atención."

:::Ver la respuesta
**La 2.** Pronto, en privado, concreta, sobre el trabajo y con qué hacer.

**La 1** llega tarde, es vaga ("a veces", "prolijidad") y habla de la persona. Nadie sabe qué cambiar.

**La 3** es pública y genérica: los que lo hacen bien se preocupan, y el que lo hace mal puede pensar que no es con él.
:::

## Qué hacer esta semana

La próxima vez que veas algo que no está bien en el trabajo de alguien, decíselo antes de que termine el día siguiente, en privado y en dos minutos. Y la próxima vez que alguien haga algo bien, decíselo delante del equipo, diciendo exactamente qué.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Cuáles son los dos ejes del cuadro?**

:::Ver la respuesta
**Que te importe la persona** y **desafiarla de frente.** Juntos dan la franqueza radical. La trampa de memoria más común es recordar sólo el segundo y quedarse con "decir las cosas de frente", que es la mitad.
:::

**2. ¿Cuál de los cuatro cuadrantes dice Scott que es el más común?**

:::Ver la respuesta
**La empatía ruinosa:** te importa la persona y por eso no le decís lo que necesita saber. Es el más común porque se siente amable. Su costo es que el error sigue y la persona se entera tarde.
:::

**3. ¿Qué conviene hacer antes de empezar a dar críticas?**

:::Ver la respuesta
**Pedirlas.** Con una pregunta concreta, aguantando el silencio y premiando lo que te dicen. Si quien coordina recibe bien una crítica, el equipo aprende que se puede hablar.
:::

**4. Una crítica, ¿en público o en privado? ¿Y un elogio?**

:::Ver la respuesta
**Crítica en privado, elogio en público.** Y las dos concretas: la crítica dice qué cambiar; el elogio, qué repetir.
:::

**5. ¿Qué dice que una evaluación anual con sorpresas sobre las conversaciones del año?**

:::Ver la respuesta
**Que no ocurrieron.** Si alguien se entera en la evaluación de algo que venía pasando hace meses, la devolución tendría que haber llegado en el momento.
:::

## Lo que suele borrarse

Si te quedó "franqueza radical es decir las cosas de frente", se te borró el eje que hace que funcione. Sin que te importe la persona, decir las cosas de frente es el cuadrante de la agresión, y Scott dedica bastante del libro a advertir que mucha gente lo confunde con su propuesta.

## Un caso para aplicarlo

Alguien de tu equipo es muy querido, trabaja mucho, y hace meses que entrega tarde. Nadie se lo dijo porque "está pasando un momento difícil". ¿Qué cuadrante es, y qué harías?

:::Ver la respuesta
**Empatía ruinosa**, de manual. Lo que harías: una conversación en privado, pronto, que empiece por lo que te importa ("quiero que te vaya bien acá") y diga lo concreto ("las tres últimas entregas llegaron después de la fecha, y eso frena a otros"). Y preguntar qué necesita. Importarte y decirlo, las dos cosas en la misma conversación.
:::

## Qué hacer esta semana

Pensá en las últimas tres devoluciones que diste y ubicalas en el cuadro. Si alguna cae en empatía ruinosa, todavía estás a tiempo de completarla.
$md$,
  7
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Scott contra Lencioni y Grove',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con los otros dos libros de equipos de la biblioteca.

**Lencioni** (*The Five Dysfunctions of a Team*): sin conflicto de ideas no hay compromiso, y en un buen equipo se piden cuentas los pares entre sí.

**Grove** (*High Output Management*): el uno a uno es de quien reporta, y la supervisión depende de cuán madura es la persona en esa tarea.

Antes de seguir, una prueba. Sin releer: **¿qué le agrega Scott a Lencioni?**

:::Ver la respuesta
**El cómo.** Lencioni dice que hace falta conflicto y que los pares se pidan cuentas, pero dice poco de cómo se dice una crítica para que sirva. Scott es ese manual: humilde, útil, inmediata, en privado, sobre el trabajo. Y agrega que tiene que importarte la persona, que en Lencioni está implícito en la confianza de la base.
:::

## Dónde se tocan, y dónde no

**Con Grove coinciden en el uno a uno.** Para los dos es la reunión más importante de quien coordina, y para los dos la agenda es de la otra persona. Scott agrega una cosa: usar ese espacio para pedir críticas, no sólo para darlas.

**Con Lencioni no coinciden del todo en quién habla.** Scott escribe sobre todo desde quien coordina hacia su equipo, y de vuelta. Lencioni pone el peso en los pares. En la práctica se complementan: si quien coordina practica la franqueza radical, los pares aprenden a hacerlo entre ellos.

## Lo que el libro no prueba

Conviene decirlo: es un libro de experiencia, no de investigación. Los casos son de empresas de tecnología de Estados Unidos, con culturas donde lo directo se valora. En otros lugares, la misma frase puede sonar más fuerte de lo que se quiso. Scott lo sabe y por eso insiste en que la medida es cómo lo recibe el otro; pero el libro no da mucha guía de cómo ajustarlo.

Y el riesgo más conocido: hay gente que lee "franqueza radical" y escucha permiso para ser brusca. El libro lo advierte varias veces, y aun así pasa.

## Una situación para decidir

En tu equipo nadie se dice nada incómodo. Tenés dos opciones para empezar: (a) instalar una ronda de devoluciones entre pares en la reunión mensual, o (b) empezar vos a pedir críticas en cada uno a uno durante un mes. ¿Cuál primero, según cada autor?

:::Ver la respuesta
**Scott: la (b).** Pedir antes de dar. Si quien coordina no recibe bien una crítica, nadie se va a animar a hacerlo entre pares.

**Lencioni: también la (b), por la base.** Una ronda de devoluciones sin confianza produce silencio o ataques. Primero, que quien coordina se muestre vulnerable.

**Grove: la (b) cabe en el uno a uno**, que ya es de la otra persona. La (a) le parecería razonable más adelante, como parte de la discusión abierta.

Los tres coinciden: primero, que quien coordina muestre que se puede.
:::

## Qué hacer esta semana

De los tres libros, elegí la idea que más le falta a tu equipo hoy y escribí qué harías el lunes para empezar. Una sola cosa.
$md$,
  8
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'Care, and say it',
$md$
Kim Scott led teams at Google and Apple, and the book grows out of a question anyone who manages people has asked themselves: why is it so hard to tell someone that something isn't right?

Her answer is a grid with two axes:

- **Caring personally.** Not as a gesture: genuinely caring how the person is doing, beyond the work.
- **Challenging directly.** Telling them what isn't right, straight out, even if it's uncomfortable.

The core idea: **the two together don't cancel out, they need each other.** Telling someone something difficult is a way of caring. And crossing the two axes gives four ways of behaving:

- **Radical candour:** you care and you say it. That's the goal.
- **Ruinous empathy:** you care, but you don't say it, so as not to hurt. Scott says it's the most common of all.
- **Obnoxious aggression:** you say it, but you don't care about the person. It's criticism that humiliates.
- **Manipulative insincerity:** you neither care nor say it. It's false praise and the comment behind someone's back.

## A worked case

Someone on the admissions team sends emails to families with a recurring mistake: they don't include the date of the next interview, so families have to write back to ask. They send about **8 emails a day**.

Whoever leads the team notices in the first week. They say nothing so as not to make things awkward: she's new, she's working hard, she'll notice. That's ruinous empathy, and it has a cost. At 8 emails a day, over **six months** of working days that's about **960 emails** with the same mistake and almost as many families writing back to ask for the date.

And when she's finally told, at the end-of-year review, she asks the obvious: why didn't anyone tell me before?

The radically candid conversation takes two minutes, in the first week, in private: "I've noticed the emails don't include the date of the next interview, and families are writing back to ask. Could you add it?"

## Where it doesn't apply

**It isn't "saying everything I think".** The caring axis is half the grid. Without it, what's left is aggression with a justification.

**It isn't for everything.** What's said has to be something the person can change and that matters. Your own quirk about punctuation doesn't merit a conversation.

**The words change depending on where you are.** What reads as direct in one team reads as blunt in another. Scott insists that what counts is how the other person receives it, not how you said it.

## Check you've got it

Which quadrant is each one in?

1. "Great presentation", to someone whose presentation had a serious mistake in the figures, so as not to discourage them.
2. "This is a disaster, how could you not check it?", in front of the team.
3. "The figures on slide 4 don't match the spreadsheet. Shall we check them together before sending it?", in private.

:::Show the answer
**1. Ruinous empathy.** You care how they feel today, so you don't tell them what they need to know. The mistake will happen again.

**2. Obnoxious aggression.** It's said, but in front of everyone and against the person, not the work. What people learn is to hide mistakes.

**3. Radical candour.** Concrete, about the work, in private, and with an offer of help that shows you care.
:::

## What to do this week

Think of something someone on your team does that you haven't mentioned so as not to make things awkward. Work out how many times it'll happen in a month if you don't say anything. If the number is large, this week it's two minutes in private.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Start by asking for it',
$md$
The book's most practical advice is the least intuitive: **before giving criticism, ask for it.** If whoever leads asks to be told what they're doing wrong, and reacts well when they are, everyone learns that in this team you can speak up. If they start by giving criticism, what people learn is that someone is judging.

Asking for it sounds easy and isn't. The first time you ask "is there anything I do wrong?", you'll be told no. Scott suggests three things to make it work:

- **A concrete question that can't be answered yes or no.** Something like "what's one thing I could do, or stop doing, that would make it easier to work with me?"
- **Bearing the silence.** After asking, stay quiet. Count to six in your head if you need to. The uncomfortable silence is what gets the other person talking.
- **Rewarding what you're told.** Thank them, don't defend yourself, and let it show that you changed something. If you get defensive, it's the last time you'll be told.

## A worked case

Someone leading a team of six starts asking the question at the end of each one-to-one, once a week.

- **Week 1:** all six say everything's fine.
- **Week 2:** the same, but this time they bear the silence. One person says the Monday meetings run long.
- **Week 3:** they change the Monday format to thirty minutes and say so: "I changed it because I was told". That week, two more people tell them something.
- **Week 4:** four of six have told them at least one concrete thing.

What changed between week 1 and week 4 isn't the question: it's that the team saw that saying it helped and cost nothing.

## Where it doesn't apply

**It isn't an anonymous survey.** Surveys are useful for other things, but they don't build what the book is after: being able to say it face to face.

**Asking doesn't oblige you to do everything you're told.** Always thank people; change only what makes sense. But if you never change anything, the thanks rings hollow.

**If there's a serious power problem,** the question isn't enough. Nobody will tell something uncomfortable to whoever decides whether their contract is renewed, however much silence they bear. There, other work comes first.

## Check you've got it

Which question is most likely to get you something useful?

1. "Do you have any criticism for me?"
2. "What's one thing I could do differently that would make it easier to work with me?"
3. "Are you happy with how things are going?"

:::Show the answer
**Number 2.** It asks for one concrete thing, can't be answered yes or no, and focuses on something you can change.

**Number 1** gets answered "no" in a second, and the word "criticism" puts anyone on the defensive.

**Number 3** asks about satisfaction, and the socially expected answer is yes.
:::

## What to do this week

In your next three one-to-ones, ask the concrete question at the end and bear the silence. Note what you're told. If you're told something, change one thing and let people know you changed it because they told you.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Short, soon and about the work',
$md$
The book's third idea is about form. Useful criticism, according to Scott, has four features:

- **Humble.** You say it as your reading, not as a verdict. You might be wrong.
- **Helpful.** It says what to change, not just what's wrong.
- **Immediate.** In the moment or as soon as possible, not saved for the review.
- **In private if it's criticism, in public if it's praise.** And in person where possible: in writing, tone gets lost.

And a fifth running through all of them: **about the work, not the person.** "This report has a mistake" can be heard. "You're sloppy" can't be changed.

Scott also insists that praise matters as much as criticism, and has to be just as concrete: "well done" tells nobody what to repeat.

## A worked case

Two ways of giving the same feedback, over the same term.

**Saved for the review:** in March, whoever leads notes that someone on the team builds presentations without checking the figures against the spreadsheet. They mention it at the June review. In between, that person built **12 presentations**; **5** went out with some figure wrong. At the review, they also feel ambushed: why didn't anyone tell me in March?

**In the moment:** the same observation, the first time, in two minutes after the meeting: "On slide 3 the total doesn't match the spreadsheet; before sending, could you cross-check them?" Of the next 11 presentations, **1** goes out with a mistake.

Five against one, and a June review with no surprises, which is what the book says should happen: if someone is surprised at a review, the year's conversations didn't take place.

## Where it doesn't apply

**Immediate isn't heated.** If you're angry, wait until it passes. Soon means the same day or the next, not in the corridor with a raised voice.

**Private isn't secret.** If a mistake affected the whole team, the team needs to know it was discussed and what changes. What isn't needed is exposing the person.

**Sometimes writing is better.** If the other person prefers to process alone before talking, a short message followed by a chat can work better than a cold conversation.

## Check you've got it

Which piece of feedback ticks every box?

1. At the annual review: "This year you were sometimes a bit careless."
2. The next day, in private: "The email to the Pérez family didn't include the interview date. Could you add it and put it in the template?"
3. At the team meeting: "Some people are sending incomplete emails. Please pay attention."

:::Show the answer
**Number 2.** Soon, private, concrete, about the work and with what to do.

**Number 1** comes late, is vague ("sometimes", "careless") and is about the person. Nobody knows what to change.

**Number 3** is public and generic: those who do it well worry, and the one who does it badly may think it isn't about them.
:::

## What to do this week

Next time you see something that isn't right in someone's work, tell them before the end of the following day, in private and in two minutes. And next time someone does something well, say so in front of the team, saying exactly what.
$md$,
  9
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. What are the grid's two axes?**

:::Show the answer
**Caring personally** and **challenging directly.** Together they give radical candour. The most common memory trap is keeping only the second and ending up with "telling it straight", which is half of it.
:::

**2. Which of the four quadrants does Scott say is most common?**

:::Show the answer
**Ruinous empathy:** you care about the person, so you don't tell them what they need to know. It's the most common because it feels kind. Its cost is that the mistake continues and the person finds out late.
:::

**3. What's worth doing before you start giving criticism?**

:::Show the answer
**Asking for it.** With a concrete question, bearing the silence and rewarding what you're told. If whoever leads takes criticism well, the team learns that it can speak up.
:::

**4. Criticism: in public or in private? And praise?**

:::Show the answer
**Criticism in private, praise in public.** And both concrete: criticism says what to change; praise, what to repeat.
:::

**5. What does an annual review with surprises say about the year's conversations?**

:::Show the answer
**That they didn't happen.** If someone learns at a review about something that had been going on for months, the feedback should have come in the moment.
:::

## What usually gets forgotten

If what stuck was "radical candour is telling it straight", you've lost the axis that makes it work. Without caring about the person, telling it straight is the aggression quadrant, and Scott spends a good part of the book warning that many people confuse it with what she's proposing.

## A case to apply it to

Someone on your team is well liked, works hard, and has been delivering late for months. Nobody has told them because "they're going through a difficult time". Which quadrant is it, and what would you do?

:::Show the answer
**Ruinous empathy**, textbook. What you'd do: a private conversation, soon, starting with what you care about ("I want things to go well for you here") and saying the concrete thing ("the last three deliveries came after the deadline, and that holds others up"). And asking what they need. Caring and saying it, both in the same conversation.
:::

## What to do this week

Think of the last three pieces of feedback you gave and place them on the grid. If one falls into ruinous empathy, there's still time to complete it.
$md$,
  7
from books b where b.slug = 'radical-candor'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Scott against Lencioni and Grove',
$md$
If it's fresh, the most useful thing is to cross it with the library's other two books about teams.

**Lencioni** (*The Five Dysfunctions of a Team*): without conflict over ideas there's no commitment, and in a good team peers hold each other to account.

**Grove** (*High Output Management*): the one-to-one belongs to the person reporting, and supervision depends on how mature the person is at that task.

Before going on, a test. Without rereading: **what does Scott add to Lencioni?**

:::Show the answer
**The how.** Lencioni says conflict is needed and that peers should hold each other to account, but says little about how to deliver criticism so it helps. Scott is that manual: humble, helpful, immediate, private, about the work. And she adds that you have to care about the person, which in Lencioni is implicit in the trust at the base.
:::

## Where they meet, and where they don't

**With Grove they agree on the one-to-one.** For both it's the leader's most important meeting, and for both the agenda belongs to the other person. Scott adds one thing: use that space to ask for criticism, not just give it.

**With Lencioni they don't fully agree on who speaks.** Scott writes mainly from the leader towards the team, and back. Lencioni puts the weight on peers. In practice they complement each other: if whoever leads practises radical candour, peers learn to do it with each other.

## What the book doesn't prove

It's worth saying: it's a book of experience, not research. The cases come from US technology companies, with cultures where directness is valued. Elsewhere, the same sentence can sound harsher than intended. Scott knows this and so insists the measure is how the other person receives it; but the book gives little guidance on how to adjust.

And the best-known risk: some people read "radical candour" and hear permission to be blunt. The book warns against this several times, and it still happens.

## A situation to decide

On your team nobody says anything uncomfortable to anyone. You have two options to start: (a) introduce a round of peer feedback at the monthly meeting, or (b) start asking for criticism yourself in every one-to-one for a month. Which first, according to each author?

:::Show the answer
**Scott: (b).** Ask before you give. If whoever leads doesn't take criticism well, nobody will dare do it between peers.

**Lencioni: also (b), because of the base.** A feedback round without trust produces silence or attacks. First, whoever leads shows vulnerability.

**Grove: (b) fits in the one-to-one**, which already belongs to the other person. He'd find (a) reasonable later, as part of open debate.

All three agree: first, whoever leads shows it can be done.
:::

## What to do this week

Of the three books, pick the idea your team most lacks today and write down what you'd do on Monday to start. Just one thing.
$md$,
  8
from books b where b.slug = 'radical-candor'
on conflict do nothing;
