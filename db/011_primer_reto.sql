-- ============================================================
-- Frontera - primer reto
-- ============================================================
-- Hueco medido: contexto-largo, 29 sobre 100, presente en solo 3 de 13
-- proyectos, con nivel 3 de sobra para dominarlo.
-- Material: sus propias sesiones de Claude Code, 186 en tres meses.
--
-- Se inserta para todos los perfiles existentes porque hoy son dos y uno
-- es de prueba. Cuando haya gente de verdad, los retos los genera el job
-- por persona.
-- ============================================================

insert into challenges (profile_id, topic_id, title, body_md, porque, minutes)
select p.id, t.id,
  'Por qué tus sesiones largas empeoran',
$md$
Tenés 186 sesiones de Claude Code en tres meses y algunas son enormes. Esto es para que veas, con tu propio material, algo que ya te pasó y probablemente atribuiste a otra cosa.

## El fenómeno

En una conversación larga, la calidad de las respuestas baja. No porque el modelo se canse: porque **todo lo anterior sigue entrando en cada pedido**. Las cosas que probaste y descartaste, los errores que ya corregiste, las tres versiones viejas del mismo archivo. Todo eso compite por atención con lo que estás pidiendo ahora.

El síntoma es inconfundible una vez que lo reconocés: **empezás a repetir instrucciones que ya habías dado.** "Te dije que no uses eso." "Acordate de que ya lo cambiamos."

## El reto, en cuatro pasos

**1. Encontrá el síntoma.** Abrí tu sesión más larga de esta semana. Andá al último tercio y buscá el primer momento donde repetiste algo que ya habías dicho. Anotá más o menos a qué altura pasó.

**2. Medí lo que te costó.** Contá cuántos mensajes van desde ese punto hasta el final de la sesión. Esos son los mensajes que trabajaste con una herramienta degradada.

**3. Hacé el experimento.** Abrí una conversación nueva. Escribí en diez líneas el estado actual: qué estás haciendo, qué decidiste, qué quedó pendiente, qué no hay que hacer. Pedí exactamente lo mismo que venías pidiendo al final de la sesión vieja. Compará las dos respuestas.

**4. Escribí tu regla de corte.** Una sola oración, para vos: cuándo cortás y empezás de nuevo. Puede ser por cantidad de mensajes, por el síntoma de la repetición, o por cambio de tema. Lo importante es que exista y que la puedas aplicar sin pensarla.

## Por qué vale la pena

Esto no es un truco de productividad. Es el mismo principio que viste en la lección del radar sobre las herramientas conectadas: **cuando algo no entra entero, la solución no es un modelo más grande, es administrarle la atención.** Las diez líneas de estado que vas a escribir en el paso 3 son exactamente lo que hace un sistema bien diseñado cuando el contexto se le llena.

Si te sale bien, el paso 3 te va a sorprender.
$md$,
  'Contexto largo es tu hueco más grande: 29 sobre 100, y aparece en solo 3 de tus 13 proyectos, teniendo nivel de sobra para dominarlo.',
  20
from profiles p
cross join topics t
where t.slug = 'contexto-largo'
  and not exists (
    select 1 from challenges c
    where c.profile_id = p.id and c.title = 'Por qué tus sesiones largas empeoran'
  );
