---
name: radar
description: Corre el ciclo diario del radar de Frontera - busca lo nuevo en el mundo de la IA, filtra, decide qué merece una lección y la escribe. Usar cuando Diego pida "corré el radar", "qué salió hoy", "actualizá Frontera" o similar.
---

# Radar de Frontera

Este es el ciclo que mantiene viva la app. Corre con la suscripción de
Claude, no con una API paga: por eso el criterio lo ponés vos acá y no un
modelo chico filtrando por keywords.

## El ciclo

### 1. Recolectar y filtrar

```
node jobs/radar.mjs --informe
```

Deja dos archivos en `jobs/salida/`: el informe en markdown y
`candidatas-YYYY-MM-DD.json`. Leé el JSON, no el markdown.

El filtro que ya corrió es tosco a propósito: bajó ~60 señales a 15
usando términos. **No confíes en su orden.** Puntaje alto no significa
que valga una lección; significa que vale mirarlo.

### 2. Elegir

De las 15 candidatas, lo normal es que **cero, una o dos** merezcan una
lección. Tres es un día excepcional. Si escribís cinco, te equivocaste.

**Merece una lección:**

- Algo que cambia cómo se trabaja: una capacidad nueva, un límite que se
  corrió, una forma de hacer algo que antes no existía.
- Algo que **contradice** lo que se creía. Es lo más valioso que existe.
  Una lección que empieza con "esto que sabías ya no es así" vale por
  diez que cuentan una novedad.
- Un patrón que se repite en varias señales del mismo día: cuando tres
  fuentes distintas tocan el mismo problema, el tema es el problema, no
  cada anuncio.

**No merece una lección:**

- Papers académicos sin aplicación a la vista. La mayoría de arXiv.
- Lanzamientos de producto de consumo: una app que llega a más
  dispositivos, un modelo nuevo en una herramienta que nadie del círculo
  usa.
- Opinión sin hecho nuevo detrás. Entrevistas, ensayos, predicciones.
- Rondas de inversión, movimientos de ejecutivos, números de mercado.
- Algo que ya cubrimos. Antes de escribir, mirá `signals` con estado
  `promovida` y las lecciones de radar existentes.
- Cualquier cosa que un usuario de nivel 2 o más ya sepa.

### 3. Leer la fuente

**Nunca escribas desde el título ni desde el resumen del feed.** Abrí la
URL y leé el anuncio o el paper. Si no podés leerlo, no escribas la
lección: pasá a la siguiente candidata.

Esto no es opcional. Es la diferencia entre esta app y un agregador.

### 4. Escribir

La lección **no cuenta la noticia**. Cuenta el problema que la noticia
revela, y lo aterriza en el trabajo real de quien lee. Estructura que
funciona:

1. **Qué pasó**, en dos o tres oraciones. Con fecha. Sin adjetivos.
2. **El problema de fondo**, que casi siempre es más viejo y más general
   que el anuncio. Acá va el grueso.
3. **Por qué te importa aunque no uses esa herramienta.** Si no podés
   responder esto, la lección no va.
4. **Qué hacer hoy.** Una acción concreta, chica, que se pueda hacer sin
   permiso de nadie y sin instalar nada.
5. **La letra chica.** Qué está en preview, qué es de un solo proveedor,
   qué puede cambiar. Decilo vos antes de que lo descubra solo.

Tono: español rioplatense, directo, sin relleno, sin entusiasmo de
vendedor. Segunda persona. Si una oración no agrega, sacala.

### 5. Nivel y nodo

- `nivel: [3, 4]` para frontera técnica: agentes, evals, arquitectura.
- `nivel: [2, 4]` para adopción, negocios, criterio.
- `nivel: [2, 3]` si es algo que a alguien de nivel 4 le resulta obvio.

Nodos válidos: `agentes`, `evals`, `automatizacion`, `producto`,
`negocios`, `modelos`, `contexto-largo`, `diseno`, `como-pedir`,
`privacidad`.

El radar nunca escribe para nivel 0 ni 1. A quien recién empieza, el
estado del arte lo abruma y lo pierde.

### 6. Guardar y publicar

Escribí `jobs/salida/lecciones-YYYY-MM-DD.json`:

```json
{
  "fecha": "2026-11-21",
  "lecciones": [
    {
      "slug": "r-2026-11-21-dos-o-tres-palabras",
      "nodo": "agentes",
      "nivel": [3, 4],
      "titulo": "Título que nombra el problema, no el producto",
      "hook": "Una oración que diga por qué esto es tuyo.",
      "cuerpo": "markdown con ## subtítulos y **negritas**",
      "minutos": 7,
      "en": {
        "titulo": "The same lesson in British English",
        "hook": "One sentence on why this is yours.",
        "cuerpo": "the same markdown, translated, same structure"
      },
      "senal": {
        "url": "https://...",
        "titulo": "Título original del anuncio",
        "resumen": "Una línea",
        "fecha": "2026-11-19"
      }
    }
  ]
}
```

**Toda lección va en español y en inglés británico.** La versión en
inglés va en `en`, con la misma estructura y los mismos datos.

Después, **siempre como borrador**:

```
node jobs/publicar.mjs --borrador
```

Desde el 24/11 el radar no publica directo: deja borradores que Diego
aprueba en la app (Ajustes → Radar). Así se sostiene la regla de no
publicar nada que nadie haya mirado, aunque la lección la haya escrito
una tarea programada sin nadie delante. Sin `--borrador`, publica
directo: sólo para cuando Diego lo pida en una sesión.

Con credenciales en `jobs/.env` escribe directo en la base. Sin
credenciales deja el SQL en `jobs/salida/` para pegar en el editor de
Supabase. El publicador valida antes de escribir y frena si algo está
mal.

### 7. Contar qué pasó

Cerrá diciendo: cuántas señales entraron, cuántas pasaron el filtro,
cuántas lecciones salieron y **por qué descartaste las que descartaste**.
Esa última parte es la que permite afinar el léxico con el tiempo.

Si no salió ninguna lección, decilo sin disculparte. Hay días en que el
mundo no produce nada que valga quince minutos de alguien.

## Reglas que no se rompen

- Nunca publicar sin haber leído la fuente.
- Nunca más de tres lecciones en un día.
- Nunca contenido de nivel 0 o 1 en el radar.
- Nunca reproducir texto de la fuente: las ideas, con palabras propias y
  diciendo de dónde salen.
- Nunca inventar una capacidad, un precio o una fecha. Si no está en la
  fuente, no va.
