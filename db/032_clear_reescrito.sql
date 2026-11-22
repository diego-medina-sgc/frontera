-- ============================================================
-- Frontera - Atomic Habits (James Clear), reescrito para que enseñe
-- ============================================================
-- Reemplaza las cinco piezas de 016 (3 no_lei, 1 hace_tiempo, 1 fresco)
-- con la estructura de 027: idea, caso trabajado, borde, recuperación
-- con respuesta escondida, y una acción para la semana.
-- Síntesis propia, sin texto del libro. Los casos son hipotéticos y
-- lo dicen. La pieza 3 mantiene la honestidad sobre lo que envejeció.
-- Los títulos no se tocan: los actuales funcionan.
-- ============================================================

-- ---------- no_lei 1: Sistemas en vez de objetivos ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
La idea que ordena el libro de James Clear, dicha una vez: **un objetivo define a dónde querés llegar; un sistema define qué hacés cada día. Y lo que se repite todos los días es lo que decide el resultado.**

Su argumento es que ganadores y perdedores suelen tener el mismo objetivo. Todos los que se anotan en una maratón quieren terminarla. Lo que los separa es lo que cada uno sostuvo durante los meses previos.

De ahí sale una consecuencia práctica: **si un problema se repite, probablemente no te falte motivación, te falta sistema.** Proponerte lo mismo con más ganas es volver a hacer lo que ya falló.

## Un caso trabajado (hipotético)

Dos personas del equipo de admisiones se ponen el mismo objetivo: contestar a cada familia que consulta en menos de 24 horas. Entran unas 25 consultas por semana, así que en un trimestre de 12 semanas son 300.

**Ana** lo anota el lunes y se lo repite cada mañana. En las semanas tranquilas lo cumple; en las de eventos, se le pasa. Supongamos que cumple 6 de las 12 semanas: unas 150 consultas a tiempo.

**Beto** no cambia el objetivo, cambia lo que hace. Decide que después del primer café abre la bandeja de consultas, antes que cualquier otra cosa, y deja armadas tres respuestas base para los casos más comunes. Supongamos que cumple 11 de 12 semanas: unas 275 a tiempo.

Mismo objetivo, mismo nivel de ganas. La diferencia son 125 familias que esperaron menos, y salió de **un disparador fijo y una respuesta ya armada**, no de más compromiso. Los números son inventados para la cuenta; el mecanismo es el del libro.

## La parte que menos se cita: identidad

Clear agrega que el hábito que dura es el que se vuelve parte de quién sos. "Quiero contestar más rápido" es un objetivo. "Soy alguien que no deja esperando a una familia" es una identidad, y cada vez que lo hacés sumás evidencia a favor. Es una hipótesis razonable, no una ley: sirve como forma de pensar el hábito, no como prueba de nada.

## Dónde la idea no aplica

**No significa tirar los objetivos.** Sin objetivo, un sistema sostiene constancia hacia ninguna parte. El objetivo da la dirección; el sistema, el día a día.

**No sirve para lo que no controlás.** Las inscripciones de un año dependen de demografía, competencia y economía de las familias. Podés diseñar un sistema para tus conductas (contactar, hacer seguimiento, responder). No podés diseñar uno para el resultado.

**Y no arregla lo estructural.** Si la bandeja recibe 80 consultas por semana y hay una persona, ningún disparador alcanza.

## Probá que lo entendiste

Respondé cada una antes de abrir la respuesta.

1. Clasificá como **objetivo**, **sistema** o **identidad**: (a) "Llegar a 300 inscriptos"; (b) "Cada viernes a las 11 reviso las familias sin respuesta"; (c) "Soy de los que cierran el ciclo".
2. Tu equipo falla todos los meses en entregar a tiempo el informe de leads. Alguien propone "pedirles más compromiso". ¿Qué le contestarías según Clear?
3. Querés bajar el tiempo de respuesta. Podés (a) fijarte la meta de 12 horas o (b) definir qué se hace al abrir la bandeja. ¿Cuál hace primero y por qué?

:::Ver la respuesta
**1. (a) objetivo, (b) sistema, (c) identidad.** La clave está en el verbo: (a) describe un resultado al que llegar, (b) describe una acción repetible con día y hora, (c) describe quién sos.

**2.** Que el problema se repite todos los meses, y que un problema que se repite apunta al sistema, no a las ganas. La pregunta útil es qué paso del proceso depende hoy de que alguien se acuerde, y cómo se vuelve automático (quién arma qué, qué día, con qué disparador).

**3. Primero (b).** Una meta de 12 horas sin un sistema que la sostenga te da el mismo resultado de Ana: cumplís cuando la semana es buena. La meta sirve después, para medir si el sistema funciona.
:::

## Qué hacer esta semana

Elegí **un** resultado que te frustra por repetirse (un informe que llega tarde, un seguimiento que se cae). Escribí en una línea la acción exacta que lo evitaría, con **día, hora y disparador**: "después de X, hago Y". Hacelo una vez esta semana. Una sola; el resto es después.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'atomic-habits');

-- ---------- no_lei 2: Las cuatro palancas ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
La idea, dicha una vez: **un hábito es una cadena de cuatro pasos (algo lo dispara, se te antoja, lo hacés, te deja algo), y Clear lo convierte en cuatro reglas: hacelo obvio, atractivo, fácil y satisfactorio.** Si el hábito no se sostiene, fallan una o varias de esas cuatro. Para sacarte uno de encima se invierten: invisible, poco atractivo, difícil, insatisfactorio.

Lo valioso no es memorizar la lista. Es usarla como **diagnóstico**: ante un hábito que se cae, preguntar cuál de las cuatro está fallando, en vez de concluir que "no tengo disciplina".

## Un caso trabajado (hipotético)

Querés revisar todas las mañanas el estado de las consultas de familias antes de empezar con lo demás. Hace tres semanas que lo intentás y lo hacés dos días de cinco. Diagnóstico regla por regla:

**Obvio.** ¿Qué lo dispara hoy? "A la mañana" es vago. Clear propone fijar cuándo y dónde: "a las 9, en mi escritorio, con el café" y, mejor, **pegarlo a algo que ya hacés sin falta**: después de servirme el café, abro el tablero.

**Atractivo.** Si el tablero te da fastidio, juntalo con algo que sí te gusta: el café o la música del escritorio, solo en ese momento.

**Fácil.** Acá suele estar el problema. "Revisar todo" son 30 minutos y por eso se posterga. Clear sugiere la **regla de los dos minutos**: achicá el hábito hasta que dure dos minutos, "abrir el tablero y mirar la primera columna". Lo que importa al principio no es la profundidad sino que aparezca el hábito.

**Satisfactorio.** El resultado tarda, así que fabricás una recompensa inmediata: tildar el día en una planilla.

Dos de cuatro eran el cuello de botella (disparador vago y tarea demasiado grande). No hacía falta más voluntad: hacía falta arreglar esas dos.

## Dónde la idea no aplica

**No es para trabajo complejo.** Las reglas funcionan con conductas simples y repetibles (revisar, enviar, anotar). No te dicen cómo escribir una buena propuesta ni cómo resolver un conflicto de equipo.

**Dos minutos no es el hábito final.** Es la puerta. Si te quedás en dos minutos para siempre, mantenés el hábito pero no el resultado. El libro lo dice, aunque se cita poco.

**Las cuatro no pesan igual en cada caso.** Casi siempre hay una dominante; arreglar las cuatro a la vez es sobreingeniería.

## Probá que lo entendiste

Respondé antes de abrir la respuesta. ¿Qué regla está fallando en cada caso?

1. Querés que tu equipo cargue cada lead en el CRM el mismo día. Saben que hay que hacerlo, pero cargar lleva 6 pasos y casi nadie lo termina.
2. Querés escribir 15 minutos por día sobre lo que aprendiste. Siempre "te acordás" a las 11 de la noche.
3. Cada semana hacés el resumen del equipo y nadie lo nota ni lo comenta. A las tres semanas lo dejás.

:::Ver la respuesta
**1. Fácil.** El equipo ya sabe y quiere; lo que falla es la fricción de 6 pasos. La salida es recortar pasos (un formulario mínimo con tres campos) en vez de insistir con la importancia.

**2. Obvio.** No falta ganas, falta un disparador atado a un momento real. La salida es pegarlo a algo que ya hacés todos los días ("después de cerrar la compu del trabajo, escribo").

**3. Satisfactorio.** El esfuerzo es inmediato y la recompensa no aparece nunca. Una salida es crear la señal: pedir un comentario en una reunión puntual, o sumarle algo que a vos te dé un retorno inmediato.
:::

## Qué hacer esta semana

Elegí un hábito que se te cae. Escribí las cuatro reglas en una línea cada una y marcá cuál es la que falla (casi nunca son las cuatro). Arreglá **solo esa** con un cambio concreto: un disparador atado a algo que ya hacés, o una versión de dos minutos. Probalo cinco días.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'atomic-habits');

-- ---------- no_lei 3: Qué envejeció mal ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
La idea, dicha una vez: **Atomic Habits es una buena caja de herramientas y una mala teoría.** Las herramientas (dos minutos, diseñar el entorno, un disparador claro) funcionan como heurísticas. Lo que se le pide de más, que sea ciencia establecida o que todo se resuelva con mejor diseño personal, no se sostiene.

Tres reservas, y cada una con un ejemplo.

## 1. La matemática del 1%: la cuenta, y su límite

El libro muestra que mejorar 1% por día durante un año te deja unas 37 veces mejor. La cuenta, hecha bien: 1,01 elevado a 365 da aproximadamente **37,8**. Y la inversa: 0,99 elevado a 365 da aproximadamente **0,026**, es decir, empeorar 1% diario te deja en un 2,6% de donde estabas.

La aritmética es correcta. **El problema es el supuesto**: que la mejora sea constante, que se componga sobre sí misma y que no haya techo. Probalo con un caso hipotético: tu tiempo de respuesta a una consulta es 60 minutos y mejorás 1% por día. A los 90 días estarías en unos 24 minutos, pero a los 365 en unos 1,5. Nadie contesta una consulta de una familia en menos de dos minutos con calidad; hay un piso. En casi todo lo que importa hay mesetas, retrocesos y techos.

Entonces: como imagen de que lo chico se acumula, sirve. Como modelo que predice cuánto vas a mejorar, no.

## 2. La evidencia es despareja

Buena parte del libro se apoya en anécdotas bien contadas y en investigaciones que, leídas de cerca, dicen menos que el relato que las acompaña. Esto no invalida las cuatro reglas: son un marco práctico razonable. Pero no son un resultado de laboratorio, y conviene no citarlas como tal ante gente que conoce el tema.

## 3. Es un libro individual

Todo problema se resuelve con mejor diseño personal. Casi no hay lugar para el caso en que la causa no es tuya: la carga de trabajo, un tiempo que no controlás, una cadena de gente que depende de vos. Para quien coordina un equipo es una limitación grande: el hábito individual no arregla un proceso roto.

## Dónde estas críticas no aplican

**No descartan las herramientas.** Dos minutos y diseño del entorno siguen funcionando porque reducen la voluntad necesaria, y la voluntad es lo que se agota. No necesitan al 1% ni a un estudio para sostenerse.

**No dicen que los hábitos no importan.** Dicen que no son magia ni teoría probada.

## Probá que lo entendiste

Respondé antes de abrir la respuesta.

1. Un colega dice: "Si mejorás 1% por día, en un año sos 37 veces mejor, está demostrado". ¿Qué parte es cierta y qué parte no?
2. Tu equipo de tres no llega a todo y alguien sugiere "usar mejor los hábitos". ¿Cuándo es una buena respuesta y cuándo es esquivar el problema?
3. Un sistema de hábitos te lleva a revisar un informe todos los días desde hace un año. ¿Qué pregunta es la que el libro no te hace?

:::Ver la respuesta
**1.** Es cierta la cuenta: 1,01 a la 365 da cerca de 37,8. No es cierto que describa cómo se mejora algo real: supone mejora constante y sin techo, y "demostrado" confunde una cuenta con un hallazgo. Una respuesta honesta: "es una metáfora linda de lo que se acumula, no una predicción".

**2.** Es buena respuesta si el problema es de ejecución individual (se olvidan cosas, falta un disparador). Es esquivar si el problema es de carga: tres personas para el trabajo de cinco no se arreglan con constancia. Hay que preguntarse primero de quién es la causa.

**3.** Si **vale la pena**. Constancia no es valor. Un sistema perfecto puede sostener algo inútil, y encima te da la sensación de progresar. Antes de mejorar cómo lo sostenés, conviene preguntarse qué pasaría si lo dejaras tres meses.
:::

## Qué hacer esta semana

Pensá en algo que hacés todos los días o todas las semanas por inercia. Preguntate una sola cosa: **si lo dejara tres meses, ¿qué pasaría?** Si la respuesta es "nada", sacalo de la agenda y usá ese tiempo para algo que sí valga.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'atomic-habits');

-- ---------- hace_tiempo 1: Lo que se te borró ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Lo leíste hace tiempo, así que empezamos por reconstruir antes de mirar. Contestá cada una **de memoria**, aunque te salga a medias. Si te sale a medias, ese es el dato.

## Reconstruí antes de ver

1. ¿Cuáles eran las cuatro reglas para armar un hábito, y cuáles las cuatro inversas para romper uno?
2. Clear propone un orden entre identidad, hábito y resultado. ¿Cuál es, y por qué contradice la intuición?
3. Algunos abandonan a las pocas semanas porque no ven resultados. ¿Cómo lo explica el libro?
4. ¿Qué regla propone para cuando se te cae un día?
5. ¿Qué es "apilar" hábitos?

:::Ver la respuesta
**1.** Obvio, atractivo, fácil y satisfactorio. Las inversas: invisible, poco atractivo, difícil e insatisfactorio. Casi todos retienen esto.

**2.** Primero decidís qué tipo de persona querés ser, y después preguntás qué haría esa persona hoy. El hábito es consecuencia. La intuición dice al revés: "hago esto hasta lograr algo y entonces soy alguien así".

**3.** Con la idea de la meseta del potencial latente: el esfuerzo rinde mucho después, así que hay un tramo largo en el que hacés todo bien y no pasa nada. Quien no sabe que ese tramo existe lo lee como fracaso y se va justo antes.

**4.** Nunca fallar dos veces seguidas. Un día no rompe nada; dos seguidos empiezan un hábito nuevo.

**5.** Atar un hábito nuevo a uno que ya hacés sin falta: después de X, hago Y. El disparador deja de ser tu memoria.
:::

Si fallaste en las de identidad, meseta y "dos veces", es lo esperable: son las que menos se citan y las que más lo distinguen de un manual de productividad.

## Qué envejeció

**La matemática del 1%.** Mejorar 1% diario hasta ser unas 37 veces mejor es una cuenta correcta (1,01 a la 365 da cerca de 37,8) aplicada a un supuesto que casi nunca se cumple: mejora constante y sin techo. En la práctica hay mesetas y pisos. Sirve como imagen, no como predicción.

**La evidencia.** Buena parte del libro descansa en anécdotas y en estudios que, mirados de cerca, dicen menos que la historia que los acompaña. Las cuatro reglas son un marco práctico, no resultado de laboratorio.

**Lo estructural.** Todo se resuelve con diseño personal. Si coordinás un equipo, sabés que a veces el problema no es de hábitos sino de carga o de proceso.

**Lo que sigue en pie:** dos minutos, diseño del entorno, no fallar dos veces y la idea de la meseta. Las cuatro funcionan sin necesidad del 1%.

## Qué hacer esta semana

Elegí un hábito que se te cayó y decidí: ¿se cayó por falta de ganas, o lo dejaste **dos veces seguidas** en una semana complicada y ya no volvió? Si fue lo segundo, no hace falta más disciplina. Elegí cuándo vas a retomarlo (día y hora) y proponete una sola cosa: no fallar dos veces.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'atomic-habits');

-- ---------- fresco 1: Contra qué leerlo ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Si lo tenés fresco, no hace falta repasarlo. Lo que falta es ponerlo contra sus límites y aplicarlo a tu trabajo.

## Conectarlo con Grove

Clear es individual; Andy Grove, en *High Output Management*, es organizacional. Donde Clear dice "diseñá tu entorno", Grove diría que si tu equipo depende de la fuerza de voluntad de cada uno, el problema es del sistema de trabajo, no de las personas.

Para quien coordina gente, la versión útil de Clear no es aplicarlo a uno mismo: es **diseñar el entorno del equipo** para que lo correcto sea lo fácil. Las cuatro reglas pasan de ser una técnica personal a ser un criterio de diseño de procesos. Eso Clear no lo escribe; lo escribís vos.

Un caso hipotético: el equipo se olvida de registrar la fuente de cada consulta. Podrías pedir más cuidado. O podrías (**fácil**) pedir un solo campo obligatorio con opciones cerradas en el formulario, y (**obvio**) que el campo sea lo primero que aparece. No cambió la gente, cambió el entorno.

## Recuperá: aplicá las reglas al equipo

Respondé antes de abrir la respuesta.

1. En tu equipo, el informe semanal sale tarde porque cada uno junta los datos a mano de tres lugares. ¿Qué regla de las cuatro estás ignorando, y qué cambiarías?
2. Querés que nadie deje una consulta sin respuesta más de un día, y tu equipo reporta que "se acuerda" cuando hay tiempo. ¿Qué cambia: pedir más compromiso o cambiar el sistema? ¿Por qué?
3. Un compañero propone medir cuántas veces por semana abre cada uno la bandeja de consultas, para "premiar la constancia". ¿Qué podría salir mal, según la crítica al libro?

:::Ver la respuesta
**1. Fácil.** Juntar de tres lugares a mano es fricción pura. Reducir a un solo lugar o automatizar la consolidación vale más que recordarles la fecha.

**2. Cambiar el sistema.** Si depende de "cuando hay tiempo", depende de la voluntad, que es lo que falla. Se arregla con un disparador fijo (una franja diaria, una lista de pendientes visible) y con tareas de pocos pasos.

**3. Premiar la constancia en vez del resultado.** Se mide cuántas veces se abre la bandeja y no si las familias fueron atendidas. Es el punto ciego del libro: optimiza la constancia sin preguntar si lo constante vale la pena. El equipo aprende a abrir la bandeja, no a resolver.
:::

## Contra el propio libro

El libro optimiza la constancia y casi nunca pregunta si la cosa vale la pena. Un sistema impecable que sostiene algo inútil es peor que no tener sistema, porque encima te da la sensación de progresar. Y mucho de lo que se cita como ciencia de hábitos es heurística: sirve, pero conviene no presentarla como resultado probado frente a quien sabe.

## El ejercicio

Elegí **un hábito que sostenés hoy con éxito** y respondé dos preguntas:

**Una:** ¿cuál de las cuatro reglas lo sostiene de verdad? Casi siempre es una sola, y casi nunca la que creías.

**Dos**, la incómoda: **¿sigue valiendo la pena?** No preguntes si lo hacés bien; preguntá qué pasaría si lo dejaras tres meses. Si la respuesta honesta es "nada", encontraste un sistema perfecto sosteniendo algo que ya no te sirve.

## Qué hacer esta semana

Elegí **un** proceso del equipo que hoy depende de que alguien se acuerde. Cambiá una sola cosa para que lo correcto sea lo más fácil (un disparador fijo, un paso menos) y anotá si el proceso se cumplió mejor o no. Una semana alcanza para saber si ese era el cuello de botella.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'atomic-habits');
