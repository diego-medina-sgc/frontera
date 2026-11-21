# Frontera

**En vivo: https://frontera-bhv.pages.dev**

(el nombre `frontera` a secas ya estaba tomado en pages.dev, por eso el sufijo)


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
2. Después `db/002_seed.sql` y **Run**
3. Después `db/003_grants.sql` y **Run**

El tercero no es opcional: la seguridad por fila decide qué filas ve cada
uno, pero Postgres primero exige permiso sobre la tabla. Sin esos grants la
app falla con `permission denied for table profiles`.

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

### Volver a publicar después de un cambio

El proyecto en Cloudflare Pages es `frontera`, por subida directa (no está
conectado a Git todavía). Para publicar una versión nueva:

1. Empaquetar la carpeta `app`:

   `Compress-Archive -Path "C:\Users\Usuario\Desktop\Claude\Code\Frontera\app\*" -DestinationPath "$env:TEMP\frontera.zip" -Force`

2. Entrar a https://dash.cloudflare.com → Workers & Pages → `frontera`
   → **Create deployment**, y subir el zip.

Si el empaquetado falla diciendo que un archivo está en uso, es el servidor
local de pruebas: cerralo primero.

### Alta de usuarios: cerrada

*Allow new users to sign up* está **apagado**. Nadie puede crearse una cuenta
aunque tenga el link, y quien lo intente ve un mensaje claro en español.

Para sumar a alguien hay dos caminos:

- **Volver a abrirla un rato** en
  https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/auth/providers,
  que se registre, y apagarla de nuevo.
- **Crear la cuenta desde el panel**, en
  https://supabase.com/dashboard/project/lboyidbtjxjkhwupysks/auth/users
  → *Add user*, y pasarle el mail y la contraseña a la persona.

### 4. Publicarla (y recién ahí probarla)

**Abrir `app/index.html` haciendo doble clic NO funciona.** La app usa módulos
de JavaScript y el navegador los bloquea cuando el archivo viene del disco.
Hay que servirla por http. La vía más corta, gratis y sin instalar nada:

1. Entrá a https://dash.cloudflare.com (cuenta gratis si no tenés)
2. Menú izquierdo → **Workers & Pages** → **Create** → pestaña **Pages**
3. Elegí **Upload assets** y ponele nombre `frontera`
4. Arrastrá la carpeta `app` completa
5. **Deploy**

Queda en `https://frontera.pages.dev`. Cada vez que haya cambios, se vuelve a
arrastrar la carpeta (o lo conectamos al repo para que se actualice solo).

Si preferís probar local y tenés Python instalado, también sirve:
`python -m http.server 8080` dentro de `app/`, y abrís `http://localhost:8080`.

## El radar

El radar tiene dos mitades, y están pensadas para que la segunda nunca
cueste plata.

**Ingesta** (`jobs/radar.mjs`). Sale a buscar y guarda lo que encuentra,
sin juzgar nada. Cinco fuentes gratuitas y sin key: arXiv cs.AI y cs.CL
(los papers, donde la novedad nace), GitHub (qué se está construyendo),
Simon Willison (uno de los pocos que filtra bien) y Hacker News con piso
de 80 puntos (qué se discute). Ventana de tres días.

Probarlo sin tocar la base:

```powershell
node jobs/radar.mjs
```

Para que escriba, copiar `jobs/.env.example` a `jobs/.env`, completar la
secret key, y:

```powershell
node jobs/radar.mjs --guardar
```

Lo que ya está en la base no se duplica: lo decide el índice único sobre
el hash de la URL.

**Triage y redacción** (pendiente). Es la mitad que importa: decidir qué
de todo eso es nuevo de verdad, qué le sirve a cada nivel, y escribir la
lección. Corre con la suscripción de Claude desde esta máquina, no con una
API paga. Sin esa mitad, el radar junta ruido: de 105 señales de un día
cualquiera, las que valen la pena son dos o tres.

## Acceso de Claude a la base (opcional)

Mi conexión a Supabase está autorizada solo para la organización de SGC, así
que no veo este proyecto y no puedo aplicar migraciones ni leer logs desde
acá. Si reconectás el conector de Supabase (`/mcp`) incluyendo esta
organización, puedo trabajar la base directo y vos no tenés que pegar SQL a
mano. Si al reconectar te deja elegir una sola organización, conviene dejar
la de SGC y seguir con el editor SQL para este proyecto.
