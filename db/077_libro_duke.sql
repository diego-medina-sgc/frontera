-- ============================================================
-- 077 · Libro: Thinking in Bets (Annie Duke)
-- ============================================================
-- Tema "decisiones": hasta ahora sólo estaba Kahneman. Duke no
-- repite el catálogo de sesgos: pone el foco en separar la calidad de
-- una decisión de su resultado, en hablar en probabilidades y en el
-- grupo que ayuda a revisar. El premortem ya está en las piezas de
-- Kahneman; acá se va más lejos (revisar sin conocer el resultado,
-- mirar desde el futuro en las dos direcciones, comprometerse antes).
--
-- Verificado en Open Library el 24/11:
--   · obra OL19736287W, 2018, Annie Duke (4 ediciones: tres en inglés
--     de Portfolio y una en turco de Mediacat);
--   · edición en castellano: NO encontrada (ni en las ediciones de la
--     obra ni buscando por título en castellano o por autora), así que
--     title_es va en null;
--   · tapa 8792782, la de la edición en inglés de Portfolio
--     (OL27328231M); covers.openlibrary.org devuelve 200.
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto. El
-- ejemplo de apertura (la jugada de Pete Carroll en el Super Bowl) se
-- nombra en una línea. Los casos son hipotéticos y lo dicen.
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'thinking-in-bets',
  'Thinking in Bets',
  'Annie Duke',
  2018,
  array['decisiones', 'sesgos'],
  null,
  8792782,
  array[
    'decisiones','decidir','decidimos','suerte','salió mal','salió bien','riesgo',
    'incertidumbre','apuesta','probabilidad','pronóstico','proyección','estimación',
    'campaña','resultados','revisión','balance','decision','forecast','risk'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Salió mal no quiere decir que se decidió mal',
$md$
Annie Duke jugó al póker profesional durante años, y el libro sale de algo que en una mesa de póker se aprende rápido: podés jugar bien una mano y perderla, y jugar mal y ganarla. Abre con un ejemplo deportivo famoso, la jugada de Pete Carroll en un Super Bowl, para mostrar cuánto se castiga una decisión sólo porque terminó mal.

La idea: **la calidad de una decisión y la calidad de su resultado son dos cosas distintas, porque en el medio están la suerte y lo que no sabías.** Juzgar la decisión por cómo terminó es un error con nombre propio: Duke toma del póker la palabra *resulting*.

El error tiene una versión cómoda. Cuando algo sale bien, lo atribuimos a que decidimos bien; cuando sale mal, a la mala suerte. Con eso, de los éxitos aprendemos de más y de los fracasos, nada.

## Un caso trabajado

Un caso hipotético. Un equipo de admisiones tiene que elegir dónde poner el esfuerzo de un sábado de mayo:

- **Opción A, la feria de colegios del barrio.** En cuatro de los últimos cinco años hizo buen tiempo y vinieron unas 120 familias al stand; de cada diez, tres pidieron entrevista. El año que llovió vinieron 40.
- **Opción B, una jornada en el propio colegio.** Más chica y sin riesgo de clima: da unas 20 entrevistas.

Hacé la cuenta de la A antes de mirar el resultado:

- Con buen tiempo: 120 × 0,3 = 36 entrevistas.
- Con lluvia: 40 × 0,3 = 12 entrevistas.
- Esperado: 0,8 × 36 + 0,2 × 12 = 28,8 + 2,4 = **31,2 entrevistas**, contra 20 de la B.

Eligen la A. Llueve. Salen 12 entrevistas. En la reunión del lunes alguien dice "fue un error ir a la feria".

No lo fue. Con lo que sabían, la A era mejor por once entrevistas esperadas, y volverían a elegirla. Lo que pasó es la parte de la apuesta que no controlaban. La pregunta útil del lunes no es "¿salió bien?" sino **"¿qué sabíamos, qué podríamos haber sabido a un costo razonable, y cuánto de esto fue suerte?"**

## Dónde no aplica

**Cuando hay muchas repeticiones.** Un resultado dice poco; treinta dicen bastante. Si la feria sale mal cinco años seguidos, ya no es lluvia: es información sobre la decisión.

**Cuando "fue mala suerte" tapa algo que se podía saber.** Si el pronóstico anunciaba tormenta desde el jueves y nadie lo miró, no fue suerte. Fue no buscar un dato barato.

**Cuando no hay azar en el medio.** Si mandaste un mail a familias con la fecha equivocada, el resultado sí te dice todo sobre lo que hiciste.

## Probá que lo entendiste

Clasificá cada caso: buena decisión con mala suerte, mala decisión con buena suerte, o mala decisión sin excusa.

1. Se lanzó una campaña en redes sin definir a quién iba dirigida. Un video se compartió de casualidad en un grupo de familias del barrio y llegaron 300 consultas.
2. Se eligió la fecha de la jornada de puertas abiertas mirando el calendario de los otros colegios. A último momento otro colegio movió la suya al mismo día y vino la mitad de la gente.
3. Se contrató un proveedor de mailing sin pedir referencias. Los mails cayeron en correo no deseado y nadie se enteró en tres semanas.

:::Ver la respuesta
**1. Mala decisión, buena suerte.** El resultado fue excelente, pero repetir "lo mismo" no repite el video que se compartió. Es el caso más peligroso, porque nadie lo revisa.

**2. Buena decisión, mala suerte.** Usaron la información que había. Que otro colegio cambiara de fecha no se podía prever.

**3. Mala decisión sin excusa.** Pedir referencias y mirar las primeras métricas eran datos baratos. El resultado y la decisión coinciden.
:::

## Qué hacer esta semana

Elegí la última decisión de tu equipo que salió mal. Escribí en tres renglones qué sabían en el momento de decidir, qué podrían haber averiguado y cuánto creés que fue suerte. Después hacé lo mismo con una que salió bien.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  '¿Querés apostar?',
$md$
Entre jugadores de póker, si alguien afirma algo con mucha seguridad, es común que otro le pregunte si quiere apostar. Duke propone llevarse esa pregunta a la vida de todos los días, aunque no haya plata en juego.

La idea: **toda creencia sobre algo que todavía no pasó es una apuesta, y conviene decirla como tal: con cuánta confianza, en un número, y lista para moverse cuando llegue información nueva.** La pregunta "¿querés apostar?" obliga a pasar de "seguro que sí" a "¿cuán seguro?".

Decir "70%" en vez de "sí" cambia tres cosas. Te obliga a pensar qué sabés de verdad. Deja lugar para que otro diga "yo diría 50, por esto". Y cuando la realidad cambia, moverte de 70 a 55 no es haberte equivocado: es actualizar. Con un "sí" rotundo, en cambio, cualquier cambio suena a dar marcha atrás.

## Un caso trabajado

Un caso hipotético. En marzo, el equipo de admisiones de un colegio discute si va a llenar las tres salas de jardín del año siguiente, 60 lugares en total. Quien coordina dice "seguro que sí". Le preguntan si quiere apostar, y lo piensa mejor:

- El año pasado llenaron, pero con lista de espera corta.
- Abrió otro jardín a diez cuadras.

Lo pone en número: **70%**.

En agosto llega información. A esa fecha del año pasado tenían 50 inscripciones confirmadas; este año tienen 45. Es un 10% menos (5 de 50). No es alarma, pero mueve la apuesta: bajan a **55%**, y con eso deciden algo concreto, sumar una jornada de visitas en septiembre.

Si hubieran seguido en "seguro que sí", ese dato de agosto se habría leído como ruido. La apuesta en número lo hizo visible.

Una forma de saber si tus porcentajes valen algo: anotá durante un tiempo todo lo que dijiste con "70%". Si de diez cosas pasaron siete, estás bien calibrado. Si pasaron cuatro, tu 70% en realidad es un 40%.

## Dónde no aplica

**Cuando no hay incertidumbre que importe.** Si la sala tiene 20 lugares y hay 20 inscriptos con matrícula pagada, ponerle porcentaje es una pose.

**Con quien necesita una respuesta clara.** A una familia no le decís "hay un 55% de que abramos la sala". El número sirve para decidir adentro; afuera se comunica la decisión.

**Cuando el número es falsa precisión.** "67,5%" sobre algo que se estima a ojo da una exactitud que no existe. Alcanza con números redondos, o un rango.

## Probá que lo entendiste

¿Cuál de estas frases está dicha como una apuesta, en el sentido de Duke?

1. "La campaña nueva va a funcionar, confiá en mí."
2. "Le doy un 60% a que la campaña nueva supere a la del año pasado. Si en tres semanas las consultas no subieron, lo bajo."
3. "No se puede saber si la campaña va a funcionar, así que no vale la pena estimarlo."

:::Ver la respuesta
**La 2.** Tiene un número, deja ver qué la haría cambiar y tiene fecha para revisarla.

**La 1** es certeza sin número. Nadie puede discutirla sin que suene a desconfianza personal.

**La 3** confunde incertidumbre con ignorancia total. Que no se pueda saber con seguridad no quiere decir que no puedas decir cuán probable te parece. Duke insiste en eso: casi nunca sabemos nada del todo, pero casi siempre sabemos algo.
:::

## Qué hacer esta semana

En la próxima reunión donde alguien diga "seguro" sobre algo que todavía no pasó, preguntá con buen tono: "¿cuánto le das, de cero a cien?". Anotá el número y la fecha en que se va a saber.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Un grupo que te contradiga a propósito',
$md$
Las dos piezas anteriores piden algo difícil de hacer solo: separar la decisión del resultado y mover tus apuestas cuando hace falta. Solo, uno tiende a defender lo que ya pensaba. Duke propone apoyarse en otros, pero no en cualquier grupo.

La idea: **un grupo ayuda a decidir mejor sólo si acordó de antemano para qué está: buscar lo que contradice, revisar el proceso y no sólo el resultado, y premiar al que cambia de opinión.** Un grupo que se junta a darse la razón empeora las cosas, porque le suma confianza a lo que ya creías. Para esas reglas, Duke se apoya en las normas que el sociólogo Robert Merton describió para la ciencia: compartir los datos, juzgar la idea y no a quien la dice, declarar los intereses, y dudar en forma organizada.

Tres prácticas concretas salen de ahí:

- **Pedir la contradicción.** No "¿qué te parece?", sino "¿qué te haría pensar que me equivoco?".
- **Revisar sin contar cómo terminó.** Si presentás una decisión diciendo primero que salió mal, todos la van a encontrar mala.
- **Viajar al futuro en las dos direcciones.** El premortem (imaginar que fracasó y preguntar por qué) se complementa con lo inverso: imaginar que salió muy bien y reconstruir hacia atrás qué tuvo que pasar. Y antes de arrancar, comprometerse a qué vas a hacer si aparece la señal de que va mal, para no decidirlo en caliente. Duke lo llama contrato de Ulises.

## Un caso trabajado

Un caso hipotético. En la revisión de fin de ciclo, el equipo de admisiones repasa seis decisiones del año. Quien coordina las presenta **sin decir cómo terminó cada una**: qué se sabía, qué se eligió y por qué. Cada persona puntúa el proceso de 1 a 5.

Tres decisiones sacan 4 o más. Recién entonces se cuenta el resultado. De esas tres, **dos terminaron mal**. Si se hubiera contado el resultado primero, las dos se habrían anotado como errores, y el año siguiente nadie habría repetido un proceso que estaba bien. Y de las tres que puntuaron bajo, una salió bien de casualidad: esa es la que hay que corregir aunque no duela.

Seis decisiones, tres mal juzgadas si se miraba sólo el resultado: la mitad del aprendizaje del año.

## Dónde no aplica

**Para decisiones chicas y reversibles.** Revisar con este cuidado cuál fue el asunto del último mail no compensa. Guardalo para lo que cuesta caro equivocarse.

**Cuando el grupo no eligió jugar así.** Si una persona empieza a "buscar la contradicción" sin que el resto lo haya acordado, se lee como ataque. Las reglas se ponen primero, en frío.

**Cuando todos piensan igual.** Tres personas con la misma experiencia y los mismos intereses no te van a contradecir aunque se lo pidas. Sumá a alguien de otra área.

## Probá que lo entendiste

Ordená estas tres revisiones de la que más ayuda a aprender a la que menos.

1. Se cuenta que la campaña terminó con menos inscriptos y se pregunta qué falló.
2. Se presenta la decisión con lo que se sabía en su momento, se puntúa el proceso y recién después se cuenta el resultado.
3. Se presenta la decisión y se le pide a una persona de otra área que diga qué la haría pensar que fue mala.

:::Ver la respuesta
**Primero la 2, después la 3, al final la 1.**

**La 2** separa proceso y resultado, que es lo central del libro.

**La 3** suma la contradicción buscada, pero si la persona ya sabe cómo terminó, el resultado la va a teñir.

**La 1** es *resulting* en estado puro: arranca por el resultado y busca la culpa hacia atrás.
:::

## Qué hacer esta semana

Elegí una decisión que tu equipo tome este mes. Antes de arrancar, escribí juntos dos cosas: qué tendría que pasar para que salga muy bien, y qué señal, en qué fecha, los haría cambiar de rumbo.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Qué es *resulting*?**

:::Ver la respuesta
**Juzgar una decisión por cómo terminó.** Duke toma la palabra del póker. Entre la decisión y el resultado están la suerte y lo que no sabías, así que una cosa no prueba la otra.
:::

**2. ¿Para qué sirve la pregunta "¿querés apostar?"?**

:::Ver la respuesta
**Para pasar de "seguro" a "¿cuán seguro?".** Obliga a pensar qué sabés, a decirlo en un número y a dejar lugar para moverlo. Funciona aunque no haya nada en juego.
:::

**3. ¿Cómo solemos repartir el mérito entre habilidad y suerte?**

:::Ver la respuesta
**A favor nuestro.** Lo que sale bien, por habilidad; lo que sale mal, por mala suerte. Y con los demás, al revés. El resultado es que aprendemos poco de nuestros fracasos y de los éxitos ajenos.
:::

**4. ¿Qué tiene que tener un grupo para que ayude a decidir mejor?**

:::Ver la respuesta
**Reglas acordadas antes:** buscar lo que contradice, juzgar la idea y no a quien la dice, revisar el proceso y no sólo el resultado, y premiar el cambio de opinión. Duke las arma sobre las normas que Merton describió para la ciencia. Sin esas reglas, un grupo confirma lo que ya creías.
:::

**5. ¿Qué es un contrato de Ulises?**

:::Ver la respuesta
**Comprometerte de antemano a lo que vas a hacer cuando aparezca una señal**, para no decidirlo en caliente. El nombre viene de Ulises atado al mástil para no ceder al canto de las sirenas.
:::

## Lo que suele borrarse

Si te quedó "los resultados no importan", se te borró la mitad. Duke no dice eso: dice que un resultado solo es un dato con mucho ruido. Muchos resultados juntos sí enseñan, y el trabajo es separar cuánto de cada uno vino de la decisión y cuánto de la suerte. Usar "fue mala suerte" para no revisar nada es otra forma del mismo error.

La otra cosa que se borra es que el libro no es sobre el póker. El póker es el ejemplo porque ahí la suerte se ve: cada mano dura minutos y se juegan cientos. En el trabajo la suerte está igual, pero tarda meses en mostrarse y se mezcla con todo lo demás, y por eso se nota menos.

## Un caso para aplicarlo

La dirección del colegio felicita al equipo porque la inscripción subió un 15% este año. Todos lo atribuyen a la campaña nueva. Pero ese mismo año cerró otro colegio de la zona. ¿Qué harías antes de repetir la campaña?

:::Ver la respuesta
**Separar decisión de resultado, igual que si hubiera salido mal.** Preguntar cuántas de las familias nuevas venían del colegio que cerró, y qué decía la campaña sobre las otras. Si el aumento se explica casi entero por el cierre, la campaña puede no haber movido nada, y repetirla el año próximo, sin ese viento a favor, va a sorprender.
:::

## Qué hacer esta semana

Buscá un éxito reciente de tu equipo y preguntate, en serio, qué parte fue suerte. Es la revisión que nadie hace.
$md$,
  7
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Duke contra Kahneman y Grove',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con dos libros de la biblioteca que también hablan de cómo se decide.

**Kahneman** (*Thinking, Fast and Slow*): el catálogo de los errores sistemáticos del juicio, y entre ellos el sesgo retrospectivo: una vez que sabés cómo terminó algo, te cuesta reconstruir lo que creías antes.

**Grove** (*High Output Management*): para decidir en grupo, discusión abierta, decisión clara y después apoyo total, incluso de quienes estaban en contra.

Antes de seguir, una prueba. Sin releer: **¿qué le agrega Duke a Kahneman?**

:::Ver la respuesta
**Un lugar donde practicar.** Kahneman describe con mucho detalle cómo nos equivocamos, y él mismo es escéptico de que conocer un sesgo alcance para evitarlo. Duke acepta eso y propone hábitos concretos: decir las creencias como apuestas con número, revisar sin contar el resultado, armar un grupo con reglas. Menos teoría, más rutina.
:::

## Dónde se tocan, y dónde no

**Con Kahneman coinciden en el diagnóstico.** Juzgar a quien decidió por cómo terminó es justamente el daño que Kahneman le atribuye al sesgo retrospectivo: castiga decisiones razonables que salieron mal y premia apuestas imprudentes que salieron bien. Y los dos desconfían de la corrección individual: Kahneman pone más fe en procedimientos que en la fuerza de voluntad; Duke, en un grupo con reglas. El premortem aparece en los dos.

**Con Grove hay una tensión.** Grove pide apoyo total una vez tomada la decisión, para que se ejecute. Duke pide mantener la apuesta abierta y actualizarla. No se contradicen si se separan dos planos: se ejecuta con todo, y al mismo tiempo se sigue el porcentaje. Lo que no vale es que el apoyo total se vuelva prohibido decir "esto bajó al 40%".

**Grove mira el antes, Duke el después.** Grove ordena cómo se discute antes de decidir. Duke pone el peso en cómo se revisa cuando ya se sabe el resultado. Juntos cubren el ciclo entero.

## Lo que el libro no prueba

Es un libro de divulgación de una jugadora que estudió psicología cognitiva, y se apoya en investigación ajena, pero sus propuestas no están medidas: no presenta evidencia de que un grupo armado como ella sugiere decida mejor en una organización.

Y la metáfora tiene un límite. En el póker las probabilidades se pueden calcular y las manos se repiten miles de veces. En un colegio, el "70%" es una estimación a ojo y la jornada de puertas abiertas pasa una vez por año: hay muy pocos resultados para calibrar. El riesgo más conocido es el uso al revés: "fue mala suerte" como excusa para no revisar nada. Duke lo advierte, y aun así pasa.

## Una situación para decidir

La inscripción bajó y la dirección quiere cambiar la agencia que hizo la campaña. Tenés dos caminos: (a) cambiarla ya, o (b) revisar primero la decisión de la campaña sin mirar el resultado, y recién después decidir. ¿Qué diría cada autor?

:::Ver la respuesta
**Duke: la (b).** Cambiar de agencia por un resultado es *resulting*. Primero, qué se sabía al contratarla y qué parte de la baja vino de afuera.

**Kahneman: también la (b)**, y advertiría que, sabiendo ya el resultado, todos van a "recordar" que la campaña se veía floja desde el principio.

**Grove: la (b) con fecha.** Discusión abierta con los datos, una decisión clara en un plazo, y apoyo total a lo que se decida.

Los tres coinciden: revisar el proceso antes de cortar cabezas.
:::

## Qué hacer esta semana

De los tres libros, elegí la práctica que más le falta a tu equipo para decidir y probala en la próxima decisión que importe. Una sola.
$md$,
  8
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'A bad outcome is not a bad decision',
$md$
Annie Duke played professional poker for years, and the book grows out of something you learn quickly at a poker table: you can play a hand well and lose it, and play it badly and win. She opens with a famous sporting example, Pete Carroll's play call in a Super Bowl, to show how harshly a decision gets punished simply because it ended badly.

The idea: **the quality of a decision and the quality of its outcome are two different things, because luck and what you didn't know sit in between.** Judging the decision by how it turned out is a mistake with its own name: Duke borrows the poker word *resulting*.

The mistake has a comfortable version. When something goes well, we put it down to having decided well; when it goes badly, to bad luck. That way we learn too much from our successes and nothing from our failures.

## A worked case

A hypothetical case. An admissions team has to choose where to put its effort on a Saturday in May:

- **Option A, the local schools fair.** In four of the last five years the weather was good and about 120 families came to the stand; of every ten, three asked for an interview. The year it rained, 40 came.
- **Option B, an event at the school itself.** Smaller and weatherproof: it yields about 20 interviews.

Do the sum for A before looking at the outcome:

- Good weather: 120 × 0.3 = 36 interviews.
- Rain: 40 × 0.3 = 12 interviews.
- Expected: 0.8 × 36 + 0.2 × 12 = 28.8 + 2.4 = **31.2 interviews**, against 20 for B.

They choose A. It rains. They get 12 interviews. At Monday's meeting someone says "going to the fair was a mistake".

It wasn't. With what they knew, A was better by eleven expected interviews, and they would choose it again. What happened was the part of the bet they didn't control. The useful question on Monday isn't "did it go well?" but **"what did we know, what could we have found out at a reasonable cost, and how much of this was luck?"**

## Where it doesn't apply

**When there are many repetitions.** One outcome says little; thirty say a lot. If the fair goes badly five years running, it's no longer rain: it's information about the decision.

**When "bad luck" covers up something you could have known.** If the forecast had been announcing storms since Thursday and nobody checked, it wasn't luck. It was failing to look for a cheap piece of information.

**When there's no chance involved.** If you emailed families the wrong date, the outcome does tell you everything about what you did.

## Check you've got it

Classify each case: good decision with bad luck, bad decision with good luck, or bad decision with no excuse.

1. A social media campaign was launched without deciding who it was aimed at. By chance, a video got shared in a local parents' group and 300 enquiries came in.
2. The open day date was chosen after checking the other schools' calendars. At the last minute another school moved its own to the same day and half the expected people came.
3. A mailing provider was hired without asking for references. The emails went to spam and nobody noticed for three weeks.

:::Show the answer
**1. Bad decision, good luck.** The outcome was excellent, but doing "the same again" won't repeat the video being shared. It's the most dangerous case, because nobody reviews it.

**2. Good decision, bad luck.** They used the information available. Another school changing its date couldn't be foreseen.

**3. Bad decision with no excuse.** Asking for references and checking the first figures were cheap pieces of information. Here the outcome and the decision match.
:::

## What to do this week

Pick your team's most recent decision that went badly. Write three lines on what you knew when you decided, what you could have found out, and how much you think was luck. Then do the same with one that went well.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Wanna bet?',
$md$
Among poker players, when someone states something with great certainty, it's common for another to ask whether they want to bet on it. Duke suggests taking that question into everyday life, even when no money is at stake.

The idea: **every belief about something that hasn't happened yet is a bet, and it's worth stating it as one: with how much confidence, as a number, and ready to move when new information arrives.** The question "wanna bet?" forces you from "definitely" to "how sure?".

Saying "70%" instead of "yes" changes three things. It makes you think about what you really know. It leaves room for someone else to say "I'd say 50, because of this". And when reality shifts, moving from 70 to 55 isn't being wrong: it's updating. With a flat "yes", by contrast, any change sounds like a climbdown.

## A worked case

A hypothetical case. In March, a school's admissions team is discussing whether it will fill next year's three nursery classes, 60 places in all. The person in charge says "definitely". Someone asks whether they want to bet, and they think again:

- Last year they filled, but with a short waiting list.
- A new nursery has opened ten streets away.

They put it as a number: **70%**.

In August, information arrives. By that date last year they had 50 confirmed enrolments; this year they have 45. That's 10% fewer (5 out of 50). Not a crisis, but it moves the bet: they drop to **55%**, and with that they decide something concrete, adding an extra visit day in September.

Had they stayed at "definitely", that August figure would have been read as noise. Putting the bet as a number made it visible.

One way to find out whether your percentages are worth anything: for a while, note down everything you said "70%" about. If seven out of ten happened, you're well calibrated. If four did, your 70% is really a 40%.

## Where it doesn't apply

**When there's no uncertainty that matters.** If the class has 20 places and 20 children enrolled with fees paid, putting a percentage on it is posturing.

**With people who need a clear answer.** You don't tell a family "there's a 55% chance we'll open the class". The number helps you decide internally; externally you communicate the decision.

**When the number is false precision.** "67.5%" for something estimated by eye suggests an accuracy that doesn't exist. Round numbers, or a range, will do.

## Check you've got it

Which of these is stated as a bet, in Duke's sense?

1. "The new campaign will work, trust me."
2. "I'd give it 60% that the new campaign beats last year's. If enquiries haven't gone up in three weeks, I'll lower it."
3. "There's no way of knowing whether the campaign will work, so there's no point estimating it."

:::Show the answer
**Number 2.** It has a number, shows what would change it and has a date to review it.

**Number 1** is certainty without a number. Nobody can challenge it without it sounding like personal distrust.

**Number 3** confuses uncertainty with total ignorance. Not being able to know for sure doesn't mean you can't say how likely it seems. Duke insists on this: we almost never know anything completely, but we almost always know something.
:::

## What to do this week

At the next meeting where someone says "definitely" about something that hasn't happened yet, ask, kindly: "how much would you give it, from nought to a hundred?". Note down the number and the date when you'll find out.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'A group that contradicts you on purpose',
$md$
The two previous pieces ask for something hard to do alone: separating the decision from the outcome, and moving your bets when needed. On your own, you tend to defend what you already thought. Duke suggests leaning on others, but not on just any group.

The idea: **a group helps you decide better only if it has agreed in advance what it's for: looking for what contradicts you, reviewing the process and not just the outcome, and rewarding whoever changes their mind.** A group that meets to agree with each other makes things worse, because it adds confidence to what you already believed. For those rules, Duke draws on the norms the sociologist Robert Merton described for science: share the data, judge the idea and not the person saying it, declare your interests, and doubt in an organised way.

Three concrete practices come out of it:

- **Ask for the contradiction.** Not "what do you think?", but "what would make you think I'm wrong?".
- **Review without saying how it ended.** If you present a decision by saying first that it went badly, everyone will find it bad.
- **Travel to the future in both directions.** The premortem (imagining it failed and asking why) is complemented by the reverse: imagining it went very well and working backwards to what had to happen. And before starting, commit to what you'll do if the warning sign appears, so you don't decide it in the heat of the moment. Duke calls this a Ulysses contract.

## A worked case

A hypothetical case. At the end-of-cycle review, the admissions team goes over six decisions from the year. The coordinator presents them **without saying how each one ended**: what was known, what was chosen and why. Each person scores the process from 1 to 5.

Three decisions score 4 or more. Only then are the outcomes revealed. Of those three, **two ended badly**. Had the outcome been told first, both would have been logged as mistakes, and next year nobody would have repeated a process that was sound. And of the three that scored low, one went well by chance: that's the one to fix, even though it doesn't hurt.

Six decisions, three misjudged if you looked only at the outcome: half of the year's learning.

## Where it doesn't apply

**For small, reversible decisions.** Reviewing the subject line of the last email with this much care isn't worth it. Save it for things that are expensive to get wrong.

**When the group hasn't chosen to work this way.** If one person starts "looking for the contradiction" without the rest having agreed, it reads as an attack. The rules are set first, calmly.

**When everyone thinks alike.** Three people with the same experience and the same interests won't contradict you even if you ask. Bring in someone from another area.

## Check you've got it

Rank these three reviews from the one that helps you learn most to the one that helps least.

1. The team is told the campaign ended with fewer enrolments and asked what went wrong.
2. The decision is presented with what was known at the time, the process is scored, and only then is the outcome revealed.
3. The decision is presented and someone from another area is asked what would make them think it was a bad one.

:::Show the answer
**First 2, then 3, last 1.**

**Number 2** separates process from outcome, which is the heart of the book.

**Number 3** adds deliberate contradiction, but if the person already knows how it ended, the outcome will colour their view.

**Number 1** is *resulting* in its purest form: it starts from the outcome and hunts backwards for someone to blame.
:::

## What to do this week

Pick a decision your team will make this month. Before starting, write down together two things: what would have to happen for it to go very well, and what sign, by what date, would make you change course.
$md$,
  9
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. What is *resulting*?**

:::Show the answer
**Judging a decision by how it turned out.** Duke borrows the word from poker. Luck and what you didn't know sit between the decision and the outcome, so one doesn't prove the other.
:::

**2. What is the question "wanna bet?" for?**

:::Show the answer
**To move from "definitely" to "how sure?".** It makes you think about what you know, say it as a number and leave room to move it. It works even when nothing is at stake.
:::

**3. How do we tend to share out credit between skill and luck?**

:::Show the answer
**In our own favour.** What goes well, down to skill; what goes badly, down to bad luck. And with other people, the other way round. The result is that we learn little from our own failures and from other people's successes.
:::

**4. What does a group need in order to help you decide better?**

:::Show the answer
**Rules agreed beforehand:** look for what contradicts you, judge the idea and not the person saying it, review the process and not just the outcome, and reward changing your mind. Duke builds them on the norms Merton described for science. Without those rules, a group confirms what you already believed.
:::

**5. What is a Ulysses contract?**

:::Show the answer
**Committing in advance to what you'll do when a sign appears**, so you don't decide it in the heat of the moment. The name comes from Ulysses tied to the mast so as not to give in to the sirens' song.
:::

## What tends to fade

If what stayed with you was "outcomes don't matter", you've lost half of it. Duke doesn't say that: she says a single outcome is a very noisy piece of data. Many outcomes together do teach you something, and the work is separating how much of each came from the decision and how much from luck. Using "it was bad luck" to avoid reviewing anything is another form of the same mistake.

The other thing that fades is that the book isn't about poker. Poker is the example because luck is visible there: each hand lasts minutes and hundreds are played. At work luck is just as present, but it takes months to show and gets mixed up with everything else, which is why it's less noticeable.

## A case to apply it

The school's leadership congratulates the team because enrolment rose by 15% this year. Everyone puts it down to the new campaign. But that same year another school in the area closed. What would you do before repeating the campaign?

:::Show the answer
**Separate decision from outcome, just as if it had gone badly.** Ask how many of the new families came from the school that closed, and what the campaign says about the others. If the rise is almost entirely explained by the closure, the campaign may not have moved anything, and repeating it next year, without that tailwind, will come as a surprise.
:::

## What to do this week

Find a recent success of your team's and ask yourself, seriously, which part was luck. It's the review nobody does.
$md$,
  7
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Duke against Kahneman and Grove',
$md$
If it's fresh in your mind, the most useful thing is to set it against two books in the library that also deal with how decisions get made.

**Kahneman** (*Thinking, Fast and Slow*): the catalogue of systematic errors of judgement, among them hindsight bias: once you know how something ended, it's hard to reconstruct what you believed beforehand.

**Grove** (*High Output Management*): for group decisions, open discussion, a clear decision and then full support, even from those who were against it.

Before going on, a test. Without rereading: **what does Duke add to Kahneman?**

:::Show the answer
**Somewhere to practise.** Kahneman describes in great detail how we go wrong, and he himself is sceptical that knowing about a bias is enough to avoid it. Duke accepts that and proposes concrete habits: stating beliefs as bets with a number, reviewing without revealing the outcome, building a group with rules. Less theory, more routine.
:::

## Where they meet, and where they don't

**With Kahneman she agrees on the diagnosis.** Judging decision-makers by how things ended is precisely the harm Kahneman attributes to hindsight bias: it punishes reasonable decisions that went badly and rewards reckless bets that went well. And both distrust individual correction: Kahneman puts more faith in procedures than in willpower; Duke, in a group with rules. The premortem appears in both.

**With Grove there's a tension.** Grove asks for full support once the decision is made, so that it gets carried out. Duke asks you to keep the bet open and update it. They don't contradict each other if you separate two levels: you execute wholeheartedly, and at the same time you keep tracking the percentage. What doesn't work is full support turning into a ban on saying "this has dropped to 40%".

**Grove looks at the before, Duke at the after.** Grove organises how things are discussed before deciding. Duke puts the weight on how you review once the outcome is known. Together they cover the whole cycle.

## What the book doesn't prove

It's a popular book by a player who studied cognitive psychology, and it draws on other people's research, but her proposals aren't measured: she presents no evidence that a group set up the way she suggests makes better decisions in an organisation.

And the metaphor has a limit. In poker the probabilities can be calculated and hands repeat thousands of times. In a school, the "70%" is an estimate by eye and the open day happens once a year: there are very few outcomes to calibrate against. The best-known risk is using it the wrong way round: "it was bad luck" as an excuse to review nothing. Duke warns about it, and it still happens.

## A situation to decide

Enrolment fell and the leadership wants to change the agency that ran the campaign. You have two paths: (a) change it now, or (b) first review the campaign decision without looking at the outcome, and only then decide. What would each author say?

:::Show the answer
**Duke: (b).** Changing agency because of an outcome is *resulting*. First, what was known when it was hired and how much of the fall came from outside.

**Kahneman: also (b)**, and he'd warn that, already knowing the outcome, everyone will "remember" that the campaign looked weak from the start.

**Grove: (b) with a deadline.** Open discussion with the data, a clear decision within a set time, and full support for whatever is decided.

All three agree: review the process before heads roll.
:::

## What to do this week

Of the three books, pick the practice your team most lacks when deciding and try it on the next decision that matters. Just one.
$md$,
  8
from books b where b.slug = 'thinking-in-bets'
on conflict do nothing;
