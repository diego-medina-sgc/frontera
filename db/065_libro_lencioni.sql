-- ============================================================
-- 065 · Noveno libro: The Five Dysfunctions of a Team (Lencioni)
-- ============================================================
-- `node jobs/libros.mjs` (24/11): el tema con pulgar arriba y menos
-- libros es "equipos" (1 libro). Este es el clásico del tema y no se
-- pisa con Sinek, que pone el peso en la seguridad que da quien
-- dirige; Lencioni lo pone en lo que se deben los pares entre sí.
--
-- Datos verificados en Open Library el 24/11:
--   · obra OL1835386W, primera edición 2002, Patrick Lencioni;
--   · hay edición en castellano: "Las cinco disfunciones de un equipo"
--     (Empresa Activa / Ediciones Urano), así que va en title_es;
--   · tapa 10863273, la roja en inglés (mirada antes de usarla).
--
-- Las ideas del libro, no el libro: síntesis propia con atribución,
-- ninguna frase del texto. De la fábula sólo se nombra a la
-- protagonista y a la empresa. Lo que el libro NO prueba (es un modelo
-- de consultor, no una investigación) se dice en la pieza que lo cruza
-- con el resto de la biblioteca.
--
-- Cinco piezas por idioma, con la estructura aprobada el 22/11:
--   no_lei 1-3 · hace_tiempo 1 · fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'five-dysfunctions',
  'The Five Dysfunctions of a Team',
  'Patrick Lencioni',
  2002,
  array['equipos', 'liderazgo'],
  'Las cinco disfunciones de un equipo',
  10863273,
  array[
    'equipo','equipos','reunión','reuniones','discusión','discusiones','conflicto',
    'acuerdos','decidimos','compromiso','coordino','coordinar','a cargo','jefe','jefa',
    'objetivos','metas','resultados','team','meetings'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'La base de la pirámide: decir "no sé"',
$md$
Lencioni escribió este libro como una fábula: Kathryn, recién llegada a dirigir una empresa de tecnología llamada DecisionTech, se encuentra con un equipo directivo de gente muy capaz que no funciona como equipo. La historia sirve para presentar un modelo, y el modelo es lo que vale la pena llevarse.

Son **cinco disfunciones apiladas como una pirámide**, y cada una se apoya en la de abajo:

1. **Falta de confianza.**
2. **Miedo al conflicto.**
3. **Falta de compromiso.**
4. **Evitar pedir cuentas.**
5. **No mirar los resultados.**

La idea de esta pieza es la de la base, porque sin ella no se arregla ninguna de arriba: **la confianza que importa en un equipo no es la de "sé que vas a cumplir". Es la de poder decir "me equivoqué", "no sé" o "necesito ayuda" sin que te cueste.** Lencioni la llama confianza basada en la vulnerabilidad.

La otra, la de saber que el otro cumple, se construye con el tiempo y está bien. Pero se puede tener mucha de esa y nada de esta: un equipo donde todos son confiables y nadie admite que algo le sale mal.

## Un caso trabajado

Un equipo de admisiones de siete personas se reúne todos los lunes. Durante un mes, quien coordina cuenta dos cosas en cada reunión:

- **Cuántas veces alguien dijo** "me equivoqué", "no sé cómo hacer esto" o "me vendría bien una mano".
- **Cuántos problemas aparecieron después**, en el pasillo o por mensaje, que ya existían el lunes y nadie mencionó.

Resultado del mes: **una** vez lo primero, **seis** veces lo segundo.

Seis problemas que estaban en la mesa y no se dijeron. Cada uno se trabajó más tarde, con menos tiempo y a veces con alguien que ya había avanzado sobre algo mal. La cuenta que importa no es "cuánto confiamos": es esa proporción, uno contra seis. Mientras sea así, discutir mejor, comprometerse más o medir resultados no tiene sobre qué apoyarse.

## Dónde no aplica

**No es contar intimidades.** Vulnerabilidad en este sentido es sobre el trabajo: lo que no sabés hacer, el error que cometiste, la ayuda que necesitás. No hace falta hablar de la vida personal para que un equipo funcione.

**Empieza por quien coordina, o no empieza.** Si quien dirige nunca dice "me equivoqué", el resto aprende que decirlo cuesta. Es la parte más incómoda del libro y la más difícil de delegar.

**No es para cualquier grupo.** Lencioni escribe sobre un equipo de verdad: pocas personas que comparten un resultado. Un grupo grande donde cada uno hace lo suyo no necesita este nivel de confianza, ni puede tenerlo.

## Probá que lo entendiste

¿Cuál de estas tres situaciones muestra la confianza de la que habla Lencioni?

1. Todos saben que, si alguien dice que algo va a estar el viernes, va a estar el viernes.
2. En la reunión, alguien dice que el informe que presentó la semana pasada tenía un error y explica cuál.
3. El equipo se lleva muy bien y comparte almuerzos todos los viernes.

:::Ver la respuesta
**La 2.** Es exactamente la confianza basada en la vulnerabilidad: admitir un error propio delante de los pares, sin que cueste.

**La 1** es la otra confianza, la de saber que el otro cumple. Es valiosa, pero un equipo puede tenerla entera y seguir escondiendo los problemas.

**La 3** es buena relación. Ayuda, pero no es lo mismo: hay equipos que se llevan muy bien justamente porque nadie dice nada incómodo. Eso Lencioni lo llama armonía artificial, y es la pieza que sigue.
:::

## Qué hacer esta semana

En la próxima reunión de tu equipo, contá las dos cosas del caso: cuántas veces alguien admitió un error o pidió ayuda, y cuántos problemas aparecen después que ya estaban en la mesa.

Y si coordinás vos, empezá por la primera: decí en esa reunión una cosa concreta que te salió mal esta semana y qué aprendiste. Es lo que habilita al resto.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'La reunión donde nadie discute',
$md$
El segundo y el tercer escalón de Lencioni van juntos, y se entienden mejor con una escena conocida: una reunión donde se toma una decisión, nadie objeta nada, todos asienten, y una semana después resulta que la mitad no la aplicó.

La idea: **sin discusión de verdad no hay compromiso de verdad.** Si nadie pudo decir que no estaba de acuerdo, el "sí" de la reunión vale poco. Lencioni llama **armonía artificial** a ese clima donde se evita el conflicto para que no haya tensión, y es el que fabrica las decisiones que nadie cumple.

Dos aclaraciones que hace el libro y que cambian todo:

- **El conflicto que importa es de ideas, no de personas.** Discutir con fuerza sobre qué hacer, no sobre quién tiene la culpa.
- **Comprometerse no es estar de acuerdo.** No hace falta consenso. Hace falta que cada uno haya sido escuchado de verdad y que la decisión quede clara. Con eso, alguien que perdió la discusión puede apoyar la decisión igual.

## Un caso trabajado

El equipo de admisiones decide en la reunión del lunes mover la jornada de puertas abiertas del sábado 8 al sábado 15. Nadie objeta. Hay siete áreas que tienen que avisar algo: la web, las redes, los mails a familias, la recepción, los docentes que participan, el transporte y la persona que coordina las visitas.

El viernes se descubre que **tres de las siete** siguieron con la fecha vieja. Una no estaba de acuerdo con mover la jornada y no lo dijo. Otra entendió que era una propuesta, no una decisión. La tercera no sabía que le tocaba avisar.

Tres de siete: casi la mitad de los canales comunicó mal. Corregirlo lleva el resto de la semana y unas cuantas familias confundidas.

Lencioni propone una herramienta simple para esto: **en los últimos minutos de cada reunión**, repasar en voz alta qué se decidió exactamente y qué le comunica cada uno a quién. En este caso habrían sido cinco minutos contra una semana de correcciones. Y en esos cinco minutos aparecen las tres cosas del caso: el desacuerdo que no se dijo, la decisión que no estaba clara y la tarea que no tenía dueño.

## Dónde no aplica

**Discutir no es pelear por todo.** Si cada decisión chica se discute como si fuera la última, el equipo se agota. El conflicto vale para lo que importa; para lo menor, alcanza con que alguien decida.

**Sin la base, esto se vuelve peligroso.** Pedirle a un equipo que discuta fuerte cuando no hay confianza produce lo contrario: ataques personales o más silencio. Por eso está arriba de la confianza en la pirámide.

**Compromiso no es unanimidad, pero tampoco es imposición.** Si quien coordina decide sin escuchar, nadie se compromete aunque haya fecha y responsable. Lo que habilita el compromiso es haber sido escuchado, no haber ganado.

## Probá que lo entendiste

Tres reuniones distintas. ¿En cuál hay más chances de que la decisión se cumpla?

1. Se decide en diez minutos, sin objeciones, y todos se van rápido.
2. Hay una discusión fuerte sobre la fecha, gana una postura, y al final se repasa qué se decidió y quién avisa a quién.
3. Como no hay acuerdo, se deja la decisión para la reunión siguiente, para que todos estén conformes.

:::Ver la respuesta
**La 2.** Hubo conflicto de ideas, la decisión quedó clara y se repasó quién hace qué. Los que perdieron la discusión fueron escuchados, y eso les permite apoyarla.

**La 1** es la armonía artificial del caso: la falta de objeciones no dice que estén de acuerdo, dice que nadie habló. Es la que fabrica los tres de siete.

**La 3** confunde compromiso con consenso. Esperar a que todos estén conformes suele terminar en no decidir, que también es una decisión, y la peor.
:::

## Qué hacer esta semana

En tu próxima reunión, reservá los últimos cinco minutos y preguntá en voz alta: **qué decidimos exactamente, y qué le dice cada uno a quién.**

Si en esos cinco minutos aparece un "ah, pero yo no estaba de acuerdo", no es un problema: es la discusión que faltaba, llegando a tiempo.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Cuando todas las áreas cumplen y el equipo pierde',
$md$
Los dos escalones de arriba de la pirámide son los que más incomodan, porque tocan lo que cada uno hace bien.

**Pedir cuentas entre pares.** La idea de Lencioni es que en un buen equipo la presión para cumplir **no viene sólo de quien coordina: viene de los compañeros.** Cuando alguien no hace lo que dijo, quien se lo dice primero es un par, no el jefe. Si el único que pide cuentas es quien dirige, el equipo depende de una sola persona para sostener el nivel, y el nivel baja.

**Mirar los resultados del equipo.** El escalón más alto: que cada uno ponga el resultado común por encima del de su área o del propio lucimiento. Lencioni dice que la tentación de mirar lo propio (el estatus, el área, el reconocimiento) es la que más equipos rompe, y que la única defensa es un resultado común, claro y a la vista.

## Un caso trabajado

El equipo de admisiones tiene metas por área para el trimestre:

- Consultas: contestar el 95% en el día. **Cumplido: 96%.**
- Visitas: 120 familias. **Cumplido: 124.**
- Comunicación: dos campañas. **Cumplido: dos.**

Todas las áreas cumplieron. La meta del colegio, que era la razón de todo lo anterior, era **120 inscripciones**. Llegaron **104**.

Cada área puede mostrar su número en verde. El equipo perdió.

Lo que mira el libro es cómo pasa esto: cada área optimizó lo suyo (contestar rápido, aunque a medias; llenar las visitas, aunque fueran de familias que no iban a inscribir) y nadie miraba el número que importaba, porque no era de nadie en particular.

El arreglo que propone Lencioni no es una meta más. Es **un resultado común publicado**, a la vista de todos, que se revisa en cada reunión antes que las metas de cada área. Y que las conversaciones de "esto no está funcionando" puedan darse entre pares: que quien coordina visitas le pueda decir a quien contesta consultas que las visitas vienen mal calificadas.

## Dónde no aplica

**Pedir cuentas entre pares sin confianza es acusar.** Si la base no está, que un compañero señale lo que no se hizo se vive como ataque, y el equipo se rompe más. Por eso este escalón está tan arriba.

**Las metas por área no están mal.** Hacen falta. El problema es cuando reemplazan al resultado común en vez de servirle. Si el número del equipo no se mira primero, las metas de cada área se cumplen solas y no alcanzan.

**No todo resultado común es de este equipo.** Si las inscripciones dependen sobre todo de algo que el equipo no controla (un cambio de aranceles, una mudanza del colegio), pedirle cuentas por ese número es injusto. El resultado común tiene que ser uno que el equipo pueda mover.

## Probá que lo entendiste

¿Qué hace un equipo que pasó los cinco escalones cuando, a mitad del trimestre, las inscripciones vienen por debajo de la meta?

1. Cada área revisa si está cumpliendo la suya, y como todas cumplen, siguen igual.
2. Quien coordina habla con cada persona por separado para ver qué puede mejorar.
3. En la reunión, el número de inscripciones va primero, y un par le dice a otro: "las visitas que me llegan no están listas para inscribir; revisemos cómo las calificás".

:::Ver la respuesta
**La 3.** El resultado común va primero y la presión viene de un par, no del jefe. Además, es conflicto de ideas sobre el trabajo, no sobre la persona.

**La 1** es la desatención a los resultados del caso: cada área en verde y el equipo perdiendo.

**La 2** no está mal, pero deja todo el peso en quien coordina. Funciona mientras esa persona tenga tiempo para seis conversaciones por semana; Lencioni diría que el equipo todavía no se hace cargo de sí mismo.
:::

## Qué hacer esta semana

Escribí en una línea **el resultado común de tu equipo**: el número que importa más que el de cada área. Si no te sale, ese es el problema.

Si te sale, ponelo primero en la próxima reunión, antes de que cada área cuente lo suyo.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer nada: reconstruí. Cinco preguntas sobre el libro. Respondelas de memoria, aunque sea a medias, y recién después abrí cada respuesta. Es incómodo, y es lo que hace que algo quede.

**1. ¿Cuáles son las cinco disfunciones, de abajo hacia arriba?**

:::Ver la respuesta
Falta de **confianza**, miedo al **conflicto**, falta de **compromiso**, evitar **pedir cuentas** y no mirar los **resultados**. El orden importa: cada una se apoya en la de abajo. Si te salieron las cinco pero en otro orden, lo que se te borró es justamente la idea de pirámide.
:::

**2. ¿De qué confianza habla Lencioni?**

:::Ver la respuesta
De la que se basa en la **vulnerabilidad**: poder decir "me equivoqué", "no sé" o "necesito ayuda" delante de los pares sin que cueste. No la de saber que el otro va a cumplir, que es otra cosa y se construye con el tiempo.
:::

**3. ¿Cómo se llama el clima donde nadie discute para que no haya tensión, y qué produce?**

:::Ver la respuesta
**Armonía artificial.** Produce decisiones que nadie objeta en la reunión y que después no se cumplen, porque el desacuerdo no desapareció: se fue al pasillo.
:::

**4. ¿Hace falta consenso para que un equipo se comprometa con una decisión?**

:::Ver la respuesta
**No.** Hace falta que cada uno haya sido escuchado y que la decisión quede clara. Con eso, quien perdió la discusión puede apoyarla. Esperar a que todos estén de acuerdo suele terminar en no decidir.
:::

**5. En un buen equipo, ¿quién le pide cuentas a quien no cumplió?**

:::Ver la respuesta
**Un par**, antes que el jefe. Si el único que pide cuentas es quien coordina, el nivel del equipo depende de una persona. Y por encima de todo, un resultado común a la vista, que va primero que el de cada área.
:::

## Lo que suele borrarse

Si tuviste que abrir casi todas, lo más probable es que te haya quedado la idea general ("los equipos necesitan confianza") y se haya borrado lo que la hace útil: **el orden**. La pirámide dice algo concreto: no sirve pedirle a un equipo que discuta mejor si no confía, ni que se comprometa si no discute.

## Un caso para aplicarlo

Un equipo tiene metas claras y una revisión quincenal, pero las decisiones de las reuniones se cumplen a medias y nadie se lo dice a nadie. ¿Qué escalón arreglarías primero?

:::Ver la respuesta
**El conflicto, y probablemente la confianza que está debajo.** Las metas y la revisión son herramientas del cuarto escalón, pero se apoyan en decisiones que no se discutieron de verdad. Antes de exigir más, conviene preguntar en la próxima reunión quién no estaba de acuerdo con la última decisión. Si nadie contesta, el problema es todavía más abajo.
:::

## Qué hacer esta semana

Elegí la disfunción que más reconocés en tu equipo y fijate en qué escalón está. Después mirá el de abajo: casi siempre es ahí donde hay que empezar.
$md$,
  7
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Lencioni contra Grove y Sinek',
$md$
Si tenés fresco a Lencioni, lo más útil es cruzarlo con los otros dos libros de la biblioteca que hablan de equipos. Dicen cosas parecidas con el peso puesto en lugares distintos, y ahí está lo interesante.

**Sinek** (*Leaders Eat Last*): el trabajo de quien dirige es dar seguridad, para que la gente deje de cuidarse y coopere.

**Grove** (*High Output Management*): discusión abierta, decisión clara y apoyo de todos después, incluso de los que perdieron.

**Lencioni**: confianza entre pares, conflicto de ideas, compromiso sin consenso, cuentas entre pares y un resultado común.

Antes de seguir, una prueba. Sin releer: **¿qué escalón de la pirámide de Lencioni ya estaba en Grove, casi veinte años antes?**

:::Ver la respuesta
**El conflicto y el compromiso.** La regla de Grove, discusión abierta antes, decisión clara y apoyo después, es casi exactamente el segundo y el tercer escalón. Lo que Lencioni agrega es por qué esa discusión no ocurre (falta la confianza de abajo) y qué viene después (las cuentas entre pares y el resultado común).
:::

## Dónde no coinciden

**Sinek pone la confianza arriba; Lencioni, entre pares.** En Sinek la seguridad la da quien dirige, que protege al equipo. En Lencioni la confianza es horizontal: la que se tienen los compañeros entre sí. Las dos hacen falta, pero no son la misma. Un jefe protector con un equipo donde nadie admite un error ante los otros tiene la de Sinek y no la de Lencioni.

**Grove y Lencioni no coinciden en quién pide cuentas.** Grove pone ese trabajo en quien supervisa, con indicadores y uno a uno. Lencioni lo quiere sobre todo entre pares. En un equipo chico de gente madura, Lencioni; con alguien nuevo en una tarea que todavía no domina, Grove.

## Lo que el libro no prueba

Conviene decirlo: la pirámide es **un modelo de consultor, no el resultado de una investigación**. El orden de los escalones es una propuesta razonable, no algo medido. Y el libro recomienda perfiles de personalidad (Myers-Briggs entre ellos) cuya base científica es discutida.

Donde sí hay evidencia es en la base. Amy Edmondson estudió equipos de hospital y encontró que los que tenían mejor clima **reportaban más errores**: no porque cometieran más, sino porque los decían. Es lo más cerca que hay de una prueba de que el primer escalón importa, y llegó por otro camino.

## Una situación para decidir

Coordinás un equipo de seis. Las reuniones son tranquilas, nadie discute, y las decisiones se cumplen a medias. Te proponen dos cosas: (a) un tablero con metas por persona y revisión semanal, o (b) que vos empieces cada reunión contando algo que te salió mal. ¿Cuál primero, según cada autor?

:::Ver la respuesta
**Lencioni: la (b).** El problema está abajo de la pirámide. Un tablero sin confianza ni discusión produce números en verde y el mismo silencio.

**Grove: probablemente la (a)**, pero con la condición que él mismo pone: que la discusión antes de decidir sea de verdad abierta. Sin eso, también Grove diría que el tablero mide teatro.

**Sinek: la (b)**, pero leída como protección: el que dirige se expone primero para que el resto sepa que no se paga.

La conclusión práctica: los tres ordenan igual. Primero que se pueda decir algo incómodo; después, medir.
:::

## Qué hacer esta semana

Elegí cuál de los tres libros describe mejor lo que le falta hoy a tu equipo, y escribí en una línea por qué no son los otros dos. Esa línea suele decir más del equipo que del libro.
$md$,
  8
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'The base of the pyramid: saying "I don''t know"',
$md$
Lencioni wrote this book as a fable: Kathryn, newly arrived to run a technology company called DecisionTech, finds an executive team of very capable people who don't work as a team. The story is there to present a model, and the model is what's worth taking away.

There are **five dysfunctions stacked like a pyramid**, each resting on the one below:

1. **Absence of trust.**
2. **Fear of conflict.**
3. **Lack of commitment.**
4. **Avoidance of accountability.**
5. **Inattention to results.**

This piece is about the base, because without it none of the upper levels can be fixed: **the trust that matters in a team isn't "I know you'll deliver". It's being able to say "I got it wrong", "I don't know" or "I need help" without it costing you.** Lencioni calls it vulnerability-based trust.

The other kind, knowing the other person delivers, is built over time and is fine. But you can have plenty of that and none of this: a team where everyone is reliable and nobody admits that something isn't going well.

## A worked case

An admissions team of seven meets every Monday. For a month, whoever chairs counts two things at each meeting:

- **How many times someone said** "I got that wrong", "I don't know how to do this" or "I could use a hand".
- **How many problems surfaced afterwards**, in the corridor or by message, that already existed on Monday and nobody mentioned.

The month's result: the first, **once**; the second, **six times**.

Six problems that were on the table and weren't said. Each was dealt with later, with less time and sometimes with someone who had already pressed ahead on something wrong. The figure that matters isn't "how much we trust each other": it's that ratio, one against six. While it stays like that, arguing better, committing more or tracking results has nothing to rest on.

## Where it doesn't apply

**It isn't sharing private matters.** Vulnerability in this sense is about the work: what you don't know how to do, the mistake you made, the help you need. A team doesn't need to talk about personal lives to work.

**It starts with whoever leads, or it doesn't start.** If the person in charge never says "I got it wrong", everyone else learns that saying it costs something. It's the most uncomfortable part of the book and the hardest to delegate.

**It isn't for every group.** Lencioni writes about a real team: a few people sharing one result. A large group where everyone does their own thing neither needs this level of trust nor can have it.

## Check you've got it

Which of these three situations shows the trust Lencioni means?

1. Everyone knows that if someone says something will be ready on Friday, it will be ready on Friday.
2. In the meeting, someone says the report they presented last week had a mistake and explains what it was.
3. The team gets on very well and has lunch together every Friday.

:::Show the answer
**Number 2.** It's exactly vulnerability-based trust: admitting your own mistake in front of your peers, without it costing you.

**Number 1** is the other kind of trust, knowing the other person delivers. It's valuable, but a team can have all of it and still hide its problems.

**Number 3** is a good relationship. It helps, but it isn't the same: some teams get on very well precisely because nobody says anything uncomfortable. Lencioni calls that artificial harmony, and it's the next piece.
:::

## What to do this week

At your team's next meeting, count the two things from the case: how many times someone admitted a mistake or asked for help, and how many problems surface afterwards that were already on the table.

And if you chair it, start with the first: say one concrete thing that went wrong for you this week and what you learned. It's what makes it possible for everyone else.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'The meeting where nobody argues',
$md$
Lencioni's second and third levels go together, and they're easiest to understand through a familiar scene: a meeting where a decision is taken, nobody objects, everyone nods, and a week later it turns out half of them didn't act on it.

The idea: **without real debate there's no real commitment.** If nobody could say they disagreed, the meeting's "yes" is worth little. Lencioni calls that climate, where conflict is avoided so there's no tension, **artificial harmony**, and it's what produces the decisions nobody carries out.

Two clarifications the book makes that change everything:

- **The conflict that matters is about ideas, not people.** Arguing hard about what to do, not about whose fault it is.
- **Committing isn't agreeing.** Consensus isn't needed. What's needed is that everyone has genuinely been heard and that the decision is clear. With that, someone who lost the argument can still back the decision.

## A worked case

At Monday's meeting, the admissions team decides to move the open day from Saturday the 8th to Saturday the 15th. Nobody objects. Seven areas have something to announce: the website, social media, emails to families, reception, the teachers taking part, transport, and the person who coordinates visits.

On Friday it emerges that **three of the seven** kept the old date. One didn't agree with moving the open day and didn't say so. Another understood it as a proposal, not a decision. The third didn't know it was their job to announce it.

Three of seven: nearly half the channels got it wrong. Fixing it takes the rest of the week and leaves quite a few families confused.

Lencioni proposes a simple tool for this: **in the last few minutes of every meeting**, go through out loud exactly what was decided and what each person will communicate to whom. In this case it would have been five minutes against a week of corrections.

## Where it doesn't apply

**Debating isn't fighting over everything.** If every small decision is argued as if it were the last, the team wears out. Conflict is worth it for what matters; for minor things, it's enough for someone to decide.

**Without the base, this becomes dangerous.** Asking a team to argue hard when there's no trust produces the opposite: personal attacks or more silence. That's why it sits above trust in the pyramid.

**Commitment isn't unanimity, but it isn't imposition either.** If whoever leads decides without listening, nobody commits even with a date and an owner. What makes commitment possible is having been heard, not having won.

## Check you've got it

Three different meetings. In which is the decision most likely to be carried out?

1. It's decided in ten minutes, without objections, and everyone leaves quickly.
2. There's a heated debate about the date, one position wins, and at the end they go through what was decided and who tells whom.
3. As there's no agreement, the decision is left for the next meeting, so that everyone's happy.

:::Show the answer
**Number 2.** There was conflict over ideas, the decision was clear, and they went through who does what. Those who lost the argument were heard, and that lets them back it.

**Number 1** is the artificial harmony of the case: no objections doesn't mean they agree, it means nobody spoke. It's what produces the three out of seven.

**Number 3** confuses commitment with consensus. Waiting until everyone's happy usually ends in not deciding, which is also a decision, and the worst one.
:::

## What to do this week

At your next meeting, keep the last five minutes and ask out loud: **what exactly did we decide, and what will each of us tell whom.**

If an "oh, but I didn't agree" comes up in those five minutes, that's not a problem: it's the missing debate, arriving in time.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'When every area hits its target and the team loses',
$md$
The two top levels of the pyramid are the most uncomfortable, because they touch what each person does well.

**Accountability between peers.** Lencioni's idea is that in a good team the pressure to deliver **doesn't come only from whoever leads: it comes from colleagues.** When someone doesn't do what they said, the first to tell them is a peer, not the boss. If the only person holding others to account is the leader, the team depends on one person to keep standards up, and standards drop.

**Attention to the team's results.** The top level: everyone putting the shared result above their own area's or their own standing. Lencioni says the pull towards what's yours (status, your area, recognition) is what breaks most teams, and that the only defence is a shared result, clear and visible.

## A worked case

The admissions team has targets by area for the term:

- Enquiries: answer 95% the same day. **Achieved: 96%.**
- Visits: 120 families. **Achieved: 124.**
- Communications: two campaigns. **Achieved: two.**

Every area hit its target. The school's target, which was the reason for all of the above, was **120 admissions**. It got **104**.

Every area can show its figure in green. The team lost.

What the book looks at is how this happens: each area optimised its own part (answering fast, even if only halfway; filling visits, even with families who weren't going to enrol) and nobody was watching the figure that mattered, because it belonged to nobody in particular.

The fix Lencioni proposes isn't one more target. It's **a shared result, made public**, visible to everyone, reviewed at every meeting before each area's targets. And that "this isn't working" conversations can happen between peers: that whoever coordinates visits can tell whoever answers enquiries that the visits are coming through poorly qualified.

## Where it doesn't apply

**Peer accountability without trust is accusation.** If the base isn't there, a colleague pointing out what wasn't done is felt as an attack, and the team breaks further. That's why this level sits so high.

**Targets by area aren't wrong.** They're needed. The problem is when they replace the shared result instead of serving it. If the team's figure isn't looked at first, each area's targets get met on their own and still fall short.

**Not every shared result belongs to this team.** If admissions depend mainly on something the team doesn't control (a change in fees, the school moving site), holding it to account for that figure is unfair. The shared result has to be one the team can move.

## Check you've got it

What does a team that has climbed all five levels do when, halfway through the term, admissions are below target?

1. Each area checks whether it's meeting its own target, and since they all are, they carry on.
2. Whoever leads talks to each person separately to see what they can improve.
3. At the meeting, the admissions figure comes first, and one peer tells another: "the visits reaching me aren't ready to enrol; let's look at how you're qualifying them".

:::Show the answer
**Number 3.** The shared result comes first and the pressure comes from a peer, not the boss. And it's conflict over ideas about the work, not about the person.

**Number 1** is the inattention to results from the case: every area green and the team losing.

**Number 2** isn't wrong, but it puts all the weight on whoever leads. It works while that person has time for six conversations a week; Lencioni would say the team isn't yet taking responsibility for itself.
:::

## What to do this week

Write down in one line **your team's shared result**: the figure that matters more than any area's. If you can't, that's the problem.

If you can, put it first at the next meeting, before each area reports on its own.
$md$,
  9
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading anything: reconstruct. Five questions about the book. Answer them from memory, even partly, and only then open each answer. It's uncomfortable, and it's what makes things stick.

**1. What are the five dysfunctions, from the bottom up?**

:::Show the answer
Absence of **trust**, fear of **conflict**, lack of **commitment**, avoidance of **accountability** and inattention to **results**. The order matters: each rests on the one below. If you got all five but in a different order, what you've forgotten is precisely the idea of a pyramid.
:::

**2. What kind of trust does Lencioni mean?**

:::Show the answer
The kind based on **vulnerability**: being able to say "I got it wrong", "I don't know" or "I need help" in front of your peers without it costing you. Not knowing that the other person will deliver, which is something else and is built over time.
:::

**3. What is the climate called where nobody argues so there's no tension, and what does it produce?**

:::Show the answer
**Artificial harmony.** It produces decisions nobody objects to in the meeting and that aren't carried out afterwards, because the disagreement didn't disappear: it went to the corridor.
:::

**4. Does a team need consensus to commit to a decision?**

:::Show the answer
**No.** What's needed is that everyone has been heard and the decision is clear. With that, whoever lost the argument can back it. Waiting until everyone agrees usually ends in not deciding.
:::

**5. In a good team, who holds to account someone who didn't deliver?**

:::Show the answer
**A peer**, before the boss. If the only person holding others to account is the leader, the team's standards depend on one person. And above everything, a shared result in plain view, which comes before each area's.
:::

## What usually gets forgotten

If you had to open almost all of them, most likely you kept the general idea ("teams need trust") and lost what makes it useful: **the order**. The pyramid says something concrete: there's no point asking a team to argue better if it doesn't trust, or to commit if it doesn't argue.

## A case to apply it to

A team has clear targets and a fortnightly review, but meeting decisions are carried out halfway and nobody says so to anyone. Which level would you fix first?

:::Show the answer
**Conflict, and probably the trust beneath it.** Targets and reviews are tools of the fourth level, but they rest on decisions that weren't genuinely debated. Before demanding more, it's worth asking at the next meeting who didn't agree with the last decision. If nobody answers, the problem is lower still.
:::

## What to do this week

Pick the dysfunction you recognise most in your team and see which level it sits on. Then look at the one below: that's almost always where to start.
$md$,
  7
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Lencioni against Grove and Sinek',
$md$
If Lencioni is fresh in your mind, the most useful thing is to cross it with the other two books in the library about teams. They say similar things with the weight in different places, and that's where it gets interesting.

**Sinek** (*Leaders Eat Last*): the leader's job is to provide safety, so people stop protecting themselves and cooperate.

**Grove** (*High Output Management*): open debate, a clear decision and everyone's support afterwards, including those who lost.

**Lencioni**: trust between peers, conflict over ideas, commitment without consensus, accountability between peers and a shared result.

Before going on, a test. Without rereading: **which level of Lencioni's pyramid was already in Grove, almost twenty years earlier?**

:::Show the answer
**Conflict and commitment.** Grove's rule, open debate beforehand, a clear decision and support afterwards, is almost exactly the second and third levels. What Lencioni adds is why that debate doesn't happen (the trust underneath is missing) and what comes next (accountability between peers and the shared result).
:::

## Where they don't agree

**Sinek puts trust at the top; Lencioni, between peers.** In Sinek, safety is provided by whoever leads, who protects the team. In Lencioni, trust is horizontal: what colleagues have with each other. Both are needed, but they aren't the same. A protective boss with a team where nobody admits a mistake to the others has Sinek's kind and not Lencioni's.

**Grove and Lencioni disagree about who holds people to account.** Grove puts that work on whoever supervises, with indicators and one-to-ones. Lencioni wants it mainly between peers. In a small team of experienced people, Lencioni; with someone new to a task they haven't yet mastered, Grove.

## What the book doesn't prove

It's worth saying: the pyramid is **a consultant's model, not the result of research**. The order of the levels is a reasonable proposal, not something measured. And the book recommends personality profiles (Myers-Briggs among them) whose scientific basis is disputed.

Where there is evidence is at the base. Amy Edmondson studied hospital teams and found that those with a better climate **reported more errors**: not because they made more, but because they said so. It's the closest thing there is to proof that the first level matters, and it came by another route.

## A situation to decide

You lead a team of six. Meetings are calm, nobody argues, and decisions are carried out halfway. Two things are proposed to you: (a) a board with individual targets and a weekly review, or (b) that you start each meeting by telling something that went wrong for you. Which first, according to each author?

:::Show the answer
**Lencioni: (b).** The problem is at the bottom of the pyramid. A board without trust or debate produces green figures and the same silence.

**Grove: probably (a)**, but with the condition he himself sets: that the debate before deciding is genuinely open. Without that, Grove too would say the board measures theatre.

**Sinek: (b)**, but read as protection: whoever leads exposes themselves first so everyone knows it doesn't cost anything.

The practical conclusion: all three put things in the same order. First, that something uncomfortable can be said; then, measure.
:::

## What to do this week

Pick which of the three books best describes what your team is missing today, and write one line on why it isn't the other two. That line usually says more about the team than about the book.
$md$,
  8
from books b where b.slug = 'five-dysfunctions'
on conflict do nothing;
