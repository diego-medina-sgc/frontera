# Frontera

App de aprendizaje continuo sobre IA. No es un feed: detecta el nivel real de
la persona, filtra el mundo por novedad genuina y enseña el salto al nivel
siguiente.

## Principios que no se negocian

1. **Costo cero.** Datos públicos por free tiers; nada personal pasa por un
   free tier que entrene con lo que recibe. La generación de lecciones corre
   local con la suscripción de Claude ya paga.
2. **Nunca te explica lo que ya sabés.** Se filtra por novedad real, no por
   tema: cada ítem se compara contra todo lo ya ingerido y el refrito se cae.
3. **El nivel es interno.** Nunca se muestra como etiqueta. Solo se usa para
   decidir qué servir.
4. **Nada de texto crudo.** De las conversaciones de la persona queda solo el
   perfil derivado. El export se procesa y se descarta.
5. **Las ideas de los libros, no los libros.** Síntesis propia con atribución
   al autor. Nunca texto del libro, nunca PDFs.

## Niveles

| | Nivel | Cómo se detecta | Qué se le enseña |
|---|---|---|---|
| 0 | Juega | Chats sueltos, imágenes, nada de trabajo | Que sirve para su trabajo real |
| 1 | Opera | Tareas reales pero manuales, sin contexto | Contexto, proyectos, iterar |
| 2 | Integra | Proyectos, herramientas conectadas | Construir: skills, código, sistemas |
| 3 | Construye | Escribe sistemas que funcionan | Medir, evaluar, dejar trabajo corriendo |
| 4 | Vanguardia | Decide qué adoptar con criterio propio | Solo la frontera |

El radar no se enciende hasta el nivel 2. A quien está en 0 o 1, el estado del
arte no le sirve: lo abruma y lo pierde.

## Estructura

```
db/      esquema y seed de Postgres
app/     front (HTML + JS, sin build step)
content/ lecciones en markdown, versionadas
jobs/    el job local que genera contenido con Claude Code
```

## Setup

Proyecto Supabase: `lboyidbtjxjkhwupysks`

> La organización `una institucion` está en plan Pro, donde cada proyecto
> nuevo cuesta 10 USD/mes. Esta app vive en una organización personal en plan
> **Free**: proyecto gratis, y sin mezclar datos personales con
> infraestructura institucional.

### 1. Crear las tablas

Abrí el editor SQL:
https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/sql/new

1. Pegá todo el contenido de `db/001_schema.sql` y apretá **Run**
2. Abrí una pestaña nueva de SQL, pegá `db/002_seed.sql` y **Run**

Tiene que decir *Success*. Si tira error, mandámelo y lo corrijo.

### 2. Permitir que se pueda entrar sin confirmar el mail

El mail propio de Supabase en plan Free está limitado a muy pocos envíos por
hora, así que no sirve para confirmar cuentas. Se usa mail + contraseña sin
confirmación:

https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/auth/providers

En **Email**, desactivá *Confirm email* y guardá.

### 3. Pegar la publishable key

https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/settings/api-keys

Copiá la **publishable key** (empieza con `sb_publishable_`) y pegala en
`app/config.js`, reemplazando `PEGAR_AQUI_LA_PUBLISHABLE_KEY`.

Esa key es pública por diseño: no habilita nada que la seguridad por fila no
permita. La `service_role` nunca va en el front ni en el repo.

### 4. Probarla

Abrí `app/index.html` en el navegador. Debería pedirte mail y contraseña,
dejarte crear cuenta y arrancar el Paso 1.

### 5. Deploy (pendiente)

Cloudflare Pages, gratis, apuntando a la carpeta `app/`.

## Acceso de Claude a la base (opcional)

Mi conexión a Supabase está autorizada solo para la organización de SGC, así
que no veo este proyecto y no puedo aplicar migraciones ni leer logs desde
acá. Si reconectás el conector de Supabase (`/mcp`) incluyendo esta
organización, puedo trabajar la base directo y vos no tenés que pegar SQL a
mano. Si al reconectar te deja elegir una sola organización, conviene dejar
la de SGC y seguir con el editor SQL para este proyecto.
