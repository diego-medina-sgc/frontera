-- ============================================================
-- 060 · Las tres lecciones de frontera de nivel 3, reescritas
-- ============================================================
-- fr-evals, fr-asincronico y fr-contexto son del 21/11, de antes de la
-- estructura aprobada el 22/11. Contaban bien la idea pero no tenían
-- caso con números, ni borde, ni recuperación con la respuesta
-- escondida. Y son las primeras que lee alguien de nivel 3 en cada
-- tema: la introducción era más floja que lo que venía después.
--
-- Mismos slugs y mismos títulos. Se reemplaza la capa conceptual
-- (tool_id null) en español y en inglés. No tienen capas por
-- herramienta. El caso es el mismo colegio de 058, a propósito: el
-- tema se lee como una sola línea.
-- ============================================================

-- ------------------------------------------------------------
-- fr-evals · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Un sistema con IA no se rompe: se pone peor sin avisar. Si mañana pasa, ¿cómo te enterás?',
  body_md = $md$
Un programa roto tira un error y te enterás. Un sistema con IA adentro **sigue respondiendo**, con la misma seguridad de siempre, y lo que cambia es la calidad: clasifica un poco peor, se saltea un caso que antes agarraba, inventa un dato cada veinte respuestas en vez de cada doscientas. Nadie te avisa.

Se degrada por tres razones, y ninguna necesita que vos toques nada: **cambia el modelo** por debajo, **cambian los datos** que entran, o **alguien toca la instrucción** para arreglar un caso.

La idea de esta lección es una sola: **un conjunto fijo de casos reales, con la respuesta correcta al lado, que corrés cada vez que algo cambia.** Eso se llama eval, y no necesita ninguna herramienta: una planilla con tres columnas (la entrada, lo que tendría que salir, lo que salió) ya lo es.

## El caso, con números

Un colegio tiene un sistema que clasifica las consultas que entran por la web: información general, visita, inscripción, beca.

Quien lo mantiene junta **20 consultas reales** de las que ya pasaron: 10 típicas y 10 raras (la que viene en dos idiomas, la que pide dos cosas a la vez, la que tiene el dato en un adjunto). Al lado de cada una escribe qué tendría que haber salido. Las corre: **17 de 20**. Ese 85% es la línea de base. No importa si es alto o bajo: importa que existe.

Un mes después, alguien se queja de que una consulta que mencionaba hermanos quedó como "información general". Se agrega una línea a la instrucción: *"si mencionan hermanos, es inscripción"*. Se prueba con esa consulta y anda. Se siente mejor.

Se corren los 20: **15 de 20**. La línea nueva arregló la consulta del reclamo y rompió otras tres: familias con hermanos en el colegio que sólo querían visitar. 17 más 1 menos 3. **El arreglo empeoró el sistema**, y sin la prueba se habría quedado así durante meses, con la tranquilidad de haber arreglado algo.

## Dónde no aplica

**Si la respuesta esperada está mal, medís hacia lo malo.** Es la advertencia que viene de quienes entrenan modelos: un verificador que acepta respuestas incorrectas es peor que no tener ninguno, porque te da tranquilidad. Los 20 casos se escriben despacio y se revisan. Es la parte lenta y es la que hace el trabajo.

**Con 20 casos, uno de diferencia no dice nada.** Cada caso vale cinco puntos: pasar de 17 a 16 puede ser casualidad. Una caída de tres, como en el ejemplo, sí obliga a mirar. Para notar diferencias finas hacen falta muchos más casos.

**No sirve tal cual para textos.** Si lo que sale es un borrador de mail, no hay una respuesta correcta para poner al lado. Ahí hace falta otra forma de corregir.

## Probá que lo entendiste

¿En cuál de estos tres casos volvés a correr la prueba? ¿Alcanza con correrla?

1. El proveedor anuncia una versión nueva del modelo que usa tu sistema.
2. Cambiás el formato de la planilla donde el sistema deja lo que clasificó.
3. El colegio abre una sede nueva y empiezan a entrar consultas sobre la sede.

:::Ver la respuesta
**1. Sí, ese mismo día.** Es la causa de degradación que menos se ve, porque no la hiciste vos. Si da igual o mejor, seguís. Si cae, ya sabés qué cambió.

**2. No hace falta.** El formato de salida no cambia lo que el sistema decide. Correr la prueba no le hace daño a nadie, pero no te va a decir nada.

**3. Sí, y no alcanza.** Tus 20 casos no tienen ni una consulta sobre la sede nueva, así que la prueba puede dar 17 de 20 y el sistema estar fallando justo en lo nuevo. Hay que sumar casos de la sede, y desde ahí la línea de base es otra: el número de antes ya no se compara.
:::

## Qué hacer esta semana

Elegí **la cosa tuya que más usa otra gente**. Abrí una planilla. Pegá 10 casos reales, 5 típicos y 5 raros, con lo que debería haber salido en cada uno. Corrélos y anotá el número con la fecha.

La próxima vez que toques algo, corrélos de nuevo antes de dar el cambio por bueno.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-evals');

-- ------------------------------------------------------------
-- fr-asincronico · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'El indicador de nivel real no es cuántas herramientas conocés. Es cuánto trabajo ocurre mientras no estás.',
  body_md = $md$
Hay una forma de medir el nivel de alguien con IA que no falla, y no tiene nada que ver con cuántas herramientas conoce: **cuánto trabajo útil ocurre mientras esa persona no está mirando.**

Para casi todo el mundo, incluida la gente que usa IA muy bien, la respuesta es cero. Todo pasa en conversación: pedís, mirás, corregís, cerrás. Y una conversación necesita que estés.

Se sube en tres escalones:

1. **Una instrucción guardada.** La disparás vos, pero ya no la pensás cada vez.
2. **Algo que corre solo cada tanto** y deja el resultado en un lugar fijo. Acá el trabajo deja de depender de que te acuerdes.
3. **Algo que decide si vale la pena molestarte.** No te manda todo: te avisa cuando hay algo que merece tu atención.

## El caso, con números

Todas las semanas llegan las respuestas abiertas de una encuesta a familias. Alguien las lee, las agrupa y escribe un resumen para el equipo.

**Escalón 0, conversando:** 45 minutos por semana, armando el pedido desde cero cada vez. Pero el dato que importa es otro: mirando el año anterior, **se hizo 24 de 40 semanas.** Las semanas cargadas se salteaba, que son justo las semanas en las que más comentarios llegan.

**Escalón 1, instrucción guardada:** 20 minutos. Pegar las respuestas, correr la instrucción, revisar.

**Escalón 2, corre solo** el domingo a la noche y deja el resumen en la carpeta del equipo: 5 minutos de revisión el lunes. Y se hace **40 de 40 semanas**, porque ya no depende de que haya tiempo.

En horas: el escalón 0 eran 18 horas al año (24 semanas por 45 minutos) y dejaba 16 semanas sin hacer. El escalón 2 son poco más de 3 horas al año y no deja ninguna. La diferencia no es sólo el tiempo: es que **el trabajo pasa a hacerse siempre**.

**Escalón 3:** el resumen sigue llegando a la carpeta, pero sólo te avisa si una misma queja aparece tres veces o más. La mayoría de las semanas no te molesta, y la semana que te molesta, es por algo.

## Dónde no aplica

**Nada que no sepas medir debería correr sin vos.** Es la regla entera. Lo asincrónico tiene un costo que lo conversacional no tiene: no estás ahí para corregirlo. Si sale mal, sale mal en silencio y durante semanas. Por eso casi todos los intentos de automatizar terminan abandonados: se automatizó algo que nadie sabía si funcionaba bien.

**Si no podés escribir la instrucción, no está lista.** Si cada vez lo hacés distinto porque depende de cosas que no sabrías explicar, quedate en conversación hasta que puedas.

**Lo que sale hacia afuera no corre solo.** El sistema prepara el mail a las familias; lo manda una persona.

## Probá que lo entendiste

¿En qué escalón está cada uno, y cuál es el próximo paso?

1. Tenés una instrucción en un documento que copiás y pegás todos los viernes.
2. Una tarea corre sola cada mañana y te manda todo lo que encontró: unas 30 cosas por día.
3. Cada vez que te acordás, le pedís a la IA que te arme la minuta de la reunión.

:::Ver la respuesta
**1. Escalón 1.** El próximo paso es que corra solo, pero antes escribí cómo te darías cuenta de que salió mal. Si no se te ocurre, todavía no.

**2. Escalón 2 disfrazado de 3.** Corre solo, pero no decide nada: te pasa el trabajo de filtrar a vos, treinta veces por día. El próximo paso es la regla de qué merece aviso.

**3. Escalón 0.** "Cada vez que te acordás" es la señal: hay semanas que no pasa. El próximo paso es guardar la instrucción.
:::

## Qué hacer esta semana

Buscá **una cosa que hacés todas las semanas** y que, si se hiciera sola y mal un par de veces, no pasaría nada grave. Esa es tu candidata.

No la automatices todavía: escribí primero cómo te darías cuenta de que salió mal. Si no se te ocurre cómo, elegí otra.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-asincronico');

-- ------------------------------------------------------------
-- fr-contexto · es
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Por qué tus conversaciones largas empeoran aunque no lleguen a ningún límite, y qué hacer cuando pasa.',
  body_md = $md$
Todo lo que entra en una conversación con una IA compite por el mismo espacio: tus instrucciones, los archivos que subiste, las herramientas conectadas y todo lo que se dijo antes. Cada pedido nuevo se responde **mirando todo eso junto**.

La idea que casi nadie tiene: **el problema no es que no entre. Es que, aunque entre, la calidad baja.** Más cosas compitiendo por atención significa peores decisiones sobre qué mirar, como una persona con doce pestañas abiertas. Por eso la solución nunca es más espacio: es **traer lo justo en el momento justo**.

## El caso, con números

Dos horas trabajando un documento de 8.000 palabras con la IA. A esa altura, la conversación tiene adentro:

- **Tres versiones** del documento que fuiste subiendo: unas 24.000 palabras.
- **Cuarenta idas y vueltas** de unas 300 palabras cada una: 12.000 más.
- **Las instrucciones** del principio: 500.

Unas **36.500 palabras** que entran en cada pedido. Lo que el pedido de ahora necesita de verdad es la versión final (8.000), lo que decidiste en el camino (unas 300) y las instrucciones (500): **8.800**.

Lo que importa es menos de un cuarto de lo que la IA está mirando, el 24%. El resto no es neutro: las versiones viejas **contradicen** a la actual, y los caminos que descartaste siguen ahí como si fueran opciones.

El síntoma es inconfundible: **empezás a repetir instrucciones que ya diste**, o la IA vuelve a proponer algo que descartaste hace una hora.

La salida es cortar. Conversación nueva con la versión final y diez líneas de estado: qué estás haciendo, qué decidiste, **qué descartaste y por qué**, qué falta. De 36.500 a menos de 9.000, y todo lo que queda es lo que importa.

## El mismo patrón, en todos lados

Cada vez que algo no entra bien, la industria responde igual. Con los archivos: en vez del documento entero, se busca el pedazo relevante. Con la memoria: en vez de toda la historia, un resumen y se recupera lo que hace falta. Con las herramientas: en vez de describir las cincuenta en cada pedido, se cargan las que se van a usar. Cuando salga el próximo anuncio sobre esto, ya sabés qué va a decir.

## Dónde no aplica

**En lo corto no importa.** Una conversación de cinco o seis idas y vueltas no se satura. Si la respuesta es floja ahí, el problema es el pedido, no el espacio.

**Esto no es "dale menos información".** Lo que daña es lo que sobra, no lo que hay. Un ejemplo bueno o un dato que faltaba casi siempre mejoran la respuesta. Se saca lo viejo y lo descartado; lo relevante se agrega.

**Cortar tiene un costo.** Lo que no esté en las diez líneas de estado se pierde. Si le pedís a la IA que escriba el resumen, leelo antes de usarlo: es fácil que se olvide justo lo que descartaste.

## Probá que lo entendiste

Tres situaciones. ¿Cortás, seguís, o sacás algo?

1. Van 60 mensajes y la IA te vuelve a proponer una estructura que descartaste hace una hora.
2. Tenés quince herramientas conectadas y hoy sólo vas a escribir un mail.
3. Van 8 mensajes y la respuesta es floja.

:::Ver la respuesta
**1. Cortás.** Es el síntoma de manual. En el estado de la conversación nueva va, escrito, que esa estructura se descartó y por qué; si no, vuelve.

**2. Sacás.** Las que no vas a usar compiten por atención en cada pedido. Desconectarlas por hoy no cuesta nada.

**3. Seguís, y cambiás el pedido.** Ocho mensajes no saturan nada. Lo que falta es contexto que sirva: un ejemplo de lo que querés, el dato que la IA no tiene, para quién es.
:::

## Qué hacer esta semana

La próxima vez que te descubras repitiendo una instrucción, no insistas. Abrí una conversación nueva con diez líneas de estado: qué estás haciendo, qué decidiste, qué descartaste y qué falta. Fijate si la primera respuesta ya es mejor que las últimas tres de la conversación vieja.
$md$
where tool_id is null and lang = 'es'
  and lesson_id = (select id from lessons where slug = 'fr-contexto');

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- fr-evals · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'A system with AI inside doesn''t break: it gets worse without telling you. If that happens tomorrow, how will you find out?',
  body_md = $md$
A broken program throws an error and you find out. A system with AI inside **keeps answering**, as confidently as ever, and what changes is the quality: it sorts a little worse, it misses a case it used to catch, it invents a fact every twenty answers instead of every two hundred. Nobody tells you.

It degrades for three reasons, and none of them needs you to touch anything: **the model changes** underneath, **the data coming in changes**, or **someone edits the instruction** to fix one case.

This lesson has one idea: **a fixed set of real cases, with the right answer next to each, that you run every time something changes.** That's called an eval, and it needs no tool at all: a spreadsheet with three columns (the input, what should come out, what did come out) already is one.

## The case, with numbers

A school has a system that sorts the enquiries coming in through its website: general information, visit, admission, bursary.

Whoever maintains it gathers **20 real enquiries** that have already been through it: 10 typical and 10 odd ones (the one in two languages, the one asking two things at once, the one with the key detail in an attachment). Next to each one they write what should have come out. They run them: **17 out of 20**. That 85% is the baseline. It doesn't matter whether it's high or low: what matters is that it exists.

A month later, someone complains that an enquiry mentioning siblings was filed as "general information". A line is added to the instruction: *"if they mention siblings, it's an admission"*. It's tested on that enquiry and it works. It feels better.

The 20 are run: **15 out of 20**. The new line fixed the enquiry from the complaint and broke three others: families with children already at the school who only wanted to visit. 17, plus 1, minus 3. **The fix made the system worse**, and without the test it would have stayed that way for months, with everyone reassured that something had been fixed.

## Where it doesn't apply

**If the expected answer is wrong, you measure your way towards the wrong thing.** It's the warning from people who train models: a checker that accepts incorrect answers is worse than none, because it reassures you. The 20 cases are written slowly and reviewed. It's the slow part, and it's the part that does the work.

**With 20 cases, one either way means nothing.** Each case is worth five points: going from 17 to 16 may be chance. A drop of three, as in the example, does make you look. To notice fine differences you need many more cases.

**It doesn't work as it stands for text.** If what comes out is a draft email, there's no single right answer to put next to it. That needs a different way of marking.

## Check you've got it

In which of these three cases do you run the test again? Is running it enough?

1. The provider announces a new version of the model your system uses.
2. You change the layout of the spreadsheet where the system records what it sorted.
3. The school opens a new campus and enquiries about the campus start coming in.

:::Show the answer
**1. Yes, that same day.** It's the least visible cause of degradation, because you didn't cause it. If it scores the same or better, carry on. If it drops, you know what changed.

**2. No need.** The output layout doesn't change what the system decides. Running the test does no harm, but it won't tell you anything.

**3. Yes, and it isn't enough.** Your 20 cases don't include a single enquiry about the new campus, so the test can score 17 out of 20 while the system fails on exactly what's new. You need to add campus cases, and from then on the baseline is a different one: the earlier figure no longer compares.
:::

## What to do this week

Pick **the thing of yours that other people use most**. Open a spreadsheet. Paste 10 real cases, 5 typical and 5 odd, with what should have come out of each. Run them and note the figure and the date.

Next time you change something, run them again before you accept the change.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-evals');

-- ------------------------------------------------------------
-- fr-asincronico · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'The real indicator of level isn''t how many tools you know. It''s how much work gets done while you''re not there.',
  body_md = $md$
There's one way of measuring someone's level with AI that never fails, and it has nothing to do with how many tools they know: **how much useful work happens while that person isn't watching.**

For almost everyone, including people who use AI very well, the answer is zero. Everything happens in conversation: you ask, you look, you correct, you close. And a conversation needs you there.

You climb in three steps:

1. **A saved instruction.** You still trigger it, but you no longer think it through each time.
2. **Something that runs on its own every so often** and leaves the result in a fixed place. Here the work stops depending on you remembering.
3. **Something that decides whether it's worth disturbing you.** It doesn't send you everything: it tells you when something deserves your attention.

## The case, with numbers

Every week the open-ended answers to a survey of families come in. Someone reads them, groups them and writes a summary for the team.

**Step 0, in conversation:** 45 minutes a week, building the request from scratch every time. But the figure that matters is another one: looking at the previous year, **it got done in 24 of 40 weeks.** The busy weeks got skipped, and those are exactly the weeks when the most comments come in.

**Step 1, saved instruction:** 20 minutes. Paste the answers, run the instruction, review.

**Step 2, runs on its own** on Sunday night and leaves the summary in the team folder: 5 minutes of review on Monday. And it gets done **40 weeks out of 40**, because it no longer depends on there being time.

In hours: step 0 was 18 hours a year (24 weeks at 45 minutes) and left 16 weeks undone. Step 2 is just over 3 hours a year and leaves none. The difference isn't only time: it's that **the work now always gets done**.

**Step 3:** the summary still lands in the folder, but it only alerts you if the same complaint appears three times or more. Most weeks it doesn't disturb you, and the week it does, there's a reason.

## Where it doesn't apply

**Nothing you can't measure should run without you.** That's the whole rule. Asynchronous work has a cost that conversation doesn't: you aren't there to correct it. If it goes wrong, it goes wrong silently, for weeks. That's why almost every attempt to automate ends up abandoned: someone automated something nobody knew was working properly.

**If you can't write the instruction down, it isn't ready.** If you do it differently each time because it depends on things you couldn't explain, stay in conversation until you can.

**Anything that goes outside doesn't run on its own.** The system prepares the email to families; a person sends it.

## Check you've got it

Which step is each one on, and what's the next move?

1. You have an instruction in a document that you copy and paste every Friday.
2. A task runs on its own every morning and sends you everything it found: about 30 items a day.
3. Whenever you remember, you ask the AI to write up the meeting notes.

:::Show the answer
**1. Step 1.** The next move is for it to run on its own, but first write down how you'd notice it had gone wrong. If you can't think how, not yet.

**2. Step 2 dressed up as step 3.** It runs on its own but decides nothing: it hands the filtering back to you, thirty times a day. The next move is the rule for what deserves an alert.

**3. Step 0.** "Whenever you remember" is the giveaway: some weeks it doesn't happen. The next move is to save the instruction.
:::

## What to do this week

Find **one thing you do every week** that, if it ran on its own and got it wrong a couple of times, nothing serious would happen. That's your candidate.

Don't automate it yet: first write down how you'd notice it had gone wrong. If you can't think how, pick another one.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-asincronico');

-- ------------------------------------------------------------
-- fr-contexto · en
-- ------------------------------------------------------------
update lesson_contents set
  minutes = 9,
  hook = 'Why your long conversations get worse even without hitting any limit, and what to do when it happens.',
  body_md = $md$
Everything that goes into a conversation with an AI competes for the same space: your instructions, the files you uploaded, the connected tools and everything said so far. Each new request is answered **by looking at all of that together**.

The idea almost nobody has: **the problem isn't that it doesn't fit. It's that, even when it fits, quality drops.** More things competing for attention means worse decisions about what to look at, like a person with twelve tabs open. That's why the answer is never more space: it's **bringing in just what's needed, just when it's needed**.

## The case, with numbers

Two hours working on an 8,000-word document with the AI. By then, the conversation contains:

- **Three versions** of the document you uploaded along the way: about 24,000 words.
- **Forty back-and-forths** of about 300 words each: 12,000 more.
- **The instructions** from the start: 500.

About **36,500 words** going into every request. What the current request actually needs is the final version (8,000), what you decided along the way (about 300) and the instructions (500): **8,800**.

What matters is less than a quarter of what the AI is looking at: 24%. The rest isn't neutral: the old versions **contradict** the current one, and the paths you rejected are still there as if they were options.

The symptom is unmistakable: **you start repeating instructions you've already given**, or the AI suggests again something you rejected an hour ago.

The way out is to cut. A new conversation with the final version and ten lines of status: what you're doing, what you've decided, **what you've rejected and why**, what's left. From 36,500 to under 9,000, and everything left is what matters.

## The same pattern, everywhere

Every time something doesn't fit well, the industry responds the same way. With files: instead of the whole document, the relevant piece is found. With memory: instead of the whole history, a summary, and what's needed is retrieved. With tools: instead of describing all fifty in every request, the ones about to be used are loaded. When the next announcement about this comes out, you already know what it'll say.

## Where it doesn't apply

**In short conversations it doesn't matter.** Five or six back-and-forths don't saturate anything. If the answer is weak there, the problem is the request, not the space.

**This isn't "give it less information".** What does the damage is what's surplus, not what's there. A good example or a missing fact almost always improves the answer. Remove the old and the rejected; add the relevant.

**Cutting has a cost.** Whatever isn't in the ten lines of status is lost. If you ask the AI to write the summary, read it before using it: it can easily leave out precisely what you rejected.

## Check you've got it

Three situations. Do you cut, carry on, or remove something?

1. You're 60 messages in and the AI suggests again a structure you rejected an hour ago.
2. You have fifteen tools connected and today you're only going to write an email.
3. You're 8 messages in and the answer is weak.

:::Show the answer
**1. Cut.** It's the textbook symptom. The status for the new conversation states, in writing, that the structure was rejected and why; otherwise it comes back.

**2. Remove.** The ones you won't use compete for attention in every request. Disconnecting them for today costs nothing.

**3. Carry on, and change the request.** Eight messages saturate nothing. What's missing is useful context: an example of what you want, the fact the AI doesn't have, who it's for.
:::

## What to do this week

Next time you catch yourself repeating an instruction, don't insist. Open a new conversation with ten lines of status: what you're doing, what you've decided, what you've rejected and what's left. See whether the first answer is already better than the last three in the old conversation.
$md$
where tool_id is null and lang = 'en'
  and lesson_id = (select id from lessons where slug = 'fr-contexto');
