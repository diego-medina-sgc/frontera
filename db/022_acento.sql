-- El acento elegido, en el perfil y no solo en el navegador.
--
-- El tamaño de letra y el fondo de lectura siguen siendo del aparato:
-- son condiciones de lectura y cambian según dónde estés leyendo. El
-- color, en cambio, es identidad: si lo elegiste en el teléfono,
-- esperás encontrarlo en la computadora.
--
-- Queda nullable a propósito. Null no es "eligió lima": es "todavía no
-- eligió", y ahí la app sube lo que haya guardado el navegador. Con un
-- default de 'lima' no se podrían distinguir los dos casos.
--
-- Sin check: la lista de acentos vive en app.js, que ya cae en lima
-- ante cualquier valor que no conozca. Un check acá obligaría a una
-- migración cada vez que se agregue un color.
--
-- Los permisos ya están: profiles tiene grant de update y la política
-- mio_profiles_update deja escribir solo la fila propia. Una columna
-- nueva entra en los dos sin tocar nada.

alter table profiles add column if not exists accent text;

comment on column profiles.accent is 'Acento elegido en Ajustes. Null = todavia no eligio.';
