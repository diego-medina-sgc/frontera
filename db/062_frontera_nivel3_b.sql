-- ============================================================
-- 062 · Frontera: cuatro lecciones más para el nivel 3
-- ============================================================
-- Con la 058 a 061, un nivel 3 tenía 12 días de material. Estas
-- cuatro cubren lo que sigue para quien ya construye y todavía no
-- tenía una lección con la estructura aprobada:
--
--   agentes:        fr-agente-o-flujo · fr-herramientas
--   automatizacion: fr-dos-veces
--   contexto-largo: fr-memoria-vieja
--
-- created_at va fechado el 19/11 a propósito: en frontera el ruteo
-- sirve primero lo más nuevo, y estas van después de las de evals y
-- de trabajo asincrónico, que son la base. Cada una se sostiene sola.
-- Mismo colegio que en la 058 a 061.
--
-- La versión en inglés va en el mismo archivo, al final.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-agente-o-flujo', 'agentes',        '2026-11-19 12:00:00+00'),
  ('fr-dos-veces',      'automatizacion', '2026-11-19 11:00:00+00'),
  ('fr-memoria-vieja',  'contexto-largo', '2026-11-19 10:00:00+00'),
  ('fr-herramientas',   'agentes',        '2026-11-19 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- fr-agente-o-flujo · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  '¿Un agente o una receta?',
  'Darle libertad a la IA para que decida los pasos suena más avanzado. Casi siempre es peor, y hay una cuenta que explica por qué.',
$md$
Hay dos formas de armar algo que hace varios pasos con IA.

Una es **la receta**: vos decidís los pasos y el orden. Primero lee la consulta, después busca en el reglamento, después redacta. La IA hace cada paso, pero no elige cuál sigue.

La otra es **el agente**: le das el objetivo y las herramientas, y él decide qué hacer, en qué orden y cuándo terminó.

El agente suena más avanzado, y por eso se elige de más. La idea de esta lección: **si sabés los pasos, escribí la receta. El agente es para cuando los pasos cambian de un caso a otro.**

## La cuenta que lo explica

Cada paso que la IA decide sola tiene alguna chance de salir mal. Supongamos que cada decisión sale bien 95 de cada 100 veces, que es mucho.

- Con **un** paso, sale todo bien el 95% de las veces.
- Con **cinco** pasos encadenados, 0,95 multiplicado cinco veces: el **77%**.
- Con **diez**, el **60%**.

Los errores se multiplican, no se suman. Cada paso que decide el agente es una decisión más que puede salir mal, y lo que hace el paso seis depende de que el cinco haya salido bien.

En la receta, el orden de los pasos no es una decisión: está escrito. Lo que puede fallar es cada paso por separado, y cada paso se puede probar por separado.

## El caso, con números

Un colegio quiere contestar las consultas sobre vacantes. Hacen falta cinco cosas: leer qué curso piden, buscar ese curso en la planilla de vacantes, ver si hay lista de espera, buscar los requisitos de ingreso y redactar.

**Como agente**, con las herramientas y el objetivo, en 50 consultas de prueba: **38 bien**, el 76%. En las otras 12 a veces redacta antes de mirar la planilla, a veces busca el curso equivocado y a veces da por terminado sin mirar la lista de espera.

**Como receta**, los mismos cinco pasos siempre en el mismo orden: **46 de 50**, el 92%. Los 4 errores están todos en el mismo paso (leer qué curso piden cuando la consulta menciona dos hijos), y eso se arregla en ese paso solo.

La receta no sólo acierta más: **cuando falla, sabés dónde.**

## Dónde no aplica

**Cuando los pasos cambian de un caso a otro, la receta no alcanza.** "Averiguá por qué bajaron las inscripciones de cuarto grado" no tiene pasos conocidos: depende de lo que vaya encontrando. Ahí el agente tiene sentido, y conviene que una persona mire lo que hace.

**Una receta con una decisión adentro sigue siendo receta.** "Si la consulta es de beca, mandala a una persona; si no, seguí" es un paso fijo que elige entre dos caminos escritos. No hace falta un agente para eso.

**Los pasos cortos y seguros cambian la cuenta.** Si cada paso del agente sale bien 99 de cada 100 veces, diez pasos dan un 90%. La cuenta no dice "nunca agentes": dice que la seguridad de cada paso manda.

## Probá que lo entendiste

¿Receta o agente?

1. Cada mañana, pasar las inscripciones nuevas del formulario a la planilla, verificar que no falte ningún dato y avisar si falta.
2. Investigar qué ofrecen los cinco colegios de la zona en idiomas, a partir de sus sitios, y armar una comparación.
3. Contestar consultas: si son de vacantes, buscar en la planilla; si son de aranceles, en la lista de precios; si son otra cosa, derivar.

:::Ver la respuesta
**1. Receta.** Los pasos son siempre los mismos y en el mismo orden. Un agente sólo agrega chances de que se saltee la verificación algún día.

**2. Agente, con una persona mirando.** Cada sitio está armado distinto: no sabés de antemano dónde está la información ni cuántas páginas hay que mirar. Es exploración, y para eso sirve.

**3. Receta con una bifurcación.** Parece que hay que decidir, pero las tres opciones están escritas. El único paso que decide es clasificar la consulta, y ese se prueba solo.
:::

## Qué hacer esta semana

Si tenés algo armado que hace varios pasos, escribí en una lista **qué pasos hace y en qué orden**. Si los pudiste escribir sin dudar y son siempre los mismos, es una receta, aunque hoy esté armado como agente.

Si no los pudiste escribir, todavía no sabés qué tiene que hacer, y eso pasa antes que elegir entre agente y receta.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-agente-o-flujo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-dos-veces · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Que pueda correr dos veces sin romper nada',
  'Algo que corre solo va a fallar a la mitad alguna vez. Lo que importa es qué pasa cuando lo volvés a correr.',
$md$
Todo lo que corre solo, algún día, se corta a la mitad. Se cayó la conexión, se venció un permiso, el archivo estaba abierto. Eso no se evita. Lo que se decide de antemano es **qué pasa cuando alguien lo vuelve a correr**.

La idea de esta lección: **algo que corre solo tiene que poder correr dos veces seguidas y dejar todo igual que si hubiera corrido una.** Si no, cada falla se convierte en dos: la del corte y la de arreglarlo.

## El caso, con números

Cada mañana, una tarea pasa las inscripciones nuevas del formulario a la planilla que usa facturación. La instrucción es simple: *"tomá las inscripciones de ayer y agregalas a la planilla"*.

Un martes entran 40. La tarea copia **25** y se corta. Alguien lo ve, la vuelve a correr y esta vez anda: copia las **40**.

En la planilla hay ahora **65 filas** donde tendría que haber 40. Hay **25 familias duplicadas**, y la planilla va a facturación el viernes. Nadie se entera hasta que llaman las familias.

El problema no fue el corte. Fue que **"agregar" no mira lo que ya está**.

Tres cambios lo arreglan:

- **Cada inscripción tiene un identificador**, y la instrucción pasa a ser *"agregá las que no estén"*. Corrida dos veces: las 25 ya están, agrega las 15 que faltan. 40 filas.
- **Cada fila procesada queda marcada** en el formulario. La próxima corrida empieza donde terminó la anterior.
- **Un ensayo antes de escribir**: la tarea primero dice qué va a hacer ("voy a agregar 15 filas") y recién después lo hace. Si dice 40 cuando ayer entraron 40 y ya se copiaron 25, algo no cierra.

## Lo irreversible, aparte

Hay acciones que se pueden deshacer y acciones que no. Una fila de más en una planilla se borra. **Un mail a 300 familias no se desmanda.**

Regla: lo que no se puede deshacer **no corre dos veces nunca**. Se marca como hecho antes de hacerlo y se revisa la marca antes de empezar. Y si es hacia afuera, como dijimos en otras lecciones, lo aprieta una persona.

## Dónde no aplica

**Lo que sólo lee no necesita nada de esto.** Un resumen que se arma de nuevo cada día y pisa al anterior se puede correr diez veces: siempre deja lo mismo.

**Lo que se corre a mano y se mira no lo necesita tanto.** Si vos disparás la tarea y mirás el resultado, el duplicado lo ves. El problema es lo que corre solo y nadie mira hasta el viernes.

**No hace falta para todo lo que escribe.** Un registro que suma una línea por corrida ("corrió a las 7, procesó 40") está bien que tenga dos líneas si corrió dos veces: es lo que pasó.

## Probá que lo entendiste

¿Cuáles se pueden correr dos veces sin problema?

1. Un resumen de las consultas del día que se guarda en un documento y pisa el del día anterior.
2. Un recordatorio por mail a las familias con la cuota vencida.
3. Agregar a la planilla de vacantes las bajas que llegaron por mail.

:::Ver la respuesta
**1. Sí.** Pisa en vez de agregar: corrido dos veces, queda el mismo documento.

**2. No, y es el más peligroso.** Corrido dos veces, cada familia recibe dos recordatorios, y no hay forma de deshacerlo. Necesita la marca de "ya enviado" revisada antes de mandar, y que lo apriete una persona.

**3. No, tal como está.** "Agregar" duplica. Con un identificador por baja y la instrucción "agregá las que no estén", sí.
:::

## Qué hacer esta semana

Tomá algo tuyo que corre solo y que escribe en algún lado. Hacé la prueba: **correlo dos veces seguidas** sobre los mismos datos, en una copia, y mirá si quedó igual que con una.

Si quedó distinto, ya sabés qué va a pasar el día que se corte a la mitad.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-dos-veces'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-memoria-vieja · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Lo que le dejaste escrito también vence',
  'Cargaste los documentos una vez y anduvo. Ocho meses después contesta con datos que ya no son ciertos, con la misma seguridad.',
$md$
Cuando armás un espacio de trabajo con IA (un proyecto con documentos de referencia, un asistente con su manual, unas instrucciones con datos adentro), lo cargás una vez, lo probás, anda bien y te olvidás.

Pero los documentos describen un momento. Los aranceles cambian, el calendario cambia, la persona de contacto se va. La IA no tiene forma de saber que un documento quedó viejo: **lo trata como verdad, con la misma seguridad del primer día.**

La idea de esta lección: **todo lo que le dejás escrito tiene fecha de vencimiento, y alguien tiene que mirarla.**

## El caso, con números

En marzo, un colegio arma un asistente para contestar preguntas de familias, con **12 documentos**: aranceles, calendario, requisitos de ingreso, transporte, uniformes, contactos, reglamento y algunos más. Lo prueban y anda muy bien.

En noviembre, alguien le hace las **20 preguntas más comunes** de la semana y compara con la información vigente. **6 de 20 respuestas usan un dato viejo**: el 30%.

Las 6 salen de **4 documentos**: los aranceles (cambiaron en julio), el calendario (se movió una fecha), los requisitos (se agregó un papel) y los contactos (cambió una persona). Los otros 8 documentos siguen bien.

Y lo más incómodo: ninguna de las 6 respuestas se ve mal. Son claras, están bien escritas y citan el documento. Ese es el problema.

El arreglo es de mantenimiento, no de IA:

- **Cada documento lleva en la primera línea** de cuándo es y quién lo mantiene.
- **Los que cambian seguido** (aranceles, calendario, contactos) tienen una revisión cada tres meses, anotada en el calendario de alguien. Son unos 20 minutos.
- **Las 20 preguntas de prueba** se vuelven a hacer después de cada revisión. Si alguna da un dato viejo, falta actualizar algo.

## Dónde no aplica

**Lo que no cambia no necesita fecha.** La historia del colegio o su proyecto educativo pueden quedar años. El trabajo es separar lo que vence de lo que no, no revisar todo cada mes.

**Cargar más documentos "por las dudas" empeora esto.** Cada documento de más es uno más que puede quedar viejo y que compite por atención con los que importan. Menos y al día es mejor que muchos y algunos vencidos.

**No esperes que la IA detecte lo viejo sola.** Le podés pedir que diga la fecha del documento del que sacó el dato, y ayuda. Pero no sabe qué cambió en el mundo desde entonces: eso lo sabe alguien del colegio.

## Probá que lo entendiste

¿Cuáles de estos documentos necesitan una fecha de revisión, y cada cuánto?

1. La lista de aranceles del año.
2. El reglamento de convivencia.
3. La historia de la fundación del colegio.

:::Ver la respuesta
**1. Sí, y seguido.** Cambia al menos una vez por año y a veces más. Es el dato que más daño hace si queda viejo: una familia decide con eso. Revisión cada tres meses y siempre que haya un aumento.

**2. Sí, una vez por año.** Cambia poco, pero cambia, y cuando cambia suele importar. Una revisión anual alcanza.

**3. No.** No va a cambiar. Ponerle fecha de revisión es trabajo sin retorno, y le quita atención a los que sí vencen.
:::

## Qué hacer esta semana

Si tenés un proyecto o un asistente con documentos cargados, listalos. Al lado de cada uno, **cuándo lo cargaste y si cambió algo desde entonces**.

Después hacele tres preguntas cuya respuesta sepas que cambió este año. Si alguna vuelve con el dato viejo, ya sabés cuál actualizar primero.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-memoria-vieja'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-herramientas · es
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cada herramienta que le das es una decisión más',
  'Conectarle todo "por si acaso" parece darle más poder. En la práctica le das más formas de equivocarse.',
$md$
Cuando armás algo que usa herramientas (buscar en una planilla, leer el mail, consultar un calendario, escribir en un documento), lo natural es conectarle todo lo que podría llegar a necesitar.

Cada herramienta conectada, en cada pedido, es una opción más que la IA tiene que descartar. Y la IA elige **por la descripción** de cada herramienta, no por lo que hace. Si dos se parecen o la descripción es vaga, elige mal, con toda seguridad.

La idea de esta lección: **pocas herramientas, cada una con una descripción que diga cuándo usarla y cuándo no.**

## El caso, con números

Un asistente del colegio contesta preguntas internas del equipo. Tiene **14 herramientas** conectadas: tres planillas distintas, el calendario, dos carpetas de documentos, el mail, el directorio de contactos y seis más que se sumaron con el tiempo.

En una prueba con **50 preguntas reales**, elige la herramienta equivocada en **9**: el 18%. Busca vacantes en la planilla de inscripciones del año pasado, o un horario en la carpeta de documentos en vez del calendario.

Dos cambios:

- **De 14 a 5.** Se sacan las que no usaron en el último mes y se unen las tres planillas en una consulta que sabe a cuál ir.
- **Cada descripción dice cuándo sí y cuándo no.** No *"planilla de vacantes"* sino *"vacantes por curso del año en curso; no tiene años anteriores ni inscripciones pendientes"*.

Las mismas 50 preguntas: **2 errores**, el 4%. El modelo es el mismo y la pregunta es la misma. Cambió lo que tenía para elegir y cómo estaba descripto.

## Cómo se escribe una buena descripción

Tres cosas, en este orden:

- **Qué tiene**, en las palabras que usaría quien pregunta, no en las del sistema.
- **Cuándo usarla**, con un ejemplo de pregunta.
- **Qué no tiene**, sobre todo si hay otra herramienta parecida. Es la parte que casi nadie escribe y la que más errores evita.

## Dónde no aplica

**Si las herramientas no se parecen, el número importa menos.** Diez herramientas que no tienen nada que ver entre sí confunden menos que tres planillas parecidas. Lo que hace daño es la ambigüedad, no la cantidad sola.

**Sacar una herramienta que hace falta es peor que tenerla de más.** Si una pregunta necesita el calendario y lo sacaste, la IA va a inventar o buscar en otro lado. Se sacan las que no se usaron, mirando el registro, no a ojo.

**Una buena descripción no arregla una herramienta mala.** Si la planilla tiene datos viejos o mal cargados, la IA va a ir al lugar correcto y traer lo incorrecto.

## Probá que lo entendiste

¿Cuál de estas tres descripciones es la mejor para una herramienta?

1. "Planilla."
2. "Planilla de vacantes. Muy útil para todo lo relacionado con vacantes y cursos."
3. "Vacantes disponibles por curso para el año en curso. Usala para preguntas como '¿hay lugar en segundo grado?'. No tiene listas de espera (están en otra herramienta) ni años anteriores."

:::Ver la respuesta
**La 3.** Dice qué tiene, cuándo usarla con un ejemplo de pregunta, y qué no tiene, que es lo que evita que la confunda con la herramienta de listas de espera.

**La 1** no le da a la IA nada para elegir. Si hay otra planilla, es tirar una moneda.

**La 2** parece más completa pero dice lo mismo que la 1 con más palabras. "Muy útil para todo lo relacionado" no ayuda a decidir: ayuda a elegirla también cuando no corresponde.
:::

## Qué hacer esta semana

Si tenés algo con herramientas conectadas, abrí la lista. Para cada una: **¿la usó en el último mes?** Si no, desconectala.

Para las que quedan, agregale a la descripción una línea de qué **no** tiene. Es la línea que casi nadie escribe.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-herramientas'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-agente-o-flujo · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'An agent or a recipe?',
  'Letting the AI decide the steps sounds more advanced. It''s nearly always worse, and one calculation explains why.',
$md$
There are two ways to build something that does several steps with AI.

One is **the recipe**: you decide the steps and the order. First read the enquiry, then search the regulations, then draft. The AI does each step, but doesn't choose the next one.

The other is **the agent**: you give it the goal and the tools, and it decides what to do, in what order and when it's finished.

The agent sounds more advanced, and that's why it gets chosen too often. The idea of this lesson: **if you know the steps, write the recipe. The agent is for when the steps change from one case to the next.**

## The calculation behind it

Every step the AI decides on its own has some chance of going wrong. Suppose each decision comes out right 95 times out of 100, which is a lot.

- With **one** step, everything goes right 95% of the time.
- With **five** chained steps, 0.95 multiplied five times: **77%**.
- With **ten**, **60%**.

Errors multiply, they don't add up. Each step the agent decides is one more decision that can go wrong, and what step six does depends on step five having gone right.

In the recipe, the order of the steps isn't a decision: it's written down. What can fail is each step on its own, and each step can be tested on its own.

## The case, with numbers

A school wants to answer enquiries about places. It takes five things: read which year group they're asking about, look that year up in the places spreadsheet, check whether there's a waiting list, look up the admission requirements, and draft.

**As an agent**, with the tools and the goal, on 50 test enquiries: **38 right**, 76%. In the other 12 it sometimes drafts before checking the spreadsheet, sometimes looks up the wrong year group, and sometimes declares itself done without checking the waiting list.

**As a recipe**, the same five steps always in the same order: **46 out of 50**, 92%. The 4 errors are all in the same step (reading which year group they mean when the enquiry mentions two children), and that gets fixed in that step alone.

The recipe isn't just right more often: **when it fails, you know where.**

## Where it doesn't apply

**When the steps change from case to case, the recipe isn't enough.** "Find out why admissions to Year 4 dropped" has no known steps: it depends on what turns up. There, an agent makes sense, and it's worth having a person watch what it does.

**A recipe with a decision inside is still a recipe.** "If the enquiry is about a bursary, send it to a person; otherwise carry on" is a fixed step choosing between two written paths. You don't need an agent for that.

**Short, safe steps change the calculation.** If each of the agent's steps comes out right 99 times out of 100, ten steps give 90%. The calculation doesn't say "never agents": it says the reliability of each step is what decides.

## Check you've got it

Recipe or agent?

1. Every morning, moving new admissions from the form into the spreadsheet, checking no data is missing and flagging it if it is.
2. Researching what the five local schools offer in languages, from their websites, and putting together a comparison.
3. Answering enquiries: if they're about places, look in the spreadsheet; if about fees, the price list; anything else, pass it on.

:::Show the answer
**1. Recipe.** The steps are always the same and in the same order. An agent only adds the chance that one day it skips the check.

**2. Agent, with a person watching.** Every website is built differently: you can't know in advance where the information is or how many pages need looking at. It's exploration, and that's what agents are for.

**3. Recipe with a fork.** It looks as if there's deciding to do, but the three options are written down. The only step that decides is sorting the enquiry, and that gets tested on its own.
:::

## What to do this week

If you have something that does several steps, write down **which steps it does and in what order**. If you could write them without hesitating and they're always the same, it's a recipe, even if today it's built as an agent.

If you couldn't write them down, you don't yet know what it has to do, and that comes before choosing between agent and recipe.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-agente-o-flujo'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-dos-veces · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Safe to run twice',
  'Anything that runs on its own will stop halfway one day. What matters is what happens when you run it again.',
$md$
Everything that runs on its own will, one day, stop halfway. The connection dropped, a permission expired, the file was open. That can't be avoided. What you decide in advance is **what happens when someone runs it again**.

The idea of this lesson: **anything that runs on its own must be able to run twice in a row and leave everything as if it had run once.** Otherwise every failure becomes two: the one where it stopped, and the one where it got fixed.

## The case, with numbers

Every morning, a task moves new admissions from the form into the spreadsheet that the finance office uses. The instruction is simple: *"take yesterday's admissions and add them to the spreadsheet"*.

One Tuesday, 40 come in. The task copies **25** and stops. Someone notices, runs it again and this time it works: it copies all **40**.

The spreadsheet now has **65 rows** where there should be 40. There are **25 duplicated families**, and the spreadsheet goes to invoicing on Friday. Nobody finds out until the families ring.

The problem wasn't the interruption. It was that **"add" doesn't look at what's already there**.

Three changes fix it:

- **Each admission has an identifier**, and the instruction becomes *"add the ones that aren't there"*. Run twice: the 25 are already there, it adds the 15 missing. 40 rows.
- **Each processed row is marked** in the form. The next run starts where the last one finished.
- **A dry run before writing**: the task first says what it's going to do ("I'm going to add 15 rows") and only then does it. If it says 40 when 40 came in yesterday and 25 have already been copied, something doesn't add up.

## The irreversible, separately

Some actions can be undone and some can't. An extra row in a spreadsheet gets deleted. **An email to 300 families can't be unsent.**

Rule: what can't be undone **never runs twice**. It's marked as done before doing it, and the mark is checked before starting. And if it goes outside, as other lessons said, a person presses the button.

## Where it doesn't apply

**Anything that only reads needs none of this.** A summary rebuilt every day that overwrites yesterday's can be run ten times: it always leaves the same thing.

**Anything run by hand and checked needs it less.** If you trigger the task and look at the result, you'll see the duplicate. The problem is what runs on its own and nobody looks at until Friday.

**Not everything that writes needs it.** A log that adds a line per run ("ran at 7, processed 40") should have two lines if it ran twice: that's what happened.

## Check you've got it

Which can safely be run twice?

1. A summary of the day's enquiries, saved to a document that overwrites the previous day's.
2. A reminder email to families with overdue fees.
3. Adding to the places spreadsheet the withdrawals that arrived by email.

:::Show the answer
**1. Yes.** It overwrites instead of adding: run twice, you get the same document.

**2. No, and it's the most dangerous.** Run twice, each family gets two reminders, and there's no undoing it. It needs a "sent" mark checked before sending, and a person to press the button.

**3. Not as it stands.** "Add" duplicates. With an identifier per withdrawal and the instruction "add the ones that aren't there", yes.
:::

## What to do this week

Take something of yours that runs on its own and writes somewhere. Test it: **run it twice in a row** on the same data, on a copy, and see whether it ends up the same as with one run.

If it doesn't, you know what will happen the day it stops halfway.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-dos-veces'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-memoria-vieja · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'What you wrote down for it goes out of date too',
  'You loaded the documents once and it worked. Eight months later it answers with facts that are no longer true, just as confidently.',
$md$
When you set up a workspace with AI (a project with reference documents, an assistant with its handbook, instructions with facts inside), you load it once, test it, it works well and you forget about it.

But documents describe a moment. Fees change, the calendar changes, the contact person leaves. The AI has no way of knowing a document has gone stale: **it treats it as true, as confidently as on day one.**

The idea of this lesson: **everything you leave written down for it has an expiry date, and someone has to check it.**

## The case, with numbers

In March, a school sets up an assistant to answer questions from families, with **12 documents**: fees, calendar, admission requirements, transport, uniform, contacts, regulations and a few more. They test it and it works very well.

In November, someone asks it the week's **20 most common questions** and compares the answers with the current information. **6 of the 20 answers use an outdated fact**: 30%.

All 6 come from **4 documents**: fees (changed in July), the calendar (a date moved), requirements (a form was added) and contacts (a person changed). The other 8 documents are still fine.

And the most uncomfortable part: none of the 6 answers looks wrong. They're clear, well written and cite the document. That's the problem.

The fix is maintenance, not AI:

- **Each document's first line** says when it's from and who maintains it.
- **Those that change often** (fees, calendar, contacts) get a review every three months, in someone's calendar. About 20 minutes.
- **The 20 test questions** are asked again after each review. If any comes back with an old fact, something still needs updating.

## Where it doesn't apply

**What doesn't change doesn't need a date.** The school's history or its educational ethos can stay for years. The work is separating what expires from what doesn't, not reviewing everything every month.

**Loading more documents "just in case" makes this worse.** Each extra document is one more that can go stale and that competes for attention with the ones that matter. Fewer and up to date beats many with some expired.

**Don't expect the AI to spot what's old by itself.** You can ask it to state the date of the document a fact came from, and that helps. But it doesn't know what has changed in the world since then: someone at the school does.

## Check you've got it

Which of these documents need a review date, and how often?

1. This year's fee list.
2. The behaviour policy.
3. The history of the school's founding.

:::Show the answer
**1. Yes, and often.** It changes at least once a year and sometimes more. It's the fact that does most harm if it's stale: a family makes decisions with it. Review every three months and whenever there's an increase.

**2. Yes, once a year.** It changes little, but it does change, and when it does it usually matters. An annual review is enough.

**3. No.** It won't change. Giving it a review date is work with no return, and it takes attention away from the ones that do expire.
:::

## What to do this week

If you have a project or assistant with documents loaded, list them. Next to each, **when you loaded it and whether anything has changed since**.

Then ask it three questions whose answers you know changed this year. If any comes back with the old fact, you know which one to update first.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-memoria-vieja'
on conflict do nothing;

-- ------------------------------------------------------------
-- fr-herramientas · en
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'en', null,
  'Every tool you give it is one more decision',
  'Connecting everything "just in case" seems to give it more power. In practice it gives it more ways to get things wrong.',
$md$
When you build something that uses tools (searching a spreadsheet, reading email, checking a calendar, writing to a document), the natural thing is to connect everything it might ever need.

Every connected tool, in every request, is one more option the AI has to rule out. And the AI chooses **by each tool's description**, not by what it does. If two are similar or the description is vague, it chooses wrongly, with complete confidence.

The idea of this lesson: **few tools, each with a description that says when to use it and when not to.**

## The case, with numbers

A school assistant answers internal questions from staff. It has **14 tools** connected: three different spreadsheets, the calendar, two document folders, email, the staff directory and six more added over time.

In a test with **50 real questions**, it picks the wrong tool in **9**: 18%. It looks for places in last year's admissions spreadsheet, or for a timetable in the documents folder instead of the calendar.

Two changes:

- **From 14 to 5.** The ones not used in the last month are removed, and the three spreadsheets are merged into one lookup that knows which to go to.
- **Each description says when yes and when no.** Not *"places spreadsheet"* but *"places by year group for the current year; doesn't include previous years or pending admissions"*.

The same 50 questions: **2 errors**, 4%. Same model, same questions. What changed is what it had to choose from and how it was described.

## How to write a good description

Three things, in this order:

- **What it contains**, in the words the person asking would use, not the system's.
- **When to use it**, with an example question.
- **What it doesn't contain**, especially if there's a similar tool. It's the part almost nobody writes and the one that prevents most errors.

## Where it doesn't apply

**If the tools aren't alike, the number matters less.** Ten tools that have nothing to do with each other confuse less than three similar spreadsheets. What does the damage is ambiguity, not quantity alone.

**Removing a tool that's needed is worse than having one too many.** If a question needs the calendar and you removed it, the AI will invent or look elsewhere. Remove the ones that weren't used, by checking the log, not by eye.

**A good description doesn't fix a bad tool.** If the spreadsheet has old or badly entered data, the AI will go to the right place and bring back the wrong thing.

## Check you've got it

Which of these three descriptions is best for a tool?

1. "Spreadsheet."
2. "Places spreadsheet. Very useful for anything to do with places and year groups."
3. "Places available by year group for the current year. Use it for questions like 'is there room in Year 2?'. Doesn't include waiting lists (they're in another tool) or previous years."

:::Show the answer
**Number 3.** It says what it contains, when to use it with an example question, and what it doesn't contain, which is what stops it being confused with the waiting-list tool.

**Number 1** gives the AI nothing to choose by. If there's another spreadsheet, it's a coin toss.

**Number 2** looks more complete but says the same as 1 in more words. "Very useful for anything to do with" doesn't help it decide: it helps it choose this one when it shouldn't, too.
:::

## What to do this week

If you have something with tools connected, open the list. For each: **did it use it in the last month?** If not, disconnect it.

For the ones that remain, add a line to the description saying what it **doesn't** contain. It's the line almost nobody writes.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-herramientas'
on conflict do nothing;
