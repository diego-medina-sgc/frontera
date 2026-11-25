-- ============================================================
-- 072 · Libro: Deep Work (Cal Newport)
-- ============================================================
-- Precarga del 24/11. Temas "productividad" y "habitos". Le habla a
-- quien coordina con la agenda llena de reuniones y mensajes, y se
-- cruza con Clear (hábitos) y Grove (la producción de quien coordina).
--
-- Verificado en Open Library el 24/11:
--   · obra OL17713267W, 2016, Cal Newport;
--   · edición en castellano "Céntrate" (Ediciones Península, 2022,
--     OL47140083M, idioma spa);
--   · tapa 7988607, de la edición de Grand Central Publishing 2016
--     en inglés (OL26314691M); responde 200 y pesa ~18 KB.
--
-- Las ideas, no el libro: síntesis propia, sin frases del texto.
-- Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'deep-work',
  'Deep Work',
  'Cal Newport',
  2016,
  array['productividad', 'habitos'],
  'Céntrate',
  7988607,
  array[
    'concentración','concentrarme','foco','distracciones','interrupciones','reuniones',
    'mails','correo','mensajes','whatsapp','agenda','agenda llena','no me alcanza el tiempo',
    'multitarea','pensar','escribir','focus','meetings','email','deep work'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Lo profundo y lo superficial',
$md$
Cal Newport es profesor de informática y escribió este libro sobre una distinción que parece obvia hasta que te ponés a medir tu semana:

- **Trabajo profundo:** el que hacés concentrado, sin distracciones, empujando tu capacidad al límite. Produce algo nuevo o te hace mejor en lo que hacés, y es difícil de copiar.
- **Trabajo superficial:** lo logístico, lo que se puede hacer distraído y casi cualquiera podría hacer con poca preparación. Contestar, reenviar, coordinar, agendar.

La idea central del libro es una hipótesis: **la capacidad de trabajar en profundidad es cada vez más escasa y, al mismo tiempo, cada vez más valiosa.** Escasa porque el trabajo de oficina empuja a estar siempre disponible. Valiosa porque lo que distingue a alguien es lo que produce cuando piensa en serio, no cuánto contesta.

Newport agrega una cuenta simple: lo que producís de calidad depende del **tiempo** que le dedicás y de la **intensidad** de la concentración. Y la intensidad se rompe con cada cambio de tarea: al saltar de algo a otro, parte de tu atención se queda pegada en lo anterior. El libro lo llama *residuo de atención*, a partir de los trabajos de la investigadora Sophie Leroy.

## Un caso trabajado (hipotético)

Quien coordina el equipo de admisiones tiene que escribir la propuesta del proceso de ingreso del año que viene. Estima que necesita unas **6 horas** de trabajo serio.

Su semana real: reuniones salteadas, y entre una y otra, huecos de media hora que llena revisando el correo y el chat del equipo. Si junta 12 huecos de 30 minutos, en el papel tiene las 6 horas.

Ahora la intensidad. Supongamos, sólo para hacer la cuenta, que en un hueco de 30 minutos con el chat abierto rinde la **mitad** que concentrada: los primeros minutos se van en acordarse dónde estaba, y cada mensaje que mira le deja algo de residuo.

- **12 huecos × 30 min × 50% = 3 horas efectivas.** La propuesta queda a medias.
- **4 bloques de 90 min sin chat ni correo = 6 horas efectivas.** Con el mismo tiempo total.

El número exacto del rendimiento es inventado; la dirección no. Mismo tiempo, distinta producción, y la diferencia está en cómo se corta.

## Dónde no aplica

**No todo trabajo valioso es profundo.** Atender a una familia que llama angustiada no requiere concentración en soledad, y es lo que más importa ese día. El libro habla del trabajo que necesita pensar, no de todo lo que vale.

**Hay roles cuya tarea es estar disponible.** Una recepción o un soporte técnico existen para responder rápido. Ahí la pregunta no es cómo dejar de responder, sino quién del equipo sí puede tener bloques.

**No es un elogio del aislamiento.** Newport reconoce que muchas ideas salen de cruzarse con otros. Lo que critica es la interrupción constante, no la colaboración.

## Probá que lo entendiste

¿Profundo o superficial?

1. Diseñar desde cero cómo se va a evaluar a los postulantes del año próximo.
2. Reenviar a cada familia el horario de la entrevista que ya está agendada.
3. Armar la planilla de seguimiento semanal copiando datos de un sistema a otro.

:::Ver la respuesta
**1. Profundo.** Requiere pensar, produce algo nuevo y no lo puede hacer cualquiera sin preparación.

**2. Superficial.** Es logística: necesaria, pero cualquiera con media hora de explicación la haría igual.

**3. Superficial**, aunque lleve horas. Que algo sea largo o tedioso no lo vuelve profundo: la medida es cuánto exige de tu capacidad, no cuánto dura.
:::

## Qué hacer esta semana

Elegí una tarea que vengas postergando porque "no encontrás el momento". Contá cuántos bloques de 90 minutos sin interrupciones tuviste la semana pasada. Si el número es cero, ya sabés por qué se posterga.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Que la profundidad tenga lugar en la agenda',
$md$
Si esperás a tener ganas o a que se libere un hueco, el trabajo profundo no ocurre. La propuesta de Newport es que **la profundidad se decide antes, con un horario y un ritual, no en el momento con fuerza de voluntad.**

Para el horario describe cuatro maneras de organizarlo, de la más extrema a la más flexible:

- **Monástica:** sacar casi todo lo superficial de tu vida laboral. Pone como ejemplo a Donald Knuth, que no usa correo electrónico. Le sirve a muy poca gente.
- **Bimodal:** alternar períodos largos de profundidad (días enteros, semanas) con períodos normales. El ejemplo es Carl Jung, que se retiraba a escribir a una casa en el campo.
- **Rítmica:** el mismo bloque, a la misma hora, todos los días o casi. No hay que decidir nada: es un hábito.
- **Periodística:** meter profundidad en cualquier hueco que aparezca. Newport advierte que es la más difícil, porque exige poder cambiar de modo en minutos.

Además del horario, un **ritual**: dónde vas a trabajar, cuánto tiempo, con qué reglas (sin correo, sin teléfono a la vista) y qué necesitás tener a mano para no levantarte. Y al final del día, un **ritual de cierre**: repasar lo pendiente, anotar dónde quedaste y dar el día por terminado, para que la cabeza no siga trabajando a la noche.

La parte menos intuitiva es la del aburrimiento. Si cada vez que esperás algo mirás el teléfono, entrenás a tu cabeza a no tolerar un minuto sin estímulo, y después no podés concentrarte cuando querés. Newport propone darlo vuelta: **no tomarte descansos de la distracción, sino de la concentración.** Decidís de antemano en qué momentos vas a mirar el correo y el chat, y fuera de esos momentos no los mirás, aunque estés esperando.

## Un caso trabajado (hipotético)

Quien coordina un equipo de cinco tiene la agenda tomada desde las 10 por reuniones, y el chat del equipo suena todo el día. Una forma monástica o bimodal no le sirve: su equipo la necesita disponible.

Elige la **rítmica**. Bloquea martes, jueves y viernes de 8:00 a 9:30, antes de que empiecen las reuniones, en una sala chica, con el correo cerrado.

- **3 bloques × 1,5 horas = 4,5 horas** de profundidad por semana.
- En **4 semanas, 18 horas.** Es más de lo que le dedicó a pensar en todo el trimestre anterior.

Para el resto del día, fija cuatro momentos para el chat y el correo: 9:30, 11:30, 14:00 y 16:30. Le avisa al equipo, y acuerda que lo urgente de verdad va por llamada. Entre esos horarios, si está esperando a alguien, espera.

## Dónde no aplica

**Cuando tu agenda no es tuya.** Si otra persona decide tus horarios, el bloque no se defiende solo: hay que negociarlo con quien decide. El libro da por sentado más autonomía de la que mucha gente tiene.

**En semanas de pico.** En plena época de inscripciones, puede que no haya bloque posible. Eso no invalida la idea: la vuelve estacional.

**Si el ritual se vuelve el objetivo.** Hay quien pasa más tiempo armando el lugar perfecto que trabajando en él.

## Probá que lo entendiste

¿Qué forma de organizar la profundidad es cada una?

1. Todos los días de 7:30 a 9:00 escribe, antes de abrir el correo.
2. Dos veces por año se toma una semana fuera de la oficina para planificar.
3. Si una reunión se cancela, aprovecha esa hora para avanzar en el informe.

:::Ver la respuesta
**1. Rítmica.** El mismo bloque a la misma hora; la regularidad le ahorra decidir.

**2. Bimodal.** Períodos largos y separados de profundidad, y el resto del tiempo, normal.

**3. Periodística.** Usa lo que aparece. Sirve si ya tenés práctica; si no, la hora se va en arrancar.
:::

## Qué hacer esta semana

Bloqueá en tu agenda dos espacios de 90 minutos, a la misma hora, con nombre ("pensar la propuesta"), y definí los horarios fijos en que vas a mirar el chat. Avisale a tu equipo cuáles son y cómo te encuentran si es urgente.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Medir lo superficial para achicarlo',
$md$
Proteger bloques profundos no alcanza si lo superficial crece hasta comerse el resto. La última parte del libro trata de eso, y la idea es: **lo superficial no se elimina, se mide y se le pone un techo.**

Newport propone tres herramientas.

**Una pregunta para medir cada tarea:** ¿cuántos meses le llevaría a una persona inteligente, recién recibida y sin experiencia en tu área, aprender a hacer esto? Si la respuesta es "una semana", es superficial. Si es "un año", probablemente es profunda. Sirve para ver con claridad lo que la costumbre mezcla.

**Un presupuesto de superficialidad, acordado con quien te conduce.** No es que lo decidas vos solo: preguntás qué proporción de tu semana debería ir a lo superficial, y con ese número podés decir que no a lo que lo pasa. Newport sugiere que, para la mayoría de los trabajos que no son de ingreso, el número razonable anda entre un tercio y la mitad.

**El correo, con otra lógica.** Tres ideas:

- Que quien te escribe haga un poco más de trabajo: decir en qué casos respondés y en cuáles no.
- Que cuando vos escribís, cierres el tema: en vez de "¿cuándo nos juntamos?", proponer dos horarios y decir qué pasa en cada caso.
- Aceptar que no todo mensaje requiere respuesta. Si no responder no trae nada grave, no responder es una opción.

## Un caso trabajado (hipotético)

Quien coordina el equipo trabaja 40 horas por semana. Durante una semana anota todo y le aplica la pregunta de los meses. Resultado: **26 horas superficiales**, el **65%**.

Habla con su directora y acuerdan un techo del **50%**: 20 horas. Tiene que liberar **6 horas** de lo superficial.

- Dos reuniones semanales de seguimiento pasan a ser una sola: libera **1,5 horas**.
- Los informes que copiaba a mano los arma alguien del equipo con una planilla: **2 horas**.
- Cada coordinación de horarios por correo le llevaba unos cinco mensajes de ida y vuelta. Con respuestas que proponen horarios y cierran el tema, baja a dos. En su volumen de mails, estima unas **2,5 horas**.

**1,5 + 2 + 2,5 = 6 horas.** Llega al techo, con el detalle de que la última cifra es una estimación que conviene revisar en un mes.

## Dónde no aplica

**Si tu rol es casi todo coordinación.** Para muchas personas que conducen equipos, la reunión y el mensaje son la herramienta, no la distracción. Ahí el techo del 50% puede ser irreal; lo útil sigue siendo medir.

**Si no responder tiene costo para otros.** No contestarle a una familia que pregunta por una vacante no es eficiencia, es mala atención. La idea de no responder vale para lo que no deja a nadie esperando.

**Si achicar lo tuyo es pasárselo a otro sin decirlo.** Delegar está bien; descargar en alguien del equipo sin ajustar su carga no.

## Probá que lo entendiste

¿Qué respuesta deja menos ida y vuelta?

1. "Dale, ¿cuándo te queda bien?"
2. "Puedo el martes a las 10 o el jueves a las 15. Si te sirve alguno, ya lo agendo; si ninguno, mandame dos opciones tuyas."
3. "Hablemos la semana que viene."

:::Ver la respuesta
**La 2.** Propone, dice qué pasa en cada caso y cierra el tema en uno o dos mensajes.

**La 1** devuelve todo el trabajo y abre una cadena de mensajes.

**La 3** suena resolutiva pero no resuelve nada: alguien va a tener que volver a escribir.
:::

## Qué hacer esta semana

Anotá durante tres días en qué se te van las horas y aplicale la pregunta de los meses a cada cosa. Sumá cuánto es superficial y llevale el número a quien te conduce, con una propuesta de techo.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas. Contestalas de memoria y recién después abrí cada una.

**1. ¿Qué distingue al trabajo profundo del superficial?**

:::Ver la respuesta
**El profundo** se hace concentrado, sin distracciones, exige tu capacidad al máximo, produce algo nuevo y es difícil de copiar. **El superficial** es logístico, se puede hacer distraído y casi cualquiera lo haría con poca preparación. La duración no los distingue: algo largo y tedioso puede ser superficial.
:::

**2. ¿Cuál es la hipótesis del libro?**

:::Ver la respuesta
Que la capacidad de trabajar en profundidad es **cada vez más escasa y cada vez más valiosa** al mismo tiempo. De ahí sale la oportunidad: quien la cultiva se diferencia.
:::

**3. ¿Cuáles son las cuatro maneras de organizar la profundidad?**

:::Ver la respuesta
**Monástica** (sacar casi todo lo superficial), **bimodal** (períodos largos de profundidad alternados con períodos normales), **rítmica** (el mismo bloque a la misma hora) y **periodística** (aprovechar cualquier hueco). La periodística es la más difícil, no la más fácil.
:::

**4. ¿De qué conviene tomarse descansos, según Newport?**

:::Ver la respuesta
**De la concentración, no de la distracción.** Se decide de antemano cuándo se mira el correo y el chat, y fuera de esos momentos no se mira. Es la manera de entrenar la tolerancia al aburrimiento que la concentración necesita.
:::

**5. ¿Qué pregunta propone para medir qué tan profunda es una tarea?**

:::Ver la respuesta
**Cuántos meses le llevaría a alguien inteligente, recién recibido y sin experiencia en tu área, aprender a hacerla.** Poco tiempo, superficial; mucho, profunda.
:::

## Lo que suele borrarse

Casi todos recuerdan "bloqueá tiempo sin interrupciones". Lo que se borra son las dos mitades que lo sostienen. Una es el aburrimiento: si en el resto del día saltás al teléfono en cada espera, el bloque de 90 minutos no funciona, porque la cabeza está entrenada para lo contrario. La otra es el techo a lo superficial: sin medirlo y acordarlo con quien te conduce, lo superficial vuelve a ocupar los bloques en dos semanas.

También se borra el ritual de cierre. No es un detalle: es lo que permite que el día termine y que el descanso sea descanso.

## Un caso para aplicarlo

Bloqueaste los martes de 8 a 10 para pensar. Tres semanas después, el bloque sigue en la agenda pero lo pasás contestando mensajes que llegaron a la noche. ¿Qué parte del libro te falta?

:::Ver la respuesta
**Las reglas del ritual y los descansos de la concentración.** El bloque existe, pero sin reglas (correo y chat cerrados, el teléfono lejos) se llena de lo que tiene más urgencia. Arreglalo fijando que los mensajes de la noche se miran a las 10, no a las 8, y avisándole al equipo cómo encontrarte si algo no puede esperar.
:::

## Qué hacer esta semana

Elegí una de las dos mitades que se borran, el aburrimiento o el techo a lo superficial, y aplicala cinco días seguidos. Al final de la semana fijate si tus bloques rindieron distinto.
$md$,
  7
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Newport contra Clear y Grove',
$md$
Si lo tenés fresco, lo más útil es cruzarlo con dos libros de la biblioteca que miran el trabajo desde otro lado.

**Clear** (*Atomic Habits*): lo que cambia la conducta es el sistema, no el objetivo. Hacer el hábito obvio, atractivo, fácil y satisfactorio, y pegarlo a algo que ya hacés.

**Grove** (*High Output Management*): la producción de quien coordina es la producción de su equipo, y su herramienta principal son las reuniones y las conversaciones.

Antes de seguir, una prueba. Sin releer: **¿en qué se parecen el ritual de Newport y el hábito de Clear?**

:::Ver la respuesta
**En que los dos sacan la decisión del momento.** Newport no quiere que la profundidad dependa de las ganas: horario fijo, lugar fijo, reglas fijas. Clear diría que es un hábito bien diseñado, con disparador claro. La forma rítmica de Newport es casi un hábito de Clear con otro nombre.
:::

## Dónde se tocan, y dónde no

**Con Clear coinciden en el diseño del entorno.** Los dos dicen que pelear contra la distracción con fuerza de voluntad es perder: hay que cambiar el entorno. Cerrar el correo, dejar el teléfono en otra sala.

**Con Clear no coinciden en la escala.** Clear empieza por lo mínimo: dos minutos. Newport dice que lo valioso aparece cuando la concentración es intensa y larga. Un bloque de dos minutos sirve para empezar el hábito, no para producir trabajo profundo.

**Con Grove hay una tensión de fondo.** Para Grove, una reunión bien usada es trabajo de alto apalancamiento: una hora que mejora lo que hacen diez personas. Con la vara de Newport, esa misma hora parece superficial. Los dos tienen razón en su terreno. Grove ya proponía algo parecido a los bloques: juntar las interrupciones en horarios previsibles, para que no lleguen a cualquier hora.

## Lo que el libro no prueba

Es un libro de argumentos y de casos, no de investigación propia. Los perfiles que usa (escritores, académicos, gente con mucha autonomía) no representan a quien tiene un jefe que decide su agenda.

La parte que más se apoya en estudios es la del residuo de atención, y esos estudios se hicieron con tareas de laboratorio. Que la idea valga en una oficina es razonable, pero no está medido así. Lo mismo con las horas: el libro sugiere que hay un límite diario de concentración intensa, extrapolado de investigaciones sobre expertos en práctica deliberada, no sobre trabajo de oficina.

Y la parte sobre redes sociales es más opinión que evidencia. Se puede compartir, pero conviene leerla como opinión.

## Una situación para decidir

Coordinás un equipo de seis y te piden dos cosas para el trimestre: rediseñar el proceso de entrevistas y estar más presente para el equipo, que está nuevo. ¿Qué haría cada autor?

:::Ver la respuesta
**Newport:** proteger bloques rítmicos para el rediseño, que es trabajo profundo, y fijar horarios para el chat. Sin bloques, el rediseño se hace a pedazos y sale peor.

**Grove:** con un equipo nuevo, el uno a uno y la presencia son lo de mayor apalancamiento. Te diría que no sacrifiques eso por tus bloques.

**Clear:** que lo que elijas sea un sistema, no una intención: el bloque del martes a las 8, y el uno a uno de los jueves, los dos con horario fijo.

La síntesis: pocas horas profundas, bien defendidas, y el resto disponible para el equipo. No compiten si las dos están en la agenda.
:::

## Qué hacer esta semana

Mirá tu agenda de la semana que viene y marcá qué reuniones son apalancamiento según Grove y cuáles son superficiales según Newport. Cancelá o acortá una de las segundas.
$md$,
  8
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'Deep and shallow',
$md$
Cal Newport is a computer science professor, and this book is about a distinction that seems obvious until you start measuring your week:

- **Deep work:** what you do while concentrating, free of distraction, pushing your ability to its limit. It produces something new or makes you better at what you do, and it's hard to copy.
- **Shallow work:** the logistical, what can be done while distracted and almost anyone could do with little preparation. Replying, forwarding, coordinating, scheduling.

The book's central idea is a hypothesis: **the ability to work deeply is becoming rarer and, at the same time, more valuable.** Rarer because office work pushes you to be always available. More valuable because what sets someone apart is what they produce when they think properly, not how much they reply to.

Newport adds a simple sum: what you produce of quality depends on the **time** you give it and the **intensity** of your focus. And intensity breaks with every switch of task: when you jump from one thing to another, part of your attention stays stuck on the previous one. The book calls this *attention residue*, drawing on the work of the researcher Sophie Leroy.

## A worked case (hypothetical)

The person who leads the admissions team has to write the proposal for next year's enrolment process. They reckon it needs about **6 hours** of serious work.

Their real week: scattered meetings, and between them, half-hour gaps they fill checking email and the team chat. If they add up 12 gaps of 30 minutes, on paper they have the 6 hours.

Now intensity. Suppose, just to do the sum, that in a 30-minute gap with the chat open they produce **half** of what they would when focused: the first minutes go on remembering where they were, and every message they glance at leaves some residue.

- **12 gaps × 30 min × 50% = 3 effective hours.** The proposal is left half done.
- **4 blocks of 90 min with no chat or email = 6 effective hours.** With the same total time.

The exact performance figure is made up; the direction isn't. Same time, different output, and the difference lies in how the time is cut up.

## Where it doesn't apply

**Not all valuable work is deep.** Looking after a family who phones in distress doesn't call for solitary concentration, and it's what matters most that day. The book is about work that needs thinking, not everything of value.

**Some roles exist to be available.** A reception desk or IT support exists to respond quickly. There the question isn't how to stop responding, but who on the team can have blocks.

**It isn't praise of isolation.** Newport accepts that many ideas come from bumping into others. What he criticises is constant interruption, not collaboration.

## Check you've got it

Deep or shallow?

1. Designing from scratch how next year's applicants will be assessed.
2. Resending each family the time of an interview that's already booked.
3. Building the weekly tracking spreadsheet by copying data from one system to another.

:::Show the answer
**1. Deep.** It needs thinking, produces something new and can't be done by just anyone without preparation.

**2. Shallow.** It's logistics: necessary, but anyone with half an hour's explanation would do it the same.

**3. Shallow**, even if it takes hours. Being long or tedious doesn't make something deep: the measure is how much it demands of your ability, not how long it lasts.
:::

## What to do this week

Pick a task you've been putting off because you "can't find the moment". Count how many uninterrupted 90-minute blocks you had last week. If the number is zero, you know why it keeps slipping.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Giving depth a place in the diary',
$md$
If you wait until you feel like it or until a gap opens up, deep work doesn't happen. Newport's proposal is that **depth is decided beforehand, with a schedule and a ritual, not in the moment with willpower.**

For the schedule he describes four ways of organising it, from the most extreme to the most flexible:

- **Monastic:** removing almost everything shallow from your working life. His example is Donald Knuth, who doesn't use email. It suits very few people.
- **Bimodal:** alternating long stretches of depth (whole days, weeks) with normal periods. The example is Carl Jung, who withdrew to write at a house in the country.
- **Rhythmic:** the same block, at the same time, every day or nearly. There's nothing to decide: it's a habit.
- **Journalistic:** fitting depth into any gap that appears. Newport warns it's the hardest, because it requires switching mode within minutes.

Besides the schedule, a **ritual**: where you'll work, for how long, under what rules (no email, no phone in sight) and what you need to hand so you don't get up. And at the end of the day, a **shutdown ritual**: review what's pending, note where you left off and call the day finished, so your head doesn't carry on working in the evening.

The least intuitive part is about boredom. If you check your phone every time you wait for something, you train your mind not to tolerate a minute without stimulus, and then you can't concentrate when you want to. Newport proposes turning it round: **don't take breaks from distraction; take breaks from focus.** You decide in advance when you'll check email and chat, and outside those moments you don't, even while waiting.

## A worked case (hypothetical)

The person who leads a team of five has a diary taken up by meetings from 10 o'clock, and the team chat pings all day. A monastic or bimodal approach won't work: the team needs them available.

They choose **rhythmic**. They block Tuesday, Thursday and Friday from 8:00 to 9:30, before meetings start, in a small room, with email closed.

- **3 blocks × 1.5 hours = 4.5 hours** of depth a week.
- Over **4 weeks, 18 hours.** That's more than they spent thinking in the whole previous term.

For the rest of the day they set four moments for chat and email: 9:30, 11:30, 14:00 and 16:30. They tell the team, and agree that anything truly urgent comes by phone call. Between those times, if they're waiting for someone, they wait.

## Where it doesn't apply

**When your diary isn't yours.** If someone else sets your hours, the block won't defend itself: it has to be negotiated with whoever decides. The book assumes more autonomy than many people have.

**In peak weeks.** In the thick of the admissions season there may be no block possible. That doesn't invalidate the idea: it makes it seasonal.

**If the ritual becomes the goal.** Some people spend more time setting up the perfect place than working in it.

## Check you've got it

Which way of organising depth is each?

1. Every day from 7:30 to 9:00 she writes, before opening email.
2. Twice a year he takes a week away from the office to plan.
3. If a meeting is cancelled, she uses that hour to push on with the report.

:::Show the answer
**1. Rhythmic.** The same block at the same time; regularity saves her deciding.

**2. Bimodal.** Long, separate periods of depth, and the rest of the time, normal.

**3. Journalistic.** She uses what turns up. It works if you're already practised; if not, the hour goes on getting started.
:::

## What to do this week

Block two 90-minute slots in your diary, at the same time, with a name ("think through the proposal"), and set the fixed times when you'll check chat. Tell your team what they are and how to reach you if it's urgent.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Measuring the shallow to shrink it',
$md$
Protecting deep blocks isn't enough if the shallow grows until it eats the rest. The last part of the book deals with that, and the idea is: **the shallow isn't eliminated; it's measured and given a ceiling.**

Newport proposes three tools.

**A question to measure each task:** how many months would it take a bright recent graduate, with no experience in your field, to learn to do this? If the answer is "a week", it's shallow. If it's "a year", it's probably deep. It shows clearly what habit blurs together.

**A shallow-work budget, agreed with your line manager.** You don't decide it alone: you ask what share of your week should go on the shallow, and with that number you can say no to whatever exceeds it. Newport suggests that, for most jobs beyond entry level, a reasonable figure is somewhere between a third and a half.

**Email, with a different logic.** Three ideas:

- Make the people who write to you do a little more work: say in which cases you reply and in which you don't.
- When you write, close the matter: instead of "when shall we meet?", propose two times and say what happens in each case.
- Accept that not every message needs a reply. If not replying causes nothing serious, not replying is an option.

## A worked case (hypothetical)

The person who leads the team works 40 hours a week. For one week they log everything and apply the months question. Result: **26 shallow hours**, **65%**.

They talk to their head and agree a ceiling of **50%**: 20 hours. They need to free **6 hours** from the shallow.

- Two weekly progress meetings become one: frees **1.5 hours**.
- The reports they copied by hand are built by someone on the team with a spreadsheet: **2 hours**.
- Each scheduling exchange by email used to take about five messages back and forth. With replies that propose times and close the matter, it drops to two. Given their email volume, they estimate about **2.5 hours**.

**1.5 + 2 + 2.5 = 6 hours.** They reach the ceiling, with the caveat that the last figure is an estimate worth checking in a month.

## Where it doesn't apply

**If your role is almost all coordination.** For many people who lead teams, the meeting and the message are the tool, not the distraction. There a 50% ceiling may be unrealistic; measuring is still useful.

**If not replying costs others.** Not answering a family asking about a place isn't efficiency, it's poor service. The idea of not replying holds for what leaves nobody waiting.

**If shrinking your load means passing it on unannounced.** Delegating is fine; offloading onto someone on the team without adjusting their workload isn't.

## Check you've got it

Which reply leaves the least back and forth?

1. "Sure, when suits you?"
2. "I can do Tuesday at 10 or Thursday at 15:00. If either works, I'll book it; if neither, send me two options of yours."
3. "Let's talk next week."

:::Show the answer
**2.** It proposes, says what happens in each case and closes the matter in one or two messages.

**1** hands all the work back and opens a chain of messages.

**3** sounds decisive but settles nothing: someone will have to write again.
:::

## What to do this week

For three days, note where your hours go and apply the months question to each thing. Add up how much is shallow and take the number to your line manager, with a proposed ceiling.
$md$,
  9
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions. Answer them from memory and only then open each one.

**1. What distinguishes deep work from shallow work?**

:::Show the answer
**Deep work** is done while concentrating, free of distraction, stretches your ability to the full, produces something new and is hard to copy. **Shallow work** is logistical, can be done while distracted and almost anyone could do it with little preparation. Length doesn't distinguish them: something long and tedious can be shallow.
:::

**2. What is the book's hypothesis?**

:::Show the answer
That the ability to work deeply is **becoming rarer and more valuable** at the same time. That's where the opportunity lies: whoever cultivates it stands out.
:::

**3. What are the four ways of organising depth?**

:::Show the answer
**Monastic** (removing almost everything shallow), **bimodal** (long stretches of depth alternating with normal periods), **rhythmic** (the same block at the same time) and **journalistic** (using any gap). The journalistic is the hardest, not the easiest.
:::

**4. According to Newport, what should you take breaks from?**

:::Show the answer
**From focus, not from distraction.** You decide in advance when to check email and chat, and outside those moments you don't. It's how you train the tolerance for boredom that concentration needs.
:::

**5. What question does he propose for measuring how deep a task is?**

:::Show the answer
**How many months it would take a bright recent graduate, with no experience in your field, to learn to do it.** Little time, shallow; a lot, deep.
:::

## What tends to get forgotten

Almost everyone remembers "block time without interruptions". What gets forgotten are the two halves that hold it up. One is boredom: if for the rest of the day you reach for your phone at every pause, the 90-minute block won't work, because your mind is trained for the opposite. The other is the ceiling on the shallow: without measuring it and agreeing it with your line manager, the shallow takes over the blocks again within a fortnight.

The shutdown ritual gets forgotten too. It isn't a detail: it's what lets the day end and rest be rest.

## A case to apply it

You blocked Tuesdays from 8 to 10 for thinking. Three weeks later the block is still in your diary, but you spend it answering messages that arrived overnight. Which part of the book are you missing?

:::Show the answer
**The ritual's rules and the breaks from focus.** The block exists, but without rules (email and chat closed, phone out of reach) it fills with whatever feels most urgent. Fix it by setting overnight messages to be checked at 10, not at 8, and telling the team how to reach you if something can't wait.
:::

## What to do this week

Pick one of the two halves that get forgotten, boredom or the ceiling on the shallow, and apply it for five days running. At the end of the week, see whether your blocks produced anything different.
$md$,
  7
from books b where b.slug = 'deep-work'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Newport against Clear and Grove',
$md$
If it's fresh, the most useful thing is to set it against two books in the library that look at work from another angle.

**Clear** (*Atomic Habits*): what changes behaviour is the system, not the goal. Make the habit obvious, attractive, easy and satisfying, and attach it to something you already do.

**Grove** (*High Output Management*): a manager's output is their team's output, and their main tool is meetings and conversations.

Before going on, a test. Without rereading: **how are Newport's ritual and Clear's habit alike?**

:::Show the answer
**Both take the decision out of the moment.** Newport doesn't want depth to depend on mood: fixed time, fixed place, fixed rules. Clear would call it a well-designed habit with a clear cue. Newport's rhythmic approach is almost a Clear habit under another name.
:::

## Where they meet, and where they don't

**With Clear they agree on designing the environment.** Both say that fighting distraction with willpower is a losing battle: you have to change the environment. Close email, leave the phone in another room.

**With Clear they disagree on scale.** Clear starts with the minimum: two minutes. Newport says the valuable comes when concentration is intense and long. A two-minute block helps start the habit, not produce deep work.

**With Grove there's an underlying tension.** For Grove, a well-used meeting is high-leverage work: one hour that improves what ten people do. By Newport's yardstick, that same hour looks shallow. Each is right on his own ground. Grove already proposed something like blocks: grouping interruptions into predictable times, so they don't arrive at any hour.

## What the book doesn't prove

It's a book of arguments and cases, not original research. The profiles it uses (writers, academics, people with plenty of autonomy) don't represent someone whose boss sets their diary.

The part that leans most on studies is attention residue, and those studies used laboratory tasks. That the idea holds in an office is reasonable, but it hasn't been measured that way. The same goes for hours: the book suggests there's a daily limit to intense concentration, extrapolated from research on experts in deliberate practice, not on office work.

And the part on social media is more opinion than evidence. You can share it, but it's best read as opinion.

## A situation to decide

You lead a team of six and you're asked for two things this term: redesign the interview process and be more present for the team, which is new. What would each author do?

:::Show the answer
**Newport:** protect rhythmic blocks for the redesign, which is deep work, and set fixed times for chat. Without blocks, the redesign gets done in pieces and comes out worse.

**Grove:** with a new team, one-to-ones and presence are the highest-leverage activity. He'd tell you not to sacrifice that for your blocks.

**Clear:** whatever you choose should be a system, not an intention: the Tuesday 8 o'clock block and the Thursday one-to-ones, both at fixed times.

The synthesis: a few deep hours, well defended, and the rest available to the team. They don't compete if both are in the diary.
:::

## What to do this week

Look at next week's diary and mark which meetings are leverage by Grove's measure and which are shallow by Newport's. Cancel or shorten one of the latter.
$md$,
  8
from books b where b.slug = 'deep-work'
on conflict do nothing;
