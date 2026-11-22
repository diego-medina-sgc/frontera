-- ============================================================
-- Frontera - los cuatro nodos que estaban vacíos
-- ============================================================
-- Los controles venían avisando hace días: cuatro nodos del mapa sin
-- una sola lección. Modelos y capacidades, IA para negocios, Construir
-- productos, Diseño y contenido. Son agujeros visibles: la persona abre
-- el mapa, ve el nodo, y no hay nada del otro lado.
--
-- Son 'frontera' y no 'fundamento': no van en orden dentro del track ni
-- caducan como el radar. Están ahí para quien tiene el nivel y le falta
-- ese nodo.
--
-- Nivel 2 a 4, que es el piso de los cuatro tópicos. Ninguna explica
-- qué es la IA: todas arrancan del error que comete alguien que ya la
-- usa todos los días, que es la única forma de no aburrir a quien ya
-- sabe.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published)
select v.slug, t.id, 'frontera', 2, 4, true
from (values
  ('fr-modelos',  'modelos'),
  ('fr-negocios', 'negocios'),
  ('fr-producto', 'producto'),
  ('fr-diseno',   'diseno')
) as v(slug, topico)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'El mejor modelo casi nunca es el que necesitás',
  'Tenés cinco o seis modelos a mano. La decisión no es cuál es mejor, y esa es justamente la pregunta que todo el mundo hace.',
$md$
Cada pocas semanas sale un modelo nuevo, alguien publica una tabla comparativa y cambia el orden. Si tu forma de decidir es mirar esa tabla, vas a estar cambiando de herramienta para siempre y no vas a trabajar mejor.

## El problema

Los modelos no se ordenan en una sola fila. Se mueven en cuatro ejes que no van juntos: **cuánto razonan**, **qué tan rápido contestan**, **cuánto texto les entra** y **cuánto salen**. El que gana en razonamiento es casi siempre el más lento y el más caro.

Usar ese para todo no es prolijidad, es desperdicio. Y al revés también: usar el rápido para la única tarea del día que de verdad necesitaba pensar es donde se pierden las horas, porque la respuesta vuelve mal y no te das cuenta hasta tres pasos después.

## Las cuatro preguntas

Antes de elegir, sobre la tarea concreta:

**¿Tiene una respuesta correcta o requiere criterio?** Extraer una fecha de un mail tiene respuesta correcta. Decidir si una queja amerita escalar, no. Lo primero no necesita el modelo caro; lo segundo sí.

**¿Cuánto texto entra de una?** Un mail son dos mil palabras. Un contrato con sus anexos son ochenta mil. Esa diferencia descarta modelos sola, antes de cualquier otra consideración.

**¿Cuántas veces por día?** Una vez por semana: usá el mejor y no lo pienses más. Cuatrocientas veces por día: ahí la diferencia de costo y de velocidad es el proyecto entero.

**¿Importa si tarda treinta segundos?** Si estás esperando mirando la pantalla, importa muchísimo. Si corre de noche sobre una lista, no importa nada y podés usar el más lento que exista.

## Lo que cambió

Hay una familia de modelos que piensa antes de responder: en vez de arrancar a escribir, gasta un rato armando el razonamiento y después contesta. En problemas de varios pasos —comparar tres propuestas contra cinco criterios, encontrar la inconsistencia en un presupuesto— la diferencia es grande y se nota.

En reformular un mail no hace nada. Es plata y tiempo por una tarea que no tiene pasos.

La regla práctica: **si vos resolverías la tarea con lápiz y papel haciendo anotaciones intermedias, usá uno que razone. Si la resolverías de corrido, no.**

## La trampa

El modelo que está abajo de tu herramienta cambia sin que nadie te avise. El mismo prompt, el mismo archivo, y la salida de noviembre no es la de marzo.

Si tenés algo armado que depende de que la respuesta venga con cierta forma —un JSON, una lista de cinco ítems, una clasificación entre tres opciones— eso se rompe en silencio. No tira error: devuelve otra cosa, con la misma seguridad.

Esa es la razón de fondo por la que existen los evals, que es otra lección. Acá alcanza con saber que el piso se mueve.

## Qué hacer esta semana

Anotá las tres cosas que más repetís con IA. Al lado de cada una, cuál de las cuatro preguntas manda.

Es muy probable que descubras que dos de las tres no necesitaban el modelo caro, y que la tercera lo necesitaba y no se lo estabas dando.
$md$,
  7, 'curado'
from lessons l where l.slug = 'fr-modelos'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'La prueba salió bien y no cambió nada',
  'Casi todo piloto de IA funciona. Casi ninguno termina siendo cómo se trabaja al día siguiente.',
$md$
El patrón se repite en todos lados y es tan parejo que da para sospechar que el problema no es de nadie en particular. Alguien prueba algo, funciona, lo muestra, todos quedan impresionados. Tres meses después se trabaja exactamente igual que antes.

No es falta de voluntad ni de presupuesto. Es que un piloto y un proceso prueban cosas distintas.

## Qué prueba un piloto

Prueba que el modelo puede hacer la tarea. Eso es todo, y casi siempre da que sí, porque la probaste vos, con los casos que elegiste, mirando la salida.

No prueba ninguna de las tres cosas que deciden si eso vive:

**Quién es dueño del resultado.** Si sale mal, ¿quién se hace cargo? Mientras la respuesta sea "el que lo probó", no escala, porque esa persona tiene otro trabajo.

**Qué pasa cuando sale mal.** No *si* sale mal: cuándo. Si no hay una respuesta, lo que hay es una apuesta a que no pase.

**De dónde salen los datos de entrada todos los días.** En el piloto los juntaste vos a mano. El lunes a las nueve, ¿quién los junta? Si la respuesta es una persona, el ahorro ya se fue.

## El cuello de botella nunca es el modelo

Esto es lo más contraintuitivo y lo más consistente: en los proyectos que fracasan, el modelo andaba bien. Lo que faltó fue el pegamento. Quién le pasa la entrada, quién mira la salida, qué pasa un domingo, dónde queda el registro de lo que hizo.

El pegamento es trabajo aburrido y no se demuestra en una reunión. Por eso no se planifica, y por eso se mueren los pilotos.

## La pregunta que ordena todo

**¿Qué tarea deja de hacer una persona, y cuántos minutos por semana son?**

Si no podés contestar eso en una oración, no tenés un proyecto: tenés una demo. Y está bien tener una demo, pero conviene llamarla por su nombre, porque a una demo no se le ponen tres meses de calendario.

## La trampa

Medir el piloto por el entusiasmo de la reunión. El entusiasmo es real y no predice nada.

Lo que predice es un número que se pueda contar antes y después: minutos por semana que desaparecieron, casos que dejaron de llegar a una persona, días que bajó un plazo. Si no lo podés contar antes de empezar, tampoco vas a poder después, y la discusión sobre si sirvió se va a decidir por quién habla más fuerte.

## Qué hacer esta semana

Elegí un proceso tuyo, de los que se repiten, y escribí tres líneas:

- quién lo hace hoy y cuánto tarda
- de dónde salen los datos de entrada
- qué pasa cuando el resultado está mal

La tercera es la que casi nadie puede llenar. Si a vos también te cuesta, ahí está el trabajo, y no en el modelo.
$md$,
  8, 'curado'
from lessons l where l.slug = 'fr-negocios'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Diseñar para cuando se equivoca',
  'Un producto con IA adentro acierta casi siempre. El diseño entero se juega en el casi.',
$md$
En software normal el error es un evento: algo falla, el sistema lo dice, aparece un cartel rojo. Vos diseñás el camino feliz y después manejás los errores, que vienen marcados.

Con un modelo adentro eso no existe. La salida equivocada tiene exactamente la misma forma que la correcta: igual de fluida, igual de segura, igual de plausible. Nadie levanta la mano.

## El error no se parece a un error

Esto cambia dónde está el trabajo de diseño. No alcanza con atrapar excepciones, porque no hay excepción: hay una respuesta normal que resulta ser falsa.

Y el costo no es el error en sí. Es que la persona no tiene forma de saber cuáles revisar, así que termina revisando todas —y entonces no ahorró nada— o no revisando ninguna, y ahí el error viaja.

## Las tres salidas

Lo que separa un producto que la gente usa de uno que probó una vez:

**Que se pueda ver de dónde salió.** La cita, el documento, la fila de la planilla, el mail original. No para que lo lean siempre: para que puedan chequear el que les hizo ruido en diez segundos en vez de en diez minutos.

**Que corregir sea más barato que hacerlo a mano.** Si arreglar una salida mala cuesta más que haberla escrito vos, el producto resta. Esto suena obvio y es donde se cae la mayoría: se diseña el camino de generar y no el de corregir.

**Que el sistema sepa cuándo no sabe.** Es la más difícil y la que más rinde.

## Lo contraintuitivo

Un producto que a veces dice "de esto no estoy seguro, miralo vos" genera más confianza que uno que contesta todo con la misma seguridad.

Parece al revés: mostrar duda parece mostrar debilidad. Pero la persona que usa la segunda versión aprende rápido que no puede confiar en nada, porque no tiene forma de distinguir. La que usa la primera aprende que cuando no hay aviso, puede avanzar.

Dicho de otra manera: **la confianza no se construye acertando más, se construye siendo predecible sobre cuándo podés fallar.**

## La trampa

Esconder que hay un modelo adentro para que la experiencia sea más mágica.

Funciona hasta la primera vez que se equivoca. Ahí la persona no tiene ningún modelo mental de por qué pasó, y la conclusión no es "esta respuesta estaba mal": es "esto no es confiable". Perdés la confianza en todo el producto por un caso, y no la recuperás explicando después.

## Qué hacer esta semana

Agarrá la cosa tuya que más usa otra gente y respondé una sola pregunta: **cuando el resultado está mal, ¿qué ve la persona?**

Si la respuesta es "nada, no se entera", eso es lo próximo que hay que construir, y es más importante que cualquier mejora de calidad que tengas en la lista.
$md$,
  8, 'curado'
from lessons l where l.slug = 'fr-producto'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Por qué se nota',
  'Todo el mundo reconoce un texto hecho con IA y casi nadie sabe explicar por qué. Entender el mecanismo es lo que te deja usarla sin que se note.',
$md$
El problema no es la calidad. Está bien escrito: la gramática es correcta, la estructura cierra, no hay repeticiones. Y aún así se nota, y la reacción de quien lo lee no es "esto está mal" sino algo peor, que es dejar de leer.

Vale la pena entender el mecanismo, porque la solución no es la que todo el mundo intenta.

## Qué hace un modelo cuando escribe

Devuelve lo más probable. Esa es la operación, y no es un defecto: es exactamente para lo que sirve.

Lo más probable es el promedio de todo lo que ya se escribió sobre el tema. Por eso el resultado es competente y anónimo al mismo tiempo. No tiene de dónde sacar lo que solamente vos sabés, porque eso no estaba en ningún lado cuando el modelo aprendió.

## Las marcas

Una vez que las ves, no las podés dejar de ver:

- **Todo viene de a tres.** Tres razones, tres beneficios, tres pasos. El mundo rara vez viene de a tres.
- **El párrafo que resume lo que acabás de leer**, justo antes de seguir.
- **Adjetivos que no eligen nada**: robusto, potente, innovador, clave. Sacalos y la oración dice lo mismo.
- **El cierre que levanta vuelo.** Las dos últimas líneas se ponen a hablar del futuro de la humanidad.
- **Ningún número propio.** Cifras redondas o ninguna.

## Dónde está el valor

En lo que el modelo no puede saber. El dato de tu operación. El ejemplo que te pasó el martes. La objeción que te hizo una persona concreta y cómo la resolviste. El número que sacaste de tu propia planilla.

Eso no está en internet, así que no está en el promedio. Y es, casi siempre, lo único que hace que el texto valga la pena.

## La forma de trabajo que funciona

Al revés de como lo hace casi todo el mundo.

**Mal:** pedirle el texto y después mejorarlo. Arrancás desde el promedio y todo lo que hacés es maquillarlo.

**Bien:** darle el material —tus notas crudas, desordenadas, el dato, la anécdota, la conversación que tuviste— y pedirle estructura y redacción sobre eso. El modelo hace lo que hace bien, que es ordenar y redactar. Vos ponés lo que no está en internet.

La diferencia en el resultado es enorme y no tiene nada que ver con el prompt.

## La trampa

Pedirle que "suene más humano" o "menos a IA".

No funciona, y vale entender por qué: le estás pidiendo más del mismo promedio con otra etiqueta encima. Va a cambiar el registro, meter alguna coloquialidad, acortar las oraciones. Sigue sin tener nada que decir que no estuviera ya dicho.

**Lo que hace humano a un texto es información, no tono.**

## Qué hacer esta semana

Agarrá el último texto que publicaste y marcá las partes que solamente podías escribir vos: un dato tuyo, un caso tuyo, una opinión que te puedan discutir.

Si no hay ninguna, el problema no era la IA. El texto no hacía falta.
$md$,
  7, 'curado'
from lessons l where l.slug = 'fr-diseno'
on conflict do nothing;
