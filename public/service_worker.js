const CACHE_VERSION = 'v1';
const CACHE_NAME = `timlead-cache-${CACHE_VERSION}`;

self.addEventListener('install', function(event) {
  event.waitUntil(
    caches.open(CACHE_NAME).then(function(cache) {
      return cache.addAll([
        '/',
        '/offline.html',
        '/pwa/logo-192.png',
        '/pwa/logo-512.png',
        // '/pwa/maskable-192.png',
        // '/pwa/maskable-512.png',
        // Add other critical assets
      ]);
    })
  );
});

self.addEventListener('fetch', function(event) {
  event.respondWith(
    caches.match(event.request).then(function(response) {
      return response || fetch(event.request).catch(function() {
        if (event.request.mode === 'navigate') {
          return caches.match('/offline.html');
        }
      });
    })
  );
}); 