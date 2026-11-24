-- ============================================================
-- 063 · Tercer arco: la reunión que nadie resume
-- ============================================================
-- Misma forma que 053 y 055: cinco días, uno por día, que terminan
-- con algo armado y guardado. Nivel 0 a 2.
--
-- Por qué este: casi todos tienen una reunión que se repite y de la
-- que no queda nada escrito. La semana siguiente se gastan los
-- primeros minutos en reconstruir qué se decidió, y las tareas sin
-- dueño no las hace nadie. Es además donde la IA hace un daño
-- particular si se usa mal: resume lo que más se habló, no lo que se
-- decidió, y le asigna tareas a quien no las aceptó.
--
-- Español e inglés británico en el mismo archivo.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, track_order, published, arc, arc_day)
select v.slug, t.id, 'arco', 0, 2, null, true, 'reunion', v.dia
from (values
  ('a3-reunion-1', 'como-pedir', 1),
  ('a3-reunion-2', 'privacidad', 2),
  ('a3-reunion-3', 'como-pedir', 3),
  ('a3-reunion-4', 'limites',    4),
  ('a3-reunion-5', 'contexto',   5)
) as v(slug, topico, dia)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Día 1 · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Lo que se pierde cuando nadie resume',
  'Hay una reunión que se repite y de la que no queda nada escrito. Esta semana armás el resumen que sale solo. Hoy no se usa la IA: hoy se mira qué tiene que tener.',
$md$
La reunión de equipo de los lunes, la de coordinación, la que tenés con tu jefe cada quince días. Se habla una hora, todos se van con la sensación de que quedó claro, y a la semana siguiente los primeros minutos se gastan en reconstruir qué se había decidido. Y las tareas que no tenían dueño, no las hizo nadie.

Esta semana vas a dejar armado un resumen que sale en cinco minutos después de cada reunión. Pero antes hay que saber qué tiene que tener, porque **un resumen no es un acta.** No es lo que se dijo: es lo que cambió.

## Un resumen tiene tres partes, y nada más

1. **Lo que se decidió.** Cosas que antes estaban abiertas y ahora no. "Se posterga la jornada al 15."
2. **Quién hace qué, y para cuándo.** Cada tarea con una persona y una fecha. Una tarea sin persona no es una tarea: es un deseo.
3. **Lo que quedó abierto.** Lo que se discutió y no se cerró. Si no se anota, la próxima vez se discute desde cero.

Todo lo demás (quién dijo qué, cómo se llegó, los ejemplos) puede ser interesante, pero no es resumen. Si lo agregás, las tres partes que importan quedan escondidas.

## Un caso trabajado

Un equipo de seis personas tiene una reunión de una hora todos los lunes. Nadie escribe nada.

El lunes siguiente, cada uno gasta unos **quince minutos** en reconstruir: buscar el mail donde alguien dijo algo, preguntarle a otro qué habían quedado, volver a discutir algo que ya se había cerrado. Seis personas por quince minutos son **noventa minutos por semana** que no se ven en ningún lado.

Y hay un costo peor, que no se mide en minutos: de las cinco tareas que salieron de la reunión, dos no tenían dueño claro. Una semana después, ninguna de las dos estaba hecha.

Anotá cuánto se pierde en tu reunión. El viernes lo vas a volver a medir.

## El borde: cuándo no hace falta

- **Si son dos o tres personas que trabajan juntas todo el día.** Lo que se decide lo ven al rato. Un resumen es burocracia.
- **Si la reunión no decide nada.** Una charla para ponerse al día no tiene decisiones ni tareas. Si eso pasa siempre, el problema no es el resumen.
- **Si el tema es confidencial.** Una reunión sobre una persona del equipo, sobre la familia de un alumno o sobre algo legal no se pasa por ninguna herramienta. Mañana lo vemos con más detalle.

## Probá que lo entendiste

Tres frases que alguien anotó en una reunión. ¿Cuál es una decisión, cuál una tarea, y cuál quedó abierta? ¿Falta algo en alguna?

1. "Mariela se encarga de pedir los presupuestos de transporte."
2. "La jornada de puertas abiertas pasa al sábado 15."
3. "Hay que ver qué hacemos con el formulario de la web."

:::Ver la respuesta
**La 2 es una decisión.** Algo que estaba abierto se cerró.

**La 1 es una tarea, pero le falta la fecha.** "Se encarga" sin un para cuándo se convierte en "cuando pueda". Completa sería "Mariela pide los presupuestos de transporte antes del viernes".

**La 3 quedó abierta, y está mal anotada.** "Hay que ver" no dice qué hay que ver ni quién. Bien anotada sería "Abierto: si cambiamos el formulario de la web. Lo trae Juan el lunes con una propuesta". Ahí se convierte en tarea.
:::

## Para hoy

1. Elegí **una reunión que se repite** y en la que estés todas las veces.
2. Sin mirar notas, escribí qué se decidió la última vez, qué tareas salieron y con qué responsables. Fijate cuánto te acordás.
3. Calculá cuánto se pierde la semana siguiente: personas por minutos de reconstruir.

## La regla que te llevás

**Un resumen es lo que cambió: decisiones, tareas con dueño y fecha, y lo que quedó abierto.** Lo que se dijo no es resumen.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Día 2 · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'De dónde sale el material, y con qué permiso',
  'La IA no estuvo en la reunión. Lo que resuma depende de lo que le des, y no todo se le puede dar.',
$md$
La IA no estuvo en la reunión. Todo lo que escriba sale de lo que le pases. Hay dos materiales posibles, y cada uno tiene una trampa distinta.

## Tus notas

Tres o cuatro renglones desordenados que tomaste mientras se hablaba. **Ventaja:** ya están filtradas, porque anotaste lo que te pareció importante. **Trampa:** si no lo anotaste, la IA no lo sabe. Y si le pedís un resumen "completo", va a rellenar los huecos con lo que le parece probable.

La forma de tomarlas que más sirve es la más simple: tres columnas o tres listas.

- **Decidimos:**
- **Quién hace qué, para cuándo:**
- **Queda abierto:**

Con eso, la IA sólo tiene que ordenar y redactar. No tiene que adivinar.

## La transcripción

Muchas herramientas de videollamada pueden transcribir la reunión entera. **Ventaja:** está todo. **Trampa:** está todo.

## Un caso trabajado

Una reunión de una hora transcripta tiene unas **9.000 palabras**. Los últimos dos minutos, donde se tomaron las decisiones, son unas **300**: alrededor del **3%** del texto.

Los cuarenta minutos que se fueron en discutir si cambiar el formulario de la web, sin cerrar nada, son más de la mitad.

Si le pedís a la IA "resumí esta reunión", va a resumir **lo que más se habló**, no lo que se decidió. El formulario va a ocupar medio resumen y las decisiones, una línea al final, si aparecen.

Por eso, con transcripción, el pedido de mañana es más importante que nunca: no le pedís un resumen, le pedís que **busque** decisiones, tareas y temas abiertos.

## El borde: lo que no se le da

Esta es la parte que no se negocia.

- **Si vas a grabar o transcribir, se avisa al empezar** y todos tienen que estar de acuerdo. Una transcripción hecha sin avisar es un problema aunque nadie se entere.
- **No se pasa una reunión con datos de personas que no están ahí:** la situación de un alumno, de una familia, la salud o el sueldo de alguien del equipo. Ni notas ni transcripción.
- **Si la herramienta es la versión gratuita y no sabés qué hace con lo que le das,** tratala como si fuera pública. Lo que no pondrías en un mail a todo el colegio, no va.

Si la reunión tiene una parte así, se saca esa parte antes de pegar. Si es toda así, esta reunión no se resume con IA.

## Probá que lo entendiste

¿Cuál de estos tres materiales le pasarías a la IA tal como está?

1. La transcripción de la reunión de equipo, donde se avisó al empezar que se transcribía.
2. Tus notas de una reunión donde se habló de un docente que está con licencia y por qué.
3. Tus notas de la reunión de coordinación, en tres listas: decidimos, tareas, abierto.

:::Ver la respuesta
**La 3, sin dudar.** Ya está ordenada, no tiene datos sensibles y la IA sólo tiene que redactar.

**La 1, sí, pero con el pedido correcto.** Se avisó, así que el permiso está. El riesgo es que resuma lo que más se habló: mañana vemos cómo pedirle que busque las decisiones.

**La 2, no.** El motivo de una licencia es información de salud de alguien que no está en la reunión. Se saca esa parte, o esta reunión se resume a mano.
:::

## Para hoy

1. En la próxima reunión de las que elegiste, tomá notas en **tres listas**: decidimos, quién hace qué y para cuándo, queda abierto.
2. Si tu herramienta de videollamada transcribe y querés probar, **avisá al empezar** y preguntá si alguien tiene problema.
3. Antes de pegar nada, releé: ¿hay algo de alguien que no está ahí? Sacalo.

## La regla que te llevás

**La IA resume lo que le das, y no todo se le da.** Notas en tres listas: la mejor materia prima. Transcripción: sólo con aviso, y sin lo que es de otros.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Día 3 · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Pedile la forma, no un resumen',
  '"Resumime esta reunión" te devuelve media página prolija y poco útil. Con la forma fija, te devuelve lo que necesitás y te avisa lo que falta.',
$md$
Si le pegás tus notas o la transcripción y le pedís "resumime esta reunión", vas a recibir algo prolijo, en párrafos, que suena bien y sirve poco. Lo que hace falta es darle **la forma exacta** del resumen y una regla que la frene cuando falta algo.

## El pedido

Cuatro partes, en este orden:

- **Qué es:** "Te paso las notas de la reunión semanal del equipo de admisiones."
- **La forma:** "Armá un resumen con tres secciones y nada más: Decisiones, Tareas (quién, qué, para cuándo) y Queda abierto."
- **Las reglas:** "Si una tarea no tiene responsable o fecha en las notas, escribí *no se dijo* en ese lugar. No inventes nombres ni fechas. Si algo no es decisión, tarea ni tema abierto, no lo pongas."
- **El material:** las notas o la transcripción.

La regla del medio es la que hace todo el trabajo. Sin ella, la IA completa los huecos con lo más probable: si "alguien" tiene que pedir presupuestos, le pone el nombre de quien más habló de eso, y la fecha "el viernes", porque suena razonable.

## Un caso trabajado

Las mismas notas de una reunión, pedidas de dos formas.

**"Resumime esta reunión":** 450 palabras en cuatro párrafos. Hay 5 tareas mezcladas en el texto. A **2** les falta responsable, pero no se nota, porque el párrafo dice "el equipo va a avanzar con los presupuestos". Y aparece **una fecha que nadie dijo**: "antes de fin de mes".

**Con la forma y la regla:** 140 palabras. Las 5 tareas están en una lista, cada una en su renglón. Dos dicen **"responsable: no se dijo"**. Ninguna fecha inventada: donde no había, dice *no se dijo*.

El segundo es más corto, se lee en treinta segundos, y lo más útil que tiene son esos dos "no se dijo": son las dos tareas que la semana que viene nadie iba a hacer. Ahora se ven, y se pueden asignar con un mensaje.

## El borde

- **Si la reunión fue para pensar, no para decidir,** la forma de tres secciones va a salir casi vacía. Está bien: ese resumen dice la verdad. Si querés guardar las ideas, pedí otra forma: "las ideas que surgieron, una por línea".
- **"No se dijo" no es un error de la IA.** Es la IA haciendo bien su trabajo. El error sería que no apareciera nunca.
- **Si la transcripción es muy larga,** agregá: "las decisiones suelen estar al final; leé todo antes de armar las secciones".

## Probá que lo entendiste

¿Qué pedido da el mejor resumen?

1. "Resumime esta reunión de forma clara y profesional."
2. "Armá un resumen con Decisiones, Tareas y Queda abierto. Completá lo que falte con lo más razonable."
3. "Armá un resumen con Decisiones, Tareas (quién, qué, para cuándo) y Queda abierto. Si falta un responsable o una fecha, escribí *no se dijo*."

:::Ver la respuesta
**El 3.** Tiene la forma y la regla que frena los inventos.

**El 2 es el más peligroso.** Tiene la forma, pero le pide expresamente que invente: "lo más razonable" es un nombre y una fecha que nadie dijo, escritos con la misma seguridad que los ciertos.

**El 1** pide tono, no forma. Va a salir prolijo y largo, con las tareas escondidas en párrafos.
:::

## Para hoy

1. Armá el pedido con las cuatro partes. Escribilo en un documento: mañana y el viernes lo vas a volver a usar.
2. Probalo con las notas de la reunión de ayer o de la próxima.
3. Contá cuántos "no se dijo" aparecen. Cada uno es una tarea que estaba por perderse.

## La regla que te llevás

**Pedí la forma, no el resumen. Y que escriba "no se dijo" antes que inventar.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Día 4 · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dos minutos antes de mandarlo',
  'Un resumen con un error lo leen seis personas y lo creen. Antes de mandarlo, se revisan tres cosas, y no se reescribe nada.',
$md$
El resumen está bien armado y suena bien. Antes de mandarlo, hay que pensar en lo que pasa si tiene un error: **lo leen seis personas y le creen.** Un resumen equivocado es peor que ninguno, porque lo que dice pasa a ser lo que se decidió.

La revisión no es releer todo ni corregir la redacción. Son tres cosas puntuales, y lleva dos minutos.

## Las tres cosas

- **Cada decisión: ¿se dijo así?** Que no esté más firme de lo que fue. "Se analiza postergar la jornada" no es lo mismo que "se posterga la jornada".
- **Cada tarea: ¿esa persona la aceptó?** Este es el error más caro. Que alguien haya hablado de un tema no significa que se haya hecho cargo.
- **Nombres y fechas.** Que estén escritos bien y que sean los que se dijeron. Si una fecha no la reconocés, probablemente la puso la IA.

Lo que **no** se revisa: el estilo, el orden de las frases, si está lindo. Si cada vez que lo revisás le cambiás la redacción, mañana anotás qué cambiás y lo agregás al pedido.

## Un caso trabajado

Un resumen con cinco tareas. En la revisión aparece que una está asignada a **la persona equivocada**: en la reunión, Laura explicó cómo se hacían los presupuestos, pero quien dijo "yo me encargo" fue Pablo. El resumen dice Laura, porque fue quien más habló del tema.

Sin revisión, pasa esto: Laura recibe el resumen, ve que la tarea es suya, piensa que es un error y no la hace. Pablo lee que es de Laura y tampoco la hace. **Una semana después, nadie hizo nada,** y se descubre en la reunión siguiente.

Con revisión: se corrige un nombre. Dos minutos.

La cuenta: dos minutos de revisión contra una semana perdida en una tarea, más los quince minutos de cada persona reconstruyendo qué pasó.

## El borde

- **Si no estuviste en la reunión, no lo podés revisar.** Revisar es comparar con lo que pasó. Si te pasaron la transcripción de una reunión ajena, que lo revise quien la coordinó antes de que salga.
- **Si encontrás muchos errores, el problema está antes.** Más de uno o dos por resumen quiere decir que el material es flojo (notas incompletas) o que al pedido le falta una regla.
- **No se manda "para que corrijan".** Un resumen que sale con errores "porque total lo corrigen" no lo corrige nadie: se cree.

## Probá que lo entendiste

En la revisión encontrás estas tres cosas. ¿Cuál corregís sí o sí antes de mandar?

1. Una frase dice "se analizó en profundidad" y te parece exagerada.
2. Una tarea dice "Martín envía la propuesta el jueves", pero Martín dijo que la mandaba "cuando tenga los números".
3. La sección Decisiones está en un orden distinto al que se trataron los temas.

:::Ver la respuesta
**La 2, sí o sí.** Hay una fecha que nadie dijo. Martín va a recibir un compromiso que no tomó. Lo correcto es "Martín envía la propuesta cuando tenga los números; fecha: no se dijo", y si hace falta fecha, se la pide en un mensaje.

**La 1** es estilo. Si te molesta siempre, agregá al pedido "sin adjetivos", pero no hace falta corregirla hoy.

**La 3** no importa. El orden no cambia nada de lo que alguien tiene que hacer.
:::

## Para hoy

1. Tomá el resumen que armaste ayer, o armá uno de la próxima reunión.
2. Revisá sólo las tres cosas: decisiones, quién aceptó cada tarea, nombres y fechas. Con un reloj al lado.
3. Anotá cuánto tardaste y qué corregiste. Si corregiste lo mismo que la vez anterior, eso va al pedido.

## La regla que te llevás

**Antes de mandarlo, tres cosas: lo que se decidió, quién aceptó cada tarea, nombres y fechas.** La redacción no se toca.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Día 5 · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dejalo guardado y medí',
  'Ya tenés el pedido que funciona. Hoy lo guardás para que la próxima reunión el resumen salga en cinco minutos, y medís cuánto cambió.',
$md$
Tenés el pedido que funciona y sabés revisar el resultado. Lo que falta es que no dependa de que te acuerdes de cómo era. Hoy lo dejás guardado, y medís.

## La receta

Es lo mismo que armaste el miércoles, con lo que aprendiste ayer:

- **Para qué es:** el resumen de la reunión semanal del equipo, para mandar el mismo día.
- **La forma:** Decisiones, Tareas (quién, qué, para cuándo), Queda abierto. Nada más.
- **Las reglas:** "no se dijo" en lugar de inventar; ninguna fecha que no esté en el material; lo que no es decisión, tarea ni tema abierto no va. Y lo que corregiste dos veces en la revisión.
- **Un ejemplo:** un resumen bueno de una reunión anterior, ya revisado. Vale más que cualquier explicación.
- **El hueco:** "Las notas de hoy son:", y ahí pegás.

## Dónde se guarda

En el mismo lugar donde la vas a usar, así no tenés que buscarla:

- **En ChatGPT:** un proyecto con la receta en las instrucciones, o un GPT propio.
- **En Claude:** un proyecto, con la receta en las instrucciones del proyecto.
- **En Gemini:** un Gem.

Cada reunión, abrís ese espacio, pegás las notas y revisás. Sin escribir el pedido de nuevo.

## Un caso trabajado

El equipo de seis del lunes, antes y después.

**Antes:** nadie resumía. Cada uno perdía quince minutos la semana siguiente reconstruyendo: **noventa minutos por semana.**

**Después:** quien coordina pega las notas, revisa dos minutos y manda. Son **cinco minutos**. La semana siguiente, cada uno lee el resumen en tres minutos en vez de reconstruir: **dieciocho minutos** entre los seis. Total: **veintitrés minutos.**

De noventa a veintitrés: **sesenta y siete minutos por semana.** En un año de unas cuarenta semanas de trabajo, son unas **cuarenta y cinco horas** del equipo.

Y lo que no entra en la cuenta: las tareas con "no se dijo" se asignan el mismo día, en vez de descubrirse sin hacer una semana después.

## El borde

- **El resumen sale el mismo día o no sirve.** Mandado tres días después, ya cada uno reconstruyó por su cuenta y el trabajo no se ahorró.
- **Todavía no lo mandes solo.** La revisión de dos minutos sigue. Sin una persona que mire, el día que asigne mal una tarea, nadie se entera.
- **Si la reunión cambia de forma, cambia la receta.** Si un día es de planificación y no de seguimiento, la forma de tres secciones va a salir vacía: no es que falló.

## Probá que lo entendiste

Pasaron dos meses. ¿Qué harías en cada caso?

1. Los resúmenes salen bien, pero siempre corregís lo mismo: que pone "se acordó" donde se dijo "se va a evaluar".
2. Alguien del equipo propone que la herramienta mande el resumen directo a todos, sin revisión, "porque ya anda bien".
3. Una semana no hubo tiempo y el resumen salió el jueves.

:::Ver la respuesta
**1. Va a la receta.** Algo que corregís dos veces es una regla que falta: "No uses *se acordó* si lo que se dijo fue que se va a evaluar; en ese caso va en Queda abierto".

**2. Todavía no.** Que ande bien quiere decir que los errores son pocos, no que no hay. La revisión son dos minutos y es lo que impide que una tarea mal asignada se pierda una semana.

**3. Está bien que pase una vez.** Si pasa seguido, el problema no es la receta: es que el resumen no tiene un momento fijo. Diez minutos en el calendario, justo después de la reunión.
:::

## Para hoy

1. Armá la receta con las cinco partes y guardala en tu herramienta.
2. En la próxima reunión, usala: pegá las notas, revisá dos minutos, mandá el mismo día.
3. Medí: cuánto tardaste vos y, si podés, preguntale a una persona del equipo si la semana siguiente tuvo que reconstruir algo.

## La regla que te llevás

**El resumen sale el mismo día, con la receta guardada y dos minutos de revisión.** Lo que corregís dos veces, va a la receta.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-5'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- Day 1 · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What gets lost when nobody writes it up',
  'There''s a meeting that repeats and leaves nothing in writing. This week you set up the write-up that comes out on its own. Today there''s no AI: today you look at what it has to contain.',
$md$
The Monday team meeting, the coordination meeting, the one with your manager every fortnight. People talk for an hour, everyone leaves feeling it was clear, and the following week the first few minutes go on reconstructing what had been decided. And the tasks without an owner were done by nobody.

This week you'll set up a write-up that takes five minutes after each meeting. But first you need to know what it must contain, because **a write-up isn't minutes.** It isn't what was said: it's what changed.

## A write-up has three parts, and nothing else

1. **What was decided.** Things that were open before and now aren't. "The open day moves to the 15th."
2. **Who does what, and by when.** Each task with a person and a date. A task without a person isn't a task: it's a wish.
3. **What was left open.** What was discussed and not settled. If it isn't written down, next time it's discussed from scratch.

Everything else (who said what, how you got there, the examples) may be interesting, but it isn't a write-up. Add it and the three parts that matter get buried.

## A worked case

A team of six has a one-hour meeting every Monday. Nobody writes anything down.

The following Monday, each person spends about **fifteen minutes** reconstructing: finding the email where someone said something, asking someone else what had been agreed, reopening something that had already been settled. Six people at fifteen minutes is **ninety minutes a week** that don't show up anywhere.

And there's a worse cost, not measured in minutes: of the five tasks that came out of the meeting, two had no clear owner. A week later, neither was done.

Write down how much is lost in your meeting. On Friday you'll measure it again.

## The edge: when it isn't needed

- **If it's two or three people who work together all day.** What gets decided, they see shortly after. A write-up is red tape.
- **If the meeting doesn't decide anything.** A catch-up chat has no decisions or tasks. If that happens every time, the problem isn't the write-up.
- **If the subject is confidential.** A meeting about a member of staff, a pupil's family or something legal doesn't go through any tool. We'll look at this in more detail tomorrow.

## Check you've got it

Three lines someone noted in a meeting. Which is a decision, which a task, and which was left open? Is anything missing from any of them?

1. "Mariela is in charge of getting the transport quotes."
2. "The open day moves to Saturday the 15th."
3. "We need to look at what to do with the website form."

:::Show the answer
**Number 2 is a decision.** Something that was open has been settled.

**Number 1 is a task, but it's missing the date.** "In charge of" without a by-when becomes "whenever she can". Complete, it would be "Mariela gets the transport quotes before Friday".

**Number 3 was left open, and it's badly noted.** "We need to look at" doesn't say what or who. Noted properly: "Open: whether we change the website form. Juan brings a proposal on Monday". That turns it into a task.
:::

## For today

1. Choose **one meeting that repeats** and that you attend every time.
2. Without looking at notes, write down what was decided last time, what tasks came out and who owns them. Notice how much you remember.
3. Work out how much is lost the following week: people times minutes spent reconstructing.

## The rule to take away

**A write-up is what changed: decisions, tasks with an owner and a date, and what was left open.** What was said isn't a write-up.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 2 · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Where the material comes from, and with whose permission',
  'The AI wasn''t at the meeting. What it writes up depends on what you give it, and not everything can be given.',
$md$
The AI wasn't at the meeting. Everything it writes comes from what you pass it. There are two possible materials, and each has a different trap.

## Your notes

Three or four messy lines you jotted down while people talked. **Advantage:** they're already filtered, because you noted what seemed important. **Trap:** if you didn't note it, the AI doesn't know it. And if you ask for a "complete" write-up, it'll fill the gaps with whatever seems likely.

The most useful way to take them is the simplest: three columns or three lists.

- **We decided:**
- **Who does what, by when:**
- **Still open:**

With that, the AI only has to organise and draft. It doesn't have to guess.

## The transcript

Many video-call tools can transcribe the whole meeting. **Advantage:** everything's there. **Trap:** everything's there.

## A worked case

A one-hour meeting, transcribed, runs to about **9,000 words**. The last two minutes, where the decisions were taken, are about **300**: around **3%** of the text.

The forty minutes spent discussing whether to change the website form, without settling anything, are more than half.

If you ask the AI to "summarise this meeting", it'll summarise **what was talked about most**, not what was decided. The form will take up half the write-up and the decisions a line at the end, if they appear at all.

So with a transcript, tomorrow's request matters more than ever: you don't ask for a summary, you ask it to **look for** decisions, tasks and open items.

## The edge: what you don't give it

This is the part that isn't negotiable.

- **If you're going to record or transcribe, say so at the start**, and everyone has to agree. A transcript made without telling people is a problem even if nobody finds out.
- **Don't pass on a meeting with information about people who aren't there:** a pupil's situation, a family's, someone's health or salary. Neither notes nor transcript.
- **If the tool is the free version and you don't know what it does with what you give it,** treat it as public. Anything you wouldn't put in an email to the whole school doesn't go in.

If the meeting has a part like that, remove that part before pasting. If it's all like that, this meeting isn't written up with AI.

## Check you've got it

Which of these three would you pass to the AI as it stands?

1. The team meeting transcript, where it was announced at the start that it was being transcribed.
2. Your notes from a meeting where a teacher's leave of absence, and the reason for it, was discussed.
3. Your notes from the coordination meeting, in three lists: decided, tasks, open.

:::Show the answer
**Number 3, without hesitation.** It's already organised, has no sensitive information, and the AI only has to draft.

**Number 1, yes, but with the right request.** It was announced, so permission is there. The risk is that it summarises what was talked about most: tomorrow we'll see how to ask it to look for the decisions.

**Number 2, no.** The reason for a leave of absence is health information about someone who isn't in the meeting. That part comes out, or this meeting is written up by hand.
:::

## For today

1. At the next meeting you chose, take notes in **three lists**: decided, who does what by when, still open.
2. If your video-call tool transcribes and you want to try it, **say so at the start** and ask whether anyone minds.
3. Before pasting anything, reread: is there anything about someone who isn't there? Take it out.

## The rule to take away

**The AI writes up what you give it, and not everything gets given.** Notes in three lists: the best raw material. Transcript: only if announced, and without what belongs to others.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 3 · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Ask for the shape, not a summary',
  '"Summarise this meeting" gets you half a tidy page that''s not much use. With a fixed shape, you get what you need and it tells you what''s missing.',
$md$
If you paste in your notes or the transcript and ask it to "summarise this meeting", you'll get something tidy, in paragraphs, that sounds good and isn't much use. What's needed is to give it **the exact shape** of the write-up and a rule that stops it when something's missing.

## The request

Four parts, in this order:

- **What it is:** "Here are the notes from the admissions team's weekly meeting."
- **The shape:** "Put together a write-up with three sections and nothing else: Decisions, Tasks (who, what, by when) and Still open."
- **The rules:** "If a task has no owner or date in the notes, write *not said* in that place. Don't invent names or dates. If something isn't a decision, a task or an open item, leave it out."
- **The material:** the notes or the transcript.

The rule in the middle does all the work. Without it, the AI fills the gaps with whatever is most likely: if "someone" has to get quotes, it puts the name of whoever talked about it most, and the date "Friday", because it sounds reasonable.

## A worked case

The same meeting notes, asked for in two ways.

**"Summarise this meeting":** 450 words in four paragraphs. There are 5 tasks mixed into the text. **2** are missing an owner, but you can't tell, because the paragraph says "the team will move forward with the quotes". And **a date nobody said** appears: "before the end of the month".

**With the shape and the rule:** 140 words. The 5 tasks are in a list, one per line. Two say **"owner: not said"**. No invented dates: where there was none, it says *not said*.

The second is shorter, reads in thirty seconds, and the most useful thing in it is those two "not said": they're the two tasks nobody was going to do next week. Now they're visible, and can be assigned with a message.

## The edge

- **If the meeting was for thinking, not deciding,** the three-section shape will come out almost empty. That's fine: that write-up is telling the truth. If you want to keep the ideas, ask for another shape: "the ideas that came up, one per line".
- **"Not said" isn't an AI error.** It's the AI doing its job properly. The error would be if it never appeared.
- **If the transcript is very long,** add: "decisions are usually at the end; read everything before building the sections".

## Check you've got it

Which request gives the best write-up?

1. "Summarise this meeting clearly and professionally."
2. "Put together a write-up with Decisions, Tasks and Still open. Fill in anything missing with whatever is most reasonable."
3. "Put together a write-up with Decisions, Tasks (who, what, by when) and Still open. If an owner or date is missing, write *not said*."

:::Show the answer
**Number 3.** It has the shape and the rule that stops invention.

**Number 2 is the most dangerous.** It has the shape, but it explicitly asks it to invent: "whatever is most reasonable" is a name and a date nobody said, written as confidently as the real ones.

**Number 1** asks for tone, not shape. It'll come out tidy and long, with the tasks hidden in paragraphs.
:::

## For today

1. Put the request together with its four parts. Write it in a document: you'll use it again tomorrow and on Friday.
2. Try it with the notes from yesterday's meeting or the next one.
3. Count how many "not said" appear. Each one is a task that was about to get lost.

## The rule to take away

**Ask for the shape, not the summary. And have it write "not said" rather than invent.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 4 · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Two minutes before you send it',
  'A write-up with a mistake gets read by six people, and they believe it. Before sending, check three things, and don''t rewrite anything.',
$md$
The write-up is well put together and sounds right. Before sending it, think about what happens if it has a mistake: **six people read it and believe it.** A wrong write-up is worse than none, because what it says becomes what was decided.

Checking isn't rereading everything or fixing the wording. It's three specific things, and it takes two minutes.

## The three things

- **Each decision: was it said like that?** Make sure it isn't firmer than it was. "We'll consider postponing the open day" isn't the same as "the open day is postponed".
- **Each task: did that person accept it?** This is the most expensive mistake. Someone having talked about a subject doesn't mean they took it on.
- **Names and dates.** That they're written correctly and are the ones that were said. If you don't recognise a date, the AI probably put it there.

What you **don't** check: the style, the order of sentences, whether it's nice. If every time you check it you change the wording, tomorrow note what you change and add it to the request.

## A worked case

A write-up with five tasks. Checking shows one is assigned to **the wrong person**: in the meeting, Laura explained how the quotes were done, but the one who said "I'll take care of it" was Pablo. The write-up says Laura, because she talked about it most.

Without checking, this happens: Laura receives the write-up, sees the task is hers, thinks it's a mistake and doesn't do it. Pablo reads that it's Laura's and doesn't do it either. **A week later, nobody has done anything,** and it comes to light at the next meeting.

With checking: one name is corrected. Two minutes.

The arithmetic: two minutes of checking against a week lost on a task, plus fifteen minutes for each person reconstructing what happened.

## The edge

- **If you weren't at the meeting, you can't check it.** Checking means comparing with what happened. If you were given the transcript of someone else's meeting, have whoever chaired it check it before it goes out.
- **If you find lots of mistakes, the problem is earlier on.** More than one or two per write-up means the material is weak (incomplete notes) or the request is missing a rule.
- **Don't send it "so people can correct it".** A write-up sent out with mistakes "because they'll correct it anyway" gets corrected by nobody: it gets believed.

## Check you've got it

While checking you find these three things. Which must you fix before sending?

1. A sentence says "it was analysed in depth" and it seems exaggerated.
2. A task says "Martín sends the proposal on Thursday", but Martín said he'd send it "when I have the figures".
3. The Decisions section is in a different order from the one the topics were discussed in.

:::Show the answer
**Number 2, no question.** There's a date nobody said. Martín will receive a commitment he didn't make. The right version is "Martín sends the proposal when he has the figures; date: not said", and if a date is needed, ask for one in a message.

**Number 1** is style. If it always bothers you, add "no adjectives" to the request, but it doesn't need fixing today.

**Number 3** doesn't matter. The order changes nothing about what anyone has to do.
:::

## For today

1. Take the write-up you put together yesterday, or do one for the next meeting.
2. Check only the three things: decisions, who accepted each task, names and dates. With a clock beside you.
3. Note how long it took and what you corrected. If you corrected the same thing as last time, that goes into the request.

## The rule to take away

**Before sending, three things: what was decided, who accepted each task, names and dates.** The wording stays as it is.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Day 5 · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Save it and measure',
  'You now have the request that works. Today you save it so that at the next meeting the write-up takes five minutes, and you measure how much has changed.',
$md$
You have the request that works and you know how to check the result. What's missing is for it not to depend on you remembering how it went. Today you save it, and you measure.

## The recipe

It's what you put together on Wednesday, plus what you learned yesterday:

- **What it's for:** the write-up of the team's weekly meeting, to send the same day.
- **The shape:** Decisions, Tasks (who, what, by when), Still open. Nothing else.
- **The rules:** "not said" instead of inventing; no date that isn't in the material; anything that isn't a decision, task or open item stays out. And whatever you corrected twice when checking.
- **An example:** a good write-up from a previous meeting, already checked. It's worth more than any explanation.
- **The gap:** "Today's notes are:", and you paste them there.

## Where to save it

In the same place you'll use it, so you don't have to look for it:

- **In ChatGPT:** a project with the recipe in its instructions, or your own GPT.
- **In Claude:** a project, with the recipe in the project instructions.
- **In Gemini:** a Gem.

At each meeting, you open that space, paste the notes and check. Without writing the request again.

## A worked case

The Monday team of six, before and after.

**Before:** nobody wrote it up. Each person lost fifteen minutes the following week reconstructing: **ninety minutes a week.**

**After:** whoever chairs pastes the notes, checks for two minutes and sends. That's **five minutes**. The following week, each person reads the write-up in three minutes instead of reconstructing: **eighteen minutes** across the six. Total: **twenty-three minutes.**

From ninety to twenty-three: **sixty-seven minutes a week.** Over a year of about forty working weeks, that's about **forty-five hours** of the team's time.

And what the arithmetic leaves out: tasks marked "not said" get assigned the same day, instead of being found undone a week later.

## The edge

- **The write-up goes out the same day or it's no use.** Sent three days later, everyone has already reconstructed on their own and nothing was saved.
- **Don't let it send itself yet.** The two-minute check stays. Without a person looking, the day it assigns a task wrongly, nobody finds out.
- **If the meeting changes shape, the recipe changes.** If one week it's for planning rather than follow-up, the three-section shape will come out empty: it hasn't failed.

## Check you've got it

Two months have passed. What would you do in each case?

1. The write-ups come out well, but you always correct the same thing: it says "it was agreed" where what was said was "it will be considered".
2. Someone on the team suggests the tool sends the write-up straight to everyone, without checking, "because it works well now".
3. One week there wasn't time and the write-up went out on Thursday.

:::Show the answer
**1. It goes into the recipe.** Something you correct twice is a missing rule: "Don't use *it was agreed* if what was said is that it will be considered; that goes under Still open".

**2. Not yet.** Working well means the mistakes are few, not that there are none. The check takes two minutes and is what stops a wrongly assigned task getting lost for a week.

**3. Fine if it happens once.** If it happens often, the problem isn't the recipe: it's that the write-up has no fixed slot. Ten minutes in the calendar, right after the meeting.
:::

## For today

1. Put the recipe together with its five parts and save it in your tool.
2. At the next meeting, use it: paste the notes, check for two minutes, send the same day.
3. Measure: how long it took you and, if you can, ask someone on the team whether they had to reconstruct anything the following week.

## The rule to take away

**The write-up goes out the same day, with the saved recipe and two minutes of checking.** Whatever you correct twice goes into the recipe.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a3-reunion-5'
on conflict do nothing;
