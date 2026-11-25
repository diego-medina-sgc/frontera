-- ============================================================
-- 071 · Duodécimo libro: Never Split the Difference (Chris Voss)
-- ============================================================
-- Precarga del 24/11. Negociación y conversaciones difíciles: con
-- familias (aranceles, becas, reclamos), con proveedores y hacia
-- adentro. Completa a Cialdini: él enseña a influir; Voss, a escuchar
-- para que la otra persona se sienta entendida antes de cualquier
-- pedido.
--
-- Verificado en Open Library el 24/11:
--   · obra OL18819818W, 2016, Chris Voss con Tahl Raz;
--   · edición en castellano "Rompe la barrera del no" (Conecta);
--   · tapa 8365942, la amarilla en inglés (mirada).
--
-- Los casos con números son hipotéticos y lo dicen. De las historias
-- del FBI no se reproduce ninguna: sólo las técnicas, en síntesis
-- propia. Cinco piezas por idioma: no_lei 1-3, hace_tiempo 1, fresco 1.
-- ============================================================

insert into books (slug, title, author, year, themes, title_es, cover_id, terms)
values (
  'never-split-the-difference',
  'Never Split the Difference',
  'Chris Voss',
  2016,
  array['negociacion', 'comunicacion'],
  'Rompe la barrera del no',
  8365942,
  array[
    'negociar','negociación','negociaciones','reclamo','reclamos','queja','quejas',
    'aranceles','becas','proveedores','presupuesto','conversaciones difíciles','acuerdo',
    'familias','clientes','negotiation','complaints'
  ]
)
on conflict (slug) do nothing;

-- ------------------------------------------------------------
-- no_lei 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 1,
  'Nombrar lo que el otro siente',
$md$
Chris Voss fue negociador de secuestros del FBI. El libro parte de una observación incómoda para cualquiera que se prepara argumentos: **en una negociación difícil, la otra persona no cambia de posición porque le des buenas razones. Cambia cuando siente que la entendiste.**

Voss llama **empatía táctica** a hacer eso a propósito. No es estar de acuerdo, ni ser amable: es mostrar que entendiste lo que el otro siente y piensa, para que baje la guardia y empiece a escuchar. Dos herramientas, las más simples del libro:

- **El espejo.** Repetir las últimas palabras importantes de lo que dijo, con tono de pregunta. "¿Que nadie te avisó?" La persona sigue hablando y explica más.
- **La etiqueta.** Ponerle nombre a lo que parece sentir: "Parece que esto te tomó por sorpresa." "Suena a que sentís que no se te tuvo en cuenta." Sin "yo", sin "pero" después.

## Un caso trabajado

Hipotético. Un colegio anuncia un aumento de aranceles y recibe **20 llamadas** de familias enojadas en una semana.

**Las primeras 10**, quien atiende explica los motivos: la inflación, los sueldos, las mejoras. Es todo cierto. **6 de 10** terminan pidiendo hablar con la dirección, más enojadas que al principio.

**Las siguientes 10**, antes de explicar nada, etiqueta: "Parece que el aumento llegó en un momento muy complicado para ustedes." Y espera. La familia habla dos o tres minutos más: el problema no es sólo el monto, es que se enteraron por otra familia antes que por el colegio. Recién después se explican los motivos. **2 de 10** piden hablar con la dirección.

Las razones eran las mismas. Lo que cambió es que la familia se sintió escuchada antes de escucharlas.

## Dónde no aplica

**No es una técnica para no resolver.** Si el problema tiene solución (una beca, un plan de pago, un error del colegio), etiquetar no reemplaza resolverlo. Sirve para llegar a hablar del problema real.

**Mal usada, se nota.** Una etiqueta dicha de memoria, sin escuchar, suena a manual de atención al cliente. La gente lo detecta y se enoja más.

**No es para cuando el otro no tiene razón en los hechos.** Podés nombrar lo que siente sin darle la razón en lo que afirma. "Parece que sentís que fue injusto" no quiere decir "fue injusto".

## Probá que lo entendiste

Una familia dice: "Mandé tres mails y nadie me contestó. Es una falta de respeto." ¿Qué respuesta está más cerca del libro?

1. "Le pido disculpas, tenemos mucho volumen de consultas en esta época."
2. "¿Tres mails sin respuesta?" Y esperar.
3. "Entiendo perfectamente cómo se siente."

:::Ver la respuesta
**La 2.** Es un espejo: repite lo importante y deja que la familia siga. Lo más probable es que cuente qué necesitaba y por qué le importaba tanto.

**La 1** explica antes de escuchar. Para la familia, suena a excusa.

**La 3** dice "entiendo" sin mostrar que entendió. Voss advierte contra esa frase: casi siempre provoca "no, no entendés".
:::

## Qué hacer esta semana

En la próxima conversación tensa, antes de explicar o defender, decí una etiqueta ("parece que...") y quedate callado. Fijate qué cuenta la otra persona en esos segundos que no te iba a contar.
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 2,
  'Buscá el "no" y el "eso es"',
$md$
Dos ideas del libro van contra lo que casi todos hacemos en una negociación.

**El "no" no es el final.** Buscamos que el otro diga que sí, y por eso hacemos preguntas que lo empujan al sí. Voss dice que un sí arrancado es frágil, y que decir que no hace sentir a la persona segura y en control. Por eso propone preguntas que se contestan con no: "¿Es una mala idea que lo hablemos el jueves?" en vez de "¿Podemos hablarlo el jueves?".

**El "eso es" vale más que el "tenés razón".** Cuando alguien te dice "tenés razón", muchas veces quiere que dejes de hablar. Cuando dice "eso es", es porque resumiste lo que piensa mejor de lo que lo habría dicho. Ese es el momento en que la conversación cambia. Se llega con un **resumen**: lo que dijo y lo que parece sentir, en tus palabras.

Y una herramienta para antes: la **auditoría de acusaciones**. Decir en voz alta, al principio, lo peor que el otro podría estar pensando de vos. "Seguramente piensan que el colegio decide esto sin escuchar a las familias." Dicho por vos, pierde fuerza.

## Un caso trabajado

Hipotético. Una familia está en duda entre dos colegios y pide una reunión. Viene con una lista de objeciones.

**Reunión A:** quien la recibe contesta cada objeción con argumentos. Al final, la familia dice "tenés razón, lo vamos a pensar". No vuelve.

**Reunión B:** empieza con una auditoría: "Seguramente sienten que todos los colegios dicen lo mismo y es difícil saber qué es cierto." La familia se ríe y dice que sí. Después de escuchar las objeciones, un resumen: "Entonces lo que más les preocupa no es el proyecto, es que a su hijo le cueste adaptarse a un grupo armado desde primer grado." La familia dice "**eso es**". Recién ahí se habla del acompañamiento a quienes llegan en cursos avanzados, que era lo único que necesitaban escuchar.

## Dónde no aplica

**Una pregunta para el "no" no es una trampa.** "¿Es una mala idea...?" funciona porque deja salir sin costo. Si la usás para acorralar ("¿No querrán que su hijo se quede atrás, no?"), es manipulación, y se nota.

**La auditoría no es autoflagelación.** Se nombra lo que el otro probablemente piensa, no se pide perdón por todo. Una o dos frases, y seguir.

**El "eso es" no se fuerza.** Si el resumen no da en el clavo, la persona corrige, y eso también sirve: ahora sabés mejor qué piensa.

## Probá que lo entendiste

¿Cuál de estos cierres de una reunión con una familia indica que de verdad se entendió el problema?

1. La familia dice: "Sí, tenés razón en todo."
2. Después de tu resumen, la familia dice: "Eso es, eso es lo que nos preocupa."
3. La familia dice: "Bueno, lo vamos a pensar."

:::Ver la respuesta
**La 2.** Es el momento que busca el libro: la familia reconoce su propia preocupación en tus palabras.

**La 1** suele querer decir "ya está, terminemos". No es acuerdo.

**La 3** es la forma educada de no decidir. Muchas veces quiere decir que la preocupación real nunca salió.
:::

## Qué hacer esta semana

En tu próxima reunión difícil, empezá con una auditoría de una frase (lo peor que el otro podría estar pensando) y terminá con un resumen. Contá si alguien te dice "eso es".
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'no_lei', 3,
  'Preguntas que empiezan con "cómo" y "qué"',
$md$
La tercera herramienta del libro es la que más sirve en negociaciones con números: las **preguntas calibradas**. Son preguntas abiertas, que empiezan con "cómo" o "qué", y que ponen a la otra persona a resolver tu problema.

- "¿Cómo se supone que haga eso con este presupuesto?"
- "¿Qué haría falta para que esto funcione para los dos?"
- "¿Qué es lo que más les preocupa de esta propuesta?"

No preguntan "por qué", que suena a acusación. No se contestan con sí o no. Y obligan al otro a mirar el problema desde tu lado.

El título del libro viene de acá: **no partas la diferencia.** Si el proveedor pide 20 y vos ofrecés 0, quedarse en 10 parece justo, pero muchas veces es el peor acuerdo para los dos: nadie consiguió lo que necesitaba. Las preguntas calibradas buscan otra cosa: qué necesita de verdad cada uno.

## Un caso trabajado

Hipotético. El proveedor de transporte escolar avisa un aumento del **20%** para el año que viene.

**Partiendo la diferencia:** el colegio contraofrece 0%, el proveedor baja a 15, el colegio sube a 5, y cierran en **10%**. Nadie está conforme y el tema vuelve el año siguiente.

**Con preguntas calibradas:** "¿Qué es lo que más pesa en ese 20%?" El proveedor explica que el costo grande es tener un micro casi vacío en un recorrido. "¿Cómo podríamos armar los recorridos para que eso no pase?" Se juntan dos recorridos con pocos chicos en uno. El aumento queda en **8%**, con un recorrido menos, y el proveedor gana más que con el 10% anterior porque se ahorra un micro.

El número final fue más bajo que la mitad, y los dos quedaron mejor. Eso es lo que el título quiere decir.

## Dónde no aplica

**Si los números son lo único que hay,** a veces sí hay que encontrarse en el medio. Las preguntas calibradas sirven para descubrir si hay algo más; si no lo hay, no lo inventan.

**Una pregunta calibrada con tono de reproche es un "por qué" disfrazado.** "¿Cómo se te ocurrió mandar esto?" empieza con cómo y es un ataque. El tono importa tanto como las palabras.

**No es para todas las conversaciones.** Con alguien del equipo que necesita ayuda, preguntar "¿qué necesitás?" está bien; manejarlo como negociación, no.

## Probá que lo entendiste

Un proveedor dice que no puede bajar el precio. ¿Qué pregunta te acerca a un mejor acuerdo?

1. "¿Por qué es tan caro?"
2. "¿Qué haría falta de nuestro lado para que puedan mejorar el precio?"
3. "¿Pueden bajarlo un 10%?"

:::Ver la respuesta
**La 2.** Es calibrada: abierta, empieza con "qué" y pone al proveedor a buscar la solución. Puede aparecer algo que no sabías (pagar por adelantado, un contrato más largo, otro horario).

**La 1** suena a acusación y lo pone a defenderse.

**La 3** se contesta con sí o no, y propone partir la diferencia antes de saber qué hay detrás del precio.
:::

## Qué hacer esta semana

Antes de tu próxima negociación con números, escribí tres preguntas que empiecen con "cómo" o "qué". Usalas antes de hacer cualquier contraoferta.
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'hace_tiempo', 1,
  'Lo que se te borró',
$md$
Antes de leer: reconstruí. Cinco preguntas de memoria, y recién después abrí.

**1. ¿Qué es la empatía táctica, y qué no es?**

:::Ver la respuesta
Es **mostrar que entendiste** lo que el otro siente y piensa, a propósito, para que baje la guardia. **No es estar de acuerdo** ni ser amable: se puede nombrar lo que alguien siente sin darle la razón.
:::

**2. ¿Qué es un espejo y qué es una etiqueta?**

:::Ver la respuesta
**Espejo:** repetir las últimas palabras importantes con tono de pregunta, para que siga hablando. **Etiqueta:** nombrar lo que parece sentir, empezando con "parece que" o "suena a que", sin "yo" y sin "pero" después.
:::

**3. ¿Por qué Voss busca que el otro diga "no"?**

:::Ver la respuesta
Porque decir que no **hace sentir seguro y en control**. Un sí arrancado es frágil. Por eso propone preguntas del tipo "¿es una mala idea si...?".
:::

**4. ¿Qué vale más, "tenés razón" o "eso es"?**

:::Ver la respuesta
**"Eso es."** "Tenés razón" muchas veces quiere decir "terminemos". "Eso es" aparece cuando tu resumen describió lo que el otro piensa mejor de lo que lo habría dicho.
:::

**5. ¿Qué quiere decir el título?**

:::Ver la respuesta
Que **quedarse en el medio no siempre es justo**: muchas veces es el peor acuerdo para los dos. Las preguntas calibradas ("¿cómo...?", "¿qué...?") buscan qué necesita cada uno, en vez de cortar el número por la mitad.
:::

## Lo que suele borrarse

Quedan las técnicas sueltas: el espejo, la etiqueta. Lo que se borra es **el orden**: primero escuchar y nombrar, después resumir hasta el "eso es", y recién ahí negociar el contenido. Usar las preguntas calibradas antes de que el otro se sienta entendido suele no funcionar.

## Un caso para aplicarlo

Una docente viene enojada a decirte que la cambiaron de curso sin consultarla. ¿Por dónde empezás?

:::Ver la respuesta
**Por una etiqueta**, no por los motivos del cambio: "Parece que sentís que se decidió algo importante para vos sin preguntarte." Dejar que hable, y cuando termine, un resumen hasta que diga "eso es". Recién ahí, los motivos y una pregunta calibrada: "¿Qué haría falta para que este cambio funcione para vos?".
:::

## Qué hacer esta semana

Elegí una de las cinco herramientas que tenías olvidada y usala una vez esta semana, a propósito.
$md$,
  7
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · es
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'es', 'fresco', 1,
  'Voss contra Cialdini y Scott',
$md$
Si lo tenés fresco, crucémoslo con dos libros de la biblioteca que también tratan de conversaciones donde algo está en juego.

**Cialdini** (*Influence*): qué señales hacen que alguien diga que sí.

**Kim Scott** (*Radical Candor*): cómo decir algo difícil a alguien de tu equipo para que sirva.

**Voss**: cómo escuchar para que el otro se sienta entendido antes de cualquier pedido.

Una prueba. Sin releer: **¿en qué se contradicen Voss y Cialdini sobre el "sí"?**

:::Ver la respuesta
**Cialdini estudia qué produce el sí**: los atajos que hacen que alguien acepte. **Voss desconfía del sí**: dice que un sí arrancado es frágil, y prefiere el "no" que hace sentir seguro y el "eso es" que muestra que se entendió. No se contradicen en los hechos: Cialdini describe cómo se consigue el sí; Voss advierte que conseguirlo no es lo mismo que llegar a un acuerdo que dure.
:::

## Dónde se tocan

**Voss y Scott, en lo que importa la persona.** La empatía táctica de Voss y el "que te importe" de Scott son primos: los dos dicen que sin mostrar que entendés al otro, lo que digas no entra. La diferencia es la dirección: Scott habla de decir algo difícil; Voss, de escuchar algo difícil.

**Voss y Cialdini, en la etiqueta y la simpatía.** Nombrar lo que el otro siente genera la simpatía que Cialdini describe como principio. Voss llega por la escucha a lo que Cialdini describe desde afuera.

## Lo que el libro no prueba

El libro está hecho de historias del FBI y de cursos de negociación. Las técnicas coinciden con lo que se sabe sobre escucha activa, pero el libro no las prueba como se probaría un tratamiento: no compara grupos ni mide resultados. Y la analogía tiene un límite: en un secuestro, la relación termina con la negociación. Con una familia del colegio o un docente, la relación sigue, y una técnica que se siente como técnica cuesta más de lo que gana.

## Una situación para decidir

Una familia reclama porque no le dieron la beca que pidió. Tenés tres opciones para la conversación: (a) explicar los criterios con claridad, (b) nombrar lo que siente y resumir su situación hasta que diga "eso es", o (c) decirle con franqueza que su caso no cumplía los requisitos. ¿Qué diría cada autor?

:::Ver la respuesta
**Voss: (b) primero.** Sin que la familia se sienta entendida, los criterios suenan a excusa.

**Scott: (c), pero con la parte de "que te importe".** Decir la verdad con claridad es respeto, siempre que se note que te importa lo que le pasa.

**Cialdini: (a), con un dato verdadero** (cuántas familias la pidieron, cómo se decidió), porque la prueba social y la autoridad legítima hacen más aceptable una decisión.

En la práctica, el orden es (b), (c) y (a): escuchar, decir la verdad, explicar.
:::

## Qué hacer esta semana

Pensá en la conversación difícil que tenés pendiente y escribí la primera frase según cada uno de los tres autores. Usá la que te parezca más honesta.
$md$,
  8
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ============================================================
-- English (British)
-- ============================================================

-- ------------------------------------------------------------
-- no_lei 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 1,
  'Naming what the other person feels',
$md$
Chris Voss was an FBI kidnapping negotiator. The book starts from an observation that's uncomfortable for anyone who prepares arguments: **in a difficult negotiation, the other person doesn't change position because you give them good reasons. They change when they feel understood.**

Voss calls doing that deliberately **tactical empathy**. It isn't agreeing, or being nice: it's showing you've understood what the other person feels and thinks, so they lower their guard and start listening. Two tools, the simplest in the book:

- **The mirror.** Repeating the last important words they said, as a question. "Nobody told you?" The person keeps talking and explains more.
- **The label.** Naming what they seem to feel: "It seems this caught you by surprise." "It sounds like you feel you weren't taken into account." No "I", no "but" afterwards.

## A worked case

Hypothetical. A school announces a fee increase and receives **20 calls** from angry families in one week.

**For the first 10**, whoever answers explains the reasons: inflation, salaries, improvements. It's all true. **6 of 10** end up asking to speak to the head, angrier than at the start.

**For the next 10**, before explaining anything, they label: "It seems the increase came at a very difficult time for you." And wait. The family talks for two or three more minutes: the problem isn't just the amount, it's that they heard about it from another family before hearing from the school. Only then are the reasons explained. **2 of 10** ask to speak to the head.

The reasons were the same. What changed is that the family felt heard before hearing them.

## Where it doesn't apply

**It isn't a technique for not solving things.** If the problem has a solution (a bursary, a payment plan, a mistake by the school), labelling doesn't replace solving it. It helps you get to the real problem.

**Used badly, it shows.** A label recited by rote, without listening, sounds like a customer-service script. People spot it and get angrier.

**It isn't for when the other person is wrong on the facts.** You can name what they feel without agreeing with what they claim. "It sounds like you feel it was unfair" doesn't mean "it was unfair".

## Check you've got it

A family says: "I sent three emails and nobody answered. It's disrespectful." Which response is closest to the book?

1. "I apologise, we have a very high volume of enquiries at this time of year."
2. "Three emails without a reply?" And wait.
3. "I completely understand how you feel."

:::Show the answer
**Number 2.** It's a mirror: it repeats what matters and lets the family carry on. Most likely they'll explain what they needed and why it mattered so much.

**Number 1** explains before listening. To the family, it sounds like an excuse.

**Number 3** says "I understand" without showing it. Voss warns against that phrase: it almost always provokes "no, you don't".
:::

## What to do this week

In your next tense conversation, before explaining or defending, say a label ("it seems that...") and stay quiet. Notice what the other person tells you in those seconds that they weren't going to tell you.
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 2 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 2,
  'Look for the "no" and the "that''s right"',
$md$
Two of the book's ideas run against what almost all of us do in a negotiation.

**"No" isn't the end.** We aim for the other person to say yes, so we ask questions that push towards yes. Voss says a yes that's extracted is fragile, and that saying no makes people feel safe and in control. So he suggests questions answered with no: "Would it be a bad idea to talk on Thursday?" instead of "Can we talk on Thursday?"

**"That's right" is worth more than "you're right".** When someone tells you "you're right", they often want you to stop talking. When they say "that's right", it's because you've summed up what they think better than they would have. That's the moment the conversation changes. You get there with a **summary**: what they said and what they seem to feel, in your words.

And a tool for beforehand: the **accusation audit**. Saying out loud, at the start, the worst things the other person might be thinking about you. "You probably think the school decides these things without listening to families." Said by you, it loses its force.

## A worked case

Hypothetical. A family is torn between two schools and asks for a meeting. They come with a list of objections.

**Meeting A:** whoever meets them answers each objection with arguments. At the end, the family says "you're right, we'll think about it". They don't come back.

**Meeting B:** it starts with an audit: "You probably feel every school says the same thing and it's hard to know what's true." The family laughs and agrees. After hearing the objections, a summary: "So what worries you most isn't the programme, it's that your son might struggle to fit into a class that's been together since Year 1." The family says "**that's right**". Only then do they talk about the support for pupils joining in later years, which was the one thing they needed to hear.

## Where it doesn't apply

**A question aimed at "no" isn't a trap.** "Would it be a bad idea...?" works because it offers a cost-free way out. If you use it to corner someone ("You wouldn't want your son to fall behind, would you?"), it's manipulation, and it shows.

**The audit isn't self-flagellation.** You name what the other person probably thinks; you don't apologise for everything. One or two sentences, and move on.

**"That's right" can't be forced.** If the summary misses, the person corrects it, and that's useful too: now you know better what they think.

## Check you've got it

Which of these endings to a meeting with a family shows the problem was genuinely understood?

1. The family says: "Yes, you're right about everything."
2. After your summary, the family says: "That's right, that's what worries us."
3. The family says: "Well, we'll think about it."

:::Show the answer
**Number 2.** It's the moment the book is after: the family recognises their own concern in your words.

**Number 1** often means "fine, let's finish". It isn't agreement.

**Number 3** is the polite way of not deciding. It often means the real concern never came out.
:::

## What to do this week

In your next difficult meeting, start with a one-sentence audit (the worst the other person might be thinking) and finish with a summary. Count whether anyone says "that's right".
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- no_lei 3 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'no_lei', 3,
  'Questions that start with "how" and "what"',
$md$
The book's third tool is the most useful in negotiations involving numbers: **calibrated questions**. They're open questions, starting with "how" or "what", that set the other person to work on your problem.

- "How am I supposed to do that with this budget?"
- "What would it take for this to work for both of us?"
- "What worries you most about this proposal?"

They don't ask "why", which sounds like an accusation. They can't be answered yes or no. And they make the other person look at the problem from your side.

The book's title comes from here: **never split the difference.** If the supplier asks for 20 and you offer 0, settling on 10 seems fair, but it's often the worst deal for both: nobody got what they needed. Calibrated questions look for something else: what each side really needs.

## A worked case

Hypothetical. The school transport supplier announces a **20%** increase for next year.

**Splitting the difference:** the school counter-offers 0%, the supplier drops to 15, the school rises to 5, and they settle on **10%**. Nobody's happy and the issue comes back the following year.

**With calibrated questions:** "What weighs most in that 20%?" The supplier explains that the big cost is running an almost empty coach on one route. "How could we arrange the routes so that doesn't happen?" Two routes with few children are merged into one. The increase ends at **8%**, with one route fewer, and the supplier earns more than with the earlier 10% because it saves a coach.

The final figure was below half, and both ended up better off. That's what the title means.

## Where it doesn't apply

**If the numbers are all there is,** sometimes you do have to meet in the middle. Calibrated questions help find out whether there's something more; if there isn't, they don't invent it.

**A calibrated question in a reproachful tone is a disguised "why".** "How did you come up with sending this?" starts with how and is an attack. Tone matters as much as the words.

**It isn't for every conversation.** With someone on the team who needs help, asking "what do you need?" is fine; treating it as a negotiation isn't.

## Check you've got it

A supplier says they can't lower the price. Which question brings you closer to a better deal?

1. "Why is it so expensive?"
2. "What would it take on our side for you to improve the price?"
3. "Can you bring it down 10%?"

:::Show the answer
**Number 2.** It's calibrated: open, starts with "what" and sets the supplier to look for the solution. Something you didn't know may come up (paying in advance, a longer contract, a different schedule).

**Number 1** sounds like an accusation and puts them on the defensive.

**Number 3** gets a yes or no, and proposes splitting the difference before knowing what's behind the price.
:::

## What to do this week

Before your next negotiation involving numbers, write three questions starting with "how" or "what". Use them before making any counter-offer.
$md$,
  9
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- hace_tiempo 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'hace_tiempo', 1,
  'What you''ve forgotten',
$md$
Before reading: reconstruct. Five questions from memory, and only then open.

**1. What is tactical empathy, and what isn't it?**

:::Show the answer
It's **showing you've understood** what the other person feels and thinks, deliberately, so they lower their guard. **It isn't agreeing** or being nice: you can name what someone feels without agreeing with them.
:::

**2. What's a mirror and what's a label?**

:::Show the answer
**Mirror:** repeating the last important words as a question, so they keep talking. **Label:** naming what they seem to feel, starting "it seems that" or "it sounds like", with no "I" and no "but" afterwards.
:::

**3. Why does Voss look for the other person to say "no"?**

:::Show the answer
Because saying no **makes people feel safe and in control**. A yes that's extracted is fragile. So he suggests questions like "would it be a bad idea if...?"
:::

**4. Which is worth more, "you're right" or "that's right"?**

:::Show the answer
**"That's right."** "You're right" often means "let's finish". "That's right" comes when your summary described what the other person thinks better than they would have.
:::

**5. What does the title mean?**

:::Show the answer
That **meeting in the middle isn't always fair**: it's often the worst deal for both. Calibrated questions ("how...?", "what...?") look for what each side needs, instead of cutting the number in half.
:::

## What usually gets forgotten

The loose techniques stay: the mirror, the label. What gets forgotten is **the order**: first listen and name, then summarise until "that's right", and only then negotiate the substance. Using calibrated questions before the other person feels understood usually doesn't work.

## A case to apply it to

A teacher comes to you angry because she's been moved to another class without being consulted. Where do you start?

:::Show the answer
**With a label**, not the reasons for the change: "It seems you feel something important for you was decided without asking you." Let her talk, and when she's done, summarise until she says "that's right". Only then, the reasons and a calibrated question: "What would it take for this change to work for you?"
:::

## What to do this week

Pick one of the five tools you'd forgotten and use it once this week, on purpose.
$md$,
  7
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;

-- ------------------------------------------------------------
-- fresco 1 · en
-- ------------------------------------------------------------
insert into book_pieces (book_id, lang, for_read_state, idx, title, body_md, minutes)
select b.id, 'en', 'fresco', 1,
  'Voss against Cialdini and Scott',
$md$
If it's fresh, let's cross it with two books in the library that also deal with conversations where something's at stake.

**Cialdini** (*Influence*): which signals make someone say yes.

**Kim Scott** (*Radical Candor*): how to tell someone on your team something difficult so it helps.

**Voss**: how to listen so the other person feels understood before any request.

A test. Without rereading: **where do Voss and Cialdini disagree about "yes"?**

:::Show the answer
**Cialdini studies what produces yes**: the shortcuts that make someone accept. **Voss distrusts yes**: he says an extracted yes is fragile, and prefers the "no" that makes people feel safe and the "that's right" that shows understanding. They don't contradict each other on the facts: Cialdini describes how yes is obtained; Voss warns that obtaining it isn't the same as reaching an agreement that lasts.
:::

## Where they meet

**Voss and Scott, on caring about the person.** Voss's tactical empathy and Scott's "care personally" are cousins: both say that without showing you understand the other person, what you say won't land. The difference is direction: Scott is about saying something difficult; Voss, about hearing something difficult.

**Voss and Cialdini, on labelling and liking.** Naming what the other person feels generates the liking Cialdini describes as a principle. Voss arrives through listening at what Cialdini describes from outside.

## What the book doesn't prove

The book is made of FBI stories and negotiation courses. The techniques match what's known about active listening, but the book doesn't test them the way a treatment would be tested: it doesn't compare groups or measure outcomes. And the analogy has a limit: in a kidnapping, the relationship ends with the negotiation. With a school family or a teacher, the relationship continues, and a technique that feels like a technique costs more than it gains.

## A situation to decide

A family complains because they didn't get the bursary they applied for. You have three options for the conversation: (a) explain the criteria clearly, (b) name what they feel and summarise their situation until they say "that's right", or (c) tell them candidly that their case didn't meet the requirements. What would each author say?

:::Show the answer
**Voss: (b) first.** Unless the family feels understood, the criteria sound like an excuse.

**Scott: (c), but with the caring part.** Telling the truth clearly is respect, as long as it shows you care what's happening to them.

**Cialdini: (a), with a true figure** (how many families applied, how it was decided), because social proof and legitimate authority make a decision easier to accept.

In practice, the order is (b), (c) and (a): listen, tell the truth, explain.
:::

## What to do this week

Think of the difficult conversation you've been putting off and write its opening line according to each of the three authors. Use the one that feels most honest.
$md$,
  8
from books b where b.slug = 'never-split-the-difference'
on conflict do nothing;
