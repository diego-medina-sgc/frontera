# Investigación de Frontera

> **Postergado (24/11).** Estos estudios se hacen cuando la app esté
> lo bastante buena como para compartirla con conocidos porque les
> sirve, no antes. Hasta entonces la única persona del estudio es quien
> la construyó, y lo que se mide es si la app ya es buena para él:
> `node jobs/investigacion.mjs` corre el instrumento de la sección
> "El instrumento que ya está adentro", sólo con cifras.

## La pregunta de riesgo

No es si la app se entiende. Es **si a alguien además de Diego le duele
lo suficiente como para volver la segunda semana.**

Usando el marco de Cagan, que está en la biblioteca de la propia app:
de los cuatro riesgos, la viabilidad técnica está probada —la app
funciona y cuesta cero— y la usabilidad tiene evidencia parcial. El de
**valor** está en "supongo", y es el único que mata productos.

Todo lo que sigue está diseñado para atacar ese riesgo primero.

---

## Lo que ya sabemos sin preguntarle a nadie

Conviene anotarlo porque evita gastar sesiones en cosas ya respondidas.

- **El problema existe para Diego.** 207 conversaciones en claude.ai y
  186 sesiones de Claude Code en tres meses, con el 61% del tiempo
  diagnosticando. Es un caso, no una muestra.
- **El onboarding se entiende.** Lo recorrió solo y la única fricción
  que reportó fue que no lo ayudaba a encontrar sus instrucciones. Ya
  está arreglado.
- **La hipótesis del nivel se sostiene en un caso.** El autodiagnóstico
  y la medición por evidencia dieron lo mismo: 3.

Lo que **no** sabemos: si alguien que no construyó la app siente la
ansiedad de quedarse atrás con suficiente fuerza como para abrir algo
todos los días.

---

## Estudio 1 — ¿El problema existe para otros?

**Método:** entrevistas. **Seis personas. 30 minutos cada una. Una
semana.**

Seis alcanza: en entrevistas de problema, los temas se repiten a partir
de la quinta. Si a las seis no apareció un patrón, el problema no es de
muestra.

**A quién:** tres que sospechás de nivel 2 o 3 —usan IA para trabajo
real, armaron algo— y tres de nivel 0 o 1. No hace falta que sean del
círculo; de hecho es mejor que no, porque a los tuyos les cuesta
decirte que no.

**Regla de oro: no mostrar la app.** Si la mostrás, la conversación
pasa a ser sobre la app y perdés el dato. La app aparece recién en el
estudio 2.

### Guía de entrevista

**Entrada (5 min).** Esto no es una demo, no tengo nada para venderte.
Estoy tratando de entender cómo hace la gente para mantenerse al día
con IA. No hay respuestas correctas y me sirve más lo que no funciona
que lo que sí.

**Contexto (10 min).** Las preguntas son sobre lo que hizo, nunca sobre
lo que haría.

- ¿Para qué usaste IA esta semana? Contame el último caso concreto.
- **¿Qué es lo que más te cuesta hoy de tu trabajo, tenga que ver con
  IA o no?** *(Va temprano y a propósito. En el ensayo con personas
  simuladas, lo más valioso aparecía siempre al final, en la pregunta
  de descarte, lo cual significaba que las preguntas del medio estaban
  hechas para lo que yo quería saber y no para lo que a la persona le
  importa.)*
- ¿Cómo te enteraste de la última cosa nueva de IA que probaste?
- Mostrame dónde la usás. *(Si es por videollamada, pedile que comparta
  pantalla. Lo que hace no coincide con lo que cuenta.)*

**Fondo (10 min).** Acá está el corazón del estudio.

- ¿Cuándo fue la última vez que sentiste que algo importante de IA se
  te había pasado? Contame esa vez.
- ¿Qué hiciste al respecto? *(La respuesta "nada" es un dato enorme.)*
- ¿Cuánto tiempo por semana le dedicás hoy a ponerte al día? ¿Dónde?
  **¿Cuándo fue la última vez, concretamente?** *(La repregunta es
  obligatoria: el primer número siempre es optimista y la persona suele
  corregirse sola.)*
- ¿Qué probaste para resolverlo y abandonaste? ¿Por qué lo abandonaste?
  *(Si nunca intentó nada, cambiar por: ¿hubo algo que quisiste
  resolver y no supiste por dónde empezar? La pregunta original se cae
  con nivel 0 y 1.)*
- **¿Cuánto tiempo real tenés por semana para esto, en minutos?**
- **¿Qué es lo que te daría vergüenza no saber?**

**Alternativas (5 min).** Esto es el método de Dunford aplicado.

- Si mañana desaparecieran todas las newsletters y cuentas que seguís,
  ¿qué harías?
- ¿Pagaste alguna vez por algo para aprender esto? ¿Qué pasó?

**Cierre.** ¿Algo que no te pregunté y que debería haber preguntado?

### Qué buscás

La señal que importa no es entusiasmo. Es **evidencia de esfuerzo
previo**: que ya hayan intentado resolverlo de alguna forma, aunque sea
torpe. Alguien que nunca hizo nada al respecto no tiene el problema,
por mucho que diga que le parece interesante.

**Pregunta de corte:** ¿cuántos de los seis describieron un intento
concreto y fallido de mantenerse al día? Si son menos de tres, el
problema no es lo bastante agudo todavía y conviene parar antes de
seguir construyendo.

---

## Estudio 2 — El primer día

**Método:** prueba de usabilidad moderada. **Cinco personas. 20 minutos
cada una. Una semana.** Puede solaparse con el estudio 1.

Cinco es el número clásico y acá aplica: no se buscan porcentajes, se
buscan los lugares donde la gente se traba.

**A quién:** tres de nivel 0 o 1 —el caso de tu mamá— y dos de nivel 3.
Son dos recorridos distintos de la app y hay que probar los dos.

### Guion

Antes de empezar, dos frases que cambian todo lo que sigue:

> No estamos probándote a vos, estamos probando la app. Si algo no se
> entiende, es culpa nuestra. Y pensá en voz alta todo el tiempo,
> aunque sea obvio.

Y después, **callarse**. La tentación de ayudar arruina la prueba.
Cuando pregunten algo, devolvelo: *"¿Vos qué harías?"*.

**Tarea 1.** Entrá y dejá la app lista para usarla.
*(Qué mirar: ¿eligen bien el camino de las tres opciones? ¿A los de
nivel 3 les molesta que les pregunte cosas básicas? ¿Encuentran sus
instrucciones o abren el plegable?)*

**Tarea 2.** Leé lo que la app te muestre hoy y hacé lo que te pida.
*(¿Entienden que el 1 al 10 no los evalúa a ellos? ¿Dudan antes de
tocar? La duda es el dato.)*

**Tarea 3.** Fijate si hay algo que te falte aprender.
*(Van al mapa. ¿Entienden la barra y el número? ¿Leen "frontera" como
lo que queremos decir?)*

**Tarea 4** *(solo nivel 3)*. Contame qué harías con el reto que
aparece ahí.
*(¿Les parece propio o genérico? Es la prueba de la promesa central.)*

**Al final, tres preguntas.**

- Sin mirar: ¿qué hace esta app?
- ¿La abrirías mañana? ¿Por qué?
- ¿A quién no se la recomendarías?

La tercera es la más honesta de las tres.

---

## El instrumento que ya está adentro

La app recoge datos de investigación desde el primer día y **nadie los
lee**. Para cualquiera de los dos estudios, estos números son el
contrapeso cuantitativo de lo que la gente dice.

```sql
-- Comprensión e interés por lección: dónde se entiende poco y dónde
-- no le importa a nadie
select l.slug, count(*) as respuestas,
       round(avg(s.comprension), 1) as comprension,
       sum(case when s.interes = 1 then 1 else 0 end) as pulgar_arriba,
       sum(case when s.interes = -1 then 1 else 0 end) as pulgar_abajo,
       sum(case when s.status = 'ya_la_sabia' then 1 else 0 end) as ya_lo_sabia
from lesson_state s join lessons l on l.id = s.lesson_id
where s.answered_at is not null
group by l.slug order by comprension nulls last;

-- Abandono del onboarding: cuántos entran y no terminan el Paso 1
select count(*) filter (where onboarded_at is null) as sin_terminar,
       count(*) filter (where onboarded_at is not null) as terminaron
from profiles;

-- Retención real: días distintos con actividad por persona
select profile_id, count(distinct day) as dias,
       min(day) as primero, max(day) as ultimo
from activity group by profile_id order by dias desc;

-- Repaso: lo que dijeron entender contra lo que realmente usaron
select r.recordaba, r.uso, count(*)
from reviews r where r.done_at is not null
group by r.recordaba, r.uso;
```

Esa última consulta es la más interesante del conjunto: cruza lo que la
persona declaró con lo que efectivamente hizo. Cuando haya volumen, ahí
está la medición honesta de si la app enseña algo.

---

## Qué no hacer

**Encuestas.** Necesitan cien respuestas o más para decir algo, y el
círculo son veinte personas. Una encuesta a veinte da la ilusión de
dato sin el dato.

**Pruebas A/B.** Requieren tráfico para alcanzar significancia. Con este
volumen, cualquier diferencia que veas es ruido.

**Preguntar si pagarían.** La respuesta no predice nada. Lo que predice
es si ya pagaron por algo parecido antes.

---

## Síntesis

Con seis entrevistas y cinco pruebas, el análisis se hace a mano y en
una tarde.

1. **Una observación por tarjeta**, con la persona que la dijo. Solo lo
   que pasó u oíste, no tu interpretación.
2. **Agrupar por parecido** sin categorías previas. Los temas aparecen
   solos.
3. Para cada grupo: **¿cuántas personas, no cuántas tarjetas?** Un tema
   que dijo una persona tres veces es una persona.
4. Ordenar por **impacto sobre la decisión de volver**, no por facilidad
   de arreglo. La facilidad entra después, para elegir qué hacés
   primero.

## Criterios de decisión, escritos antes de empezar

Escribirlos antes es lo que impide acomodarlos después.

| Resultado | Qué significa |
|---|---|
| 4 o más de 6 describen un intento fallido concreto | El problema existe. Seguir. |
| 3 de 6 | Existe pero es tibio. Acotar a un perfil más chico antes de seguir. |
| 2 o menos | El problema es de Diego, no del mercado. Frontera sigue como herramienta propia y se para la idea de producto. |

Y para el estudio 2: si **alguien de nivel 0 o 1 no logra terminar el
Paso 1 sin ayuda**, eso se arregla antes que cualquier otra cosa.
