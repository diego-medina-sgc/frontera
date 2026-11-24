// Service worker.
//
// Está por dos razones: sin un worker con handler de fetch, Chrome no
// ofrece instalar la app en el teléfono; y guardar el armazón hace que
// abra al instante aunque la conexión esté mala.
//
// La versión anterior tenía un problema serio: guardaba app.js y
// styles.css, así que una versión vieja podía quedar servida y la
// persona no se enteraba de que había una nueva. Ahora:
//
//   · solo se guarda lo mínimo para que arranque sin conexión
//   · el código siempre se pide a la red
//   · cuando hay una versión nueva, la app avisa en pantalla
//
// Al cambiar algo acá, subir el número de CACHE.

const CACHE = 'frontera-v13';

// Solo lo indispensable para que algo se vea sin conexión. El código no
// entra: que lo traiga la red siempre.
const MINIMO = ['./index.html', './icono.svg', './manifest.webmanifest'];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE)
      .then((c) => c.addAll(MINIMO))
      .then(() => self.skipWaiting())
  );
});

self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys()
      .then((ks) => Promise.all(ks.filter((k) => k !== CACHE).map((k) => caches.delete(k))))
      .then(() => self.clients.claim())
      .then(() => self.clients.matchAll({ type: 'window' }))
      .then((clientes) => {
        // Si ya había una versión corriendo, avisarle. En la primera
        // instalación no hay a quién avisar y no molesta a nadie.
        for (const c of clientes) c.postMessage({ tipo: 'version-nueva' });
      })
  );
});

self.addEventListener('fetch', (e) => {
  const url = new URL(e.request.url);

  // Supabase, el CDN y todo lo externo van directo a la red.
  if (e.request.method !== 'GET' || url.origin !== self.location.origin) return;

  e.respondWith(
    fetch(e.request)
      .then((r) => {
        // Solo se guarda el armazón mínimo, como red de emergencia.
        if (MINIMO.some((m) => url.pathname.endsWith(m.replace('./', '')))) {
          const copia = r.clone();
          caches.open(CACHE).then((c) => c.put(e.request, copia));
        }
        return r;
      })
      .catch(() => caches.match(e.request).then((r) => r || caches.match('./index.html')))
  );
});
