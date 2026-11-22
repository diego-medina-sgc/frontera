-- ============================================================
-- Frontera - Leaders Eat Last (Sinek), las ocho piezas reescritas
-- ============================================================
-- Misma idea que 027 (Grove): cada pieza hace un trabajo distinto.
--   no_lei:      idea, caso trabajado, borde, recuperacion escondida, accion.
--   hace_tiempo: primero reconstruir (respuestas escondidas), despues
--                lo que envejecio.
--   fresco:      conectar con otros autores y aplicar, con recuperacion.
-- Sintesis propia con atribucion a Sinek; sin texto del libro. Los casos
-- trabajados son hipoteticos y lo dicen. Se actualiza por
-- idx + lang + estado + libro; el titulo no cambia.
-- ============================================================

-- ---------- no_lei 1: la idea central ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Sinek arranca con una apuesta que incomoda a quien dirige gente: el rendimiento de un equipo depende menos de los incentivos, los objetivos o el talento que de una condición previa.

**Si las personas sienten que pueden confiar en las de al lado y en quien manda, gastan su energía en el problema. Si sienten que no, la gastan en protegerse.**

A esa condición la llama **círculo de seguridad**. Adentro, nadie tiene que vigilar si lo van a culpar, si lo van a dejar expuesto o si otro se queda con el crédito. Afuera, todo eso se vigila, y la vigilancia consume atención que no queda para el trabajo. La gente no se protege por mala: es lo que hace cualquiera que siente peligro.

Lo más exigente del argumento es dónde pone la responsabilidad: en quien dirige. Según Sinek, el líder no es quien tiene la mejor idea, es quien decide quién está adentro del círculo y cuánto cuesta estar ahí. Y eso no se declara, se demuestra en los momentos en que proteger a alguien le sale caro a él.

El título viene de una costumbre que Sinek cuenta de los marines: en el comedor, los oficiales comen últimos. Es un gesto chico que dice algo grande: el que manda recibe después.

## El costo, con números

La idea suena a valor de póster hasta que se le pone una cuenta. Esta es hipotética, para ver la mecánica.

Un equipo de admisiones de un colegio, cinco personas. Nadie se siente del todo seguro. Cada una hace, a lo largo del día, pequeñas cosas de cobertura: copia a la coordinadora en mails que no lo necesitan, deja registro escrito de cada decisión por si después la cuestionan, evita avisar de un error hasta tener la solución armada. Digamos que son veinte minutos por persona por día.

Cinco personas × veinte minutos = cien minutos por día. Por cinco días son más de ocho horas por semana: una jornada completa de una persona, todas las semanas, dedicada a no quedar expuesta. Nadie lo ve en ninguna planilla, porque no figura como tarea. Y el costo no termina ahí: el error que se avisa tarde sale más caro que el que se avisa a tiempo.

Los números son inventados, pero la forma de la cuenta no: lo que cuesta la falta de seguridad es tiempo y atención que se van sin dejar rastro.

## Dónde la idea no aplica

**No significa ser blando.** Absorber el riesgo por tu gente es más exigente que ser amable, no menos. Un equipo seguro puede tener estándares altísimos; lo que no tiene es miedo a decir que algo salió mal.

**No significa que no haya peligro afuera.** Sinek no promete un mundo sin presión. Su punto es que el círculo es para que la energía se oriente hacia la amenaza externa (la competencia, un plazo, un problema real) y no hacia adentro, contra los de al lado.

**No se declara.** Si el círculo dependiera de decir "acá pueden confiar en mí", cualquiera lo tendría. Se construye con lo que hacés cuando te cuesta.

## Probá que lo entendiste

Para cada situación, decidí si la señal que recibe el equipo **fortalece** o **debilita** el círculo, **antes** de abrir la respuesta.

1. Un error de un integrante llega a la dirección. La coordinadora responde: "lo vimos tarde, el control es mío y lo vamos a ajustar".
2. En la reunión de resultados, la coordinadora agradece "al equipo" por el buen trimestre, y en la de al lado, cuando algo falla, dice el nombre de quien se equivocó.
3. Una persona cuenta que cometió un error y la respuesta es una pregunta: "¿qué necesitás para arreglarlo y qué cambiamos para que no se repita?".

:::Ver la respuesta
**1 fortalece, 2 debilita, 3 fortalece.**

**El 1 es el gesto del que come último.** La coordinadora recibe el golpe hacia arriba y el equipo lo ve. Es exactamente el momento en que proteger a alguien le cuesta algo a ella.

**El 2 debilita aunque tenga un buen momento.** El crédito es difuso y la culpa tiene nombre. La señal que recibe el equipo es clara: el riesgo es individual y el mérito es colectivo. Esa asimetría es la que hace que la gente empiece a cubrirse.

**El 3 fortalece porque la reacción es lo que enseña.** La persona acaba de exponerse, y la respuesta define si la próxima vez avisa temprano o tarde. Sin el "qué cambiamos", sería comprensión sin exigencia, que Sinek casi no trata y que es la parte que falta.
:::

## Qué hacer esta semana

Pensá en el último error de alguien de tu equipo del que te enteraste. Respondé por escrito: ¿te enteraste enseguida o tarde? ¿Quién te lo contó? ¿Cómo reaccionaste? Si te enteraste tarde o por un tercero, ese es el dato: el círculo tiene un borde ahí.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- no_lei 2: que rompe el circulo ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Sinek dedica buena parte del libro a cómo se rompe el círculo de seguridad, y casi nada tiene que ver con jefes malos. Su idea central acá:

**Las condiciones que destruyen la confianza aparecen solas, por la inercia de la estructura. Si no hacés nada para evitarlas, pasan igual.**

Son cuatro, y conviene tenerlas separadas porque se ven distinto.

- **La distancia.** Cuanto más lejos está quien decide de quien recibe la decisión, más fácil es decidir cosas que lastiman, no por crueldad sino porque a lo lejos las personas se vuelven números.
- **La abundancia mal repartida.** Cuando quien está arriba recibe primero y más, la señal es que el riesgo no se comparte.
- **Los números por encima de las personas.** La métrica deja de ser un indicador y pasa a ser el objetivo.
- **La inestabilidad crónica.** Reorganizaciones, reglas que cambian, prioridades que se dan vuelta. Desde abajo no se lee como dinamismo, se lee como peligro.

## Un caso, dos de las cuatro a la vez

Hipotético, para ver cómo trabajan. Una dirección de un colegio mide al equipo de admisiones por **cantidad de entrevistas realizadas por semana**. Es una métrica razonable: refleja actividad, se mide fácil.

Con el tiempo pasa lo previsible. Las entrevistas se acortan para entrar más en la agenda, se agendan familias que casi seguro no van a matricular, se cuentan reuniones informales. El número sube. La conversación con cada familia, que era lo que importaba, empeora. Nadie decide hacer esto: cada persona hace lo razonable para quedar bien frente a la métrica.

Eso es el tercer factor en estado puro. Y se combina con el primero: quien mira el tablero no escucha las entrevistas, entonces el número parece buena noticia.

La lección de Sinek no es "no midas". Es que **una métrica sin contacto con la realidad que mide termina premiando lo equivocado**, y que la distancia entre quien mira el número y quien hace el trabajo es lo que lo permite.

## Dónde la idea no aplica

**No todo cambio es inestabilidad.** Una reorganización necesaria, explicada a tiempo y con lo que está definido y lo que no, no rompe el círculo. Lo que rompe es el cambio sin explicación o permanente.

**No todo número es un enemigo.** Medir es necesario. El problema aparece cuando el número reemplaza al juicio y no lo acompaña.

**No todo es culpa de la estructura.** Sinek insiste en que son condiciones que aparecen solas, pero también que alguien tiene que hacerse cargo de corregirlas. "Es la estructura" no sirve como excusa.

## Probá que lo entendiste

Clasificá cada situación en una de las cuatro condiciones (distancia, abundancia mal repartida, números por encima de personas, inestabilidad) **antes** de abrir la respuesta.

1. Una dirección anuncia un cambio de horarios de atención a familias sin haber hablado con quienes atienden, que se enteran por un mail.
2. En tres meses, el área cambió de objetivo principal cuatro veces y cada vez se pidió "priorizar esto" sobre lo anterior.
3. Se premia a quien más consultas cerró en el mes, y se empiezan a cerrar consultas sin resolverlas.

:::Ver la respuesta
**1 es distancia, 2 es inestabilidad, 3 es números por encima de personas.**

**El 1 es distancia** porque quien decide no tuvo delante a quien recibe la decisión. Ni siquiera hace falta que el cambio sea malo: la manera de comunicarlo ya transmite que a quienes atienden no se los cuenta como parte de la decisión.

**El 2 es inestabilidad** porque cada cambio, por separado, puede ser defendible. El problema es el patrón: la gente aprende que nada de lo que hace hoy va a valer mañana, y lo razonable es no comprometerse del todo.

**El 3 es la métrica convertida en objetivo.** Lo que se mide es "cerrar consultas", lo que importa es "resolverlas", y la gente optimiza lo primero porque es lo que se premia.
:::

## Qué hacer esta semana

Elegí una de las cuatro condiciones y buscá una evidencia concreta en tu área, no una impresión: un mail, una decisión, una métrica. Si encontrás una, escribí cuál sería el cambio más chico que la corrige. Si no encontrás ninguna, preguntale a alguien del equipo cuál de las cuatro cree que más se parece a lo que vive.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- no_lei 3: que cambia el lunes ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
El libro es más inspirador que operativo. Esta pieza traduce sus ideas a conductas que se pueden hacer un lunes, y parte de una sola:

**Cuando liderás, tu equipo lee en qué momentos proteger a alguien te sale caro a vos, y con eso decide cuánto cuidarse de vos.**

Las conductas que salen de eso:

- **Absorber el golpe.** Cuando algo sale mal y hay que dar explicaciones hacia arriba, las das vos.
- **Dar el crédito con nombre.** Quién hizo qué, dicho delante de quien importa.
- **Proteger a quien trae la mala noticia.** Tu reacción a la primera define si habrá una segunda.
- **Acortar la distancia a propósito.** Ir a ver, no esperar el informe.
- **Decir qué está definido y qué no.** La incertidumbre sin explicar es lo que dispara el modo defensa.

## Caso trabajado: la versión que sube y la versión que baja

Hipotético. A un colegio le sale mal un envío masivo a familias: un dato equivocado en la fecha de una reunión. La coordinadora tiene que informar a la dirección. Dos versiones posibles del mismo mensaje.

**Versión A:** "Hubo un error en el envío. La persona que lo preparó cargó mal la fecha."

**Versión B:** "Hubo un error en el envío: la fecha salió mal. El control final lo hago yo y no lo hice con cuidado. Ya mandamos la corrección y agregué un paso de revisión doble."

Las dos son ciertas. La diferencia es qué aprende el equipo cuando se entera de cuál se mandó. Con la A, aprende que el riesgo de errores es individual y que quien se equivoca queda solo. Con la B, aprende que avisar temprano es seguro. La primera produce un equipo que esconde errores; la segunda, uno que los avisa cuando todavía son baratos.

Y fijate lo que la B tiene además de protección: tiene una corrección. Absorber el golpe no es llorar ni excusar; es hacerte cargo y cambiar algo.

## Dónde la idea no aplica

**Absorber no es esconder.** Si un problema es de desempeño sostenido, hacerte cargo hacia arriba no resuelve nada: tenés que hablarlo con la persona, de frente. Proteger no es tapar.

**No todo error es tuyo.** Hay errores que son de una persona y que tenés que conversar con ella. Lo que no hacés es señalarla en público o hacia arriba como explicación.

**Dar crédito no es inflar.** Si decís "gran trabajo" a todo, la señal se diluye. El crédito con nombre vale porque es específico.

## Probá que lo entendiste

Decidí qué harías en cada caso **antes** de abrir la respuesta.

1. Una persona del equipo te avisa que lleva dos días con un problema que no sabe cómo resolver y que probablemente afecte un plazo. Estás apurada y de mal humor.
2. Un proyecto salió muy bien y te felicitan a vos delante de la dirección. El trabajo lo hicieron tres personas.
3. Se viene una reorganización y todavía no sabés cómo te va a afectar a vos ni a tu equipo.

:::Ver la respuesta
**1.** Frená un minuto, aunque estés apurada, y respondé con una pregunta, no con un reproche: "gracias por avisar, ¿qué necesitás de mí?". La reacción a la primera mala noticia decide si la próxima te llega a tiempo o cuando ya es caro. El mal humor lo conversás después, si hace falta.

**2.** Devolvé el crédito ahí mismo, con nombres: "esto lo hicieron X, Y y Z, y esto fue lo que hizo cada uno". Cuesta diez segundos y es el momento exacto en que el equipo mira. Si lo dejás pasar, la señal es que el mérito sube y el riesgo baja.

**3.** Decí lo que sabés y lo que no: "hay una reorganización, todavía no sé cómo nos afecta, te cuento apenas lo sepa". La ambigüedad sin explicar es lo que dispara la defensa. No hace falta que mientas con que todo está bien; hace falta que sepan qué está definido y qué no.
:::

## Qué hacer esta semana

Elegí una sola de las cinco conductas. Anotá cuándo, con quién y en qué situación concreta la vas a hacer esta semana. Si no podés ponerle día y persona, todavía no es una acción, es una intención.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- no_lei 4: que envejecio mal ----------
update book_pieces
set
  minutes = 8,
  body_md = $md$
Si vas a usar este libro para decidir cómo dirigís, conviene saber dónde es flojo. La idea de esta pieza:

**Del libro se sostiene lo que Sinek observa sobre cómo se comportan las personas en las organizaciones. Se sostiene menos la explicación que le pone encima.**

Son tres problemas.

- **La biología.** Sinek explica casi todo con cuatro sustancias, a las que ordena en dos pares: endorfinas y dopamina, las del logro individual; serotonina y oxitocina, las de los vínculos. Suma el cortisol como la del estrés. Es ordenado y memorable, pero es una simplificación que la neurociencia no sostiene: ninguna de esas sustancias hace una sola cosa ni funciona como una palanca que se sube o se baja.
- **La idealización de lo militar.** Los marines como modelo de organización sana ilustran la idea, pero un colegio o un área de marketing no se parece a una unidad de combate en lo que está en juego ni en los incentivos.
- **Lo que falta: la exigencia.** El libro habla mucho de proteger y poco de exigir.

## Caso trabajado: separar lo que se sostiene de lo que no

Un ejercicio de lectura crítica. Tomá esta frase, que resume un tipo de afirmación frecuente en el libro: "tu equipo rinde mejor porque la oxitocina liberada por la confianza lo hace colaborar".

Se puede partir en dos:

1. **Observación:** en equipos donde hay confianza, la gente colabora más y esconde menos los errores.
2. **Explicación:** eso pasa por una sustancia en particular.

La primera la podés chequear en tu propio equipo, mirando qué pasa cuando alguien se equivoca. La segunda no la podés chequear ni con tu experiencia ni, como la presenta el libro, con la investigación. Y no te hace falta: la decisión que tomás (cómo reaccionás a un error) es la misma con o sin la química.

El método sirve para todo el libro: separar lo que se observa de lo que se explica. Con lo primero trabajás. Lo segundo lo tomás como una metáfora que ayuda a recordar.

## Dónde la crítica no aplica

**No invalida la idea central.** Que la explicación biológica esté inflada no significa que el círculo de seguridad sea falso. La observación de que la gente se protege cuando se siente en peligro es sólida y tiene respaldo de otras investigaciones, como las de Amy Edmondson sobre seguridad psicológica.

**No hace al libro inútil.** Su valor está en las imágenes y en el foco en la responsabilidad del líder, no en la química.

## Probá que lo entendiste

Clasificá cada afirmación como **observación** (la podés comprobar mirando a tu equipo) o **explicación** (necesitaría evidencia que no tenés) **antes** de abrir la respuesta.

1. "Cuando el jefe reparte el crédito con nombre, la gente cuenta antes los problemas."
2. "La confianza se genera porque el cerebro libera una sustancia específica cuando alguien cumple."
3. "Cuando se avisa un error tarde, suele salir más caro."

:::Ver la respuesta
**1 es observación, 2 es explicación, 3 es observación.**

**El 1 y el 3** describen conductas que podés ver: qué hace la gente y cuánto cuesta. Las podés probar en tu equipo durante un mes y quedarte con lo que veas.

**El 2** hace una afirmación sobre mecanismos del cuerpo, y esa es justamente la parte que la neurociencia no sostiene como la plantea el libro. Aun si fuera cierta, no cambiaría qué hacés el lunes. Cuando una explicación no cambia ninguna decisión, no necesitás creerla para usar el libro.
:::

## Qué hacer esta semana

Cuando alguien te cite este libro (o cuando lo cites vos), hacé la pregunta del ejercicio: ¿esto es algo que se observa en equipos reales o es una explicación sobre por qué? Con lo primero, probalo en tu área. Lo segundo, usalo como imagen, no como argumento.
$md$
where idx = 4
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- hace_tiempo 1: lo que se te borro ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Del libro de Sinek casi todos retienen el título y la imagen del círculo. Lo que se pierde con el tiempo es la parte difícil, que es la que sirve. Antes de leer nada, reconstruilo vos.

## Reconstruí antes de ver

Respondé en voz alta o por escrito cada una. Después abrí la respuesta y compará.

**Uno.** ¿Qué define el borde del círculo de seguridad: quién está adentro o quién queda afuera?

:::Ver la respuesta
**Quién queda afuera.** No es un valor abstracto, es un borde. Sinek insiste en que la organización, a medida que crece, multiplica los bordes: cada área, cada capa, cada "ellos" dibuja un círculo más chico. Si respondiste "quién está adentro", te quedaste con la imagen y se te borró el mecanismo.
:::

**Dos.** Un equipo se protege del equipo de al lado, dentro de la misma institución. ¿Cómo se siente eso desde adentro y qué indica?

:::Ver la respuesta
**Se siente como lealtad, y es el síntoma de que el círculo grande se rompió.** Proteger al propio equipo del de al lado parece virtud, y en este esquema es señal de que la organización dejó de ser un solo círculo.
:::

**Tres.** ¿Por qué decisiones que lastiman se toman más fácil cuando quien decide está lejos? ¿Es por maldad?

:::Ver la respuesta
**No es maldad, es distancia.** A lo lejos las personas se convierten en números, y un recorte en una planilla es una línea. A tres metros, es alguien con nombre. Por eso Sinek propone acortar la distancia a propósito: la organización la agranda sola.
:::

**Cuatro.** ¿Cuándo se mide la integridad de un líder, según el libro?

:::Ver la respuesta
**Cuando proteger a alguien le sale caro a él.** Los gestos de los días buenos no definen el círculo. Cuenta lo que hacés cuando te cuesta.
:::

Si te salieron tres o cuatro, el libro sigue en pie en tu cabeza. Si te salió una, no es grave: es lo normal con un libro leído hace años, y esta pieza es para eso.

## Lo que probablemente recordás mal

**Que el libro propone ser blando.** No lo propone. Propone absorber el riesgo por tu gente, que es bastante más exigente que ser amable.

## Qué envejeció

**La explicación química.** Las sustancias que Sinek usa para explicar el comportamiento (el par del logro y el par del vínculo) ordenan bien la exposición pero son una simplificación que la neurociencia no sostiene. Lo que él observa sobre conductas sigue valiendo; la química, tomala como metáfora.

**El silencio sobre la exigencia.** El libro protege mucho y exige poco. La investigación posterior sobre seguridad psicológica es explícita: seguridad y estándares altos juntos.

## Para ahora

Pensá en tu equipo y preguntate dónde está el borde hoy. Quién está adentro y quién, sin que nadie lo haya decidido, quedó afuera. Escribí un nombre.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- hace_tiempo 2: la prueba que el libro propone sin decirlo ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Hay un test que recorre todo el libro y que Sinek nunca formula como tal. Intentá enunciarlo vos antes de ver cuál es.

## Reconstruí antes de ver

**Uno.** ¿Cuál es el test? Pista: tiene que ver con cuándo se mira a una organización.

:::Ver la respuesta
**Qué hace la organización cuando las cosas se ponen difíciles.** Los días buenos no distinguen a nadie. Lo que informa es cómo se reparte el costo cuando hay una caída, un recorte, una crisis.
:::

**Dos.** Sinek contrasta dos modos de responder a una caída. ¿Cuáles son y qué recuerda la gente de cada uno?

:::Ver la respuesta
**Repartir el dolor entre todos, incluido el que manda, o ajustar por la vía rápida sobre los de abajo.** El punto del libro no es que despedir esté mal en sí. Es que la forma en que una organización reparte el costo es el dato más honesto que da sobre sí misma, y todos lo leen, sobre todo los que se quedan.
:::

**Tres.** Llevado a tu escala, que no es la de una fábrica: ¿en qué situaciones chicas aparece la misma prueba?

:::Ver la respuesta
Cuando hay que trabajar un fin de semana y se decide quién va. Cuando una decisión de arriba cae mal y la defendés como propia o la entregás como ajena. Cuando se reparte algo bueno, como un proyecto visible o un reconocimiento. Son versiones chicas de la misma prueba, y el equipo las registra todas.
:::

Nadie recuerda el discurso de la reunión anual. Todos recuerdan qué pasó la vez que se puso difícil.

## Qué envejeció

**Los ejemplos de empresas que se salvan repartiendo el dolor.** Son relatos elegidos: se cuenta lo que salió bien y no las empresas que hicieron lo mismo y igual quebraron. Tomalos como ilustración de una idea, no como prueba de que funciona siempre. La prueba es sobre qué señal recibe la gente, no sobre si la empresa se salva.

**Lo que no dice.** El libro no te da una receta para decidir cuánto dolor repartir y cómo. Eso lo tenés que resolver vos con las condiciones reales de tu institución; el libro solo te avisa de que la gente va a mirar cómo lo hacés.

## Para ahora

Acordate de la última vez que algo se complicó de verdad en tu área. Escribí en una línea qué aprendió tu equipo sobre vos ese día. Si no te gusta lo que escribiste, tenés material para la próxima.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- fresco 1: contra que conviene leerlo ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Si lo tenés fresco no necesitás el resumen. Necesitás los libros que lo discuten, que es donde el tema se vuelve útil. Tres lecturas para ponerlo a prueba.

**Amy Edmondson, sobre seguridad psicológica.** Es la versión con investigación de la idea de Sinek, y llega a una conclusión que él casi no formula: la seguridad sola no produce nada. Su esquema cruza dos ejes, seguridad y exigencia, y da cuatro zonas.

- Seguridad alta, exigencia baja: zona de confort. Agradable, poco productiva.
- Seguridad baja, exigencia alta: zona de ansiedad. La gente se cubre.
- Seguridad baja, exigencia baja: zona de apatía.
- Las dos altas: zona de aprendizaje.

Sinek se queda casi entero en un eje.

**Andy Grove, en High Output Management.** El contrapunto duro. Grove pensaba la organización desde la producción medible y la obligación del jefe de aumentarla. No es incompatible con Sinek, pero obliga a una pregunta que el otro esquiva: ¿qué hacés con quien está adentro del círculo y no rinde?

**La crítica más dura**, que no está en ningún libro: Sinek describe condiciones, no mecanismos. Te deja convencido y sin saber qué hacer el lunes.

## Ubicá antes de ver

Tres equipos hipotéticos. Ubicá a cada uno en una de las cuatro zonas de Edmondson **antes** de abrir la respuesta.

1. Un equipo donde nadie discute nada en las reuniones, todos están de acuerdo, hace años que no se cambia un proceso y nadie recuerda un error reciente.
2. Un equipo con objetivos muy ambiciosos y revisión semanal de números, donde los errores se esconden hasta que ya no se pueden esconder.
3. Un equipo donde alguien puede decir "creo que esto está mal", se discute y se corrige, y a la vez los resultados se miran con rigor.

:::Ver la respuesta
**1 es confort, 2 es ansiedad, 3 es aprendizaje.**

**El 1 es confort**, no apatía: hay seguridad y ninguna exigencia que la ponga a prueba. Que nadie recuerde un error no significa que no los haya; significa que nadie los cuenta, o que no se busca nada que los produzca.

**El 2 es ansiedad.** La exigencia está, la seguridad no: el error se esconde porque mostrarlo cuesta. Esto es lo que Sinek describe, y Edmondson lo ubica con precisión.

**El 3 es aprendizaje**, porque las dos condiciones están a la vez. Y fijate que Sinek, solo, no lo explicaría completo: describe cómo se construye lo primero, pero la exigencia la pone Grove, o la pone Edmondson.
:::

## Qué te queda

**La síntesis que sirve:** Sinek te da el porqué y la imagen que te acordás. Edmondson te da el modelo con los dos ejes. Grove te da el filo: la obligación de que haya resultado. Cada uno solo es una media verdad; juntos son un sistema.

Una pregunta para llevarte, y no tiene respuesta fácil: si tuvieras que decir hoy en qué zona está tu equipo, ¿con qué evidencia lo dirías? No con qué impresión.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'leaders-eat-last');

-- ---------- fresco 2: aplicado a esta semana ----------
update book_pieces
set
  minutes = 7,
  body_md = $md$
Un ejercicio, no un resumen. Lleva veinte minutos y se hace una sola vez por trimestre. Antes de empezar, una pregunta para forzarte a recordar lo que leíste.

## Recuperación antes de aplicar

Respondé antes de abrir: según Sinek, ¿qué hace que alguien "esté adentro" del círculo en la práctica? ¿Es lo que figura en el organigrama?

:::Ver la respuesta
**No. Es lo que hace que la persona se sienta segura para avisarte de un problema.** El organigrama dice quién reporta a quién; el círculo lo definen la confianza y el costo que asume quien manda. Por eso el borde real casi nunca coincide con el formal, y es el que vas a dibujar en el primer paso.
:::

## El ejercicio

**Uno. Dibujá el borde real.** Escribí los nombres de tu equipo. Al lado de cada uno, respondé con honestidad: si esta persona se equivoca fuerte mañana, ¿me avisa a mí primero o trata de arreglarlo sola? Los que tratarían de arreglarlo solos están afuera del círculo, aunque figuren adentro del organigrama.

**Dos. Buscá la última vez que absorbiste un golpe.** Un momento concreto en el que podías haber señalado a alguien de tu equipo y no lo hiciste, hacia arriba o hacia afuera. Si no encontrás ninguno en los últimos tres meses, hay dos explicaciones posibles: no pasó nada malo, o el círculo no es tan sólido como te parece.

**Tres. Elegí el eje que te falta.** Con el modelo de Edmondson: ¿tu equipo está más cerca de la zona de confort (cómodos, poco exigidos) o de la de ansiedad (exigidos, cuidándose)? Según cuál sea, lo que tenés que subir es distinto, y subir el equivocado empeora las cosas.

**Cuatro, la única con consecuencia:** elegí una conversación de esta semana donde vayas a hacer algo distinto por esto. Una. Anotá cuál y con quién.

## Una vuelta más para probar el paso tres

Imaginá que en el paso uno te quedó que tres de cinco personas arreglarían el error solas. ¿Qué eje subirías primero y qué harías?

:::Ver la respuesta
**Seguridad primero.** Si la gente arregla sola para no avisarte, la señal es que avisarte cuesta. Subir la exigencia en ese momento sería agregar presión sobre un equipo que ya se está cubriendo, y vas a terminar en la zona de ansiedad.

Lo concreto: la próxima vez que alguien te cuente un error, respondé con "¿qué necesitás de mí?" antes que con cualquier juicio, y contá en voz alta un error propio reciente. Una vez que avisen temprano de forma estable, ahí sí subís la exigencia.
:::

Lo demás es filosofía de aeropuerto.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'leaders-eat-last');
