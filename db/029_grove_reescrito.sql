-- ============================================================
-- Frontera - Grove: las otras seis piezas, reescritas para que enseñen
-- ============================================================
-- Sigue el molde de 027 (la pieza 1). no_lei: idea, caso trabajado,
-- borde, recuperacion con respuesta escondida, accion de la semana.
-- hace_tiempo: arranca por recuperacion activa, despues que envejecio.
-- fresco: conectar y aplicar, con recuperacion escondida.
-- Los casos con numeros son hipoteticos y lo dicen. Sintesis propia,
-- atribuida a Grove; sin texto del libro.
-- ============================================================

-- ---------- no_lei 2: madurez relevante a la tarea ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
En la pieza anterior quedó una puerta abierta: delegar sin más puede ser abandonar. Grove tiene la respuesta, y la llama **madurez relevante a la tarea**.

La idea, dicha una vez: **cuánto tenés que involucrarte en un trabajo no depende de vos ni de la persona en general. Depende de cuán madura es esa persona en esa tarea concreta.** Y esa madurez no es solo saber hacerla: cuenta también querer hacerse cargo y ser capaz de fijarse metas exigentes pero realistas. A mayor madurez, menos involucramiento tuyo; a menor, más.

Esto desarma la pregunta que todos nos hacemos mal, *¿soy de los que delegan o de los que controlan?*. No es un rasgo tuyo. Es una decisión que se toma de nuevo por persona, por tarea y por momento.

## Un caso trabajado

Hipotético, pero típico. Lucía lleva ocho años en un equipo de admisiones y contesta consultas de familias mejor que nadie. Este mes le toca, por primera vez, armar y conducir una jornada de puertas abiertas.

- En **responder consultas**, su madurez es alta. Con vos alcanza con acordar el objetivo ("ninguna familia espera más de un día") y mirar el resultado.
- En **conducir una jornada**, su madurez es baja: nunca lo hizo. Es una tarea nueva para una persona veterana.

El error que se comete casi siempre es leer a Lucía como "la experta" y soltarle la jornada con un *confío en vos*. Ella no va a pedir ayuda, porque no es de las que piden. Va a improvisar, algo va a salir torcido el día del evento, y vos te vas a enterar ese mismo día.

Lo que corresponde con madurez baja es lo que Grove describe como más directivo: definir juntos el cronograma, decirle qué querés ver armado y para cuándo, y revisar en fechas fijas antes del evento. No es desconfianza. Es andamiaje, y se va sacando. En la segunda jornada ya es madurez media: acuerdan el qué y el cómo, y revisás en dos puntos. En la tercera, quizás alta: solo el objetivo.

Fijate lo que pasó: **la misma persona tuvo tres estilos de supervisión en tres meses.** Eso no es incoherencia tuya. Es la idea funcionando.

## Dónde la idea no aplica

- **No resuelve un problema de querer.** Si alguien sabe perfectamente hacer la tarea y no la hace, la madurez no es baja: tenés otra conversación pendiente, y supervisar más de cerca no la reemplaza.
- **Alta no es "desaparecer del todo".** Es no supervisar el cómo. Lo que sí seguís mirando es el resultado, con los indicadores que ves en la pieza que sigue. Soltar la tarea sin mirar la salida es el abandono de nuevo.
- **No es un juicio sobre la persona.** Madurez baja en una tarea nueva no dice nada de su capacidad. Si se lo comunicás como etiqueta, rompés lo que la idea quería cuidar.

## Probá que lo entendiste

Tres situaciones hipotéticas. Para cada una, decidí el nivel de madurez (baja, media, alta) y cómo supervisarías, **antes** de abrir la respuesta.

1. Martín tiene diez años de experiencia redactando comunicados. Hoy le pedís uno más.
2. Martín, el mismo, pasa a escribir por primera vez un informe con datos para el consejo directivo.
3. Camila entró hace seis meses, hizo tres veces el seguimiento de aspirantes y las tres salió bien con una revisión tuya al final. Hoy hace el cuarto.

:::Ver la respuesta
**1. Alta, y objetivo solamente.** Es su terreno. Acordás para cuándo y para quién, y lo ves cuando sale. Revisarlo línea por línea es asfixiar.

**2. Baja, aunque sea el mismo Martín.** La experiencia en comunicados no se transfiere sola a un informe con datos para un público distinto. Sentate con él antes, definí qué debe contener, pactá una revisión del borrador a mitad de camino. Tratarlo como experto acá es la trampa más común, porque "es senior".

**3. Media, camino a alta.** Tiene el hábito y tres repeticiones con resultado. Ya no necesita que le digas el cómo; sí te sirve mirar un punto intermedio o el resultado, y si vuelve a salir bien, la próxima vez soltás la revisión. Se promueve por evidencia, no por tiempo en el puesto.

Lo que une los tres: miraste la tarea, no el cargo ni la antigüedad.
:::

## Qué hacer esta semana

Escribí cada integrante del equipo con **una tarea concreta en curso** (no su rol). Al lado, madurez en esa tarea: alta, media o baja. Y al lado, cómo la estás supervisando hoy.

Buscá una fila donde no coincidan. Con esa sola persona, cambiá el estilo esta semana y avisale por qué ("esto es nuevo para vos, vamos a mirarlo juntos dos veces" o "esto ya lo dominás, lo veo en el resultado"). Una fila alcanza.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'high-output-management');

-- ---------- no_lei 3: indicadores ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
Grove viene de fabricar chips, y trae de ahí una obsesión que al resto nos falta: medir. Pero no medir cualquier cosa.

La idea, dicha una vez: **medí la salida, no la actividad, y poné siempre los indicadores de a pares: uno de cantidad con uno de calidad al lado.** Un indicador solo se puede inflar a costa de lo que no mide. El par lo impide, porque si uno sube mintiendo, el otro lo delata.

## Un caso trabajado

Todos los números son hipotéticos, pero la mecánica es real. Un equipo de admisiones recibe cien consultas por semana y decide medir una sola cosa: **cuántas se contestan en el día.** Arrancan en sesenta. Se esfuerzan y llegan a noventa y cinco. Parece un éxito.

Ahora agregamos el indicador que faltaba: **cuántas consultas quedan resueltas con la primera respuesta**, sin que la familia tenga que volver a preguntar.

- **Antes:** sesenta contestadas en el día, ochenta resueltas en la primera respuesta. Veinte consultas generan una vuelta extra. Total de mensajes: cien más veinte, ciento veinte.
- **Después:** noventa y cinco contestadas en el día, pero solo cincuenta y cinco resueltas en la primera. Cuarenta y cinco vueltas extra. Total: cien más cuarenta y cinco, ciento cuarenta y cinco.

Para ir rápido, el equipo contestó a medias. El indicador de velocidad mejoró treinta y cinco puntos y el trabajo real **creció veinticinco mensajes por semana**, además de familias más molestas. Nadie hizo trampa: hicieron exactamente lo que se les midió. El par lo habría mostrado en la primera semana.

## Los indicadores adelantados

Grove agrega una distinción útil. Un indicador **atrasado** te dice qué pasó (las inscripciones del año). Uno **adelantado** te avisa antes (las visitas agendadas para el mes que viene). Con solo atrasados, te enterás cuando ya no podés mover nada. Para decidir sirven los adelantados; los atrasados son para confirmar.

## Dónde la idea no aplica

- **Más indicadores no es mejor.** Un par por cada cosa importante, no un tablero de veinte. Si nadie recuerda de memoria lo que se mide, no se está midiendo: se está archivando.
- **Con muestras chicas, los números mienten.** Con tres casos, un porcentaje es ruido. Un equipo de siete personas no se evalúa con un porcentaje de cada una. El indicador sirve para ver el sistema, no para juzgar a alguien.
- **No todo se mide con precisión, y no pasa nada.** Grove no pide exactitud: pide que haya alguna señal de salida. Medir mal una cosa importante sirve más que medir bien una irrelevante.

## Probá que lo entendiste

Tres casos hipotéticos. Respondé antes de abrir.

1. Un área de comunicación mide "publicaciones por semana". ¿Qué indicador de calidad le pondrías al lado?
2. Clasificá como adelantado o atrasado: (a) matrículas confirmadas; (b) familias que abrieron el mail de invitación; (c) bajas del año.
3. Un equipo mide "tickets cerrados por persona" y quiere comparar a los siete integrantes. ¿Qué dos problemas ves?

:::Ver la respuesta
**1.** Algo que mida si lo publicado cumple su función, por ejemplo cuántas publicaciones generan una acción concreta (una consulta, una visita agendada) o cuántas hubo que corregir o bajar. El porqué: sin eso, la forma más fácil de subir el número es publicar más y peor.

**2.** (a) Atrasado: ya pasó, confirma. (b) Adelantado: anticipa visitas e inscripciones. (c) Atrasado: te enterás cuando la familia ya se fue. Regla práctica: si el número solo puede cambiar después de que se decidió lo importante, es atrasado.

**3.** Primero, falta el par de calidad: cerrar tickets rápido es fácil si se cierran mal o se reabren. Segundo, compararlos como personas con una muestra chica mezcla el desempeño con la dificultad de lo que le tocó a cada uno. El indicador sirve para ver al equipo, no para ordenar a la gente.
:::

## Qué hacer esta semana

Elegí **una** cosa de tu área que hoy medís por actividad (mails enviados, publicaciones, reuniones hechas). Escribí en una línea el par: qué indicador de cantidad de salida y qué indicador de calidad la acompañan. Si te sale solo uno, tu hallazgo es ese. Probalo con datos de las últimas dos semanas antes de decirlo en voz alta.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'high-output-management');

-- ---------- hace_tiempo 1: lo que se borró ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Antes de leer nada: reconstruí. Es incómodo y es lo que hace que algo quede. Cuatro preguntas sobre el libro, respondelas de memoria, aunque sea a medias, y recién después abrí cada respuesta.

**1. ¿Quién arma la agenda de un uno a uno y qué hacés vos en esa reunión?**

:::Ver la respuesta
La agenda la arma **quien reporta**, no vos. Vos escuchás y preguntás. Si la conducís con tus temas, es un reporte de estado disfrazado, y para eso alcanza un mensaje. Grove los quería largos, alrededor de una hora, porque los problemas de verdad no aparecen en los primeros minutos.
:::

**2. Hay una discusión fuerte en el equipo y se toma una decisión. ¿Qué se espera de los que estaban en contra?**

:::Ver la respuesta
Que la apoyen, del todo. La regla de Grove es discusión abierta antes, decisión clara y apoyo después, incluso de los que perdieron. Lo que rompe equipos no es discutir: es seguir discutiendo después de decidido, o callarse antes y quejarse después.
:::

**3. Tu área produce algo en cuatro etapas y una tarda el doble que las otras. ¿Dónde conviene poner el esfuerzo de mejora, y por qué?**

:::Ver la respuesta
En esa etapa. Grove llama **paso limitante** a la más lenta y menos flexible: marca el ritmo de todo el proceso. Mejorar cualquier otra no acelera el resultado; solo acumula trabajo esperando delante del cuello de botella. Suele ser una persona o una aprobación, y casi siempre es la tuya.
:::

**4. ¿Qué dos tipos de reunión defendía Grove, y qué pasa con las demás?**

:::Ver la respuesta
Las **de proceso**, regulares y previsibles, para que la información y el trabajo circulen, y las **de misión**, que existen para producir una decisión. La reunión que no es ninguna de las dos no tiene función definida, y para él no va.
:::

## Si alguna te falló

No es un problema de lectura: es la señal de que esa idea nunca llegó a ser tuya. Es normal; recordar lo que se leyó hace años cuesta a casi todos. Elegí la que más te falló y buscá hoy dónde aparece en tu semana.

## Para ahora

Mirá tu último uno a uno y respondé dos cosas: ¿quién armó la agenda? ¿Cuántos minutos hablaste vos? Si las respuestas son "yo" y "más de la mitad", tenés el primer cambio listo.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'high-output-management');

-- ---------- hace_tiempo 2: que envejecio y que no ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Primero reconstruí. Sin mirar: las tres ideas más fuertes del libro, cada una en una frase. Después abrí.

**¿Cuáles son y qué dice cada una?**

:::Ver la respuesta
**Apalancamiento:** tu producción es la de tu equipo, así que cada hora vale por lo que multiplica en otros, no por lo que producís vos.

**Madurez relevante a la tarea:** cuánto te involucrás depende de cuán maduro es ese colaborador en esa tarea concreta, y cambia con el tiempo.

**Indicadores de a pares:** medí la salida, y poné uno de cantidad con uno de calidad, porque un indicador solo se infla a costa de lo que no mide.

Si las dos primeras te salieron y la tercera no, es lo más habitual: es la más técnica y la que menos se repite en las charlas de management.
:::

**Ahora, otra pregunta de memoria: ¿qué parte del libro dirías que envejeció peor?**

:::Ver la respuesta
La que supone que supervisás a gente que ves todo el día. Grove escribe en 1983, en una fábrica, y su modelo de seguimiento descansa en la presencia física y el pasillo como canal de información. También suena de otra época la parte de evaluación de desempeño, dura y pensada para organizaciones que se imaginan como máquinas que se afinan.
:::

## Lo que sí resistió

El apalancamiento, la madurez según la tarea y los pares de indicadores no dependen de que haya fábrica ni oficina. Dependen de cómo se multiplica el trabajo de otros, y eso no cambió. Buena parte del management actual repite estas ideas sin citarlas.

## Lo que el libro no podía saber

Dos cosas que hoy pesan y que él no escribió: cómo se coordina un equipo que no comparte horario ni oficina, y qué pasa cuando parte del trabajo lo hace una herramienta y no una persona. No hay una respuesta de Grove escrita; hay un marco que alcanza para armarla.

Probalo: si tu producción es la de tu equipo y tu equipo ahora trabaja con herramientas de IA, **ayudarlos a usarlas bien** es una de las actividades de mayor apalancamiento que tenés. Y la madurez según la tarea aplica igual: alguien con madurez alta en redactar puede tener madurez baja en revisar lo que redacta una IA. Es otra tarea.

## Para ahora

Elegí a una persona de tu equipo y una tarea donde use IA. ¿Qué madurez tiene en *esa* tarea, y cómo la estás acompañando? Si no lo sabés, ahí está el trabajo de esta semana.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'high-output-management');

-- ---------- fresco 1: Grove contra Sinek ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Si tenés frescos a Grove y a Sinek, la discusión entre ellos es más útil que cada libro por separado. No se contradicen en los hechos: se contradicen en dónde ponen el peso.

**Sinek** (*Leaders Eat Last*) dice que el trabajo de quien dirige es que la gente deje de cuidarse: protección, confianza, absorber el riesgo.

**Grove** dice que el trabajo de quien dirige es aumentar la producción de su gente: apalancamiento, medición, exigencia.

Antes de seguir, una prueba de conexión. Sin releer, escribí **qué le falta a cada uno** según el otro. Después abrí.

:::Ver la respuesta
**Lo que Grove le hace a Sinek:** el libro de Sinek esquiva qué hacés con la persona que está dentro del círculo de seguridad y no rinde. Grove sí tiene respuesta: lo medís, elegís el estilo de supervisión según su madurez en esa tarea, y si aun así no rinde, eso también es información. Sin esa pieza, la seguridad se convierte en una zona donde nadie rinde cuentas.

**Lo que Sinek le hace a Grove:** el modelo de Grove asume que la gente dice lo que piensa en la discusión abierta que precede a la decisión. Eso **solo ocurre si es seguro decirlo**. Donde contradecir al jefe se paga, esa discusión es teatro: todos asienten y el desacuerdo aparece después, por abajo.
:::

## Una situación para decidir

Hipotética. En una reunión de equipo proponés cambiar el formato de la jornada de puertas abiertas. Nadie se opone. A la semana, tres personas te dicen por separado que no estaban de acuerdo. ¿Cuál de los dos libros explica el problema, y qué corregís primero?

:::Ver la respuesta
Lo explica **Sinek** primero: la discusión abierta de Grove no funcionó porque no era seguro hablar en la reunión. Corregirlo con más exigencia ("tienen que decir lo que piensan") empeora, porque castiga justo lo que falló.

Lo que corregís primero es la condición: preguntar antes de proponer, pedir a alguien explícitamente que objete, y agradecer la primera objeción de verdad que llegue. Recién cuando la gente habla, **Grove** vuelve a ser útil: decisión clara y apoyo de todos después.

Si hiciste al revés, empezando por la regla de Grove, tenés el síntoma de un equipo con exigencia sin seguridad.
:::

## La síntesis

Seguridad para que la discusión sea real; exigencia para que esa discusión sirva de algo. Es lo que plantea Amy Edmondson con los dos ejes altos a la vez. Ninguno de los dos libros alcanza solo.

## Para esta semana

Pensá en tu última decisión de equipo y preguntate cuál de las dos condiciones falló, la seguridad o la exigencia. Solo una. Y qué harías distinto la próxima vez.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'high-output-management');

-- ---------- fresco 2: aplicado a esta semana ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Tres ejercicios cortos. Se hacen en media hora y se repiten una vez por trimestre. Antes de hacerlos, un caso resuelto para que veas qué se busca.

## Un ejemplo hipotético resuelto

Un equipo de cuatro personas. Para cada una, una tarea en curso, su madurez en esa tarea y cómo la supervisa hoy quien coordina:

- **Ana**, redactar la comunicación a familias: madurez alta. Hoy la revisan siempre antes de que salga.
- **Bruno**, armar el primer informe de datos: madurez baja. Hoy lo dejaron solo "porque es senior".
- **Carla**, coordinar visitas: madurez media. Hoy se acuerda el objetivo y se revisa al final.
- **Dani**, seguimiento de aspirantes: madurez media. Hoy se le revisa cada caso.

¿Dónde están los desajustes? Pensalo y abrí.

:::Ver la respuesta
Hay tres. **Ana**: madurez alta y supervisión alta, la estás asfixiando; bajá a objetivo y resultado. **Bruno**: madurez baja y casi sin supervisión, es el desajuste caro, porque no va a pedir ayuda; sentate con él antes de que empiece. **Dani**: madurez media y revisión caso por caso, es demasiado; pasá a revisar en dos o tres puntos pactados. **Carla** es la única que coincide.

La regla: el desajuste más grave no es el que supervisa de más, es el que deja solo a alguien que todavía no sabe. Se disimula con la palabra "senior".
:::

## Ahora los tuyos

**Uno. La tabla de madurez.** Escribí tu equipo en una lista. Al lado de cada uno, una tarea concreta en curso, la madurez en esa tarea (alta, media o baja) y cómo la supervisás hoy. Buscá los desajustes, como en el ejemplo.

**Dos. El par que te falta.** Elegí el indicador más importante de tu área. ¿Tiene al lado su par de calidad? Si no, escribilo. Si no se te ocurre ninguno, ese es el hallazgo: estás midiendo algo que se puede inflar sin que nadie se entere.

**Tres. El apalancamiento de la semana que viene.** Mirá tus próximos siete días y marcá cada bloque con **M** si multiplica lo que hacen otros, o **A** si solo produce algo tuyo. No hace falta que todo sea M. Pero si no hay ninguna M, es la semana de alguien que hace el trabajo de su equipo en lugar de dirigirlo.

## La decisión

De los tres ejercicios, elegí **una sola cosa** para cambiar esta semana. Escribí con quién y cuándo: Grove diría que una decisión sin fecha y sin responsable no es una decisión.

Y para dentro de un mes, una pregunta de recuperación para vos: sin mirar nada, ¿qué cambió y qué efecto tuvo en esa persona o en ese indicador?
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'high-output-management');
