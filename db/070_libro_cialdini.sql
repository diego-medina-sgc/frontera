-- ============================================================
-- 070 · Undécimo libro: Influence (Robert Cialdini)
-- ============================================================
-- Precarga del 24/11. Temas comunicación y marketing, al lado de
-- Made to Stick y Obviously Awesome. Para un equipo de admisiones es
-- el libro que más sirve y el más fácil de usar mal, así que las
-- piezas ponen la línea ética en el centro.
--
-- Verificado en Open Library el 24/11:
--   · obra OL3902892W, Robert B. Cialdini (primera edición, 1984);
--   · edición en castellano "Influencia: la psicología de la
--     persuasión" (HarperCollins, 2022) → title_es "Influencia";
--   · tapa 431011 (mirada).
--
-- Los casos con números son hipotéticos y lo dicen. Los estudios que
-- se nombran son los clásicos que el libro cuenta; lo que vino
-- después se atribuye como posterior.
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'influence',
  'Influence',
  'Robert B. Cialdini',
  1984,
  array['comunicacion', 'marketing'],
  'Influencia',
  431011,
  array[
    'marketing','comunicación','campaña','campañas','convencer','persuadir','familias',
    'admisiones','inscripciones','ventas','vender','clientes','jornada','mails','redes',
    'mensajes','sales','persuasion'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Los atajos que todos usamos para decir que sí',
$md$
Cialdini es psicólogo social y pasó años estudiando a quienes viven de convencer: vendedores, recaudadores, publicistas. Algunos de esos años los pasó infiltrado, aprendiendo los trucos desde adentro.

La idea del libro: **la mayoría de las veces no decidimos analizando todo, sino con atajos.** No porque seamos tontos, sino porque no hay tiempo de pensar cada decisión desde cero. Y esos atajos responden a unas pocas señales, que Cialdini ordenó en seis principios:

- **Reciprocidad:** tendemos a devolver lo que recibimos.
- **Compromiso y coherencia:** queremos ser coherentes con lo que ya dijimos o hicimos.
- **Prueba social:** si no estamos seguros, miramos qué hacen otros parecidos a nosotros.
- **Simpatía:** le decimos que sí más fácil a quien nos cae bien o se nos parece.
- **Autoridad:** confiamos en quien sabe, o parece saber.
- **Escasez:** lo que es poco o se termina parece valer más.

Los atajos funcionan casi siempre, y por eso se pueden explotar. El libro es, al mismo tiempo, una guía para persuadir y una defensa contra quien lo hace con trampa.

## Un caso trabajado

Todos los números son hipotéticos; la mecánica es la del libro. Un colegio invita por mail a **500 familias** que hicieron una consulta a la jornada de puertas abiertas.

**Mail genérico:** "Te invitamos a nuestra jornada de puertas abiertas". Se anotan **90**, el 18%.

**Mail con dos principios usados con verdad:** "El año pasado vinieron 140 familias, y la pregunta que más se repitió fue sobre el transporte: en la jornada la contesta la persona que lo coordina". Prueba social (140 familias, un dato real) y autoridad (quien sabe del tema, no un folleto). Se anotan **130**, el 26%.

Cuarenta familias más, con un mail que no dice nada falso. Esa es la parte que importa.

## Dónde no aplica, o dónde no debería

**Si no es verdad, es trampa.** Decir "últimas vacantes" cuando no lo son usa la escasez y funciona una vez. Cuando la familia se entera, perdiste la confianza, que es lo que más vale en una decisión de años como elegir un colegio.

**No reemplaza tener algo bueno.** Los principios mueven a quien duda. No convencen a nadie de algo que no le sirve, o lo convencen una vez y después se va.

**Hay decisiones que no conviene acelerar.** Para una familia, elegir colegio es una decisión grande. Usar la presión para que decida rápido puede funcionar y ser exactamente lo que no hay que hacer.

## Probá que lo entendiste

¿Qué principio usa cada frase? ¿Alguna cruza la línea?

1. "Más de la mitad de las familias de nuestra jornada pasada se inscribió ese mismo mes."
2. "Quedan sólo 3 vacantes para primer grado", cuando en realidad quedan 15.
3. "La charla sobre el proyecto de inglés la da la coordinadora del área, con 20 años en el colegio."

:::Ver la respuesta
**1. Prueba social.** Si es un dato real, es legítima.

**2. Escasez, y cruza la línea.** Es falso. Funciona hasta que se descubre, y se descubre.

**3. Autoridad.** Legítima: dice quién sabe del tema y por qué.
:::

## Qué hacer esta semana

Tomá la última comunicación que mandaste a familias. Marcá qué principio usa cada frase, si usa alguno. Y para cada uno, una sola pregunta: ¿es verdad?
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Dar primero, y pedir de a poco',
$md$
Dos de los seis principios trabajan juntos y son los más útiles para quien tiene que acompañar una decisión larga: la reciprocidad y el compromiso.

**Reciprocidad.** Cuando alguien nos da algo, sentimos que tenemos que devolver. Cialdini cuenta, entre otros, el caso de grupos que regalaban una flor en los aeropuertos antes de pedir una donación: el regalo no pedido hacía que más gente donara. La versión legítima: **dar algo que de verdad sirve, sin pedir nada en el mismo momento.**

**Compromiso y coherencia.** Una vez que dijimos o hicimos algo, tendemos a seguir en esa línea. Un experimento clásico que el libro cuenta: a vecinos a los que primero se les pidió algo chico (poner un cartel pequeño de seguridad vial) después aceptaron mucho más que otros un pedido grande (un cartel enorme en el jardín). El paso chico cambia cómo se ve la persona a sí misma.

## Un caso trabajado

Hipotético, con la mecánica del libro. Un colegio quiere que más familias que consultan lleguen a la entrevista.

**Antes:** a cada consulta se le contesta con la información y una invitación a la entrevista. De **200 consultas**, **40** llegan a la entrevista, el 20%.

**Después, dando primero y pidiendo de a poco:**

- A cada consulta se le manda una **guía útil**, sin pedir nada: cómo comparar colegios, qué preguntar en una visita. Reciprocidad, con algo que sirve aunque no elijan este colegio.
- Una semana después, un **paso chico**: "¿Querés que te avisemos cuando abramos las visitas?". Responden que sí **110**.
- Cuando abren las visitas, se les avisa. Vienen **70**. De esos, **52** piden entrevista.

De 40 a 52 entrevistas, sin presionar a nadie. Cada paso fue algo que la familia eligió.

## Dónde no aplica

**Un regalo con pedido inmediato se siente como trampa.** La reciprocidad funciona con lo que se da sin condiciones. "Te mandamos esta guía, ¿te inscribís?" en el mismo mail rompe el efecto.

**El compromiso se puede usar contra la persona.** Hacer que alguien diga que sí a algo chico para después llevarlo a algo que no quería es la técnica de los vendedores que el libro desarma. La línea: cada paso tiene que ser algo que la persona querría igual.

**No sirve para cambiar la decisión de quien ya decidió.** Una familia que eligió otro colegio por buenas razones no necesita una guía, necesita que la dejen tranquila.

## Probá que lo entendiste

¿Cuál de estas secuencias usa los dos principios con legitimidad?

1. Mandar una guía útil sin pedir nada, y una semana después preguntar si quieren que les avisen de las visitas.
2. Mandar una guía y, en el mismo mail, pedir que reserven la entrevista con un descuento si es esta semana.
3. Pedir el número de teléfono "para mandar la guía", y después usarlo para llamar ofreciendo la inscripción.

:::Ver la respuesta
**La 1.** Da primero sin condición, y el paso siguiente es chico y elegido.

**La 2** mezcla regalo con pedido y agrega una presión de tiempo. Puede funcionar algunas veces; se siente como lo que es.

**La 3** usa un pedido chico para algo distinto de lo que se dijo. Es exactamente lo que el libro enseña a reconocer como trampa.
:::

## Qué hacer esta semana

Pensá qué podés darle a una familia que consulta, que le sirva aunque no elija tu colegio. Si no se te ocurre nada, ese es el trabajo antes de pensar en cómo pedirle algo.
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'La línea entre persuadir y manipular',
$md$
Cialdini dedica el libro a los seis principios, pero lo que más vale la pena llevarse no es la lista: es saber dónde está la línea entre usarlos para ayudar a decidir y usarlos para empujar.

Una forma práctica de trazarla, a partir de lo que el libro defiende: **un principio se usa bien cuando señala algo que es verdad y relevante para la decisión. Se usa mal cuando fabrica la señal.**

- Decir que muchas familias eligen el colegio, si es verdad: **señala.** Inventar el número: **fabrica.**
- Que la charla la dé alguien que sabe: **señala.** Ponerle un título que no tiene: **fabrica.**
- Avisar que quedan pocas vacantes, si quedan pocas: **señala.** Decirlo siempre: **fabrica.**

Y una prueba de un segundo: **¿lo dirías igual si la familia supiera exactamente por qué lo decís?** Si la respuesta es no, cruzaste la línea.

## Un caso trabajado

Hipotético. Un equipo de admisiones revisa sus **12 comunicaciones** del año con esa prueba.

- **7** usan algún principio y lo que dicen es verdad: datos reales de familias, quién da cada charla, fechas de cierre que existen. Pasan.
- **3** usan escasez con frases como "últimos lugares" que se repiten en todas las campañas, haya o no lugares. No pasan.
- **2** no usan ningún principio. Son correctas y nadie las recuerda.

El equipo saca la escasez falsa de las 3, la reemplaza por la fecha de cierre real, y a las 2 que no dicen nada les agrega un dato verdadero. El año siguiente, la cantidad de familias que se queja de "presión" en las entrevistas baja, y las inscripciones no.

## Dónde no aplica

**No todo lo que funciona es legítimo, ni todo lo legítimo funciona.** La prueba ética no te dice qué mensaje convierte más. Te dice cuáles podés usar sin que te cueste la confianza.

**Los principios también se usan contra vos.** El mismo libro sirve para reconocerlos cuando te los aplican: el proveedor que te regala algo antes de negociar, la oferta que vence hoy. Saber nombrarlos ya es una defensa.

**Lo que es verdad cambia.** Una frase que era cierta en marzo ("quedan pocas vacantes") puede no serlo en mayo. Revisar las comunicaciones que se repiten es parte de usarlas bien.

## Probá que lo entendiste

Pasale la prueba a cada una: ¿la dirías igual si la familia supiera por qué la decís?

1. "Las inscripciones cierran el 30 de noviembre", y es la fecha real.
2. "Esta propuesta es exclusiva para las familias que vinieron a la jornada", cuando se le manda a todas.
3. "El 85% de nuestros egresados eligió su primera opción de universidad", con el dato verificado.

:::Ver la respuesta
**1. Pasa.** Es un dato que la familia necesita para decidir.

**2. No pasa.** La exclusividad es inventada: si la familia supiera que se la mandaron a todas, se sentiría engañada.

**3. Pasa**, si el dato está verificado y se explica de dónde sale. Es autoridad y prueba social con algo real.
:::

## Qué hacer esta semana

Pasale la prueba de un segundo a las tres comunicaciones que más se repiten en tu equipo. Lo que no pase, cambialo por un dato verdadero antes de la próxima campaña.
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer: reconstruí. Cinco preguntas de memoria, y recién después abrí cada respuesta.

**1. ¿Cuáles son los seis principios?**

:::Ver la respuesta
**Reciprocidad, compromiso y coherencia, prueba social, simpatía, autoridad y escasez.** En ediciones posteriores Cialdini sumó un séptimo, la **unidad**: el sentido de pertenecer al mismo grupo. Si te salieron cuatro o cinco, lo habitual es que falten simpatía o coherencia.
:::

**2. ¿Por qué funcionan, según el libro?**

:::Ver la respuesta
Porque **decidimos con atajos**. No hay tiempo para pensar cada decisión desde cero, y los atajos responden a señales simples. Casi siempre aciertan; por eso se pueden explotar.
:::

**3. ¿Qué tiene que ver un cartel chico de seguridad vial con un cartel enorme en el jardín?**

:::Ver la respuesta
Es el experimento clásico del **compromiso**: los vecinos que primero aceptaron algo chico aceptaron mucho más que otros el pedido grande. El paso chico cambió cómo se veían a sí mismos.
:::

**4. ¿Cuándo funciona mejor la prueba social?**

:::Ver la respuesta
Cuando **no estamos seguros** y cuando los otros **se nos parecen**. A una familia le dice más lo que hicieron familias como ella que un número genérico.
:::

**5. ¿Para qué más sirve el libro, además de persuadir?**

:::Ver la respuesta
Para **defenderse**. Saber nombrar el principio que te están aplicando (el regalo antes del pedido, la oferta que vence hoy) es la mejor forma de no responder en automático.
:::

## Lo que suele borrarse

La lista de los seis queda. Lo que se borra es la **advertencia**: Cialdini escribió el libro tanto para enseñar a usarlos como para enseñar a detectarlos cuando se usan con trampa. Si sólo te quedó la lista, te quedó la mitad que sirve para vender, y se fue la que sirve para no ser engañado.

## Un caso para aplicarlo

Un proveedor de un sistema para el colegio te invita a un almuerzo, te regala una capacitación y te dice que el precio especial vence el viernes. ¿Qué principios ves?

:::Ver la respuesta
**Reciprocidad** (el almuerzo y la capacitación antes de pedir) y **escasez** (el precio que vence). No quiere decir que la oferta sea mala: quiere decir que conviene decidir el lunes, con la cabeza fría, comparando como lo harías sin el almuerzo.
:::

## Qué hacer esta semana

La próxima vez que alguien te quiera vender algo, nombrá en voz baja qué principio te está aplicando. Es sorprendente lo que cambia la decisión.
$md$,
  7
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Cialdini contra los Heath y Dunford',
$md$
Si lo tenés fresco, crucemos con los otros dos libros de comunicación y marketing de la biblioteca.

**Chip y Dan Heath** (*Made to Stick*): qué hace que una idea se recuerde. Simple, inesperada, concreta, creíble, emocional, con historias.

**April Dunford** (*Obviously Awesome*): el posicionamiento. Contra qué te comparan, qué tenés que los otros no, y para quién eso importa.

**Cialdini**: qué hace que alguien diga que sí.

Una prueba antes de seguir. Sin releer: **¿en qué orden los usarías para la comunicación de un colegio?**

:::Ver la respuesta
**Dunford primero, después los Heath, al final Cialdini.** Primero saber qué te hace distinto y para quién (posicionamiento). Después decirlo de forma que se recuerde (Heath). Recién ahí, presentar esa verdad de forma que mueva a decidir (Cialdini). Usar a Cialdini sin lo anterior es empujar sin tener qué ofrecer.
:::

## Dónde se tocan

**Credibilidad.** Los Heath dicen que una idea se cree cuando trae su propia prueba (un dato concreto, un caso). Cialdini dice lo mismo desde la autoridad y la prueba social. Coinciden en que la prueba tiene que ser verificable.

**Lo concreto.** Para los Heath, lo concreto se recuerda. Para Cialdini, lo concreto convence más: "140 familias" pesa más que "muchas familias".

## Lo que el libro no prueba

Muchos de los experimentos que cuenta son de los años sesenta y setenta, con muestras chicas, y la psicología social revisó bastantes estudios de esa época desde entonces. Los seis principios, en general, se sostuvieron; pero el tamaño de los efectos fuera del laboratorio suele ser menor que en los ejemplos del libro. Conviene tomarlo como un mapa de señales que funcionan, no como una promesa de cuánto van a mover.

## Una situación para decidir

Las inscripciones vienen bajas. Te proponen: (a) una campaña con "últimos lugares" y un descuento que vence en una semana, o (b) revisar qué diferencia de verdad al colegio para las familias que no se inscribieron, y comunicarlo con datos. ¿Qué diría cada autor?

:::Ver la respuesta
**Dunford: la (b).** Si no se inscriben, primero hay que entender contra qué los comparan y qué no están viendo.

**Heath: la (b)**, y comunicada con un caso concreto, no con adjetivos.

**Cialdini: la (a) puede funcionar a corto plazo**, pero él mismo advierte que la escasez fabricada destruye la confianza. Con la (b), los principios se usan sobre algo verdadero y duran.
:::

## Qué hacer esta semana

Escribí en una línea qué diferencia de verdad a tu colegio, o a lo que ofrecés, para una familia concreta. Si esa línea no está clara, ningún principio de Cialdini la va a reemplazar.
$md$,
  8
from books b where b.slug = 'influence'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'The shortcuts we all use to say yes',
$md$
Cialdini is a social psychologist who spent years studying people who make a living from persuading: salespeople, fundraisers, advertisers. Some of those years he spent undercover, learning the tricks from the inside.

The book's idea: **most of the time we don't decide by analysing everything, but by shortcuts.** Not because we're foolish, but because there's no time to think every decision through from scratch. And those shortcuts respond to a few signals, which Cialdini arranged into six principles:

- **Reciprocity:** we tend to return what we receive.
- **Commitment and consistency:** we want to be consistent with what we've already said or done.
- **Social proof:** when unsure, we look at what people like us are doing.
- **Liking:** we say yes more easily to people we like or who resemble us.
- **Authority:** we trust those who know, or seem to.
- **Scarcity:** what's rare or running out seems worth more.

The shortcuts almost always work, and that's why they can be exploited. The book is at once a guide to persuading and a defence against those who do it by trickery.

## A worked case

All figures are hypothetical; the mechanics are the book's. A school emails **500 families** who made an enquiry, inviting them to the open day.

**Generic email:** "We'd like to invite you to our open day". **90** sign up, 18%.

**Email using two principles truthfully:** "Last year 140 families came, and the most common question was about transport: at the open day it's answered by the person who runs it". Social proof (140 families, a real figure) and authority (someone who knows, not a leaflet). **130** sign up, 26%.

Forty more families, with an email that says nothing false. That's the part that matters.

## Where it doesn't apply, or shouldn't

**If it isn't true, it's a trick.** Saying "last few places" when there are plenty uses scarcity and works once. When the family finds out, you've lost their trust, which is what counts most in a decision lasting years, like choosing a school.

**It doesn't replace having something good.** The principles move people who are hesitating. They don't persuade anyone of something that doesn't suit them, or they do once and then the person leaves.

**Some decisions shouldn't be hurried.** For a family, choosing a school is a big decision. Using pressure to make them decide quickly may work and be exactly what you shouldn't do.

## Check you've got it

Which principle does each line use? Does any cross the line?

1. "More than half the families at our last open day enrolled that same month."
2. "Only 3 places left in Year 1", when there are actually 15.
3. "The talk on our English programme is given by the head of department, who has been at the school for 20 years."

:::Show the answer
**1. Social proof.** If it's a real figure, it's legitimate.

**2. Scarcity, and it crosses the line.** It's false. It works until it's found out, and it is found out.

**3. Authority.** Legitimate: it says who knows the subject and why.
:::

## What to do this week

Take the last communication you sent to families. Mark which principle each sentence uses, if any. And for each, one question: is it true?
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Give first, and ask a little at a time',
$md$
Two of the six principles work together and are the most useful for anyone who has to accompany a long decision: reciprocity and commitment.

**Reciprocity.** When someone gives us something, we feel we have to give back. Cialdini tells, among others, the story of groups handing out a flower in airports before asking for a donation: the unrequested gift made more people donate. The legitimate version: **give something genuinely useful, without asking for anything at the same moment.**

**Commitment and consistency.** Once we've said or done something, we tend to stay on that line. A classic experiment the book recounts: residents who were first asked for something small (displaying a little road-safety sign) later agreed far more than others to a big request (a huge sign in their garden). The small step changes how people see themselves.

## A worked case

Hypothetical, with the book's mechanics. A school wants more of the families who enquire to reach an interview.

**Before:** each enquiry gets the information and an invitation to an interview. Of **200 enquiries**, **40** reach an interview, 20%.

**After, giving first and asking a little at a time:**

- Each enquiry is sent a **useful guide**, asking nothing: how to compare schools, what to ask on a visit. Reciprocity, with something useful even if they don't choose this school.
- A week later, a **small step**: "Would you like us to let you know when visits open?" **110** say yes.
- When visits open, they're told. **70** come. Of those, **52** ask for an interview.

From 40 to 52 interviews, without pressuring anyone. Each step was something the family chose.

## Where it doesn't apply

**A gift with an immediate request feels like a trick.** Reciprocity works with what's given unconditionally. "Here's this guide, will you sign up?" in the same email breaks the effect.

**Commitment can be used against the person.** Getting someone to say yes to something small to then lead them into something they didn't want is the salesperson's technique the book takes apart. The line: each step has to be something the person would want anyway.

**It doesn't change the mind of someone who has decided.** A family that chose another school for good reasons doesn't need a guide; it needs to be left alone.

## Check you've got it

Which of these sequences uses the two principles legitimately?

1. Send a useful guide asking nothing, and a week later ask whether they'd like to hear when visits open.
2. Send a guide and, in the same email, ask them to book an interview with a discount if it's this week.
3. Ask for their phone number "to send the guide", then use it to call offering enrolment.

:::Show the answer
**Number 1.** It gives first without conditions, and the next step is small and chosen.

**Number 2** mixes gift with request and adds time pressure. It may work sometimes; it feels like what it is.

**Number 3** uses a small request for something other than what was said. It's exactly what the book teaches you to recognise as a trick.
:::

## What to do this week

Think about what you could give a family who enquires that would help them even if they don't choose your school. If nothing comes to mind, that's the work before thinking about how to ask them for anything.
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'The line between persuading and manipulating',
$md$
Cialdini devotes the book to the six principles, but what's most worth taking away isn't the list: it's knowing where the line is between using them to help someone decide and using them to push.

A practical way to draw it, based on what the book argues for: **a principle is used well when it points to something true and relevant to the decision. It's used badly when it manufactures the signal.**

- Saying many families choose the school, if true: **points.** Inventing the figure: **manufactures.**
- Having someone who knows give the talk: **points.** Giving them a title they don't hold: **manufactures.**
- Saying places are running out, if they are: **points.** Saying it every time: **manufactures.**

And a one-second test: **would you say it the same way if the family knew exactly why you were saying it?** If not, you've crossed the line.

## A worked case

Hypothetical. An admissions team reviews its **12 communications** for the year with that test.

- **7** use some principle and what they say is true: real family figures, who gives each talk, closing dates that exist. They pass.
- **3** use scarcity with lines like "last few places" repeated in every campaign, whether or not places are scarce. They fail.
- **2** use no principle at all. They're correct and nobody remembers them.

The team removes the false scarcity from the 3, replaces it with the real closing date, and adds a true figure to the 2 that say nothing. The following year, the number of families complaining of "pressure" at interviews drops, and enrolments don't.

## Where it doesn't apply

**Not everything that works is legitimate, and not everything legitimate works.** The ethical test doesn't tell you which message converts best. It tells you which ones you can use without it costing you trust.

**The principles are used on you too.** The same book helps you recognise them when they're applied to you: the supplier who gives you something before negotiating, the offer that ends today. Being able to name them is already a defence.

**What's true changes.** A line that was true in March ("few places left") may not be in May. Reviewing the communications that repeat is part of using them well.

## Check you've got it

Run each through the test: would you say it the same way if the family knew why you were saying it?

1. "Admissions close on 30 November", and that's the real date.
2. "This offer is exclusive to families who came to the open day", when it's sent to everyone.
3. "85% of our leavers got into their first-choice university", with the figure verified.

:::Show the answer
**1. Passes.** It's information the family needs to decide.

**2. Fails.** The exclusivity is invented: if the family knew it was sent to everyone, they'd feel deceived.

**3. Passes**, if the figure is verified and you explain where it comes from. It's authority and social proof with something real.
:::

## What to do this week

Run the one-second test on the three communications your team repeats most. Whatever fails, replace it with a true figure before the next campaign.
$md$,
  9
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading: reconstruct. Five questions from memory, and only then open each answer.

**1. What are the six principles?**

:::Show the answer
**Reciprocity, commitment and consistency, social proof, liking, authority and scarcity.** In later editions Cialdini added a seventh, **unity**: the sense of belonging to the same group. If you got four or five, liking or consistency are usually the ones missing.
:::

**2. Why do they work, according to the book?**

:::Show the answer
Because **we decide by shortcuts**. There's no time to think every decision through from scratch, and shortcuts respond to simple signals. They're almost always right; that's why they can be exploited.
:::

**3. What does a small road-safety sign have to do with a huge one in the garden?**

:::Show the answer
It's the classic **commitment** experiment: residents who first agreed to something small agreed far more than others to the big request. The small step changed how they saw themselves.
:::

**4. When does social proof work best?**

:::Show the answer
When **we're unsure** and when the others **resemble us**. What families like theirs did says more to a family than a generic figure.
:::

**5. What else is the book for, besides persuading?**

:::Show the answer
For **defending yourself**. Being able to name the principle being applied to you (the gift before the request, the offer that ends today) is the best way not to respond on autopilot.
:::

## What usually gets forgotten

The list of six stays. What gets forgotten is the **warning**: Cialdini wrote the book as much to teach how to spot the principles being used dishonestly as to teach how to use them. If only the list stuck, you kept the half that helps you sell and lost the half that stops you being taken in.

## A case to apply it to

A supplier of a system for the school invites you to lunch, gives you free training and says the special price ends on Friday. Which principles do you see?

:::Show the answer
**Reciprocity** (the lunch and the training before the request) and **scarcity** (the price that ends). It doesn't mean the offer is bad: it means it's worth deciding on Monday, with a cool head, comparing as you would without the lunch.
:::

## What to do this week

Next time someone wants to sell you something, quietly name the principle they're applying. It's surprising how much it changes the decision.
$md$,
  7
from books b where b.slug = 'influence'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Cialdini against the Heaths and Dunford',
$md$
If it's fresh, let's cross it with the library's other two books on communication and marketing.

**Chip and Dan Heath** (*Made to Stick*): what makes an idea memorable. Simple, unexpected, concrete, credible, emotional, with stories.

**April Dunford** (*Obviously Awesome*): positioning. What you're compared against, what you have that others don't, and who cares about that.

**Cialdini**: what makes someone say yes.

A test before going on. Without rereading: **in what order would you use them for a school's communications?**

:::Show the answer
**Dunford first, then the Heaths, Cialdini last.** First know what makes you different and for whom (positioning). Then say it in a way that sticks (Heath). Only then present that truth in a way that moves people to decide (Cialdini). Using Cialdini without the rest is pushing without having anything to offer.
:::

## Where they meet

**Credibility.** The Heaths say an idea is believed when it carries its own proof (a concrete figure, a case). Cialdini says the same through authority and social proof. They agree the proof has to be verifiable.

**The concrete.** For the Heaths, the concrete is remembered. For Cialdini, the concrete persuades more: "140 families" carries more weight than "many families".

## What the book doesn't prove

Many of the experiments it recounts date from the sixties and seventies, with small samples, and social psychology has re-examined quite a few studies from that period since. The six principles have broadly held up; but the size of the effects outside the laboratory is usually smaller than in the book's examples. Best taken as a map of signals that work, not a promise of how much they'll move.

## A situation to decide

Enrolments are low. You're offered: (a) a campaign with "last few places" and a discount ending in a week, or (b) reviewing what genuinely sets the school apart for the families who didn't enrol, and communicating it with figures. What would each author say?

:::Show the answer
**Dunford: (b).** If they're not enrolling, first understand what they're comparing you against and what they're not seeing.

**Heath: (b)**, communicated with a concrete case, not adjectives.

**Cialdini: (a) may work in the short term**, but he himself warns that manufactured scarcity destroys trust. With (b), the principles are applied to something true, and they last.
:::

## What to do this week

Write one line on what genuinely sets your school, or what you offer, apart for a specific family. If that line isn't clear, no Cialdini principle will replace it.
$md$,
  8
from books b where b.slug = 'influence'
on conflict do nothing;
