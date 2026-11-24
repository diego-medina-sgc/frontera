-- ============================================================
-- 058 · Frontera: cuatro lecciones para el hueco del nivel 3
-- ============================================================
-- Simulado el 24/11 con el catálogo real: a alguien de nivel 3 la app
-- tenía material para ocho días. El hueco de ese nivel es medir,
-- evaluar y dejar trabajo corriendo solo, y lo cubrían dos lecciones
-- introductorias (fr-evals, fr-asincronico). Estas cuatro siguen
-- donde aquellas terminan, con la estructura aprobada el 22/11: la
-- idea, el caso trabajado con números, el borde, la recuperación con
-- la respuesta escondida y qué hacer esta semana.
--
--   evals:       fr-errores  → fr-juez
--   asincronico: fr-paralelo → fr-avisos
--
-- created_at va fechado ANTES de fr-evals y fr-asincronico a
-- propósito: en frontera el ruteo sirve primero lo más nuevo, y estas
-- tienen que llegar después de la introducción de su tema. Cada una
-- igual se sostiene sola si llega primero.
--
-- La versión en inglés está en la 059.
-- ============================================================

insert into lessons (slug, topic_id, kind, level_floor, level_ceiling, published, created_at)
select v.slug, t.id, 'frontera', 3, 4, true, v.creada::timestamptz
from (values
  ('fr-errores',  'evals',       '2026-11-20 12:00:00+00'),
  ('fr-juez',     'evals',       '2026-11-20 11:00:00+00'),
  ('fr-paralelo', 'asincronico', '2026-11-20 10:00:00+00'),
  ('fr-avisos',   'asincronico', '2026-11-20 09:00:00+00')
) as v(slug, topico, creada)
join topics t on t.slug = v.topico
on conflict (slug) do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Antes de medir, mirá',
  'Los casos que se te ocurren a vos no son los que fallan. Los que fallan se encuentran leyendo.',
$md$
Cuando alguien arma su primer conjunto de casos de prueba, lo arma con lo que **se imagina** que puede fallar. Es razonable y casi siempre está mal: lo que se te ocurre que puede salir mal y lo que sale mal de verdad se parecen poco.

La idea de esta lección es una sola: **antes de medir, se lee.** Leer muchas salidas reales, anotar qué está mal en cada una con tus palabras, agrupar y contar. Ese conteo te dice qué arreglar primero y qué casos poner en tu prueba. Sin él, arreglás lo que más te molesta, que no es lo mismo que lo que más pasa.

## El caso, con números

Un colegio tiene un sistema que lee las consultas que entran por la web, las clasifica en cuatro tipos y deja un borrador de respuesta. Funciona. Nadie se quejó. La persona que lo armó se sienta una tarde con las **60 salidas de la última semana**.

Regla de la lectura: una línea por salida que tenga algo mal, en palabras propias, **sin categorías armadas de antemano**. Las categorías salen después, de las líneas.

Resultado: **14 de 60 tienen algún problema**, casi una de cada cuatro. Al agrupar las líneas aparecen cuatro grupos:

- **7** confunden "quiero visitar" con "quiero inscribir" cuando la consulta menciona una fecha.
- **4** contestan con el arancel del año pasado.
- **2** tienen un tono demasiado formal.
- **1** firma con el nombre de una persona que no existe.

Ahora la cuenta. Lo que a ella le molestaba al leer los borradores era el tono, y eso es lo que pensaba arreglar. El tono son **2 de 14**: un 14% de los problemas. Los dos primeros grupos juntos son **11 de 14**, el 79%.

Y el conteo dice algo más: el arancel viejo **no es un problema de instrucciones**. Ningún prompt arregla un dato desactualizado: hay que cambiar el dato que el sistema lee. Sin leer, se habría pasado una semana ajustando la instrucción.

Recién ahora tiene sentido armar la prueba: los casos tienen que incluir consultas con fechas, consultas sobre aranceles y alguna donde haga falta firmar. Son los que fallan.

## Dónde no aplica

**Con pocas salidas no hay patrón.** Con diez, cualquier grupo es casualidad. Por debajo de treinta, conviene esperar a juntar más antes de sacar conclusiones.

**La frecuencia no es lo único.** El nombre inventado es **1 de 14** y es lo más grave de la lista: un mail a una familia firmado por alguien que no existe. El conteo ordena por cuánto pasa; la gravedad se suma después, a mano. Un error raro y caro puede ir primero.

**No le delegues la primera lectura a otra IA.** Más adelante se puede automatizar la corrección, pero la primera lectura es donde vos descubrís qué significa "bien" para este sistema. Si la delegás, delegás también esa definición.

## Probá que lo entendiste

Leíste **50 resúmenes** que hace un sistema después de cada reunión. **12** tienen problemas:

- 6 se olvidan de las decisiones que se tomaron al final.
- 3 le asignan una tarea a la persona equivocada.
- 3 son demasiado largos.

¿Qué arreglás primero? Pensalo antes de abrir.

:::Ver la respuesta
**Depende de adónde van los resúmenes, y esa es la respuesta.**

Por frecuencia, ganan las decisiones olvidadas: son la mitad de los problemas (6 de 12) y además suelen tener una sola causa, porque lo último de la reunión es lo que el sistema lee con menos cuidado.

Pero si los resúmenes **se mandan a todos los participantes**, la tarea mal asignada puede ir primero aunque sea la mitad de frecuente: alguien deja de hacer algo porque el resumen dijo que le tocaba a otro, y nadie se entera hasta la reunión siguiente.

El largo va último en cualquier caso. Molesta, pero no hace que nadie haga algo mal.
:::

## Qué hacer esta semana

Elegí el sistema tuyo que más se usa. Juntá **las últimas 30 a 50 salidas reales**. Una línea por cada una que tenga algo mal, con tus palabras. Después agrupá y contá.

Lleva unos 45 minutos. Al final tenés dos cosas que antes no tenías: qué arreglar primero, y la lista de casos que tu prueba tiene que tener sí o sí.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-errores'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Cuando la respuesta correcta no es una sola',
  'Una planilla de casos sirve cuando la respuesta se puede comparar. Para un texto, hace falta un corrector, y al corrector también hay que probarlo.',
$md$
Una prueba con la respuesta correcta al lado funciona perfecto cuando la respuesta es una sola: la categoría era "visita" o no lo era. Pero buena parte de lo que hace una IA es escribir, y un borrador de mail no tiene una respuesta correcta. Tiene muchas aceptables y muchas malas.

Para eso se usa **otra IA como correctora**. La idea tiene dos partes, y la segunda es la que casi todo el mundo se saltea:

1. Al corrector no se le pide una nota: se le hacen **preguntas de sí o no**, una por criterio.
2. Antes de confiarle nada, **se compara su corrección con la tuya**, caso por caso, y se cuenta en cuántos coinciden.

## Por qué sí o no y no del 1 al 10

Un 7 no te dice qué arreglar. Y si corrés dos veces el mismo texto, el mismo corrector te puede dar un 6 y un 8. Una pregunta de sí o no, en cambio, se puede contar: "en 31 de 200 borradores falta el próximo paso" es un dato con el que se trabaja. "El promedio es 7,2" no.

## El caso, con números

Borradores de respuesta a consultas de familias. Tres preguntas:

- ¿Responde lo que la familia preguntó?
- ¿Incluye algún dato que no está en la información del colegio?
- ¿Propone un próximo paso concreto?

**Calibración.** Corregís vos **30 borradores** con las tres preguntas. El corrector corrige los mismos 30. Se compara pregunta por pregunta:

- "¿Responde lo que preguntó?": coinciden en **28 de 30**, el 93%. Sirve.
- "¿Incluye algún dato que no está?": coinciden en **22 de 30**, el 73%. No sirve.

Mirando los 8 desacuerdos aparece la causa: **el corrector no tenía la información del colegio.** No puede saber si un dato es inventado si no sabe cuál es el verdadero. Se la pasás junto con el borrador, corrés de nuevo y coinciden en **27 de 30**, el 90%.

Ahora sí. Corregir a mano te llevó unos 2 minutos por borrador: los 30 fueron una hora. Corregir 200 a mano serían más de seis horas y media. Con el corrector calibrado son minutos, y lo podés repetir cada vez que cambiás algo.

## Dónde no aplica

**Si escribe y corrige el mismo modelo con las mismas instrucciones, se aprueba solo.** Comparten los mismos puntos ciegos. El corrector necesita instrucciones propias, escritas para encontrar fallas, no para producir.

**No verifica lo que no puede ver.** Como en el caso: si la pregunta depende de un dato, el dato tiene que estar en lo que recibe. Si no, adivina con mucha seguridad.

**Se recalibra.** Cuando cambia el modelo o cambiás las preguntas, el 90% de antes no vale. Son 30 casos otra vez, que ya tenés corregidos.

**No reemplaza leer.** Sirve para corregir en cantidad lo que **vos ya sabés corregir**. Si todavía no sabés qué es un buen borrador, el corrector va a aplicar con mucha prolijidad un criterio que no existe.

## Probá que lo entendiste

¿Cuál de estas tres preguntas le darías tal como está a un corrector? ¿Qué harías con las otras dos?

1. "¿El mail es bueno?"
2. "¿Menciona la fecha de visita que la familia pidió en su consulta?"
3. "Puntuá del 1 al 10 qué tan cálido es el tono."

:::Ver la respuesta
**La 2, tal como está.** Es de sí o no, se puede verificar con lo que el corrector recibe (la consulta y el borrador) y dos personas distintas contestarían lo mismo.

**La 1 hay que partirla.** "Bueno" son cinco cosas distintas mezcladas. Escribí qué mirás vos cuando decidís que un mail es bueno y convertí cada cosa en una pregunta propia.

**La 3 hay que pasarla a sí o no**, describiendo qué es "cálido" en algo observable: "¿Saluda a la familia por su nombre?", "¿Agradece la consulta antes de responder?". Si no podés describirlo en algo que se vea, el corrector tampoco va a poder.
:::

## Qué hacer esta semana

Tomá **un criterio que hoy revisás a mano** y escribilo como pregunta de sí o no. Corregí vos 20 casos. Que el corrector corrija los mismos 20. Contá en cuántos coinciden.

Si coinciden en menos de 18, no cambies de herramienta: casi siempre el problema está en la pregunta, o en algo que el corrector necesitaba ver y no le diste.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-juez'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Dos semanas en paralelo antes de soltarlo',
  'El salto de "lo disparo yo" a "corre solo" no se da de golpe. Se da corriendo en sombra, con el número decidido de antemano.',
$md$
Pasar algo de "lo hago yo con la IA" a "corre solo todos los días" es el salto que más cambia lo que produce alguien. También es el que más sale mal, y casi siempre por la misma razón: se suelta de golpe, sin saber cuánto se equivoca.

La forma segura tiene nombre: **correr en sombra.** La tarea programada corre todos los días y deja su resultado **al lado del tuyo**, sin que nadie lo use. Vos seguís haciendo el trabajo como siempre. Al final comparás. Recién con ese número decidís si lo soltás.

Y hay una regla que hace que funcione: **el número que te alcanza se escribe antes de empezar.** Si lo decidís después de ver el resultado, siempre te va a parecer suficiente.

## El caso, con números

Todas las mañanas alguien clasifica las consultas que entraron el día anterior: información general, visita, inscripción, beca. Son unas 15 por día.

**Antes de empezar**, una línea: *"Lo suelto si coincide conmigo en el 90% o más y no hay más de un error caro por semana."*

Dos semanas en sombra: 10 días hábiles, **150 consultas**. El sistema coincide en **138**, el 92%. Pasa el primer número.

Pero los 12 desacuerdos no valen lo mismo:

- **9** son "información general" contra "visita". Error barato: quien atiende lo nota y lo reclasifica en un segundo.
- **3** son pedidos de beca clasificados como información general. Error caro: se contestan días más tarde, y es justo la familia para la que más importa.

Tres errores caros en dos semanas es más de uno por semana: no pasa el segundo número. Pero el conteo también dice cómo arreglarlo: **todo lo que mencione beca, arancel o descuento va a revisión humana**, siempre. Con esa regla, de esos 150 casos no habría quedado ningún error caro, y el sistema se queda con el resto del trabajo.

Sin las dos semanas, se habría soltado con un 92% que parecía excelente.

## Lo que tiene que tener algo que corre solo

**Deja el resultado siempre en el mismo lugar.** Una planilla, una carpeta, un documento. No donde caiga.

**Deja constancia de cada corrida.** Cuándo corrió y cuántas cosas procesó. Una línea alcanza.

**Te enterás si no corrió.** Es la falla más traicionera: si mañana no hay nada, ¿es que no entraron consultas o que se cayó? Lo que corre solo tiene que dejar algo también cuando no encontró nada, para que el silencio signifique algo.

## Dónde no aplica

**Lo que sale hacia afuera no se suelta nunca del todo.** Un mail a una familia, una publicación, un pago: el sistema prepara, una persona aprieta enviar. El paralelo sirve para saber cuánto confiar en el borrador, no para sacar a la persona.

**Con poco volumen, dos semanas no dicen nada.** Si entran tres casos por semana, en dos semanas tenés seis, y seis aciertos de seis no prueban nada. Lo que hace falta es una cantidad de casos, no de días: alrededor de cien.

**No se corre en sombra lo urgente.** Mientras dura el paralelo, el trabajo lo seguís haciendo vos. Si no podés sostener eso dos semanas, no es el momento.

## Probá que lo entendiste

Tres situaciones después de dos semanas en paralelo. ¿Soltarlo, seguir en paralelo o cambiar algo antes?

1. Coincide en el 96%, y todos los errores son etiquetas menores que nadie usa para decidir nada.
2. Coincide en el 97%, pero el 3% restante son mails a familias con la fecha de la entrevista equivocada.
3. Coincide en el 85%, sobre 6 casos en total.

:::Ver la respuesta
**1. Soltarlo.** Pasa el número y los errores son baratos. Seguir en paralelo es trabajo doble sin información nueva.

**2. No así.** El porcentaje es más alto que el del 1 y el caso es peor, porque el error es caro y sale hacia afuera. Una persona revisa todos los mails antes de salir, o al menos todos los que llevan una fecha.

**3. Seguir en paralelo.** Con seis casos el 85% no significa nada: es un error. Hacen falta más casos antes de decidir, para bien o para mal.
:::

## Qué hacer esta semana

Elegí una tarea que hacés todos los días o todas las semanas. Antes de tocar nada, escribí **en una línea** qué número te alcanza para soltarla y qué cuenta como error caro.

Después armá la corrida en sombra. Esa línea escrita antes es la que te va a proteger de tu propio entusiasmo dentro de dos semanas.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-paralelo'
on conflict do nothing;

-- ------------------------------------------------------------
insert into lesson_contents (lesson_id, lang, tool_id, title, hook, body_md, minutes, generated_by)
select l.id, 'es', null,
  'Un aviso que se ignora es peor que ninguno',
  'Lo que decide si algo que vigila por vos sirve no es cuánto encuentra. Es cuántos de sus avisos valen la pena.',
$md$
El escalón más alto del trabajo que corre solo es el que decide **si vale la pena molestarte**. Y ahí hay una trampa que casi todo el mundo pisa: medir lo que encuentra en vez de medir lo que avisa.

La idea es una sola: **si de cada diez avisos te sirven dos, en tres semanas dejás de mirarlos.** Y el día que llega el que importa, no lo ves. Un sistema que avisa de más no es un sistema exigente: es un sistema que te entrenó para ignorarlo.

Por eso a cualquier cosa que te avisa se le miran **dos números**, y subir uno baja el otro:

- **De lo que te avisó, cuánto valía la pena.**
- **De lo que valía la pena, cuánto te avisó.**

## El caso, con números

Alguien arma un vigía que revisa todos los días doce fuentes: los sitios de otros colegios y las novedades del ministerio. Le avisa cualquier cambio.

**Primera semana: 25 avisos.** Tres valían la pena: un colegio cambió sus fechas de inscripción, otro publicó aranceles nuevos y el ministerio cambió un requisito. Los otros 22 fueron un banner nuevo, una foto cambiada, una noticia del acto. **3 de 25 es un 12%.** A ese ritmo, en un mes no lo abre nadie.

Tres cambios en la regla:

- Avisar sólo cambios en **fechas, aranceles y requisitos**, no en cualquier parte de la página.
- **Un solo resumen por día**, no un aviso por cambio.
- Cada aviso dice **por qué te lo manda** y qué cambiaría para vos.

**Tercera semana: 4 avisos, 3 útiles.** El 75%.

Falta el otro número. Esa semana se revisan las doce fuentes a mano una vez, para comparar. Hubo **4 cambios importantes** y el vigía avisó **3**: se le pasó uno, un requisito que cambió en un documento adjunto que no lee. Es decir: avisa poco y casi todo sirve, pero se le escapa uno de cada cuatro.

¿Está bien? Depende de qué cuesta perder ese uno, y esa es la decisión que nadie toma por vos. Lo que sí está claro es que la primera semana encontraba más y servía menos.

## Dónde no aplica

**Para lo grave y raro, al revés.** Si lo que vigilás es un error en datos de pago o una inscripción duplicada antes de facturar, preferís avisos de más: uno falso te cuesta un minuto; uno perdido, mucho más. La regla de "pocos y buenos" es para lo frecuente y barato.

**No conviene mezclar los dos en el mismo canal.** Si lo urgente llega en el mismo lugar que lo curioso, termina ignorado junto con lo curioso. Dos canales: uno que casi nunca suena y siempre se mira, y uno que se puede no leer.

**Lo que no llega a aviso no se guarda para después.** Si armás un "resumen de todo lo demás", que se pise cada semana. Si se acumula, armaste otra bandeja de entrada.

## Probá que lo entendiste

Para cada caso, ¿qué cuidás más: que lo que te avisa valga la pena, o que no se te pase nada?

1. Un vigía de novedades de IA para armar un resumen interno cada quince días.
2. Un control que revisa si la planilla de inscripciones tiene filas duplicadas antes de mandarla a facturación.
3. Un vigía de menciones del colegio en redes.

:::Ver la respuesta
**1. Que valga la pena.** Si se pierde una novedad, aparece la quincena siguiente o no era tan importante. Si avisa de más, el resumen deja de hacerse.

**2. Que no se pase nada.** Una fila duplicada que llega a facturación es una familia que paga dos veces. Diez avisos falsos son diez minutos.

**3. Las dos cosas, separadas.** Las menciones en general: pocas y buenas. Las quejas: que no se pierda ninguna. Dos reglas y dos canales, no una regla intermedia que hace mal las dos cosas.
:::

## Qué hacer esta semana

Si ya tenés algo que te avisa (alertas de mail, notificaciones de una herramienta, un vigía propio), contá durante una semana **cuántos avisos llegaron y cuántos te hicieron hacer algo**.

Si es menos de la mitad, no sumes otro aviso: cambiá la regla del que tenés.
$md$,
  9, 'curado'
from lessons l where l.slug = 'fr-avisos'
on conflict do nothing;
