-- ============================================================
-- 076 · Libro: Switch (Chip y Dan Heath)
-- ============================================================
-- Tema "cambio": el libro clásico sobre por qué la gente no cambia
-- aunque sepa que conviene. Caso de todas las piezas: un equipo que
-- tiene que adoptar una herramienta de IA nueva y no la adopta. No
-- pisa fr-adopcion (que enseña a medir la adopción): acá se trata de
-- diagnosticar por qué no se adopta y qué cambiar.
--
-- Verificado en Open Library el 24/11:
--   · obra OL8423529W, "Switch", Chip Heath y Dan Heath, primera
--     edición en inglés 2010 (Broadway Books; Open Library muestra 1999
--     como primer año por un registro mal cargado);
--   · edición en castellano: "Cambia el chip" (obra OL28170209W),
--     Gestión 2000, 2011, y Booket, 2022; traducción de Ana García
--     Bertrán. Hay además una edición de 2024 de Penguin Random House
--     titulada "Switch: Cómo cambiar las cosas cuando cambiar es
--     difícil"; se usa el título más difundido, "Cambia el chip";
--   · tapa 7280922, la azul con el interruptor, en inglés (mirada).
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto. Las
-- historias del libro sólo se nombran en una línea. Lo que no prueba
-- (anécdotas, el estudio de Wansink, el agotamiento del autocontrol)
-- va en la pieza que lo cruza con Made to Stick y Atomic Habits.
--
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'switch',
  'Switch',
  'Chip y Dan Heath',
  2010,
  array['cambio', 'liderazgo'],
  'Cambia el chip',
  7280922,
  array[
    'cambio','cambiar','adopción','adoptar','herramienta nueva','resistencia',
    'nadie la usa','implementar','implementación','capacitación','costumbre',
    'hábitos','motivar','convencer','equipo','change','adoption','rollout'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'El jinete, el elefante y el camino',
$md$
Los Heath toman una imagen del psicólogo Jonathan Haidt: cada persona es **un jinete montado en un elefante**. El jinete es la parte que razona, planifica y sabe lo que conviene. El elefante es la parte emocional: tiene la fuerza, se cansa, quiere lo inmediato. Cuando los dos tiran para lados distintos, el jinete puede ganar un rato, pero a la larga gana el elefante. Y los Heath agregan una tercera pieza: **el camino**, el entorno por el que los dos avanzan.

La idea del libro: **cuando un cambio no ocurre, casi nunca es porque la gente sea testaruda. Falla al menos una de tres cosas: el jinete no sabe exactamente qué hacer, el elefante no tiene ganas, o el camino está lleno de obstáculos.** Y cada falla se arregla distinto.

Tres frases del libro, dichas con otras palabras, ordenan el diagnóstico: lo que parece resistencia muchas veces es falta de claridad; lo que parece pereza muchas veces es cansancio; lo que parece un problema de personas muchas veces es un problema de situación.

## Un caso trabajado

Un caso hipotético. El equipo de admisiones de un colegio, ocho personas, recibe una herramienta de IA que arma el resumen de cada entrevista con una familia y lo deja en la ficha. Seis semanas después, de **120** entrevistas, sólo **30** tienen resumen hecho con la herramienta: el 25%.

La respuesta de siempre sería otra capacitación. Antes, quien coordina habla con cada una de las ocho personas y ordena lo que escucha:

- **Jinete (3 personas):** "No sé si va para la primera entrevista o para todas", "No sé si después tengo que corregirlo". No es rechazo: no saben qué hacer.
- **Elefante (3 personas):** temen que el resumen diga algo que la familia no dijo, y una siente que le sacan la parte del trabajo que más le gusta.
- **Camino (2 personas):** la herramienta está en otra pestaña, hay que copiar las notas a mano y son siete pasos. Entre una entrevista y la siguiente no hay tiempo.

Tres más tres más dos: ocho. Una capacitación le habla al jinete. En el mejor caso resuelve a 3 de 8; a los otros 5 no les cambia nada, porque su problema no es de información.

## Dónde no aplica

**Cuando la herramienta es mala.** A veces la gente no adopta algo porque no sirve. Si el resumen sale con errores en una de cada tres entrevistas, el elefante tiene razón. Escuchá primero, diagnosticá después.

**Cuando el cambio no le conviene a quien tiene que hacerlo.** Si adoptar la herramienta le suma trabajo a una persona para ahorrárselo a otra, no hay jinete ni elefante que lo arregle: es un problema de reparto, y se discute como tal.

**Cuando es una sola decisión, no un comportamiento.** El marco sirve para cambios que hay que sostener todos los días. Para algo que se decide una vez, alcanza con decidirlo bien.

## Probá que lo entendiste

¿Jinete, elefante o camino?

1. "Me parece buena idea, pero para usarla tengo que entrar con otra clave y nunca me acuerdo cuál es."
2. "No me queda claro si el resumen reemplaza mis notas o va además de ellas."
3. "Si la familia lee algo mal escrito en la ficha, la que queda mal soy yo."

:::Ver la respuesta
**La 1 es camino.** La persona quiere y sabe; el entorno le pone un obstáculo. Se arregla sacando la clave del medio, no explicando de nuevo.

**La 2 es jinete.** Le falta saber qué hacer exactamente. Se arregla con una instrucción precisa.

**La 3 es elefante.** Es miedo, y no se va con información. Se arregla con algo que baje ese riesgo, por ejemplo que el resumen pase por sus manos antes de quedar en la ficha.
:::

## Qué hacer esta semana

Elegí un cambio que en tu equipo no está prendiendo. Hablá con tres personas que no lo hacen y anotá cada razón como jinete, elefante o camino. Si todas caen en la misma columna, ya sabés dónde empezar; si caen en las tres, ya sabés por qué la última capacitación no alcanzó.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Decirle a dónde ir y darle ganas de ir',
$md$
Para el jinete, los Heath proponen tres cosas; para el elefante, otras tres. Esta pieza junta las que más sirven cuando un equipo no adopta algo nuevo.

La idea: **el jinete necesita instrucciones concretas y un destino claro, porque cuando hay ambigüedad se queda pensando y no se mueve. El elefante necesita sentir algo y que el primer paso parezca chico.** Explicar mejor no mueve al elefante; emocionar no le dice al jinete qué hacer.

**Para el jinete:**

- **Encontrar los puntos brillantes.** En vez de estudiar por qué falla, buscar quién ya lo está haciendo bien y copiar qué hace distinto. El libro lo cuenta con el trabajo de Jerry Sternin contra la desnutrición infantil en Vietnam.
- **Guionar los movimientos críticos.** No "usá más la herramienta", sino la conducta exacta, en el momento exacto. El ejemplo del libro es una campaña de salud que no pedía "comer mejor", sino pasar a leche descremada.
- **Señalar el destino.** Una imagen del punto de llegada, concreta y cercana.

**Para el elefante:**

- **Encontrar el sentimiento.** Mostrar, no demostrar. En el libro, alguien apila en la mesa del directorio los cientos de modelos de guantes que la empresa compraba por separado, y eso convence más que una planilla.
- **Achicar el cambio.** Que el primer paso se sienta corto, o que se vea que ya hay una parte hecha.

(La tercera para el elefante, hacer crecer a la gente desde su identidad, queda para cuando lo leas.)

## Un caso trabajado

Sigue el caso hipotético de la pieza anterior: ocho personas, 30 de 120 entrevistas con resumen hecho por la herramienta.

**Puntos brillantes.** Dos personas la usan casi siempre. Quien coordina mira qué hacen: pegan las notas apenas termina la entrevista, antes de levantarse, y corrigen el resumen ahí mismo, en tres minutos. Los demás dejaban todo para el final del día, cuando ya no se acordaban de los detalles.

**Guion.** Eso se vuelve la instrucción: "Al terminar cada entrevista, antes de levantarte, pegás las notas y revisás el resumen". Una conducta, un momento.

**Destino.** "En marzo, ninguna ficha queda sin resumen más de un día."

**Sentimiento.** En la reunión, quien coordina no muestra el 25%. Muestra un caso: una familia que tuvo que contar dos veces lo mismo porque la ficha estaba vacía, y cómo lo vivió.

**Achicar.** Durante dos semanas, sólo las segundas entrevistas. Y cada uno ve que ya tiene sus notas cargadas: falta el último paso.

Cuatro semanas después: de **80** entrevistas, **52** tienen resumen, el 65%. Contra el 25% de antes, son 40 puntos más, sin una capacitación nueva.

## Dónde no aplica

**Cuando no hay puntos brillantes.** Si nadie lo hace bien, no hay qué copiar. Primero alguien tiene que probarlo y encontrar la forma.

**Cuando el sentimiento es manipulación.** Elegir el caso más dramático para empujar algo que no lo justifica funciona una vez. La segunda, el equipo ya no te cree.

**Cuando achicar es esconder.** Si el cambio de verdad es grande, presentarlo como chico para que arranquen y después sumar lo demás rompe la confianza. Achicá el primer paso, no la verdad sobre el resto.

## Probá que lo entendiste

¿Para el jinete o para el elefante?

1. "Desde el lunes, toda entrevista de primera vez se resume con la herramienta antes de las 17."
2. Mostrar la ficha de una familia que se quejó por tener que repetir todo.
3. "Ya tenés las notas cargadas en 8 de tus 10 fichas: te falta apretar un botón en cada una."

:::Ver la respuesta
**La 1 es para el jinete:** un movimiento guionado, con conducta y momento.

**La 2 es para el elefante:** encontrar el sentimiento con un caso concreto, no con un porcentaje.

**La 3 es para el elefante:** achicar el cambio, mostrando que ya hay una parte hecha.
:::

## Qué hacer esta semana

Buscá a la persona de tu equipo que mejor adoptó algo nuevo y preguntale exactamente cuándo y cómo lo hace. Convertí la respuesta en una sola frase con conducta y momento, y compartila tal cual.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Cambiar el camino, no a la gente',
$md$
La tercera parte del libro es la menos heroica y, para quien coordina, la más útil. Cuando un cambio no prende, la tendencia es trabajar sobre las personas: explicar, motivar, insistir. Los Heath proponen mirar el entorno.

La idea: **muchas veces es más fácil cambiar la situación que cambiar a la persona. Si el comportamiento nuevo es el más fácil de hacer, la gente lo hace sin necesidad de convencerse todos los días.**

Tres formas de darle forma al camino:

- **Ajustar el entorno.** Sacar pasos, mover las cosas de lugar, que lo nuevo quede a mano y lo viejo un poco más lejos.
- **Crear hábitos.** Atar la conducta nueva a un disparador que ya existe, para que no dependa de acordarse. Lo que en psicología se llama intención de implementación: "cuando pase tal cosa, hago tal otra".
- **Hacer que se contagie.** La gente mira qué hacen los demás para saber qué es lo normal. Si el uso es invisible, cada uno cree que es el único que lo intenta.

## Un caso trabajado

Sigue el caso hipotético: el equipo de admisiones ya está en 65%, pero las dos personas cuyo problema era el camino siguen sin usar la herramienta.

**Ajustar el entorno.** Para hacer un resumen había que abrir otra pestaña, entrar con otra clave, copiar las notas, pegarlas, esperar, copiar el resultado y pegarlo en la ficha: **7 pasos**, unos **6 minutos**. Se agrega un botón en la ficha que manda las notas y trae el resumen: **2 pasos**, unos **2 minutos**.

Con unas **30 entrevistas por semana**, son 4 minutos menos por entrevista: **120 minutos**, dos horas por semana que el equipo deja de gastar en copiar y pegar.

**Crear hábitos.** El disparador ya existe: la familia se va. "Cuando la familia sale de la oficina, apretás el botón." No hace falta acordarse de nada más.

**Hacer que se contagie.** En la reunión del lunes se muestra cuántas fichas tienen resumen, por persona, sin ranking ni reproches: sólo que se vea que la mayoría ya lo hace.

Tres semanas después, las ocho personas usan la herramienta.

## Dónde no aplica

**Cuando el problema no era el camino.** Si alguien no confía en lo que resume la herramienta, ponerle un botón más cerca no lo resuelve. Sacar obstáculos sirve cuando la gente ya quiere.

**Cuando contagiar se vuelve vigilar.** Mostrar el uso por persona puede leerse como control. Si el equipo lo vive así, mostrá el total, no los nombres.

**Cuando lo fácil también es lo malo.** Si el botón hace tan fácil el resumen que nadie lo revisa, ajustaste el camino hacia otro problema. Lo que hagas fácil tiene que ser lo correcto completo, revisión incluida.

## Probá que lo entendiste

¿Ajustar el entorno, crear un hábito o hacer que se contagie?

1. Que la herramienta aparezca abierta por defecto al entrar a la ficha de la familia.
2. "Cada viernes, antes de cerrar la semana, revisás los resúmenes que quedaron pendientes."
3. Contar en la reunión que ya seis de ocho personas la usan en todas sus entrevistas.

:::Ver la respuesta
**La 1 es ajustar el entorno.** No le pide nada a la persona: la conducta nueva queda a mano.

**La 2 es crear un hábito.** Ata la conducta a un disparador que ya existe, el cierre de la semana.

**La 3 es hacer que se contagie.** Muestra que lo nuevo ya es lo normal, y eso empuja a quienes faltan.
:::

## Qué hacer esta semana

Elegí un cambio que estás pidiendo y contá los pasos que hacen falta para cumplirlo. Si son más de tres, buscá uno que puedas sacar esta semana sin pedirle nada a nadie.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Qué representan el jinete, el elefante y el camino?**

:::Ver la respuesta
**El jinete** es la parte racional, la que planifica. **El elefante** es la emocional, la que tiene la fuerza. **El camino** es el entorno. La imagen del jinete y el elefante es de Jonathan Haidt; el camino lo agregan los Heath.
:::

**2. Lo que parece resistencia, ¿qué suele ser según el libro?**

:::Ver la respuesta
**Falta de claridad.** La gente no se mueve porque no sabe exactamente qué hacer. Es el argumento para guionar los movimientos críticos en vez de pedir "más compromiso".
:::

**3. ¿Qué es un punto brillante y para qué sirve?**

:::Ver la respuesta
**Un caso que ya funciona**, aunque sea chico, dentro del mismo contexto. Sirve para copiar lo que hace distinto, en vez de analizar a fondo por qué falla todo lo demás.
:::

**4. ¿Por qué no alcanza con explicar bien un cambio?**

:::Ver la respuesta
**Porque la explicación le habla al jinete, y el que se cansa es el elefante.** El autocontrol se agota: si el cambio exige esfuerzo constante, en algún momento gana la costumbre. Hace falta un sentimiento, un primer paso chico o un camino más fácil.
:::

**5. ¿Cuáles son las tres formas de darle forma al camino?**

:::Ver la respuesta
**Ajustar el entorno, crear hábitos y hacer que se contagie.** Las tres bajan la cantidad de voluntad que hace falta.
:::

## Lo que suele borrarse

Casi todos recuerdan el jinete y el elefante, y se olvidan del camino. Es la parte menos vistosa y la que más le sirve a quien coordina: muchas veces cambiar dónde está una herramienta o cuántos pasos lleva mueve más que cualquier charla. Si de *Switch* te quedó "hay que motivar y explicar", te quedaste con dos de tres. Y el otro olvido frecuente es el orden: primero se diagnostica cuál de las tres falla, después se elige qué hacer.

## Un caso para aplicarlo

En tu equipo se decidió usar una herramienta de IA para preparar las respuestas a consultas frecuentes. Todos dijeron que sí. Al mes, casi nadie la usa. Quien coordina propone mandar un mail recordando lo útil que es. ¿Qué le dirías?

:::Ver la respuesta
**Que un mail le habla sólo al jinete**, y probablemente el jinete ya sabe que es útil. Antes de mandar nada, hablá con tres personas y separá las razones en jinete, elefante y camino. Si aparece "no sé cuándo usarla", guioná el momento exacto. Si aparece "me da miedo que conteste mal", bajá ese riesgo. Si aparece "está en otro lado y no me acuerdo", acercá la herramienta. El mail resuelve, como mucho, una de las tres.
:::

## Qué hacer esta semana

Pensá en el último cambio que pediste y no prendió. Escribí qué hiciste para el jinete, qué para el elefante y qué para el camino. Si alguna columna quedó vacía, por ahí va el próximo intento.
$md$,
  7
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Los Heath contra los Heath, y contra Clear',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con dos libros de la biblioteca que tocan lo mismo desde otro lado.

***Made to Stick***, de los mismos autores: cómo hacer que una idea se entienda y se recuerde. Simple, inesperada, concreta, creíble, emocional, con historias.

***Atomic Habits***, de James Clear: los hábitos se sostienen si son obvios, atractivos, fáciles y satisfactorios, y el entorno pesa más que la voluntad.

Antes de seguir, una prueba. Sin releer: **¿qué parte de *Switch* es casi *Made to Stick* aplicado al cambio?**

:::Ver la respuesta
**Dirigir al jinete y motivar al elefante.** Guionar los movimientos críticos es hacer concreta la instrucción; señalar el destino es encontrar el núcleo; encontrar el sentimiento es la parte emocional y la de las historias. *Made to Stick* enseña a que una idea quede; *Switch* agrega que, aunque quede, la gente puede no actuar si el camino está en contra.
:::

## Dónde se tocan, y dónde no

**Con Clear coinciden en el camino.** Ajustar el entorno y crear hábitos de *Switch* son casi las reglas de Clear de hacer las cosas obvias y fáciles. Los dos llegan a la misma conclusión: lo que parece falta de carácter suele ser un entorno mal armado.

**Pero no le hablan a la misma persona.** Clear escribe para alguien que quiere cambiar su propia conducta. Los Heath escriben para alguien que quiere que otros cambien: un equipo, una organización, una comunidad. Por eso *Switch* tiene algo que a Clear le falta, que es el contagio entre personas y el diagnóstico de por qué un grupo no se mueve.

**Con *Made to Stick* hay una diferencia de alcance.** Ese libro termina cuando la idea quedó en la cabeza del otro. *Switch* empieza ahí: la idea ya se entendió, y aun así no pasa nada.

## Lo que el libro no prueba

Como los otros dos, es un libro de divulgación armado con casos que salieron bien. No hay forma de saber cuántos cambios aplicaron lo mismo y fracasaron.

Hay dos apoyos que hoy conviene tomar con cuidado. Uno: el libro se apoya en la idea de que el autocontrol se agota con el uso, como un músculo cansado. Esa línea de investigación tuvo después problemas serios de replicación: un estudio grande, coordinado entre muchos laboratorios en 2016, encontró un efecto cercano a cero. La intuición de que el esfuerzo sostenido cansa sigue siendo razonable; el mecanismo, no está probado. Dos: el libro abre con un estudio sobre porciones de pochoclo de Brian Wansink, un investigador que años después tuvo muchos trabajos retractados por problemas de método. La idea general de que el entorno cambia cuánto comemos tiene otros apoyos, pero ese estudio no conviene citarlo.

## Una situación para decidir

Tenés que lograr que tu equipo use una herramienta de IA nueva. Tiempo para una sola cosa este mes: (a) una presentación muy bien armada, con un caso que emocione, o (b) sacar pasos para que la herramienta quede dentro del sistema que ya usan. ¿Qué elegiría cada uno?

:::Ver la respuesta
***Made to Stick*: la (a).** Su terreno es que el mensaje quede.

**Clear: la (b).** Hacerlo fácil y obvio le gana a cualquier motivación.

***Switch*: depende del diagnóstico.** Si la gente no la usa porque no entiende para qué, la (a). Si ya la entiende y no la usa, la (b). Antes de elegir, preguntá a tres personas por qué no la usan.
:::

## Qué hacer esta semana

Tomá el cambio que más te cuesta en tu equipo y escribí una línea por libro: qué haría cada uno. Si las tres líneas dicen lo mismo, hacelo; si no, empezá por la que ataca la razón que escuchaste más veces.
$md$,
  8
from books b where b.slug = 'switch'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'The Rider, the Elephant and the Path',
$md$
The Heaths borrow an image from the psychologist Jonathan Haidt: each person is **a rider sitting on an elephant**. The rider is the part that reasons, plans and knows what's sensible. The elephant is the emotional part: it has the strength, it gets tired, it wants what's immediate. When the two pull in different directions, the rider can win for a while, but in the long run the elephant wins. And the Heaths add a third piece: **the path**, the environment both of them travel through.

The book's idea: **when a change doesn't happen, it's rarely because people are stubborn. At least one of three things is failing: the rider doesn't know exactly what to do, the elephant doesn't want to, or the path is full of obstacles.** And each failure is fixed differently.

Three claims from the book, put in other words, organise the diagnosis: what looks like resistance is often a lack of clarity; what looks like laziness is often exhaustion; what looks like a people problem is often a situation problem.

## A worked case

A hypothetical case. A school's admissions team, eight people, is given an AI tool that writes the summary of each interview with a family and puts it on the record. Six weeks later, of **120** interviews, only **30** have a summary made with the tool: 25%.

The usual response would be another training session. Instead, the person coordinating talks to each of the eight and sorts what they hear:

- **Rider (3 people):** "I don't know if it's for the first interview or for all of them", "I don't know if I then have to correct it". It isn't rejection: they don't know what to do.
- **Elephant (3 people):** they're afraid the summary will say something the family didn't say, and one feels the part of the job she enjoys most is being taken away.
- **Path (2 people):** the tool is in another tab, the notes have to be copied by hand and it takes seven steps. There's no time between one interview and the next.

Three plus three plus two: eight. A training session speaks to the rider. At best it solves 3 out of 8; for the other 5 nothing changes, because their problem isn't information.

## Where it doesn't apply

**When the tool is bad.** Sometimes people don't adopt something because it doesn't work. If the summary contains mistakes in one interview in three, the elephant is right. Listen first, diagnose afterwards.

**When the change doesn't benefit the person who has to make it.** If adopting the tool adds work for one person to save it for another, no rider or elephant will fix it: it's a question of how the work is shared out, and it should be discussed as such.

**When it's a single decision, not a behaviour.** The framework is for changes that have to be sustained every day. For something decided once, deciding it well is enough.

## Check you've got it

Rider, elephant or path?

1. "I think it's a good idea, but to use it I have to log in with another password and I can never remember which one."
2. "It isn't clear to me whether the summary replaces my notes or goes alongside them."
3. "If the family reads something badly written on the record, I'm the one who looks bad."

:::Show the answer
**1 is the path.** The person wants to and knows how; the environment puts an obstacle in the way. You fix it by removing the password, not by explaining again.

**2 is the rider.** They're missing exactly what to do. You fix it with a precise instruction.

**3 is the elephant.** It's fear, and information won't make it go away. You fix it with something that lowers that risk, for example making the summary pass through her hands before it goes on the record.
:::

## What to do this week

Pick a change in your team that isn't catching on. Talk to three people who aren't doing it and note each reason as rider, elephant or path. If they all fall in the same column, you know where to start; if they fall in all three, you know why the last training session wasn't enough.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Show the way and make them want to go',
$md$
For the rider, the Heaths propose three things; for the elephant, another three. This piece brings together the ones that help most when a team doesn't adopt something new.

The idea: **the rider needs concrete instructions and a clear destination, because when there's ambiguity it keeps thinking and doesn't move. The elephant needs to feel something and for the first step to look small.** Explaining better doesn't move the elephant; stirring emotions doesn't tell the rider what to do.

**For the rider:**

- **Find the bright spots.** Instead of studying why it fails, look for who is already doing it well and copy what they do differently. The book tells it through Jerry Sternin's work against child malnutrition in Vietnam.
- **Script the critical moves.** Not "use the tool more", but the exact behaviour, at the exact moment. The book's example is a health campaign that didn't ask people to "eat better", but to switch to skimmed milk.
- **Point to the destination.** A picture of the end point, concrete and near.

**For the elephant:**

- **Find the feeling.** Show, don't argue. In the book, someone piles up on the boardroom table the hundreds of different gloves the company was buying separately, and that convinces more than a spreadsheet.
- **Shrink the change.** Make the first step feel short, or show that part of it is already done.

(The third one for the elephant, growing people through their identity, is for when you read it.)

## A worked case

The hypothetical case from the previous piece continues: eight people, 30 of 120 interviews summarised with the tool.

**Bright spots.** Two people use it almost every time. The person coordinating watches what they do: they paste the notes as soon as the interview ends, before getting up, and correct the summary there and then, in three minutes. The others left it all until the end of the day, when they no longer remembered the details.

**Script.** That becomes the instruction: "When each interview ends, before you get up, paste the notes and check the summary". One behaviour, one moment.

**Destination.** "By March, no record goes more than a day without a summary."

**Feeling.** In the meeting, the person coordinating doesn't show the 25%. They show a case: a family who had to tell the same story twice because the record was empty, and how they felt about it.

**Shrink.** For two weeks, second interviews only. And everyone can see their notes are already in: only the last step is missing.

Four weeks later: of **80** interviews, **52** have a summary, 65%. Against the earlier 25%, that's 40 points more, with no new training session.

## Where it doesn't apply

**When there are no bright spots.** If nobody is doing it well, there's nothing to copy. First someone has to try it and find the way.

**When the feeling is manipulation.** Choosing the most dramatic case to push something that doesn't warrant it works once. The second time, the team no longer believes you.

**When shrinking is hiding.** If the real change is large, presenting it as small to get people started and then adding the rest breaks trust. Shrink the first step, not the truth about the rest.

## Check you've got it

For the rider or for the elephant?

1. "From Monday, every first-time interview is summarised with the tool before 5 pm."
2. Showing the record of a family who complained about having to repeat everything.
3. "Your notes are already in 8 of your 10 records: all that's left is pressing a button on each."

:::Show the answer
**1 is for the rider:** a scripted move, with a behaviour and a moment.

**2 is for the elephant:** finding the feeling with a concrete case, not a percentage.

**3 is for the elephant:** shrinking the change by showing that part of it is already done.
:::

## What to do this week

Find the person in your team who has best adopted something new and ask them exactly when and how they do it. Turn the answer into a single sentence with a behaviour and a moment, and share it as it is.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Change the path, not the people',
$md$
The third part of the book is the least heroic and, for whoever coordinates, the most useful. When a change doesn't catch on, the tendency is to work on the people: explain, motivate, insist. The Heaths suggest looking at the environment.

The idea: **it's often easier to change the situation than to change the person. If the new behaviour is the easiest one to do, people do it without having to convince themselves every day.**

Three ways to shape the path:

- **Tweak the environment.** Remove steps, move things around, put the new thing within reach and the old one a little further away.
- **Build habits.** Tie the new behaviour to a trigger that already exists, so it doesn't depend on remembering. What psychology calls an implementation intention: "when this happens, I do that".
- **Rally the herd.** People look at what others do to know what's normal. If use is invisible, everyone thinks they're the only one trying.

## A worked case

The hypothetical case continues: the admissions team is now at 65%, but the two people whose problem was the path still don't use the tool.

**Tweak the environment.** To make a summary you had to open another tab, log in with another password, copy the notes, paste them, wait, copy the result and paste it into the record: **7 steps**, about **6 minutes**. A button is added to the record that sends the notes and brings back the summary: **2 steps**, about **2 minutes**.

With about **30 interviews a week**, that's 4 minutes less per interview: **120 minutes**, two hours a week the team stops spending on copying and pasting.

**Build habits.** The trigger already exists: the family leaves. "When the family walks out of the office, you press the button." Nothing else to remember.

**Rally the herd.** At the Monday meeting the team sees how many records have a summary, by person, with no ranking and no reproach: just so it's visible that most people already do it.

Three weeks later, all eight people use the tool.

## Where it doesn't apply

**When the problem wasn't the path.** If someone doesn't trust what the tool summarises, putting a button closer doesn't solve it. Removing obstacles helps when people already want to.

**When rallying becomes monitoring.** Showing use by person can read as control. If the team experiences it that way, show the total, not the names.

**When the easy thing is also the wrong thing.** If the button makes the summary so easy that nobody checks it, you've shaped the path towards another problem. Whatever you make easy has to be the complete right thing, checking included.

## Check you've got it

Tweak the environment, build a habit or rally the herd?

1. The tool opens by default when you go into a family's record.
2. "Every Friday, before closing the week, you check the summaries left pending."
3. Telling the meeting that six of eight people already use it in all their interviews.

:::Show the answer
**1 is tweaking the environment.** It asks nothing of the person: the new behaviour is within reach.

**2 is building a habit.** It ties the behaviour to a trigger that already exists, closing the week.

**3 is rallying the herd.** It shows the new thing is already normal, and that nudges those who haven't started.
:::

## What to do this week

Pick a change you're asking for and count the steps needed to do it. If there are more than three, find one you can remove this week without asking anything of anyone.
$md$,
  9
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. What do the rider, the elephant and the path stand for?**

:::Show the answer
**The rider** is the rational part, the one that plans. **The elephant** is the emotional part, the one with the strength. **The path** is the environment. The image of the rider and the elephant comes from Jonathan Haidt; the Heaths add the path.
:::

**2. According to the book, what is what looks like resistance often?**

:::Show the answer
**A lack of clarity.** People don't move because they don't know exactly what to do. It's the argument for scripting the critical moves instead of asking for "more commitment".
:::

**3. What is a bright spot and what is it for?**

:::Show the answer
**A case that already works**, however small, within the same context. It's for copying what it does differently, instead of analysing in depth why everything else fails.
:::

**4. Why isn't explaining a change well enough?**

:::Show the answer
**Because the explanation speaks to the rider, and it's the elephant that gets tired.** Self-control runs down: if the change demands constant effort, at some point habit wins. You need a feeling, a small first step or an easier path.
:::

**5. What are the three ways to shape the path?**

:::Show the answer
**Tweak the environment, build habits and rally the herd.** All three reduce the amount of willpower needed.
:::

## What usually gets forgotten

Almost everyone remembers the rider and the elephant, and forgets the path. It's the least showy part and the most useful for whoever coordinates: often changing where a tool sits or how many steps it takes moves more than any talk. If what stayed with you from *Switch* is "you have to motivate and explain", you kept two out of three. The other common slip is the order: first you diagnose which of the three is failing, then you choose what to do.

## A case to apply it

Your team decided to use an AI tool to prepare replies to frequent enquiries. Everyone said yes. A month later, hardly anyone uses it. The person coordinating suggests sending an email reminding everyone how useful it is. What would you tell them?

:::Show the answer
**That an email speaks only to the rider**, and the rider probably already knows it's useful. Before sending anything, talk to three people and sort the reasons into rider, elephant and path. If "I don't know when to use it" comes up, script the exact moment. If "I'm afraid it'll reply badly" comes up, lower that risk. If "it's somewhere else and I forget" comes up, bring the tool closer. The email solves one of the three, at most.
:::

## What to do this week

Think of the last change you asked for that didn't catch on. Write down what you did for the rider, what for the elephant and what for the path. If any column is empty, that's where the next attempt goes.
$md$,
  7
from books b where b.slug = 'switch'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'The Heaths against the Heaths, and against Clear',
$md$
If it's fresh in your mind, the most useful thing is to cross it with two books in the library that touch the same ground from another side.

***Made to Stick***, by the same authors: how to make an idea understood and remembered. Simple, unexpected, concrete, credible, emotional, with stories.

***Atomic Habits***, by James Clear: habits last if they're obvious, attractive, easy and satisfying, and the environment matters more than willpower.

Before going on, a test. Without rereading: **which part of *Switch* is almost *Made to Stick* applied to change?**

:::Show the answer
**Directing the rider and motivating the elephant.** Scripting the critical moves is making the instruction concrete; pointing to the destination is finding the core; finding the feeling is the emotional part and the stories. *Made to Stick* teaches how to make an idea stay; *Switch* adds that, even if it stays, people may not act if the path is against them.
:::

## Where they meet, and where they don't

**With Clear they agree on the path.** Tweaking the environment and building habits in *Switch* are almost Clear's rules of making things obvious and easy. Both reach the same conclusion: what looks like a lack of character is usually a badly arranged environment.

**But they're not speaking to the same person.** Clear writes for someone who wants to change their own behaviour. The Heaths write for someone who wants others to change: a team, an organisation, a community. That's why *Switch* has something Clear lacks: contagion between people and the diagnosis of why a group doesn't move.

**With *Made to Stick* there's a difference of scope.** That book ends when the idea has stuck in the other person's head. *Switch* starts there: the idea has been understood, and still nothing happens.

## What the book doesn't prove

Like the other two, it's a popular book built on cases that went well. There's no way to know how many changes applied the same things and failed.

Two of its supports are worth handling with care today. One: the book leans on the idea that self-control runs down with use, like a tired muscle. That line of research later ran into serious replication problems: a large study coordinated across many laboratories in 2016 found an effect close to zero. The intuition that sustained effort is tiring is still reasonable; the mechanism isn't proven. Two: the book opens with a study on popcorn portions by Brian Wansink, a researcher who years later had many papers retracted over problems of method. The general idea that the environment changes how much we eat has other support, but that study is best not cited.

## A situation to decide

You need your team to use a new AI tool. Time for one thing only this month: (a) a very well-made presentation, with a case that moves people, or (b) removing steps so the tool sits inside the system they already use. What would each choose?

:::Show the answer
***Made to Stick*: (a).** Its ground is making the message stick.

**Clear: (b).** Making it easy and obvious beats any motivation.

***Switch*: it depends on the diagnosis.** If people don't use it because they don't understand what it's for, (a). If they understand it and still don't use it, (b). Before choosing, ask three people why they don't use it.
:::

## What to do this week

Take the change your team finds hardest and write one line per book: what each would do. If all three lines say the same thing, do it; if not, start with the one that tackles the reason you heard most often.
$md$,
  8
from books b where b.slug = 'switch'
on conflict do nothing;
