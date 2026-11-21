---
name: reto
description: Genera el próximo reto práctico de Frontera cruzando el hueco medido de la persona con el material real en el que está trabajando. Usar cuando Diego pida "generá un reto", "armá el próximo reto" o "qué debería practicar".
---

# Reto de Frontera

Un reto no es un ejercicio. Es la cosa concreta que, si la hace, le mueve
el nodo donde está flojo, hecha sobre lo que ya tiene entre manos.

## El ciclo

### 1. Medir

```
node jobs/evidencia.mjs
node jobs/retos.mjs
```

El primero lee las sesiones locales y deriva dominio por nodo. El segundo
elige el hueco y arma el brief en `jobs/salida/brief-reto-FECHA.json`.

Leé el brief. Trae el hueco, el nivel, cómo trabaja la persona y en qué
proyectos anduvo últimamente.

### 2. Elegir el material

El hueco ya está elegido por la medición: no lo discutas salvo que sea
evidentemente absurdo. Lo que tenés que elegir es **sobre qué** se hace.

Mirá `material_reciente` y preguntate: ¿en cuál de estos proyectos este
hueco duele de verdad? Si el hueco es evals y hay algo en producción, es
ahí. Si el hueco es contexto largo, es donde las sesiones son más largas.

Si ningún proyecto conecta con el hueco de forma natural, **no lo fuerces**:
el reto puede ser sobre la propia práctica de la persona, como su forma de
trabajar con la herramienta, que también es material propio.

### 3. Escribir

Reglas:

- **15 a 30 minutos.** Si no entra en una sentada, es un proyecto, no un
  reto. Nadie empieza un reto de dos horas.
- **Pasos numerados**, cada uno terminando en algo observable: un número
  anotado, un archivo escrito, dos respuestas comparadas. Nada de
  "reflexioná sobre".
- **Sin instalar nada y sin pedirle permiso a nadie.** Si requiere una
  cuenta nueva o aprobación de alguien, no se hace.
- **Sobre material propio**, no sobre un ejemplo inventado. Esta es la
  regla que lo distingue de cualquier curso.
- **Cerrá diciendo qué cambia si le sale.** No felicites por adelantado.

Estructura que funciona: el fenómeno en dos párrafos, los pasos, y una
última sección corta sobre por qué vale la pena.

### 4. Guardar

Escribí `jobs/salida/reto-FECHA.json`:

```json
{
  "nodo": "contexto-largo",
  "titulo": "Nombra el problema, no el tema",
  "cuerpo": "markdown con ## y **negritas**",
  "porque": "Una oración con el dato medido que lo justifica",
  "minutos": 20
}
```

El campo `porque` se le muestra a la persona. Tiene que citar el número:
*"contexto largo es tu hueco más grande: 29 sobre 100, en 3 de 13
proyectos"*. Que vea de dónde salió.

### 5. Publicar

```
node jobs/publicar.mjs jobs/salida/reto-FECHA.json
```

Valida antes de escribir: nodo válido, cuerpo con cuerpo, el `porque`
presente, y entre 10 y 45 minutos. Y **frena si ya hay un reto abierto**
para esa persona, que es la regla que de otro modo se olvida.

## Reglas que no se rompen

- Un solo reto abierto por persona. Si ya hay uno sin cerrar, no generes
  otro: preguntá si lo quiere cambiar.
- Nunca un reto sobre un nodo donde la persona ya está fuerte.
- Nunca material de otra persona. Los proyectos propios y nada más.
- Si el reto no se puede empezar en los próximos cinco minutos, está mal
  escrito.
