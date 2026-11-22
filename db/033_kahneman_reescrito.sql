-- ============================================================
-- Frontera - Thinking, Fast and Slow, reescrito para que enseñe
-- ============================================================
-- Reemplaza las cinco piezas de 019 (3 no_lei, 1 hace_tiempo, 1 fresco).
-- Misma estructura que 027: idea, caso trabajado, borde, recuperación
-- con respuesta escondida, acción. Los casos con números son
-- hipotéticos y están marcados así. Se mantiene la pieza sobre lo que
-- no replicó. Síntesis propia, sin texto del libro.
-- ============================================================

-- ---------- no_lei 1 ----------
update book_pieces
set
  minutes = 9,
  body_md = $md$
Kahneman es psicólogo y ganó el Nobel de Economía por mostrar que la gente no decide como la economía suponía. Todo el libro gira alrededor de una distinción, y conviene tenerla precisa desde el principio.

**Tu mente tiene dos modos de operar.** El Sistema 1 es rápido y automático: reconoce una cara, completa una frase, siente que algo no cierra. El Sistema 2 es lento y deliberado: multiplica, compara, verifica. No son dos partes del cerebro, son una forma de hablar de dos modos.

Y la clave que casi todos los resúmenes dejan afuera: **el Sistema 1 siempre propone una respuesta, y el Sistema 2, que es perezoso, casi siempre la aprueba sin revisar.** El error no suele ser que el modo rápido falle. Es que el modo lento no se entera de que tenía que intervenir.

Del mismo mecanismo sale la idea más citada, que Kahneman abrevia como **lo que ves es todo lo que hay**: la mente arma la historia más coherente posible con lo que tiene delante y no registra lo que falta. Por eso tu confianza en una conclusión mide cuán bien encaja la historia, no cuánta evidencia hay.

## Un caso, con la cuenta

Versión adaptada de un acertijo clásico que Kahneman usa. Hipotético.

Un paquete de pauta más diseño cuesta 1.100 en total. La pauta cuesta 1.000 más que el diseño. ¿Cuánto cuesta el diseño?

Casi todos sienten **100** antes de calcular nada. Probalo: si el diseño costara 100, la pauta costaría 1.100 y el total sería 1.200. No cierra.

La cuenta correcta: diseño = 50, pauta = 1.050. Suman 1.100, y la diferencia es 1.000. El diseño cuesta 50.

Lo que importa no es el acertijo. Es que la respuesta equivocada llegó con sensación de certeza, y verificarla llevaba diez segundos. Ninguna alarma avisó.

## Dónde la idea no aplica

**No es "desconfiá de tu intuición".** Kahneman discutió esto con Gary Klein, que estudia expertos que deciden rápido, y coincidieron en una condición: la intuición es confiable cuando el entorno es bastante regular y recibís devolución rápida y clara sobre si acertaste. Un ajedrecista o un bombero experimentado la cumplen.

**Tampoco el Sistema 2 es el bueno.** Puede dedicarse a justificar lo que el 1 ya decidió. Y no se puede usar para todo: se agota la paciencia. La habilidad es elegir en qué momentos frenar.

## Probá que lo entendiste

Respondé antes de abrir cada respuesta.

**Caso 1.** Para cada situación, ¿confiás en tu intuición o frenás?
- Leer a ojo un texto de tres líneas de tu área y sentir que el tono está mal.
- Predecir qué porcentaje de las familias que visitaron este mes se va a inscribir.
- Decidir si una herramienta de IA nueva "se siente" mejor que la que usabas.

:::Ver la respuesta
**Confiás, frenás, frenás.**

El texto de tu área: leíste miles, el entorno es regular y tuviste devolución constante sobre qué funciona. Ahí tu intuición es un activo.

La predicción de inscripción: el entorno tiene mucho ruido y la devolución llega meses después, cuando ya no podés conectarla con lo que sentiste. Ahí la intuición suena igual de segura y vale mucho menos. Frená y mirá las tasas de otros años.

La herramienta nueva: sentir que es mejor mide cuán fluida suena, no cuán bien resuelve tu trabajo. Hay que probarla con casos.
:::

**Caso 2.** Una colega te dice con entusiasmo que su campaña de redes "funcionó" porque entraron muchos mensajes. ¿Qué tres cosas te faltan ver antes de creerlo?

:::Ver la respuesta
**Con qué la compara, qué pasó después, y qué más cambió.**

Cuántos mensajes entraban en un período normal: sin esa base, "muchos" no significa nada. Cuántos de esos mensajes terminaron en algo: una consulta no es una inscripción. Y qué otra cosa pasó en esas semanas: un evento, un cambio de horario, una nota en un diario.

Notá que la historia de tu colega ya era coherente sin nada de eso. Por eso funciona lo de "lo que ves es todo lo que hay".
:::

**Caso 3.** Un libro y su señalador cuestan 2.200 en total. El libro cuesta 2.000 más que el señalador. ¿Cuánto cuesta el señalador?

:::Ver la respuesta
**100.** El libro cuesta 2.100, y 2.100 más 100 son 2.200, con 2.000 de diferencia.

Si te vino 200, fue el reflejo: restaste 2.000 de 2.200 sin comprobar la segunda condición. Si te vino 100 de entrada, el Sistema 2 estaba despierto, que es el objetivo.
:::

## Qué hacer esta semana

Elegí una decisión que vayas a tomar en los próximos días, de las que importan. Antes de decidir, escribí una sola pregunta: **¿qué no estoy viendo?** Y buscá la respuesta activamente, aunque sea con una sola persona o un solo dato.

No hace falta cambiar la decisión. Hace falta que el Sistema 2 se entere de que le tocaba intervenir.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- no_lei 2 ----------
update book_pieces
set
  minutes = 9,
  title = 'Cuatro sesgos con antídoto',
  body_md = $md$
El libro cataloga decenas de sesgos. Estos cuatro resistieron las revisiones posteriores y son los que más pesan en un trabajo como el tuyo. Tienen algo en común que es la idea de esta pieza:

**Son errores con dirección. Se equivocan siempre para el mismo lado.** Por eso la defensa no es "estar atento", que no funciona, sino un procedimiento que se hace antes de decidir.

**Anclaje.** El primer número que aparece contamina los juicios siguientes, aunque sea arbitrario. Antídoto: que cada uno escriba su número antes de que alguien diga el suyo.

**Encuadre.** El mismo dato dicho de dos maneras produce decisiones distintas. Antídoto: mirar las dos versiones, o el número absoluto.

**Aversión a la pérdida.** Perder duele más que lo que alegra ganar lo mismo, en torno al doble según la situación. Explica por qué cuesta tanto discontinuar algo que no rinde. Antídoto: preguntarte si lo empezarías hoy, desde cero, con lo que sabés.

**Falacia de la planificación.** Subestimamos cuánto va a tardar algo, incluso sabiendo que siempre tardó más. Antídoto: la **vista externa**, que es la que vemos a continuación.

## Un caso trabajado

Hipotético. Tu equipo va a preparar la campaña de matrícula del año próximo. Desde adentro todos dicen **4 semanas**: el brief está claro y la agenda libre.

Ahora la vista externa. Las últimas cinco campañas parecidas tardaron 6, 8, 9, 7 y 10 semanas. Suman 40, y 40 dividido 5 es **8**. El rango va de 6 a 10.

La estimación honesta es 8, con un rango de 6 a 10. Decir 4 es creer que esta vez es la excepción.

Fijate qué tuvieron en común esas cinco campañas: cada una tuvo un imprevisto distinto. Cada imprevisto, por separado, era improbable. Que hubiera alguno era casi seguro. Desde adentro solo se ven los problemas que ya conocés, y la vista externa los incluye todos, incluso los que no sabés nombrar.

## Dónde las ideas no aplican

**La vista externa necesita una clase de referencia parecida.** Si el proyecto es realmente nuevo, no tenés cinco antecedentes. Y si lo que causaba las demoras ya no existe, por ejemplo un proveedor lento que cambiaste, ajustá, pero con evidencia y no con optimismo.

**El encuadre no se evita.** No existe una versión neutra de un dato. Lo que podés hacer es no quedarte con una sola.

**Mantener lo que ya hiciste a veces es correcto.** La pregunta es si lo elegirías hoy. Si la respuesta es sí, seguir no es sesgo.

## Probá que lo entendiste

Para cada caso, nombrá el sesgo y decidí qué harías, antes de abrir la respuesta.

**Caso 1.** Pedís presupuesto para un video institucional. El primer proveedor dice 80.000. Los otros dos vienen en 75.000 y 85.000. Concluís que "el mercado está en 80".

:::Ver la respuesta
**Anclaje.** El 80.000 llegó primero y ordenó todo lo demás, incluso tu propia idea de qué es normal. Además no sabés si los otros dos cotizaron sin saber lo que pidió el primero.

Lo que cambia: antes de pedir nada, escribí tu rango. Mandá el mismo brief a todos, sin cifra, y pedí cada cotización por separado. Después comparás con tu número, no con el primero que apareció.
:::

**Caso 2.** Ya gastaste 3.000 en preparar un evento. Terminarlo cuesta 2.000 más y esperás que traiga 1.500 en matrículas. ¿Seguís?

:::Ver la respuesta
**No, con esos números.** Los 3.000 ya se fueron en los dos caminos: seguir o parar. Lo que decide es lo que viene: poner 2.000 para recibir 1.500 pierde 500.

Duele parar porque cierra la pérdida y la hace real. Esa es la aversión a la pérdida trabajando. La pregunta útil es: si hoy empezara de cero con estos números, ¿lo haría? Si tu estimación de 1.500 es conservadora, la cuenta cambia, pero el 3.000 sigue sin entrar.
:::

**Caso 3.** Un informe dice: "El 85% de las familias que nos visitaron dice que nos recomendaría". Otro: "El 15% de las familias que nos visitaron no nos recomendaría".

:::Ver la respuesta
**Es el mismo dato con encuadres distintos.** Suele pasar que el segundo mueve más a actuar, porque pone el foco en lo que se pierde, y el primero tranquiliza. Una misma persona puede decidir distinto según cuál lea.

Cuando tengas que reportar algo así, mostrá las dos versiones o el número absoluto: 85 de cada 100, 15 de cada 100.
:::

## Qué hacer esta semana

Hacé un **premortem**, una técnica de Gary Klein que Kahneman recomienda. Elegí algo que arranque en el próximo mes. Reuní al equipo veinte minutos y decí: *pasó un año y esto fracasó. Cada uno escriba, en silencio, por qué.*

Funciona porque da permiso para dudar sin quedar como el pesimista, y porque al escribir en silencio nadie se ancla en lo que dijo el primero.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- no_lei 3 ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Esta es la parte más importante de la síntesis y la que no vas a encontrar en los resúmenes que circulan.

**La idea:** un resultado sorprendente que sale de un estudio con poca gente es evidencia débil. Casi todo lo que se cayó del libro se cayó por eso, y el propio libro tiene un capítulo que explica por qué las muestras chicas engañan.

Durante la década siguiente a su publicación, la psicología pasó por una crisis de replicación: muchos experimentos famosos, repetidos con más gente y mejores métodos, dejaron de dar lo que daban. Dos casos de este libro son los más conocidos. El **priming de conducta**, la idea de que ver ciertas palabras cambia tu comportamiento inmediato sin que lo notes. Y la **depleción del ego**, la idea de que la fuerza de voluntad se gasta como un músculo.

Kahneman reconoció públicamente en 2017 que había dado demasiado crédito a estudios chicos y que los lectores no deberían haberle creído sobre esa parte. Un Nobel, diciéndolo de su libro más vendido.

## Un caso para ver el mecanismo

Hipotético. Mandás dos versiones de un mail, a doce personas cada una. La A recibe 5 respuestas y la B recibe 8. Dividido, 8 contra 5 es 60% más. Suena a victoria clara.

Pero mirá la diferencia sin porcentajes: **tres personas**. Que tres personas respondan o no puede depender del día que tuvieron. Con grupos tan chicos, una diferencia así aparece fácilmente por pura suerte.

Un ejemplo más simple: tirás una moneda cuatro veces. Que salgan cuatro caras pasa una de cada dieciséis veces, que no es nada raro. Con cuarenta tiradas, que casi todas sean cara casi nunca pasa. Cuanto menos gente, más extremos aparecen solos, y esos extremos son justamente los que parecen noticia.

Lo correcto es repetir la prueba con otras doce personas por grupo, o con más, y ver si se mantiene.

## Dónde la idea no aplica

**No replicar no significa que sea falso.** Significa que no hay evidencia sólida a favor. Es distinto, y conviene decirlo así.

**No significa que el libro entero esté en duda.** Lo que se cayó es una parte acotada. Anclaje, encuadre, aversión a la pérdida, falacia de la planificación y vista externa resistieron.

**Y que algo se haya replicado no garantiza que valga para tu caso.** Lo que viene de otros contextos hay que probarlo en el tuyo.

## Probá que lo entendiste

Para cada afirmación, decidí entre **creerla**, **suspenderla** o **tratarla como hipótesis para probar**, antes de abrir la respuesta.

**Caso 1.** Un artículo cita "la ciencia demuestra" que una luz cálida en la sala de espera hace que las familias digan que sí 20% más. Salió de un estudio con 25 familias. (El caso es inventado.)

:::Ver la respuesta
**Suspendé.** Pocas personas, un efecto llamativo y un solo estudio: es exactamente el perfil de lo que después no replicó.

Tres preguntas para hacerle a cualquier resultado así: cuánta gente tuvo, quién lo repitió, y de qué tamaño era el efecto. Sin respuesta a las tres, quedate con "interesante, falta ver".
:::

**Caso 2.** Se te dice que para estimar plazos conviene mirar cuánto tardaron proyectos parecidos y no confiar en la cuenta desde adentro.

:::Ver la respuesta
**Creela, y comprobala con tus propios datos.** La falacia de la planificación se mostró en muchos proyectos y contextos, no en un solo experimento. Además tiene algo muy bueno: la evidencia la tenés vos, en tus últimas campañas.

El cuidado es elegir bien la clase de referencia, y no comparar con proyectos que no se parecen.
:::

**Caso 3.** Un proveedor de IA publica un estudio propio con 40 usuarios que muestra que su herramienta ahorra el 50% del tiempo.

:::Ver la respuesta
**Tratalo como hipótesis para probar vos.** Pocas personas, lo mide quien vende, y no sabés qué tareas ni cómo midieron el tiempo. No es que sea mentira: es que no alcanza para decidir.

Probala con tus propios casos, en tu trabajo real, con un criterio que escribas antes de empezar.
:::

## Qué hacer esta semana

Elegí una idea que repitas con convicción, que hayas aprendido de un libro, un curso o una charla. Escribí en una hoja cuánta gente tenía el estudio detrás y quién lo repitió.

Si no podés contestar las dos preguntas, bajala de categoría: ya no es un hecho, es una hipótesis. Es una forma barata de aplicarte lo que Kahneman nos dejó con su propio capítulo caído.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- hace_tiempo 1 ----------
update book_pieces
set
  minutes = 7,
  title = 'Reconstruí lo que leíste, y mirá qué envejeció',
  body_md = $md$
Si lo leíste hace años, lo que te quedó probablemente sea una impresión general. Antes de que te cuente qué cambió, probá reconstruir tres cosas. Escribí tu respuesta, aunque sea en dos líneas, y recién después abrí.

## Reconstruí

**1.** Sin mirar: ¿qué quiere decir "lo que ves es todo lo que hay" y qué cambia en cómo llevás una reunión?

:::Ver la respuesta
La mente arma la historia más coherente posible con lo que tiene y no registra lo que falta. Por eso la confianza que sentís mide cuán bien encaja la historia, no cuánta evidencia tenés.

En una reunión cambia lo que preguntás: en lugar de evaluar la propuesta que te presentan, preguntá qué dato no está en la mesa y pedí que alguien defienda la opción contraria.
:::

**2.** Tu promedio es de 40 consultas por semana. Una semana cayó a 22 y cambiaste el asunto del mail. La siguiente fueron 33. ¿Funcionó el cambio?

:::Ver la respuesta
**No se puede saber con eso.** Es regresión a la media: una semana extrema suele ser seguida por otra más cercana al promedio sin que nada haya cambiado. La brecha era de 18 (de 22 a 40) y se recuperaron 11. Una buena parte de eso se esperaba igual.

Para saber si funcionó, compará contra semanas en las que no cambiaste nada, o probá el asunto nuevo solo con la mitad de la lista.

Este es el mismo error que hace creer que retar al que anduvo mal "funciona": un mal día suele ser seguido de uno mejor sin ayuda.
:::

**3.** Estimás 3 semanas para algo. Las últimas cuatro cosas parecidas tardaron 5, 7, 4 y 8. ¿Qué plazo prometés?

:::Ver la respuesta
Suman 24, y 24 dividido 4 es **6 semanas**. Esa es la vista externa. Si tu fecha límite es rígida, prometé lo que cubra el peor caso visto, que fue 8.

Si te salió 3 o 4, es la estimación desde adentro: la que se siente razonable y casi siempre es corta.
:::

Si en alguna te trabaste, esa es la que se borró y vale la pena volver a mirarla.

## Lo que envejeció

**Dos capítulos no replicaron.** El priming de conducta y la depleción del ego, que fueron de lo más citado del libro, no se sostuvieron cuando se repitieron con más gente. Kahneman lo reconoció públicamente en 2017. Si todavía contás el experimento de caminar más lento, convendría dejarlo de lado.

**La pregunta "¿se replicó?"** se aprendió de esa crisis y conviene hacerla con cualquier libro de esa época, incluido este.

**Lo que se sostiene:** anclaje, encuadre, aversión a la pérdida, falacia de la planificación, regresión a la media y la vista externa. Y la idea de que reglas simples suelen ganarle al juicio experto en decisiones repetitivas, porque el experto es inconsistente consigo mismo. Hoy esa idea tiene un uso concreto: un criterio escrito, aplicado igual cada vez.

**Lo que el libro no podía saber:** que buena parte de tu trabajo con IA iba a ser evaluar respuestas fluidas y seguras. Ese es el terreno donde "lo que ves es todo lo que hay" aparece más.

## Qué hacer esta semana

Elegí una cosa que decís con seguridad y que aprendiste hace años. Buscá si se sostiene. No para tirarla, sino para saber en cuál de los dos grupos está.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'thinking-fast-slow');

-- ---------- fresco 1 ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Si lo tenés fresco, lo más útil no es repasar sesgos: es aplicarlos al terreno donde hoy decidís con menos defensas, que es evaluar herramientas de IA.

**Lo que ves es todo lo que hay.** Una respuesta de IA llega completa, fluida y sin señales de lo que no sabe. No hay huecos visibles, así que tu Sistema 1 la evalúa por coherencia. Y la coherencia es lo que estos sistemas producen mejor, sepan o no la respuesta.

**Confirmación al probar.** Cuando probás algo que te entusiasma, le hacés las preguntas que intuís que va a contestar bien. Después concluís que es excelente. Cinco pruebas elegidas por vos no son una muestra, son una demostración.

**Anclaje en lo primero.** La primera respuesta fija tu idea de lo que es posible, y las siguientes las juzgás contra eso, no contra lo que necesitabas.

**Regresión a la media.** Si un prompt salió mal y lo retocás, la próxima respuesta suele salir mejor aunque el cambio no haya hecho nada, porque lo malo era un extremo.

## Lo que une todo

Kahneman dedica el libro a mostrar que la intuición es inconsistente y que los procedimientos simples la mejoran. Para la IA, ese procedimiento es un conjunto de casos de prueba: elegidos **antes** de probar, con la respuesta esperada escrita antes de ver el resultado, contados en vez de sentidos. Es el cruce exacto con la lección de evals de esta app.

## Probá aplicarlo

Respondé antes de abrir.

**Caso 1.** Probás una herramienta nueva con cinco pedidos que se te ocurrieron en el momento. Las cinco respuestas salen muy bien. Concluís que es mejor que la anterior. ¿Qué falló en el razonamiento y qué hacés?

:::Ver la respuesta
**Fallaron tres cosas a la vez.** Elegiste los pedidos después de saber qué hace bien (confirmación). Evaluaste por cuán convincente sonaba (lo que ves es todo lo que hay). Y cinco es muy poco para concluir algo.

Lo que cambia: escribí los casos antes de probar, incluí al menos dos difíciles que sepas que son difíciles, y la respuesta esperada antes de ver la salida.
:::

**Caso 2.** Tenés veinte casos de prueba. La versión A de tu prompt resuelve bien 14 y la B resuelve bien 16. ¿Podés decir que la B es mejor?

:::Ver la respuesta
**Todavía no.** Es 70% contra 80%, pero son dos casos de veinte. Un modelo puede responder distinto al mismo pedido en corridas distintas, así que dos casos de diferencia pueden moverse solos.

Qué hacés: mirá cuáles son esos casos y si la B rompió alguno que la A hacía bien. Repetí la corrida y sumá casos. Si la ventaja se mantiene en más casos y en más corridas, ahí sí.
:::

**Caso 3.** Un prompt devolvió algo flojo, le cambiaste dos frases, y la siguiente respuesta salió muy bien. ¿Lo arreglaste?

:::Ver la respuesta
**No sabés.** Una respuesta mala es un extremo, y lo esperable después de un extremo es algo más cercano al promedio, con o sin tu cambio.

Para saber si el cambio sirve, corré la versión vieja y la nueva sobre los mismos diez pedidos y compará cuántos salen bien en cada una.
:::

## Qué hacer esta semana

Elegí una tarea real que se repita en tu trabajo, por ejemplo responder consultas de familias. Armá **diez casos** que hayas visto de verdad, con la respuesta que considerarías buena escrita antes de usar IA. Pasalos por la herramienta que usás hoy y contá cuántos salen bien.

Es media hora. Si leíste el libro y no medís lo que hacés con IA, todavía no lo aplicaste.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'thinking-fast-slow');
