-- ============================================================
-- Frontera - Made to Stick (Chip y Dan Heath), reescrito para que enseñe
-- ============================================================
-- Reemplaza el body de las 5 piezas de db/021_libro_heath.sql con la
-- estructura aprobada (idea, caso trabajado, borde, recuperación con
-- respuesta escondida, acción de la semana). Los casos son hipotéticos
-- y lo dicen. Síntesis propia con atribución; sin texto del libro.
-- ============================================================

update book_pieces
set
  minutes = 9,
  body_md = $md$
Chip y Dan Heath parten de una idea que explica casi todo lo que sigue en su libro:

**Cuando sabés algo, no podés reconstruir cómo se ve desde afuera.** Lo llaman la maldición del conocimiento. No es falta de talento ni de tiempo para explicar: es que, una vez que entendiste, ya no tenés acceso a la versión de vos que no entendía.

Ellos lo ilustran con un juego: una persona golpea con los dedos el ritmo de una canción conocida y otra tiene que adivinarla. Quien golpea oye la melodía completa en su cabeza y espera que sea fácil; quien escucha oye golpes sueltos. Lo que importa no es que el oyente falle, sino que **el que golpea no se entera de lo que le falta al otro**, porque lo que le falta es justo lo que él tiene.

## El caso trabajado

Un ejemplo inventado, pero reconocible. Una pieza de admisiones dice:

*"Nuestra propuesta educativa integral forma personas con pensamiento crítico, sólidos valores y excelencia académica, en un entorno bilingüe y contenedor."*

Para quien la escribió, cada palabra remite a algo que ve todos los días. Para una familia que visita tres colegios por semana, es la misma frase que ya leyó en los otros dos. Nada en ella se puede imaginar, y lo que no se puede imaginar no se recuerda ni se compara.

El movimiento no es usar palabras más simples. Es **bajar cada abstracción a una escena**. Preguntate: *¿qué hace un chico un martes cualquiera que sea la prueba de que esto es cierto?* Y escribís eso:

*"En cuarto año, los chicos arman un proyecto, lo presentan en inglés frente a gente de afuera del colegio y reciben preguntas que nadie les adelantó."*

(Escena hipotética: reemplazala por la real de tu colegio.) La segunda versión es más larga, usa palabras más concretas y no tiene ninguna palabra difícil. Una familia puede repetirla en la cena. La primera, no.

## Dónde no aplica

**Cuando el otro comparte tu contexto.** Entre dos personas de tu equipo que viven el tema, el lenguaje abstracto es una abreviatura legítima, y forzar el ejemplo es ruido. La maldición solo pega donde el contexto no se comparte.

**Cuando la escena concreta es una excepción.** Elegir el caso más vistoso y presentarlo como lo normal no es concretar, es engañar con buena puntería. La escena tiene que ser representativa.

**Cuando el mensaje es operativo.** "La reunión es el jueves a las 18 en el aula magna" ya es concreto. No hace falta un cuento.

## Probá que lo entendiste

Tres casos. Resolvelos antes de abrir la respuesta.

1. Clasificá cuáles de estas frases sufren la maldición y cuáles no: (a) "Acompañamos a cada alumno en su trayectoria"; (b) "Si tu hijo falta tres días seguidos, lo llamamos nosotros el cuarto"; (c) "Trabajamos con una mirada innovadora".

:::Ver la respuesta
**(a) y (c) sufren la maldición; (b) no.**

(a) y (c) son frases que el que las escribe completa con todo lo que sabe, y que el que las lee no puede completar con nada. Nadie podría decir qué haría distinto un colegio que acompaña de uno que no. Son intercambiables entre colegios, y esa es la señal.

(b) se puede imaginar, se puede verificar y se puede incumplir. Esas tres propiedades juntas son lo que hace concreta una frase: **una frase concreta es la que podría resultar falsa**.
:::

2. Reescribí esta frase para una familia que nunca pisó el colegio: *"Fomentamos la autonomía de nuestros estudiantes."* Escribí tu versión y después compará.

:::Ver la respuesta
No hay una única respuesta correcta, pero la buena sigue este camino: preguntar "¿qué hace un chico autónomo que uno pueda ver?". Por ejemplo: *"A partir de primer año, cada chico lleva su propia agenda y es quien le avisa a la preceptora cuando le falta entregar algo, antes de que se lo pidan."*

Qué mirar en tu versión: que tenga un sujeto que hace algo, que se pueda observar desde afuera y que tu colegio pueda sostener en la práctica. Si te quedó una frase con "promovemos", "fomentamos" o "acompañamos" adentro, volviste a abstracto.
:::

3. Vas a mandarle un mensaje a un docente que se suma al equipo la semana que viene. ¿A quién le es más difícil escribir bien ese mensaje: a la persona que lleva diez años en el colegio o a quien llegó hace tres meses? ¿Por qué?

:::Ver la respuesta
**A la que lleva diez años.** Quien llegó hace tres meses todavía recuerda qué no entendía, y esa memoria es justo la que le sirve para escribir. La de diez años sabe tanto que lo obvio le parece parte del aire.

Esto da una regla práctica: cuando tenés que explicarle algo a alguien nuevo, la persona del equipo con menos antigüedad es la mejor editora, no la más experta.
:::

## Qué hacer esta semana

Agarrá el próximo mensaje a familias que tengas que escribir. Antes de mandarlo, subrayá las dos frases más abstractas y reemplazá **una** por una escena que pase de verdad en el colegio. Después mostráselo a la persona más nueva del equipo y preguntale cuál es la primera cosa que no entendió.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'made-to-stick');

update book_pieces
set
  minutes = 9,
  body_md = $md$
Los Heath estudiaron qué tienen en común las ideas que la gente recuerda y repite, y las ordenaron en seis rasgos. La lectura útil no es la lista, sino la función de cada uno:

**Simple** quiere decir que tiene núcleo: una cosa que, si el otro se lleva solo esa, ya valió. **Inesperado** rompe una expectativa para captar atención y deja un hueco de curiosidad para sostenerla. **Concreto** se puede imaginar con los sentidos. **Creíble** da algo que el otro puede comprobar, en vez de pedirle que confíe. **Emocional** hace que le importe a alguien en particular, y no a un promedio. **Historias** le dan al otro una situación para ensayar en la cabeza.

La idea de fondo: **no son seis adornos, son seis formas de compensar que no podés volver a no saber lo que sabés.** Y el más importante, el que casi nadie hace, es el primero: decidir el núcleo antes de escribir.

## El caso trabajado

Un ejemplo hipotético. Hay que convocar a familias de sala de cuatro a una reunión informativa. El mail original:

*"Estimadas familias: Los invitamos a participar de la reunión informativa en la que abordaremos distintos aspectos de la propuesta pedagógica, la organización institucional, los espacios de comunicación y las novedades del ciclo. Contamos con su presencia."*

Diagnóstico. Hay cuatro temas y ninguno es el núcleo. Si preguntás "¿qué tiene que pasar en la cabeza de quien lo lee?", la respuesta honesta es "que venga", y el mail no le da ninguna razón. Entonces elegís el núcleo, y elegir es descartar: de los cuatro temas, ¿cuál es el que a una familia de sala de cuatro le importa de verdad? Supongamos que es **cómo es el primer mes de adaptación**.

Versión nueva:

*"Estimadas familias: el jueves a las 18 les vamos a mostrar cómo es, hora por hora, el primer mes de sus hijos en el colegio, incluido qué pasa si llora en la puerta. Lo vamos a hacer con una maestra que lo vive todos los años. Los otros temas los mandamos por escrito."*

Se aplicaron tres rasgos con un solo movimiento: **simple** (un único tema), **concreto** (hora por hora, llorar en la puerta) y **inesperado** (nadie suele prometer hablar de la parte incómoda). Las otras tres cosas quedaron afuera, y eso no es una pérdida: es lo que hizo que la convocatoria funcione.

## Dónde no aplica

**No hacen falta los seis.** Los Heath mismos dicen que con dos o tres bien hechos alcanza. Un mensaje que intenta los seis a la vez sale recargado, y es otra manera de perder el núcleo.

**No sirve para lo estrictamente informativo.** Una fecha de pago o un horario de salida piden claridad, no gancho. Hacer "pegajoso" un aviso de vencimiento es solo ruido.

**Memorable no es lo mismo que convincente.** Un mensaje puede quedar clavado y no mover a nadie, o moverlos en la dirección equivocada. Que se recuerde es condición, no resultado.

## Probá que lo entendiste

1. Cada defecto con su rasgo faltante. Unilo con el rasgo que lo arreglaría: (a) "Mejoramos continuamente nuestra comunicación con las familias"; (b) "Nuestros egresados tienen un excelente desempeño universitario"; (c) un mail con siete novedades y ninguna jerarquizada.

:::Ver la respuesta
**(a) falla en concreto; (b) en creíble; (c) en simple.**

(a) es una intención que no se puede ver. Se arregla con algo como "desde marzo, cualquier consulta a administración se responde en el día hábil o te avisamos por qué no".

(b) es una afirmación que pide fe. Se arregla dándole al lector algo que pueda verificar: qué porcentaje, de qué cohorte, medido cómo, o un recorrido de egresados que cualquiera podría chequear.

(c) no tiene núcleo. Se arregla con una decisión, no con una redacción: elegir la novedad que, si fuera la única que se lleva la familia, ya justificó el mail, y mandar el resto aparte.
:::

2. Escribí el núcleo, en una sola línea, de este aviso: *"Informamos que a partir del próximo ciclo se modificará la política de recuperación de clases perdidas por inasistencia, contemplando nuevos criterios y plazos."* Imaginá que lo único que a la familia le importa es qué le va a pasar a su hijo si falta.

:::Ver la respuesta
Una posible: ***"Si tu hijo falta, vas a tener tres semanas para ponerlo al día, y la maestra te va a decir cómo."***

(Los datos concretos —tres semanas, quién avisa— son un supuesto del ejemplo: usá los reales.) Fijate que la línea no es un resumen del aviso original, es una **elección**: el original hablaba de "criterios y plazos" y la línea los volvió algo que le pasa a un chico en particular. Ese salto de política a consecuencia es el trabajo central.
:::

3. Dos alternativas para abrir una presentación a un Board: (i) arrancar con la conclusión ("recomendamos ampliar la inversión en captación"); (ii) arrancar con una pregunta que el Board no sabe contestar ("¿cuántas familias que nos visitaron en octubre se anotaron en otro colegio, y por qué?"). ¿Cuál abre más atención y por qué?

:::Ver la respuesta
**La (ii), en general.** Según los Heath, la curiosidad nace al señalar un hueco entre lo que alguien sabe y lo que le gustaría saber. La conclusión primera cierra el hueco antes de abrirlo: el Board ya sabe adónde vas y puede desconectarse.

Condición: el hueco tiene que ser real y tiene que importarle a quien escucha. Una pregunta de la que el Board ya conoce la respuesta, o que no le importa, es solo un truco.
:::

## Qué hacer esta semana

Antes de escribir el próximo mensaje importante, **escribí una sola línea con su núcleo**, que diga qué tiene que quedar en la cabeza del lector si no se lleva nada más. Después escribí el mensaje. Si no podés escribir la línea, no sigas con el mensaje: todavía no sabés qué querés decir.
$md$
where idx = 2
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'made-to-stick');

update book_pieces
set
  minutes = 8,
  title = 'Pegajoso no es lo mismo que verdadero',
  body_md = $md$
Hay una idea que importa más que cualquiera de las del libro, y los Heath la muestran sin proponérselo:

**Las técnicas para que algo quede funcionan igual de bien con una idea verdadera que con una falsa.** Entre sus mejores ejemplos de ideas pegajosas hay leyendas urbanas: concretas, inesperadas, emotivas, con historia, y falsas. Hacer que algo quede es una habilidad sin contenido moral propio. Que lo que quede sea cierto depende de quien comunica.

Para alguien que escribe institucionalmente, eso es una responsabilidad de oficio, no una nota al pie.

## El caso trabajado

Un ejemplo hipotético. Un colegio quiere mostrar que sus egresados llegan bien a la universidad. Tiene la historia de una chica: primera de su familia en estudiar, ingresó a una carrera muy exigente, hoy trabaja en lo que soñaba. La historia es real, vívida y emocional, y hace exactamente lo que el libro recomienda.

Versión que falla:

*"Así son nuestros egresados: Lucía llegó sin saber si podía y hoy es [profesión]. Eso es lo que logramos todos los años."*

La última frase es el problema. Una historia verdadera, presentada como lo habitual, afirma sin decirlo algo que no se sostiene: que lo típico es Lucía. Funciona muy bien, porque es pegajosa, y por eso es la versión peligrosa.

Versión que corrige:

*"Esta es la historia de Lucía. Es una de las que más nos orgullece, no la más común. Si querés saber cómo les va a la mayoría de nuestros egresados, acá están los datos de las últimas cinco promociones."*

Perdió un poco de brillo y ganó lo que sostiene todo lo demás: **que la próxima vez que cuentes algo, te crean**. La credibilidad se gasta una sola vez, y se gasta rápido.

## Dónde no aplica

Hay dos lecturas exageradas de este reparo.

**No significa dudar de todo el libro.** Que el método tenga defectos no vuelve falsa la idea de que lo concreto se recuerda mejor que lo abstracto. Por un lado, el libro estudia ideas que sobrevivieron y busca qué tienen en común, sin mirar las muchas que cumplían los mismos rasgos y se olvidaron. Eso vuelve los seis rasgos una buena heurística, no una ley demostrada. Por otro, algunos de los experimentos que cita son de una época cuyos resultados la psicología después revisó con más cautela. Usalos como orientación, no como cita de ciencia dura.

**No significa no contar casos.** Un caso individual, bien presentado como individual, es honesto y es eficaz. El problema aparece cuando el caso se disfraza de tendencia.

## Probá que lo entendiste

1. Un colegio cuenta, con la autorización de la familia, el caso real de un alumno con muchas dificultades que revirtió su año. El texto termina: "Esto es lo que hacemos con cada chico". ¿Qué está mal y cómo lo arreglás?

:::Ver la respuesta
Lo que está mal no es el caso, es la última frase: convierte un resultado excepcional en una promesa general, y las familias que lean eso van a esperar lo mismo para su hijo.

Arreglo: cambiar la promesa por una descripción de lo que el colegio hace de verdad, que sí es general: *"No siempre sale así. Lo que sí hacemos con cada chico es [acción concreta y verificable]"*. Se puede cumplir, y si no se cumple, la familia lo ve.
:::

2. Decidí: ¿cuál de estas dos versiones pasaría una revisión honesta? (a) "El 90% de las familias recomienda el colegio", sin decir cómo se midió ni cuántas respondieron. (b) "De las 40 familias que respondieron la encuesta de este año, 36 dijeron que lo recomendarían. Respondió menos de la mitad."

:::Ver la respuesta
**La (b).** Es más específica, dice cuánta gente respondió y reconoce el límite. La (a) puede ser exactamente el mismo dato y aun así engañar, porque oculta el denominador.

(Las cifras del ejemplo son inventadas.) Regla práctica: si un número se vería distinto cuando se conoce de dónde salió, el número no está listo para publicarse.
:::

3. Una colega dice: "Si lo que cuento es verdad pero lo cuento de la manera más emocional posible, ya cumplí". ¿Qué le responderías?

:::Ver la respuesta
Que **verdadero en cada frase no es lo mismo que verdadero en el conjunto**. Se puede armar un mensaje engañoso con puras frases ciertas, eligiendo cuáles contar y cuáles callar.

La prueba útil es preguntarle a quien lo lee, después: "¿qué pensás que pasa en general en el colegio?". Si lo que contesta es más optimista que lo que sabés vos, el mensaje funcionó y fue deshonesto.
:::

## Qué hacer esta semana

Elegí **una afirmación** de tu material de admisiones actual (una cifra, un caso, un adjetivo fuerte) y escribí al lado de dónde sale y cómo se midió. Si no podés completar esa línea, reescribila o sacala. No hace falta auditar todo: una alcanza para ver cuánto se sostiene.
$md$
where idx = 3
  and lang = 'es'
  and for_read_state = 'no_lei'
  and book_id = (select id from books where slug = 'made-to-stick');

update book_pieces
set
  minutes = 9,
  body_md = $md$
Antes de ver nada, intentá reconstruir lo que te quedó. Tomate un minuto por pregunta y contestala **en voz alta o por escrito, antes de abrir la respuesta**. Lo que no te salga es lo que vale la pena releer.

## Primero, reconstruí

**1. Los seis rasgos de las ideas que pegan.** ¿Los podés nombrar y decir, de cada uno, qué trabajo hace?

:::Ver la respuesta
Los seis, en la lectura de los Heath: **simple** (un núcleo), **inesperado** (rompe una expectativa y abre un hueco de curiosidad), **concreto** (se puede imaginar), **creíble** (el otro puede comprobarlo), **emocional** (le importa a alguien) e **historias** (le dan algo para ensayar mentalmente).

Si solo recordabas los nombres, te quedó la lista sin el motor. El motor es que cada rasgo compensa una manera distinta de que el otro no pueda reconstruir lo que vos ya sabés.
:::

**2. Simple no es lo mismo que corto, y concreto no es lo mismo que simple. ¿Qué distingue a cada par?**

:::Ver la respuesta
**Simple, en el libro, es nuclear**: tiene un centro, y el resto está subordinado. Puede ser corto o no. **Concreto** es otra dimensión: se puede percibir con los sentidos. Un concepto puede ser simple y abstracto ("mejoramos la calidad") y no se recuerda, o complejo y concreto (una escena con varios personajes) y se recuerda bien.

Encontrar el núcleo exige **sacrificar cosas verdaderas e importantes**. Si no te dolió descartar, probablemente no lo encontraste.
:::

**3. ¿Cuál es la causa que, según el libro, está debajo de casi toda la mala comunicación?**

:::Ver la respuesta
**La maldición del conocimiento**: una vez que sabés, no podés reconstruir cómo se ve sin saber. Los seis rasgos son en gran parte formas de compensarla. Quien golpea el ritmo oye la canción entera, y el que escucha solo recibe golpes.
:::

**4. Una de las ideas del libro dice cómo conseguir que el otro se interese. ¿Cómo se abre la curiosidad?**

:::Ver la respuesta
Señalando **un hueco entre lo que el otro sabe y lo que ahora querría saber**. No con un dato nuevo, sino con una pregunta que no puede contestar y que le importa. Dar la conclusión primero cierra el hueco y apaga el interés.
:::

## Qué envejeció

Pasaron casi veinte años desde la publicación, y conviene separar lo que se sostuvo de lo que no.

**Se sostiene:** la idea central. Que lo concreto se recuerda más que lo abstracto y que quien sabe mucho subestima la distancia con quien no sabe es consistente con casi toda la experiencia de comunicar.

**Envejeció la base de evidencia.** El libro estudia ideas que sobrevivieron y no las que se olvidaron, y varios experimentos de la época fueron revisados con más cautela después. Los seis rasgos quedan mejor como herramienta práctica que como ley demostrada.

**Cambió el contexto en el que lo aplicás.** Hoy un borrador sale en segundos, y es probable que el texto que te propone una herramienta de IA sea el más promedio posible: correcto, ordenado y abstracto. Eso es, en versión automática, lo que el libro describe como el problema. (Es una observación mía, no del libro: la podés probar con tus propios borradores.) El antídoto sigue siendo el que el libro propone y la máquina no puede darte sola: **el núcleo y la escena concreta salen de lo que vos sabés y que no está en el borrador.**

## Qué hacer esta semana

Pedile a la IA que redacte un comunicado cualquiera para familias. Marcá las tres frases más abstractas y reemplazalas por algo que solo vos sabés del colegio: una escena real, un número que se pueda imaginar. Anotá cuánto cambió el texto. Ese es el valor que agregás vos.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'hace_tiempo'
  and book_id = (select id from books where slug = 'made-to-stick');

update book_pieces
set
  minutes = 9,
  body_md = $md$
Si lo tenés fresco, el valor está en cruzarlo con otro libro de esta biblioteca: *Obviously Awesome*, de April Dunford. Los dos hablan de comunicar, pero responden preguntas distintas.

**Heath responde "cómo lo digo para que quede". Dunford responde "contra qué me van a comparar".** El orden importa: un mensaje impecablemente pegajoso dentro del marco equivocado hace que la gente recuerde con precisión algo que no le interesa.

La secuencia útil es **Dunford primero, Heath después**. Primero elegís contra qué querés que te comparen; después hacés que quede. Casi todos hacemos el orden inverso: pulimos la redacción y nunca discutimos el marco.

## Probá si lo conectaste

Tres situaciones. Decidí antes de abrir cada respuesta.

1. Tu colegio tiene un mensaje muy bien escrito sobre "una educación personalizada". Las familias lo recuerdan, pero al comparar eligen otro colegio con "más horas de inglés". ¿Falló la redacción o el marco?

:::Ver la respuesta
**El marco**, muy probablemente. Si el mensaje quedó (Heath funcionó) pero las familias lo comparan contra otro criterio, el problema no es que no se acuerden: es que lo recuerdan **dentro de una categoría que no te favorece**.

Antes de reescribir, la pregunta de Dunford: ¿qué alternativa tiene la familia en la cabeza cuando nos mira? Si compara contra "más horas de inglés", o cambiás ese eje con una evidencia concreta, o dejás de competir en él. Retocar la frase no resuelve eso.
:::

2. Tenés el siguiente texto: *"Un colegio diferente para chicos que piensan distinto."* Tiene tres defectos desde el punto de vista del libro. ¿Cuáles?

:::Ver la respuesta
Los tres que más se ven: **no es concreto** (¿qué hace distinto?), **no es creíble** (no hay nada que verificar) y **no tiene núcleo identificable** (¿diferente en qué, para quién?). Además, cualquier colegio puede decirlo, y eso es la señal de la maldición: lo escribe alguien que ya sabe a qué se refiere.

Atención al orden: arreglar estos tres sin haber definido contra qué se compara sería pulir una frase que quizá no tendría que estar.
:::

3. Un compañero propone ponerle emoción a una cifra: "Cada año, más de cien familias nos eligen" se convierte en una historia de una sola familia. ¿Cuándo es buena idea y cuándo no?

:::Ver la respuesta
**Buena idea** cuando el caso es representativo, está dicho como un caso, y la cifra queda disponible para quien la quiera ver. Los Heath sostienen que una persona identificable moviliza más que una cantidad, y es un hallazgo sólido.

**Mala idea** si el caso reemplaza a la cifra o se presenta como lo típico, porque estás usando la emoción para tapar lo que el número dice.
:::

## El ejercicio

Elegí **el mensaje que más veces tuviste que repetir** este año: el que explicaste cinco veces y cinco veces volvieron a preguntar lo mismo.

**Uno.** Escribí su núcleo en una línea. Si te salen dos, todavía no elegiste.

**Dos.** Marcá lo abstracto y reemplazá **una sola** cosa por algo concreto: un caso, un número que se pueda imaginar. Una sola, para ver el efecto aislado.

**Tres.** Buscá la expectativa que podrías romper. Si tu mensaje confirma lo que el otro ya suponía, no tiene por dónde entrar.

**Cuatro.** Contáselo a alguien que no sepa del tema y pedile que te lo repita **al día siguiente**. Lo que te devuelva es tu mensaje real.

Y un paso opcional con IA: pegale a un asistente solo la versión nueva y pedile que te diga qué entendió, sin darle contexto. Es una forma rápida de simular a quien lee sin saber lo que vos sabés, aunque no reemplaza la prueba con una persona.
$md$
where idx = 1
  and lang = 'es'
  and for_read_state = 'fresco'
  and book_id = (select id from books where slug = 'made-to-stick');
