-- ============================================================
-- 068 · Frontera: cuatro lecciones más para niveles 3 y 4
-- ============================================================
-- Segunda tanda de la precarga del 24/11. Para quien ya construye y
-- empieza a tener a otros usando lo que armó:
--
--   contexto-largo: fr-receta-compartida  · cuando la usa el equipo
--   asincronico:    fr-registro           · que deje rastro
--   agentes:        fr-persona-en-medio   · dónde va la persona
--   negocios:       fr-adopcion           · cuánta gente lo usa de verdad
--
-- created_at del 16/11: después de las anteriores de cada tema.
-- Español e inglés británico en el mismo archivo.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-receta-compartida', 'contexto-largo', '2026-11-16 12:00:00+00'),
  ('fr-registro',          'asincronico',    '2026-11-16 11:00:00+00'),
  ('fr-persona-en-medio',  'agentes',        '2026-11-16 10:00:00+00'),
  ('fr-adopcion',          'negocios',       '2026-11-16 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-receta-compartida · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cuando tu receta la usa todo el equipo',
  'Una instrucción guardada que funciona para vos se rompe distinto cuando la usan cinco personas. Hace falta lo mismo que cualquier herramienta compartida: un dueño y una forma de avisar.',
$md$
Armaste un proyecto o un asistente que funciona: tiene sus instrucciones, sus documentos y sus ejemplos. Lo compartís con el equipo. A las dos semanas, hay cinco versiones: cada uno le cambió algo para que le sirva más, nadie sabe cuál es la buena, y cuando algo sale mal, no hay a quién decírselo.

La idea de esta lección: **una receta que usa un equipo necesita lo mismo que cualquier herramienta compartida: un dueño, una sola versión vigente y una forma de reportar lo que sale mal.**

## Las tres piezas

- **Un dueño.** Una persona que decide los cambios. No la única que puede proponerlos: la única que los aplica.
- **Una versión, con fecha.** Arriba de las instrucciones, una línea: "Versión del 14/3. Cambios: se agregó la regla de becas". Quien la usa sabe si está al día.
- **Un lugar para avisar.** Una planilla, un canal, un formulario: donde cualquiera anota "esto salió mal" con el ejemplo. Lo revisa el dueño una vez por semana.

## El caso, con números

Un asistente para responder consultas, armado por una persona y compartido con **6 personas** del equipo.

**Sin dueño:** al mes hay **4 copias distintas** dando vueltas. En una se agregó una regla que contradice a otra. Cuando se actualizan los aranceles, se actualiza en una copia y no en las otras tres: durante dos semanas, **la mitad del equipo** contesta con los aranceles viejos.

**Con dueño, versión y planilla de avisos:** una sola copia, que los demás usan pero no editan. En el mes llegan **9 avisos** a la planilla. El dueño los revisa el viernes: 5 se resuelven con una regla nueva, 3 eran del mismo problema, 1 era un error de la persona y no de la receta. La actualización de aranceles se hace una vez y la ven las seis.

El costo: media hora por semana del dueño. Lo que evita: dos semanas de respuestas con datos viejos.

## Dónde no aplica

**Si la usan dos personas que se sientan juntas**, alcanza con hablarlo. El sistema es para cuando ya no te enterás de lo que pasa con lo que armaste.

**Que haya un dueño no quiere decir que nadie más opine.** Si los avisos no se leen o nunca generan cambios, la gente deja de avisar y vuelve a hacer su propia copia.

**Hay ajustes personales que están bien.** Si alguien quiere que la receta le conteste más corto, eso va en sus instrucciones personales, no en la receta del equipo. La receta es lo común.

## Probá que lo entendiste

Alguien del equipo te dice que la receta compartida contesta mal las consultas de becas. ¿Qué hacés?

1. Le decís que haga una copia y la ajuste para él.
2. Le pedís el ejemplo para la planilla de avisos, y el viernes lo revisás con los otros.
3. Cambiás la receta en el momento, para que no vuelva a pasar.

:::Ver la respuesta
**La 2.** Con el ejemplo concreto, podés ver si es un problema de la receta y arreglarlo una vez para todos. Y si hay otros avisos del mismo tema, los resolvés juntos.

**La 1** es como se llega a cuatro copias distintas. El problema de becas sigue igual para los otros cinco.

**La 3** puede estar bien si es urgente y obvio, pero sin el ejemplo no sabés si lo arreglaste. Y cambiar en el momento cada vez que alguien se queja termina en una receta que contradice lo que ayer funcionaba.
:::

## Qué hacer esta semana

Si compartiste algo armado con otras personas, escribí arriba de las instrucciones la versión y la fecha, y armá la planilla de avisos con tres columnas: qué pediste, qué salió, qué tendría que haber salido.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-receta-compartida'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-registro · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que deje rastro',
  'Lo que corre solo hace su trabajo mientras no mirás. Si no deja registro, cuando algo sale mal no hay forma de saber qué pasó.',
$md$
Algo tuyo corre solo todos los días. Un lunes, alguien te dice que una consulta quedó sin clasificar. ¿Cuándo pasó? ¿Qué recibió el sistema? ¿Qué contestó? Si no hay registro, la única respuesta posible es "no sé", y arreglarlo es adivinar.

La idea de esta lección: **todo lo que corre sin vos tiene que dejar un registro de qué recibió, qué hizo y cuándo**, en un lugar donde lo puedas leer. Y una vez por semana, se lee.

## Qué se anota, en cada corrida

- **Cuándo corrió.** Fecha y hora.
- **Qué recibió.** No hace falta copiar todo: alcanza con cuántas cosas y un identificador de cada una.
- **Qué decidió.** La categoría, el resumen, la respuesta, lo que haya hecho.
- **Si algo falló.** Y qué falló, en palabras.

Una fila por cosa procesada, en una planilla. No hace falta más.

## El caso, con números

Un sistema que clasifica las consultas cada mañana, **sin registro**. Un día una familia se queja de que nadie le contestó una consulta de beca. Se busca: la consulta está en el formulario, pero no se sabe si el sistema la vio, ni cómo la clasificó. Llevan **dos horas** de reconstruir y no hay respuesta.

El mismo sistema, **con registro**: una planilla con una fila por consulta procesada. Se busca la consulta: el sistema la vio el martes a las 7:02 y la clasificó como "información general". El problema está a la vista en **cinco minutos**: la consulta decía "ayuda económica", no "beca". Se suma como caso a la prueba y se ajusta la instrucción.

Y la lectura semanal: el viernes, quince minutos mirando la planilla de la semana. En la primera lectura aparece algo que nadie había reportado: **11 de 70** consultas quedaron como "otra cosa", la categoría de descarte. Eso es un 16%, y es un aviso de que hay un tipo de consulta que el sistema no conoce.

## Dónde no aplica

**El registro también tiene datos de personas.** Si anotás las consultas enteras, el registro es otra copia de información sensible. Alcanza con el identificador y la decisión; el texto completo queda en el lugar original.

**Un registro que nadie lee es un archivo.** El valor está en la lectura semanal, no en la planilla. Si no vas a mirarlo, por lo menos que te avise cuando una categoría se dispara.

**No hace falta para lo que corrés a mano y mirás.** Si vos disparás la tarea y ves el resultado, el registro sos vos. Es para lo que pasa mientras no estás.

## Probá que lo entendiste

¿Qué registro te sirve más para algo que clasifica consultas cada mañana?

1. Un archivo donde el sistema escribe "corrió bien" cada día.
2. Una planilla con una fila por consulta: fecha, identificador, categoría elegida y si hubo error.
3. Una copia completa de cada consulta con su respuesta, en una carpeta.

:::Ver la respuesta
**La 2.** Te deja encontrar una consulta en minutos, ver qué decidió el sistema, y en la lectura semanal, contar cuántas fueron a cada categoría.

**La 1** dice que corrió, no qué hizo. El día que falla una sola consulta, no te sirve de nada.

**La 3** tiene todo, pero duplica información de familias en otra carpeta y es difícil de leer. Más no es mejor si nadie lo puede revisar en quince minutos.
:::

## Qué hacer esta semana

Si tenés algo que corre solo, sumale una planilla de registro con cuatro columnas: cuándo, qué, qué decidió y si falló. El viernes que viene, leela quince minutos y anotá una cosa que no sabías.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-registro'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-persona-en-medio · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dónde va la persona',
  '"Que lo revise una persona" no alcanza como diseño. Importa en qué paso, sobre qué casos y con qué tiempo, porque si revisa todo, deja de revisar.',
$md$
Todo el mundo dice que la IA tiene que tener "una persona en el medio". Está bien. Pero como diseño, no alcanza: una persona que tiene que aprobar cuarenta cosas por día, todas iguales, a la tercera semana aprueba sin mirar. La revisión sigue existiendo en el papel y desapareció en la práctica.

La idea de esta lección: **la persona va donde el error es caro o no se puede deshacer, y sólo ahí.** Lo demás corre solo, con registro. Así, lo que llega a la persona es poco y vale la pena mirarlo.

## Dos preguntas por cada paso

- **¿Cuánto cuesta si sale mal?** Una etiqueta equivocada en una planilla interna, poco. Un mail con una fecha equivocada a una familia, mucho.
- **¿Se puede deshacer?** Una fila se corrige. Un mail mandado, no.

Si es caro **o** no se puede deshacer, va la persona. Si es barato **y** se puede deshacer, corre solo.

## El caso, con números

Un sistema que procesa **40 consultas por día** en tres pasos: clasificarlas, redactar un borrador de respuesta y mandarla.

**Primer diseño:** una persona aprueba todo, los tres pasos de las 40 consultas. Son **120 aprobaciones por día.** Al principio las mira. A la tercera semana, las aprueba de a diez. En un control, de **6 errores** que había en una semana, la persona aprobó **5** sin verlos.

**Segundo diseño:** clasificar corre solo, porque una etiqueta mal puesta se corrige y cuesta poco. Redactar también corre solo. **Mandar** es el paso que no se deshace: ahí va la persona, sólo para las respuestas que mencionan dinero, fechas o vacantes, que son las caras. Son unas **12 por día.** Las mira de verdad, porque son pocas y sabe que son las que importan. En el mismo control, de **6 errores**, atrapa **5**.

Diez veces menos aprobaciones, y la revisión funciona.

## Dónde no aplica

**Al principio, la persona revisa todo.** Mientras no sabés cuánto se equivoca el sistema, no sabés qué es seguro dejar solo. Esto es para después de haberlo corrido en paralelo y tener el número.

**"Barato" depende de quién lo ve.** Una etiqueta interna es barata; la misma etiqueta, si decide qué familia recibe una llamada, no. El costo se mide por lo que pasa después del error, no por el paso en sí.

**Que corra solo no es que nadie lo mire.** Lo que no pasa por la persona queda en el registro, y el registro se lee una vez por semana. La persona se saca del paso a paso, no de la supervisión.

## Probá que lo entendiste

¿En cuál de estos pasos ponés a la persona?

1. Etiquetar cada consulta según el curso por el que pregunta.
2. Mandar a las familias la confirmación de la fecha y hora de su entrevista.
3. Resumir las consultas del día en un mensaje interno al equipo.

:::Ver la respuesta
**En la 2.** Es hacia afuera, no se deshace, y una fecha equivocada tiene consecuencias para la familia. Es exactamente donde va la persona.

**La 1** corre sola: una etiqueta equivocada se corrige y cuesta poco. Queda en el registro.

**La 3** también corre sola: es interna, y si el resumen tiene un error, alguien del equipo lo nota y lo dice.
:::

## Qué hacer esta semana

Tomá algo tuyo que tenga a una persona aprobando. Contá cuántas aprobaciones hace por día y, para cada paso, contestá las dos preguntas. Si hay pasos baratos y reversibles que la persona aprueba, sacáselos: lo que le quede, lo va a mirar mejor.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-persona-en-medio'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-adopcion · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cuánta gente lo usa de verdad',
  'Compartiste algo con doce personas y todos dijeron que estaba buenísimo. La pregunta que importa es cuántos lo usaron la semana pasada.',
$md$
Armaste algo, lo mostraste, lo compartiste con doce personas y todos dijeron que estaba buenísimo. Tres meses después, ¿cuántas lo usan? Casi nadie lo sabe, porque casi nadie lo mide. Y es la única forma de saber si lo que armaste resolvió algo.

La idea de esta lección: **la adopción se mide con lo que la gente hace, no con lo que dice: cuántos lo usaron la semana pasada, para cuántas de las tareas para las que existe.** Dos números, una vez por mes.

## Los dos números

- **Uso real:** de las personas que lo tienen, cuántas lo usaron al menos una vez la semana pasada. No "alguna vez": la semana pasada.
- **Cobertura:** de las veces que se hizo la tarea para la que existe, en cuántas se usó. Si se contestaron 90 consultas y 30 pasaron por el asistente, la cobertura es un tercio.

El primero dice si la gente lo adoptó. El segundo dice si reemplazó la forma vieja o convive con ella.

## El caso, con números

Un asistente para responder consultas, compartido con **12 personas.** En la presentación, las 12 dijeron que lo iban a usar.

Al mes, con el registro: **5 de 12** lo usaron la semana anterior. Cobertura: de **90 consultas** de esa semana, **28** pasaron por el asistente, el 31%.

Se habla con los siete que no lo usan. Aparecen tres razones: cuatro no se acuerdan de dónde está, dos encontraron que en las consultas de becas contesta mal y volvieron a escribir a mano, y uno prefiere su forma.

Se arreglan las dos primeras: un acceso directo y una regla de becas. Al mes siguiente: **9 de 12** lo usan, y la cobertura sube a **61 de 90**, el 68%.

El asistente era el mismo. Lo que cambió fue saber por qué no se usaba.

## Dónde no aplica

**No todo tiene que llegar al cien.** Si una tarea a veces conviene hacerla a mano (una consulta delicada, una familia conocida), una cobertura del 70% puede ser la correcta. El número es para ver tendencias, no para cumplir una meta.

**El uso no dice si sirve.** Alguien puede usarlo todos los días y corregir todo lo que sale. La adopción va al lado de la calidad, no en lugar de ella.

**Con dos o tres personas, preguntá.** Medir tiene sentido cuando ya no te enterás de cómo se usa lo que armaste.

## Probá que lo entendiste

¿Qué dato te dice mejor si tu asistente compartido funciona?

1. Las 12 personas dijeron en la reunión que les parecía muy útil.
2. Se usó 140 veces desde que lo compartiste hace tres meses.
3. La semana pasada lo usaron 9 de 12 personas, para 61 de las 90 consultas.

:::Ver la respuesta
**La 3.** Es uso reciente, de cuántas personas y sobre cuántas tareas posibles. Se puede comparar con el mes anterior.

**La 1** es intención. No predice nada.

**La 2** parece mucho, pero no dice nada: 140 usos en tres meses pueden ser dos personas que lo usan todos los días y diez que nunca lo abrieron.
:::

## Qué hacer esta semana

Si compartiste algo con más de tres personas, averiguá cuántas lo usaron la semana pasada. Con las que no, preguntá por qué, sin defender lo que armaste. La razón más repetida es lo próximo que hay que arreglar.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-adopcion'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-receta-compartida · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'When the whole team uses your recipe',
  'A saved instruction that works for you breaks differently when five people use it. It needs what any shared tool needs: an owner and a way to report problems.',
$md$
You set up a project or an assistant that works: it has its instructions, its documents and its examples. You share it with the team. Two weeks later there are five versions: each person changed something to suit themselves, nobody knows which is the good one, and when something goes wrong, there's nobody to tell.

The idea of this lesson: **a recipe a team uses needs the same as any shared tool: an owner, a single current version and a way to report what goes wrong.**

## The three pieces

- **An owner.** One person who decides changes. Not the only one who can propose them: the only one who applies them.
- **One version, dated.** Above the instructions, one line: "Version of 14/3. Changes: bursary rule added". Whoever uses it knows whether it's up to date.
- **A place to report.** A spreadsheet, a channel, a form: where anyone notes "this went wrong", with the example. The owner reviews it once a week.

## The case, with numbers

An assistant for answering enquiries, set up by one person and shared with **6 people** on the team.

**Without an owner:** after a month there are **4 different copies** going round. One has a rule added that contradicts another. When the fees are updated, it's done in one copy and not the other three: for two weeks, **half the team** answers with the old fees.

**With an owner, a version and a reporting sheet:** a single copy, which the others use but don't edit. During the month, **9 reports** reach the sheet. The owner reviews them on Friday: 5 are solved with a new rule, 3 were the same problem, 1 was the person's mistake rather than the recipe's. The fee update is done once and all six see it.

The cost: half an hour a week of the owner's time. What it prevents: two weeks of answers with stale data.

## Where it doesn't apply

**If two people who sit together use it**, talking is enough. The system is for when you no longer hear what's happening with what you built.

**Having an owner doesn't mean nobody else has a say.** If reports aren't read or never lead to changes, people stop reporting and go back to making their own copies.

**Some personal adjustments are fine.** If someone wants shorter answers, that goes in their personal instructions, not in the team recipe. The recipe is what's shared.

## Check you've got it

Someone on the team tells you the shared recipe handles bursary enquiries badly. What do you do?

1. Tell them to make a copy and adjust it for themselves.
2. Ask them for the example for the reporting sheet, and review it on Friday with the others.
3. Change the recipe there and then, so it doesn't happen again.

:::Show the answer
**Number 2.** With the concrete example, you can see whether it's a recipe problem and fix it once for everyone. And if there are other reports on the same topic, you solve them together.

**Number 1** is how you end up with four different copies. The bursary problem stays the same for the other five.

**Number 3** can be right if it's urgent and obvious, but without the example you don't know whether you fixed it. And changing it on the spot every time someone complains ends in a recipe that contradicts what worked yesterday.
:::

## What to do this week

If you've shared something you built with other people, write the version and date above the instructions, and set up the reporting sheet with three columns: what you asked, what came out, what should have come out.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-receta-compartida'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-registro · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Leave a trail',
  'What runs on its own does its work while you''re not looking. If it leaves no record, when something goes wrong there''s no way to know what happened.',
$md$
Something of yours runs on its own every day. One Monday, someone tells you an enquiry wasn't sorted. When did it happen? What did the system receive? What did it reply? Without a record, the only possible answer is "I don't know", and fixing it is guesswork.

The idea of this lesson: **everything that runs without you must leave a record of what it received, what it did and when**, somewhere you can read it. And once a week, someone reads it.

## What gets noted, on each run

- **When it ran.** Date and time.
- **What it received.** You needn't copy everything: how many items and an identifier for each is enough.
- **What it decided.** The category, the summary, the reply, whatever it did.
- **Whether anything failed.** And what, in words.

One row per item processed, in a spreadsheet. Nothing more is needed.

## The case, with numbers

A system that sorts enquiries every morning, **without a record**. One day a family complains that nobody answered their bursary enquiry. People search: the enquiry is in the form, but nobody knows whether the system saw it, or how it sorted it. After **two hours** of reconstructing, there's no answer.

The same system, **with a record**: a spreadsheet with one row per enquiry processed. They look up the enquiry: the system saw it on Tuesday at 7:02 and sorted it as "general information". The problem is visible in **five minutes**: the enquiry said "financial help", not "bursary". It's added as a test case and the instruction is adjusted.

And the weekly reading: on Friday, fifteen minutes looking at the week's sheet. The first reading turns up something nobody had reported: **11 of 70** enquiries ended up as "other", the catch-all category. That's 16%, and a sign there's a kind of enquiry the system doesn't recognise.

## Where it doesn't apply

**The record contains people's data too.** If you log enquiries in full, the record is another copy of sensitive information. The identifier and the decision are enough; the full text stays where it originally was.

**A record nobody reads is an archive.** The value is in the weekly reading, not the spreadsheet. If you're not going to look at it, at least have it alert you when a category spikes.

**It isn't needed for what you run by hand and watch.** If you trigger the task and see the result, you are the record. It's for what happens while you're away.

## Check you've got it

Which record helps you most for something that sorts enquiries every morning?

1. A file where the system writes "ran fine" each day.
2. A spreadsheet with one row per enquiry: date, identifier, category chosen and whether there was an error.
3. A full copy of every enquiry with its reply, in a folder.

:::Show the answer
**Number 2.** It lets you find an enquiry in minutes, see what the system decided, and in the weekly reading, count how many went to each category.

**Number 1** says it ran, not what it did. The day a single enquiry fails, it's no use at all.

**Number 3** has everything, but duplicates families' information in another folder and is hard to read. More isn't better if nobody can review it in fifteen minutes.
:::

## What to do this week

If you have something that runs on its own, add a record sheet with four columns: when, what, what it decided and whether it failed. Next Friday, read it for fifteen minutes and note one thing you didn't know.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-registro'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-persona-en-medio · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Where the person goes',
  '"Have a person check it" isn''t enough as a design. It matters at which step, on which cases and with how much time, because if they check everything, they stop checking.',
$md$
Everyone says AI needs "a human in the loop". Fine. But as a design, it isn't enough: a person who has to approve forty things a day, all alike, is approving without looking by the third week. The check still exists on paper and has vanished in practice.

The idea of this lesson: **the person goes where a mistake is expensive or can't be undone, and only there.** The rest runs on its own, with a record. That way, what reaches the person is little and worth looking at.

## Two questions for each step

- **How much does it cost if it goes wrong?** A wrong label in an internal spreadsheet, little. An email with the wrong date to a family, a lot.
- **Can it be undone?** A row gets corrected. A sent email doesn't.

If it's expensive **or** can't be undone, the person goes there. If it's cheap **and** can be undone, it runs on its own.

## The case, with numbers

A system that processes **40 enquiries a day** in three steps: sort them, draft a reply and send it.

**First design:** a person approves everything, all three steps for all 40 enquiries. That's **120 approvals a day.** At first they look. By the third week, they approve them ten at a time. In a check, of the **6 errors** in one week, the person approved **5** without seeing them.

**Second design:** sorting runs on its own, because a wrong label gets corrected and costs little. Drafting runs on its own too. **Sending** is the step that can't be undone: that's where the person goes, only for replies that mention money, dates or places, which are the expensive ones. That's about **12 a day.** They genuinely look, because there are few and they know these are the ones that matter. In the same check, of **6 errors**, they catch **5**.

Ten times fewer approvals, and the check works.

## Where it doesn't apply

**At first, the person checks everything.** While you don't know how often the system gets things wrong, you don't know what's safe to leave alone. This is for after you've run it in parallel and have the figure.

**"Cheap" depends on who sees it.** An internal label is cheap; the same label, if it decides which family gets a call, isn't. The cost is measured by what happens after the mistake, not by the step itself.

**Running on its own isn't nobody looking.** What doesn't pass through the person stays in the record, and the record gets read once a week. The person is taken out of the step-by-step, not out of supervision.

## Check you've got it

At which of these steps do you put the person?

1. Labelling each enquiry by the year group it asks about.
2. Sending families confirmation of the date and time of their interview.
3. Summarising the day's enquiries in an internal message to the team.

:::Show the answer
**At 2.** It goes outside, can't be undone, and a wrong date has consequences for the family. It's exactly where the person goes.

**Number 1** runs on its own: a wrong label gets corrected and costs little. It stays in the record.

**Number 3** runs on its own too: it's internal, and if the summary has a mistake, someone on the team notices and says so.
:::

## What to do this week

Take something of yours that has a person approving. Count how many approvals they make a day and, for each step, answer the two questions. If there are cheap, reversible steps the person approves, take those away from them: what's left, they'll look at better.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-persona-en-medio'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-adopcion · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'How many people really use it',
  'You shared something with twelve people and they all said it was brilliant. The question that matters is how many used it last week.',
$md$
You built something, showed it, shared it with twelve people and they all said it was brilliant. Three months later, how many use it? Hardly anyone knows, because hardly anyone measures it. And it's the only way to know whether what you built solved anything.

The idea of this lesson: **adoption is measured by what people do, not what they say: how many used it last week, for how many of the tasks it exists for.** Two figures, once a month.

## The two figures

- **Real use:** of the people who have it, how many used it at least once last week. Not "ever": last week.
- **Coverage:** of the times the task it exists for was done, how many used it. If 90 enquiries were answered and 30 went through the assistant, coverage is a third.

The first tells you whether people adopted it. The second tells you whether it replaced the old way or sits alongside it.

## The case, with numbers

An assistant for answering enquiries, shared with **12 people.** At the presentation, all 12 said they'd use it.

A month later, from the record: **5 of 12** used it the previous week. Coverage: of that week's **90 enquiries**, **28** went through the assistant, 31%.

They talk to the seven who don't use it. Three reasons come up: four can't remember where it is, two found it answers bursary enquiries badly and went back to writing by hand, and one prefers their own way.

The first two get fixed: a shortcut and a bursary rule. The following month: **9 of 12** use it, and coverage rises to **61 of 90**, 68%.

The assistant was the same. What changed was knowing why it wasn't being used.

## Where it doesn't apply

**Not everything has to reach a hundred.** If a task is sometimes better done by hand (a sensitive enquiry, a family you know), 70% coverage may be right. The figure is for seeing trends, not hitting a target.

**Use doesn't say whether it helps.** Someone can use it every day and correct everything it produces. Adoption sits next to quality, not in place of it.

**With two or three people, just ask.** Measuring makes sense once you no longer hear how what you built is being used.

## Check you've got it

Which figure best tells you whether your shared assistant works?

1. All 12 people said at the meeting they found it very useful.
2. It's been used 140 times since you shared it three months ago.
3. Last week 9 of 12 people used it, for 61 of the 90 enquiries.

:::Show the answer
**Number 3.** It's recent use, by how many people and over how many possible tasks. It can be compared with the previous month.

**Number 1** is intention. It predicts nothing.

**Number 2** sounds like a lot, but says nothing: 140 uses in three months could be two people using it every day and ten who never opened it.
:::

## What to do this week

If you shared something with more than three people, find out how many used it last week. With those who didn't, ask why, without defending what you built. The most repeated reason is the next thing to fix.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-adopcion'
on conflict do nothing;
