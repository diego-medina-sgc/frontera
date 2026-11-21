-- ============================================================
-- Frontera - High Output Management (Andrew Grove, 1983)
-- ============================================================
-- Elegido como segundo libro por dos razones: es el contrapunto duro de
-- Leaders Eat Last, que ya está en la biblioteca, y porque quien lee
-- coordina un equipo de siete personas en una institución. Grove escribe
-- para exactamente eso.
--
-- Síntesis propia de las ideas, atribuidas al autor. Sin texto del libro.
-- ============================================================

-- ---------- Para quien no lo leyó ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1, 'Tu producción no es lo que hacés',
$md$
Grove dirigía Intel cuando escribió esto, y arranca con una definición que incomoda a cualquiera que coordine gente:

**La producción de un gerente es la producción de su equipo, más la de los equipos sobre los que influye.** Nada de lo que vos hacés con tus propias manos cuenta. Nada.

Suena obvio dicho así. En la práctica casi nadie trabaja como si fuera cierto. Seguimos midiendo el día por lo que despachamos nosotros —los mails contestados, el documento terminado, las reuniones aguantadas— cuando eso, en su esquema, no es producción: es actividad.

## La consecuencia práctica: apalancamiento

Si tu producción es la de los demás, entonces la pregunta de cada día no es "¿qué hago?", sino **"¿qué de lo que puedo hacer multiplica lo que hacen los otros?"**.

Grove lo llama apalancamiento, y lo usa para ordenar el tiempo sin culpa. Hay actividades de apalancamiento altísimo:

- **Entrenar a alguien.** Dos horas que se multiplican por todas las veces que esa persona haga la tarea bien.
- **Decidir rápido cuando hay gente esperando tu decisión.** Cada día que tardás son siete personas trabajando con menos certeza.
- **Intervenir temprano**, cuando algo recién empieza a torcerse y corregirlo cuesta una conversación en lugar de un rehacer.

Y hay actividades de apalancamiento negativo: estar en todos lados, revisar todo, pedir que te copien en cada mail. No solo no suman: le restan producción al equipo, porque lo frenan esperándote.

**Lo que esto te plantea:** mirá tu agenda de la semana pasada y marcá cuánto tiempo estuvo en cosas que multiplican a otros. Para la mayoría de la gente que coordina, el número es incómodo.
$md$, 7
from books b where b.slug = 'high-output-management'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2, 'La idea que más se usa y menos se conoce',
$md$
Si el libro tuviera una sola página para rescatar, sería esta. Grove la llama **madurez relevante a la tarea**, y resuelve una pregunta que todo el que coordina se hace mal.

La pregunta mal hecha es: *¿soy un jefe que delega o un jefe que controla?* Como si fuera un rasgo de personalidad, o una postura que uno elige y aplica parejo.

La respuesta de Grove: **no depende de vos, depende de la persona y de la tarea.** Y no de la persona en general: de esa persona *en esa tarea específica*.

Alguien con quince años de experiencia puede tener madurez altísima en lo que viene haciendo y madurez cero en algo que arranca por primera vez. Tratarlo como experto en lo segundo porque lo es en lo primero es abandonarlo. Y tratarlo como novato en lo primero porque es nuevo en lo segundo es asfixiarlo.

## Cómo se traduce

- **Madurez baja en esa tarea:** instrucciones precisas, seguimiento frecuente, nada de "fijate vos". No es desconfianza, es andamiaje.
- **Madurez media:** acordar el qué y el cómo juntos, revisar en puntos pactados.
- **Madurez alta:** acordar solo el objetivo y desaparecer. Preguntar únicamente si te buscan.

El error caro no es elegir mal el estilo: es **elegir uno solo y aplicarlo a todos**. Grove es explícito en que el estilo correcto cambia con la persona, con la tarea, y con el tiempo, a medida que la misma persona madura en esa misma tarea.

**Para probar hoy:** agarrá tu equipo y una tarea concreta en curso por cada uno. Poné madurez alta, media o baja. Vas a encontrar al menos un caso donde estás supervisando con el estilo equivocado, y casi siempre es el mismo tipo de error en todos.
$md$, 7
from books b where b.slug = 'high-output-management'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3, 'Medir lo que sale, no lo que se mueve',
$md$
Grove viene de fabricar chips, y trae de ahí una obsesión que al resto nos falta: medir.

Su regla es incómoda y simple: **medí la salida, no la actividad.** Cuántas cosas terminadas, no cuántas horas puestas. Cuántas familias respondidas, no cuántos mails escritos.

Y le agrega algo que casi nadie hace: **los indicadores van de a pares.** Siempre uno de cantidad con uno de calidad al lado, porque cualquier métrica sola se puede inflar arruinando lo que no se mide. Velocidad de respuesta sin calidad de respuesta da respuestas rápidas y malas. Volumen sin errores da volumen con errores.

## Por qué esto te suena conocido

Es la misma idea que aparece hoy cuando se habla de medir sistemas de IA: un indicador solo se puede jugar, y si medís una cosa optimizás esa cosa aunque rompas otra. Grove lo escribió en el 83 para una fábrica.

También insiste en los **indicadores adelantados**: los que te avisan antes de que el problema llegue, no después. La facturación del mes es un indicador atrasado; las consultas de la semana pasada son adelantados. Si solo mirás los atrasados, te enterás cuando ya no podés hacer nada.

## La parte que duele

Grove dice que si no podés medir la producción de un área, probablemente no entendés qué hace. No es una provocación: es su test. Y la mayoría de las áreas de comunicación, marketing e institucionales fallan ese test con elegancia, midiendo actividad y llamándola resultado.

**Para probar hoy:** elegí una cosa de tu área que hoy medís por actividad y escribí cuál sería el par de indicadores —uno de cantidad, uno de calidad— que mide la salida de verdad.
$md$, 7
from books b where b.slug = 'high-output-management'
on conflict do nothing;

-- ---------- Para quien lo leyó hace tiempo ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1, 'Lo que se te borró',
$md$
De Grove casi todos retienen el apalancamiento y los uno a uno. Lo que se pierde es más fino y más útil.

**El uno a uno es del otro, no tuyo.** Grove es tajante: la agenda la arma quien reporta, no vos. Vos escuchás y preguntás. Si la reunión la conducís vos con tus temas, no es un uno a uno: es un reporte de estado disfrazado, y para eso alcanza un mensaje. También pedía que fueran largos —alrededor de una hora— porque los problemas de verdad no salen en los primeros quince minutos.

**El desacuerdo va antes, el apoyo va después.** Su regla de decisión: discusión abierta donde todos dicen lo que piensan sin cuidarse, decisión clara, y después **apoyo total incluso de los que estaban en contra**. Lo que rompe equipos no es discutir: es seguir discutiendo después de decidido, o no haber discutido antes y quejarse después.

**El paso limitante.** Grove ordena todo proceso alrededor de la etapa más lenta y menos flexible, y construye el resto alrededor de eso. Aplicado a un área: hay un cuello de botella real, suele ser una persona o una aprobación, y optimizar cualquier otra cosa no cambia nada.

**La reunión como herramienta, no como costo.** Es de los pocos que defiende las reuniones, pero solo las que tienen una función definida: las de proceso, que son regulares y previsibles, y las de misión, que existen para producir una decisión. La que no es ninguna de las dos, no va.

**Para ahora:** ¿tus uno a uno los armás vos o los arma la otra persona?
$md$, 6
from books b where b.slug = 'high-output-management'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 2, 'Qué envejeció y qué no',
$md$
El libro es de 1983 y lo escribió alguien que dirigía una fábrica de semiconductores. Conviene saber qué parte de eso pesa.

**Envejeció mal:** la obsesión con la presencia física y el pasillo como canal de información —escribió antes del trabajo remoto y del trabajo asincrónico, y su modelo de supervisión asume que ves a tu gente—. También la parte de evaluación de desempeño, que es dura y bastante de su época, y el supuesto implícito de que la organización es una máquina que se afina.

**Envejeció bien, y mejor de lo esperado:** el apalancamiento, la madurez relevante a la tarea, los pares de indicadores y los indicadores adelantados. Todo eso resistió cuarenta años sin una arruga, y buena parte del management moderno lo repite sin citarlo.

**Lo que no estaba y hoy hace falta:** nada sobre cómo se coordina un equipo que no comparte horario ni oficina, y nada sobre qué pasa cuando parte del trabajo lo hace una herramienta y no una persona. Esa pregunta —¿cuál es el apalancamiento de un jefe cuando su equipo delega la mitad de las tareas en IA?— es exactamente la de Grove, sin respuesta escrita todavía.

Ahí hay algo para pensar, porque el marco sigue sirviendo: si tu producción es la de tu equipo, y tu equipo ahora produce con herramientas que multiplican, entonces **entrenar al equipo en esas herramientas es la actividad de mayor apalancamiento que tenés disponible.** Grove lo habría puesto arriba de todo.
$md$, 6
from books b where b.slug = 'high-output-management'
on conflict do nothing;

-- ---------- Para quien lo tiene fresco ----------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1, 'Grove contra Sinek',
$md$
Si tenés los dos frescos, la discusión entre ellos es más útil que cualquiera de los dos por separado. Y existe de verdad: no se contradicen en los hechos, se contradicen en dónde ponen el peso.

**Sinek** dice que el trabajo del que dirige es hacer que la gente deje de cuidarse. Protección, confianza, absorber el riesgo.

**Grove** dice que el trabajo del que dirige es aumentar la producción de su gente. Apalancamiento, medición, exigencia.

Puestos frente a frente, cada uno expone el agujero del otro.

**Lo que Grove le hace a Sinek:** la pregunta que *Leaders Eat Last* esquiva es qué hacés con la persona que está adentro del círculo y no rinde. Sinek no tiene respuesta buena. Grove sí: la medís, le decís con qué estilo la vas a supervisar según su madurez en esa tarea, y si aun así no rinde, eso también es información. Sin esa pieza, el círculo de seguridad se convierte en una zona donde nadie rinde cuentas, que es el modo más amable de arruinar un equipo.

**Lo que Sinek le hace a Grove:** el modelo de Grove asume que la gente va a decir lo que piensa en la discusión abierta previa a la decisión. Pero eso **solo pasa si es seguro decirlo**. En un equipo donde contradecir al jefe se paga, la discusión abierta de Grove es teatro: todos asienten y el desacuerdo aparece después, por abajo. Sinek explica la condición que Grove da por sentada.

**La síntesis:** seguridad para que la discusión sea real, exigencia para que la discusión sirva de algo. Es, otra vez, el modelo de Edmondson: los dos ejes altos. Ninguno de los dos libros solo.
$md$, 7
from books b where b.slug = 'high-output-management'
on conflict do nothing;

insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 2, 'Aplicado a esta semana',
$md$
Tres ejercicios cortos. Se hacen en media hora y se repiten una vez por trimestre.

**Uno. La tabla de madurez.** Escribí tu equipo en una columna. Al lado, **una tarea concreta en curso por cada persona** —no su rol, una tarea—. Al lado, madurez alta, media o baja en esa tarea. Y en la última columna, cómo la estás supervisando hoy.

Buscá las filas donde las dos últimas columnas no coinciden. Vas a encontrar al menos una persona con madurez alta que estás revisando de más, y casi siempre una con madurez baja que dejaste sola porque es "grande". La segunda es la cara.

**Dos. El par que te falta.** Elegí el indicador más importante de tu área. ¿Tiene su par de calidad al lado? Si no, escribilo. Si no se te ocurre ninguno, ese es el hallazgo: estás midiendo algo que se puede inflar sin que nadie se entere.

**Tres. El apalancamiento de la semana que viene.** Mirá tu calendario de los próximos siete días y marcá cada bloque con A, si multiplica lo que hacen otros, o B, si solo produce algo tuyo. No hace falta que todo sea A. Pero si no hay ninguna A, esa es la semana de alguien que está haciendo el trabajo de su equipo en vez de dirigirlo.

**Y una cuarta, que es la de verdad:** de las tres anteriores, elegí **una sola cosa** para cambiar esta semana, y escribí con quién y cuándo. Grove diría que una decisión sin fecha y sin responsable no es una decisión.
$md$, 7
from books b where b.slug = 'high-output-management'
on conflict do nothing;
