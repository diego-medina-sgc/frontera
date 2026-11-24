-- ============================================================
-- Frontera - el primer arco: el mail que escribis quince veces
-- ============================================================
-- Un arco es una tarea real del trabajo contada en cinco dias, uno
-- por dia, que termina con algo armado y guardado. No ensena un
-- concepto suelto: ensena a sacarse de encima una tarea, y el
-- concepto aparece adentro.
--
-- Por que existe: el contenido estaba ordenado por conceptos
-- (contexto, como pedir, limites) y la gente no piensa su trabajo
-- asi. Piensa "el mail de siempre", "el informe del lunes".
--
-- Reglas del arco (viven en app.js, elegirArco):
--   - Un arco empezado va primero en Hoy, despues del compromiso y del
--     repaso. Un dia por vez: el siguiente aparece al dia siguiente.
--   - Si pasan diez dias sin tocarlo, se cierra solo y no deja nada
--     pendiente. Nada se acumula.
--   - El dia 1 se ofrece a los niveles 0 a 2. Un nivel 3 ya hace esto.
--
-- Cada dia sigue la estructura aprobada: la idea, el caso trabajado,
-- el borde, la recuperacion con la respuesta escondida y que hacer hoy.
-- ============================================================

alter table lessons drop constraint if exists lessons_kind_check;
alter table lessons add constraint lessons_kind_check
  check (kind in ('fundamento', 'radar', 'libro', 'frontera', 'arco'));

alter table lessons add column if not exists arc text;
alter table lessons add column if not exists arc_day smallint check (arc_day between 1 and 10);

-- Un dia por arco, sin repetidos.
create unique index if not exists lessons_arco_dia on lessons (arc, arc_day) where arc is not null;

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, track_order, published, arc, arc_day)
select v.slug, t.id, 'arco', 0, 2, null, true, 'mail-repetido', v.dia
from (values
  ('a1-mail-repetido-1', 'como-pedir', 1),
  ('a1-mail-repetido-2', 'como-pedir', 2),
  ('a1-mail-repetido-3', 'contexto',   3),
  ('a1-mail-repetido-4', 'limites',    4),
  ('a1-mail-repetido-5', 'contexto',   5)
) as v(slug, topico, dia)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- Dia 1
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Encontrá el mail que escribís siempre',
  'Hay un mail que escribís todas las semanas casi igual. Esta semana lo dejás armado para no volver a escribirlo de cero. Hoy, el primer paso: encontrarlo y medirlo.',
$md$
Todos tenemos uno. La respuesta a quien pide información, el recordatorio de un vencimiento, la confirmación de una entrevista, el aviso de que algo se demora. Lo escribís de nuevo cada vez, un poco distinto, y cada vez te lleva cinco o diez minutos que no se notan porque están repartidos en la semana.

Esta semana vas a hacer una sola cosa, un día por vez: dejar ese mail armado para que la próxima vez te lleve uno o dos minutos. Al final vas a tener algo guardado en tu herramienta de IA que funciona solo con pegarle los datos del caso.

Hoy no se usa la IA. Hoy se elige bien, porque es lo que decide si el resto de la semana sirve.

## Un mail repetido tiene tres partes

Agarrá cualquier mail que mandes seguido y vas a encontrar tres cosas mezcladas:

1. **Lo fijo.** Lo que dice siempre lo mismo: el saludo, el horario de atención, el link al formulario, la firma, la frase de cierre.
2. **Los datos del caso.** Lo que cambia y se puede copiar de algún lado: el nombre, la fecha, el monto, el número de pedido, el curso.
3. **El criterio.** Lo que cambia y hay que pensar: si a esta persona le contestás más cálido porque ya reclamó dos veces, si le ofrecés una alternativa, qué le decís si pide algo que no se puede.

Un mail sirve para armar cuando **lo fijo y los datos son casi todo**, y el criterio es poco y se puede escribir como regla. Si el criterio es la mitad del mail, la IA te puede ayudar con un borrador, pero no te vas a ahorrar el pensar.

## Un caso trabajado

En un área de admisiones llegan unas quince consultas por semana de familias que preguntan por vacantes. La respuesta tiene siempre la misma forma: gracias por escribir, cómo es el proceso, qué fechas hay de visita, el link para anotarse y quién va a contactarlos.

Lo que cambia: el nombre de la familia, el año que les interesa y, a veces, si tienen un hermano en la escuela. Eso último es el único criterio: si hay un hermano, el mail lo menciona y explica que tienen prioridad.

La cuenta del tiempo:

- Cada respuesta lleva unos **seis minutos**, entre buscar el último mail parecido, copiarlo, cambiar los datos y releer.
- Quince por semana son **noventa minutos**.
- Si queda armado, cada una lleva un minuto y medio: pegar los datos, leer, mandar. Son **veintidós minutos**.

Son más de una hora por semana, todas las semanas, con un solo mail. Ese es el número que hay que tener anotado, porque el viernes lo vas a volver a medir.

## El borde: cuándo no conviene

No todo lo que se repite conviene armarlo:

- **Si casi todo es criterio.** Una respuesta a un reclamo serio, una mala noticia, algo con una persona enojada. Cada caso es distinto y lo que importa es lo que pensás vos. Ahí la IA ayuda a escribir mejor, pero no hay plantilla.
- **Si lo mandás dos veces por mes.** El esfuerzo de armarlo no se paga.
- **Si cada vez cambian las reglas.** Si el proceso cambia todos los meses, primero se ordena el proceso.

## Probá que lo entendiste

¿Cuál de estos tres mails conviene armar esta semana?

1. La confirmación de una entrevista, con día, hora y qué traer. Mandás diez por semana.
2. La respuesta a una familia que se queja porque no la llamaron. Llegan dos o tres por mes y cada una es distinta.
3. El recordatorio de un pago vencido, con el monto y la fecha límite. Mandás treinta por mes.

:::Ver la respuesta
**El 1 y el 3. Si hay que elegir uno, el 3**, que es más volumen. Los dos son casi todo fijo y datos, y el criterio es poco: en el recordatorio, por ejemplo, si es el primer aviso o el segundo.

El 2 no: es casi todo criterio, llega poco y cada caso es distinto. Para ese conviene la lección del mail difícil, no una plantilla.
:::

## Para hoy

1. Abrí tu carpeta de enviados y buscá el mail que más se repite. Una pista: buscá una frase que siempre escribís, como "gracias por tu consulta" o "te recuerdo que".
2. Contá cuántos mandaste en el último mes y estimá cuántos minutos te lleva cada uno. Anotá la cuenta: cantidad por minutos.
3. Elegí **tres** de esos mails que hayas mandado y que te gusten cómo quedaron. Copialos a una nota. **Sacales los nombres, mails y datos de otras personas** antes de pegarlos en cualquier herramienta: poné "Familia X" o "el alumno".

Mañana los vas a usar. Los tres ejemplos son la materia prima de todo lo que sigue.

## La regla que te llevás

**Armá lo que se repite, no lo que se parece.** Un mail que es casi todo fijo y datos se arma una vez. Uno que es casi todo criterio se piensa cada vez.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-1'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 2
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Tres ejemplos valen más que una explicación',
  'Ayer elegiste el mail y juntaste tres que te salieron bien. Hoy los usás: en vez de explicarle a la IA cómo escribís, se lo mostrás.',
$md$
Si le pedís a la IA "escribí un mail cálido pero profesional para una familia que pregunta por vacantes", te va a dar un mail cálido y profesional. El de cualquiera. Con "¡Esperamos que se encuentren muy bien!" y tres párrafos donde vos ponés uno.

El problema no es la herramienta. "Cálido pero profesional" quiere decir cosas distintas para cada persona, y ella no tiene forma de saber qué quiere decir para vos.

## Mostrar en vez de explicar

Hay una forma de pedir que casi nadie usa y que cambia el resultado más que cualquier adjetivo: **pegarle ejemplos de lo que ya escribiste bien** y pedirle uno nuevo igual.

Los ejemplos le dicen de una sola vez todo lo que costaría explicar: el largo, el tono, cómo saludás, qué ponés primero, cómo cerrás, qué no decís nunca. Ella copia el patrón mucho mejor de lo que sigue una descripción.

La forma del pedido es siempre la misma:

1. **Qué es.** "Estos son tres mails que mando a familias que preguntan por vacantes."
2. **Los ejemplos.** Los tres, uno debajo del otro, separados con una línea que diga "Ejemplo 1", "Ejemplo 2", "Ejemplo 3".
3. **El caso nuevo.** "Escribí uno igual para este caso:" y los datos.
4. **Una restricción.** "Mismo largo y mismo tono. No agregues nada que no esté en los ejemplos."

La última línea es más importante de lo que parece. Sin ella, la herramienta tiende a mejorar lo que no le pediste: agrega un párrafo, un saludo más largo, una oferta que vos no hacés.

## Un caso trabajado

El caso nuevo: la familia Fernández pregunta por vacantes para segundo grado y tiene una hija en quinto.

Con el pedido de adjetivos, la respuesta tenía 180 palabras, arrancaba con "¡Muchas gracias por su interés en nuestra comunidad educativa!" y no decía nada de la hermana, porque nadie le había dicho que eso importaba.

Con los tres ejemplos pegados, y uno de ellos era justamente de una familia con un hermano en la escuela, la respuesta tuvo 95 palabras, el saludo de siempre, la frase de la prioridad por hermano en el mismo lugar donde la ponés vos y el link correcto. Hubo que cambiar una sola palabra.

Fijate qué hizo la diferencia: **el ejemplo con hermano le enseñó la regla del hermano** sin que nadie la escribiera.

## El borde: cuándo los ejemplos fallan

- **Si los ejemplos se contradicen.** Si uno es formal y otro es muy suelto, la respuesta sale a mitad de camino y no se parece a ninguno. Elegí ejemplos que mandarías hoy igual.
- **Si los tres son del mismo caso.** Va a copiar ese caso aunque el nuevo sea distinto. Conviene que cubran las variantes que tenés: con hermano y sin hermano, primer aviso y segundo aviso.
- **Si copia datos de los ejemplos.** A veces se le pega un nombre o una fecha de un ejemplo. Por eso ayer sacaste los datos de las personas: así no hay nada real que se pueda colar, y además no le pasás datos de terceros a ninguna herramienta.

## Probá que lo entendiste

Tenés que armar el recordatorio de pago. ¿Cuál es el mejor juego de tres ejemplos?

1. Tres recordatorios de primer aviso, que son los que más mandás.
2. Un primer aviso, un segundo aviso y uno a alguien que tiene un plan de pagos.
3. El mejor recordatorio que escribiste y dos que salieron mal, para que vea la diferencia.

:::Ver la respuesta
**El 2.** Cubre las variantes reales que vas a tener, y cada ejemplo le enseña una regla distinta sin que la tengas que escribir.

El 1 le enseña bien un solo caso: cuando le pidas un segundo aviso, lo va a escribir como si fuera el primero. El 3 parece astuto, pero con ejemplos malos mezclados es muy probable que copie partes de los malos. Los ejemplos son lo que querés que haga, no lo que querés que evite.
:::

## Para hoy

1. Abrí tu herramienta de IA y armá el pedido con las cuatro partes: qué es, los tres ejemplos, el caso nuevo y la restricción.
2. Usá un caso real de los próximos que tengas que mandar.
3. Contá cuántas cosas tuviste que cambiar en lo que te devolvió, y **anotá cuáles**. No las cambies solamente: anotalas. Mañana esas correcciones se convierten en reglas.

## La regla que te llevás

**No le describas cómo escribís: mostrale.** Tres buenos ejemplos le enseñan más que cualquier adjetivo.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-2'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 3
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Armá la receta: lo fijo, las reglas y el hueco',
  'Ya sabés que con ejemplos sale bien. Hoy juntás todo en un solo texto que se usa siempre igual, así no tenés que volver a armar el pedido cada vez.',
$md$
Ayer el pedido funcionó, pero tiene un costo: cada vez que lo uses tenés que buscar los tres ejemplos, pegarlos, escribir la restricción y acordarte de qué cosas corregiste la última vez. Eso es exactamente el trabajo que querías sacarte de encima.

Hoy lo convertís en una **receta**: un texto que escribís una vez, que tiene todo lo que no cambia, y un hueco al final donde va lo único que cambia.

## Las cinco partes de una receta

1. **Para qué es.** Una o dos líneas: qué mail es, quién lo recibe y qué tiene que lograr. "Respuesta a familias que consultan por vacantes. Tiene que dejarlas con el próximo paso claro y con ganas de venir a la visita."
2. **Lo que va siempre.** Los datos fijos, escritos una vez: el link del formulario, los días de visita, el horario de atención, la firma. Así no los inventa ni los toma viejos de un ejemplo.
3. **Las reglas.** Lo que aprendiste ayer al corregir, escrito como regla. "Si tienen un hermano en la escuela, mencionarlo y decir que tienen prioridad." "Nunca confirmar una vacante: la confirma Admisiones por escrito."
4. **Los ejemplos.** Los tres de ayer, sin datos de personas.
5. **El hueco.** La última línea: "Datos de este caso:" y nada más. Ahí es donde cada vez pegás el nombre, el año y lo que corresponda.

El orden importa poco. Lo que importa es que **todo lo que hoy tenés en la cabeza quede escrito**, porque lo que no está escrito, la herramienta lo adivina.

## Un caso trabajado

Ayer, con el pedido de ejemplos, las correcciones fueron tres: puso el horario de atención viejo, que estaba en un ejemplo de hace meses; usó "estimada familia", que nunca usás; y ofreció una visita "en el día y horario que les quede cómodo", cosa que no existe porque las visitas tienen fechas fijas.

Cada corrección se convierte en una parte de la receta:

- El horario viejo pasa a **lo que va siempre**: "Horario de atención: lunes a viernes de 8 a 16." Ahora no lo saca de un ejemplo.
- "Estimada familia" pasa a **regla**: "Saludo: Hola, familia y el apellido. Nunca estimada."
- La visita flexible pasa a **regla** y a **lo que va siempre**: "Las visitas son en las fechas de esta lista. No ofrecer otras." Y la lista.

Con la receta armada, el mismo caso de ayer salió sin ninguna corrección. Y el que vino después, también.

## El borde: reglas que no sirven

No toda frase escrita como regla funciona. Hay reglas que la herramienta puede cumplir y reglas que no le dicen nada:

- "Sé empático" no le dice nada: no hay forma de saber si lo cumplió.
- "Si la familia cuenta una situación difícil, agradecé que lo haya contado en la primera línea" sí: es concreta y se puede chequear.

La prueba es simple: **si no podés mirar el mail y decir sí o no, la regla es un deseo.** Cambiala por lo que harías vos en ese caso.

## Probá que lo entendiste

¿Cuáles de estas reglas sirven tal como están y cuáles hay que reescribir?

1. "Que suene cercano."
2. "Máximo cuatro párrafos cortos."
3. "Si preguntan por becas, no dar montos: decir que la información está en la reunión de familias."
4. "Que no sea robótico."

:::Ver la respuesta
**Sirven la 2 y la 3.** Se pueden chequear mirando el mail: se cuentan los párrafos, se ve si hay un monto.

**Hay que reescribir la 1 y la 4.** Son deseos. Una forma de bajarlas a tierra: "Tutear a la familia, saludar con Hola y el apellido, cerrar con el nombre de quien firma y sin frases hechas como quedamos a su entera disposición." Eso es lo que "cercano y no robótico" quería decir.
:::

## Para hoy

1. Abrí una nota y escribí tu receta con las cinco partes.
2. Pasá a reglas **todas** las correcciones que anotaste ayer.
3. Probala con un caso real: pegá la receta entera en una conversación nueva, completá el hueco y mirá cuánto hay que corregir.

Si salió algo para corregir, no corrijas el mail: corregí la receta. Eso es lo de mañana.

## La regla que te llevás

**Lo que tenés en la cabeza y no está en la receta, la herramienta lo adivina.** Escribilo una vez y deja de adivinar.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-3'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 4
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Revisar sin reescribir',
  'La receta ya escribe casi bien. Hoy aprendés a revisar en treinta segundos, y a que cada error que encontrás deje de aparecer.',
$md$
Una receta que funciona tiene un riesgo nuevo: como casi siempre sale bien, dejás de leer. Y el día que sale mal, sale mal en un mail que ya mandaste.

No hace falta releer todo con lupa. Hace falta mirar **las tres cosas que si están mal te dejan mal parado** y, cada vez que encontrás un error, arreglarlo en el lugar correcto.

## Qué mirar en treinta segundos

1. **Los datos del caso.** El nombre, la fecha, el monto, el curso. ¿Son los que pegaste? Es el error más común y el más caro: un mail con el apellido de otra familia.
2. **Lo que promete.** Todo lo que el mail dice que va a pasar: una vacante, una llamada, un plazo, un descuento. ¿Lo podés cumplir? La herramienta tiende a ser amable, y ser amable a veces es prometer de más.
3. **Que no haya inventado nada.** Un dato que no estaba en la receta ni en el caso: una fecha, un nombre de alguien, un requisito. Si no sabés de dónde salió, sacalo.

El estilo, en cambio, casi no hace falta mirarlo: lo fijan los ejemplos. Si el estilo se va, es porque la receta tiene ejemplos que se contradicen.

## Arreglá la receta, no el mail

Cuando encontrás un error, la tentación es corregirlo en el mail y mandar. Funciona hoy y vuelve a pasar la semana que viene.

La regla práctica es esta: **si corregís lo mismo dos veces, va a la receta.** Una sola vez puede ser casualidad. Dos veces es un patrón.

## Un caso trabajado

En una semana con la receta de vacantes salieron catorce mails. Las correcciones fueron:

- Dos veces escribió "les confirmamos el lugar" cuando la familia preguntaba por fechas. Es una promesa que no se puede hacer. **Va a la receta:** "Nunca escribir confirmamos, reservamos ni aseguramos. La vacante la confirma Admisiones por escrito."
- Una vez puso mal un apellido compuesto: usó solo el primero. Es un dato del caso y una sola vez. **No va a la receta:** se corrige y listo.
- Tres veces agregó al final "no dudes en contactarnos ante cualquier consulta", que no está en ningún ejemplo. **Va a la receta:** "Terminar con la firma. Sin frase de cierre."

Catorce mails, seis correcciones. Dos se convirtieron en reglas. La semana siguiente, con la receta corregida, fueron catorce mails y una corrección.

## El borde: la receta que engorda

Si cada corrección se vuelve regla, en un mes la receta tiene cuarenta líneas, y algunas se contradicen entre sí. Una receta larga y contradictoria escribe peor que una corta.

Tres señales de que hay que podar:

- **Más de quince reglas.** Probablemente varias dicen lo mismo de distinta manera.
- **Dos reglas que tiran para lados opuestos**, como "breve" y "explicá bien el proceso".
- **Reglas para un caso que pasó una vez.** Ese caso es de criterio: escribilo vos.

Cada tanto, leé la receta entera y preguntate de cada regla si sigue haciendo falta.

## Probá que lo entendiste

Estas son las correcciones de una semana con la receta del recordatorio de pago. ¿Cuáles pasan a la receta?

1. Tres veces escribió el monto sin el signo de pesos.
2. Una vez le escribió a alguien que ya había pagado. El dato del caso estaba mal en la planilla.
3. Dos veces ofreció "un plan de pagos a medida", que no existe.

:::Ver la respuesta
**Pasan la 1 y la 3.** La 1 es un patrón de formato: "Los montos van con signo de pesos y sin decimales." La 3 es una promesa que no se puede cumplir, y dos veces ya es un patrón: "No ofrecer planes de pago. Si lo piden, decir que lo consulten con Administración."

**La 2 no.** El error no lo cometió la herramienta: el dato del caso estaba mal. Ninguna regla de la receta lo arregla. Se arregla en la planilla.
:::

## Para hoy

1. Usá la receta para todos los mails de este tipo que tengas que mandar hoy.
2. Antes de mandar cada uno, mirá solo las tres cosas: datos, promesas, inventos.
3. Llevá una cuenta en la nota de la receta: cuántos mails, cuántas correcciones, cuáles se repitieron. Las que se repitieron, pasalas a reglas.

## La regla que te llevás

**Si corregís lo mismo dos veces, no es un error del mail: es una regla que le falta a la receta.**
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-4'
on conflict do nothing;

-- ------------------------------------------------------------
-- Dia 5
-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dejalo guardado y medí cuánto ganaste',
  'Último día. La receta funciona, pero todavía vive en una nota que hay que copiar. Hoy la dejás guardada donde la uses, y hacés la cuenta del lunes otra vez.',
$md$
Una receta en una nota ya es un avance enorme. Pero cada vez que la usás tenés que abrir la nota, copiarla, abrir una conversación nueva, pegarla y completar el hueco. Son cuatro pasos de más, y los pasos de más son lo que hace que una buena práctica se abandone a las tres semanas.

Hoy la dejás guardada **adentro de tu herramienta**, para que usarla sea abrir algo y pegar los datos del caso.

## Dónde se guarda

Las tres herramientas más usadas tienen un lugar para esto, con distinto nombre:

- En **ChatGPT**, un proyecto o un GPT propio.
- En **Claude**, un proyecto.
- En **Gemini**, un Gem.

Los tres hacen lo mismo: guardan un texto con instrucciones, y a veces archivos, que se lee solo al principio de cada conversación que abrís ahí. Ahí va la receta entera: para qué es, lo que va siempre, las reglas y los ejemplos. El hueco no hace falta escribirlo: cada conversación nueva es el hueco.

Y si tu herramienta no tiene nada de esto, o la usás desde el teléfono, una nota fijada con la receta lista para copiar también sirve. Lo importante no es dónde, sino que **esté a un toque**.

Ponele un nombre que digas en voz alta: "Respuesta vacantes", "Recordatorio de pago". El día que tengas cuatro, vas a querer encontrarlas.

## Un caso trabajado: la cuenta del lunes

El lunes la cuenta era quince mails por semana, seis minutos cada uno: noventa minutos.

Con la receta guardada, el viernes se midió de verdad, con reloj, en los últimos diez mails:

- Abrir, pegar los datos y mirar las tres cosas: **un minuto** en promedio.
- Dos de los diez necesitaron un cambio: **dos minutos** más cada uno.
- Total para diez: catorce minutos. Para quince, unos **veintiún minutos**.

Noventa contra veintiuno son **sesenta y nueve minutos por semana**. En un año de cuarenta semanas de trabajo, son unas **cuarenta y seis horas**. Más de una semana laboral entera, con un solo mail.

Y hay una ganancia que no está en la cuenta: los mails salen todos iguales de bien, también el que escribís a las seis de la tarde de un viernes.

## El borde: no lo mandes solo, todavía

El paso siguiente que se te va a ocurrir es que se mande solo: que lea el mail que llega, escriba la respuesta y la envíe. Se puede hacer, y es un tema de otro nivel, el de la automatización.

Pero no lo hagas todavía. Hoy sos vos el que revisa datos, promesas e inventos, y esa revisión es lo que hace que puedas confiar. Antes de sacarte de la revisión necesitás semanas de mails que salieron bien sin tocarlos. Cuando la cuenta de correcciones llegue a cero varias semanas seguidas, ese día se habla.

## Probá que lo entendiste

Alguien manda doce recordatorios por semana y cada uno le llevaba ocho minutos. Con la receta guardada, le llevan dos. ¿Cuánto gana por semana y cuánto en un año de cuarenta semanas?

:::Ver la respuesta
**Setenta y dos minutos por semana y cuarenta y ocho horas por año.**

Antes: doce por ocho, noventa y seis minutos. Ahora: doce por dos, veinticuatro minutos. La diferencia son setenta y dos. Por cuarenta semanas, dos mil ochocientos ochenta minutos, que son cuarenta y ocho horas.

Si la cuenta te dio parecido con tu propio mail, ese es el número que vale la pena contarle a alguien del equipo.
:::

## Para hoy

1. Guardá la receta en tu herramienta, en el lugar que corresponda, con un nombre claro.
2. Usala para el próximo mail real de ese tipo y cronometrá cuánto tardás.
3. Hacé la cuenta del lunes otra vez con el número nuevo. Anotala en algún lado donde la veas.

Al cerrar esta lección, en lo que te proponés, escribí cuál va a ser **el próximo mail que vas a armar**. El segundo sale en la mitad de tiempo, porque ya sabés cómo.

## La regla que te llevás

**Una buena práctica que cuesta cuatro pasos se abandona. Una que cuesta uno, se queda.** Guardala donde la uses.
$md$,
  7, 'curado'
from lessons l where l.slug = 'a1-mail-repetido-5'
on conflict do nothing;

-- ------------------------------------------------------------
-- Control
-- ------------------------------------------------------------
select l.arc_day, l.slug, c.title, length(c.body_md) as caracteres
from lessons l join lesson_contents c on c.lesson_id = l.id and c.lang = 'es' and c.tool_id is null
where l.arc = 'mail-repetido'
order by l.arc_day;
