'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "42784a79af707b6b806a340ae7b340d5",
"version.json": "165b77f9d6f4bf96cc8c7fc1c12084b1",
"index.html": "de5a58138c1df37d11f100a3473cb21a",
"/": "de5a58138c1df37d11f100a3473cb21a",
"main.dart.js": "bcccc9440514860938c2bd1ba5b29480",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "7772f1db39348196899f0acf1c8c4219",
"assets/AssetManifest.json": "b6cba7d14113d8d4741d5ebc6df2ff10",
"assets/NOTICES": "a8c54ed9f857ca72b1b82c522c6642e4",
"assets/FontManifest.json": "7b2a36307916a9721811788013e65289",
"assets/AssetManifest.bin.json": "f8b405dd7de2d217e7f20954215fbbe3",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "24beedc88880ba869db8f99d86f4db5c",
"assets/fonts/MaterialIcons-Regular.otf": "8a4a98fa706a22fa8e31e3560cee9cb3",
"assets/assets/images/projects/avance/4.webp": "3571483b2187c517fa50b793c06720cb",
"assets/assets/images/projects/avance/3.webp": "986403188fff4561ffb7cebb07bdff77",
"assets/assets/images/projects/avance/2.webp": "f02013d357e68f64eb14436b7ae3139e",
"assets/assets/images/projects/avance/1.webp": "dd3274af1d029cb58e091906423ac52f",
"assets/assets/images/projects/cof/5.webp": "19d5978137b23fc05c07228edbe23dcd",
"assets/assets/images/projects/cof/4.webp": "d7ec78bf2914f9ed3375708f1c6e91b8",
"assets/assets/images/projects/cof/3.webp": "fad8700959ef450d87223394d1f7f79f",
"assets/assets/images/projects/cof/2.webp": "93b59f4ffad9c26d3c817335efe2839b",
"assets/assets/images/projects/cof/1.webp": "e546ded942f651d0a9d24d509f5ceb83",
"assets/assets/images/projects/cusca/5.webp": "abe4951aae35fa6071c8fb4cb71e6eba",
"assets/assets/images/projects/cusca/4.webp": "99b3878be7bd5e550b8bd4aeab14cf56",
"assets/assets/images/projects/cusca/3.webp": "77b09d0632245e49b3abeafc2b7a7487",
"assets/assets/images/projects/cusca/2.webp": "79b757fbe03a842260ce27cee79c3047",
"assets/assets/images/projects/cusca/1.webp": "d903d1d3087ad0da0cf0bd3c991a8bb1",
"assets/assets/images/projects/fedemovil/5.webp": "f5f0fbdc79eb1b5a6f0e7ad236390d6c",
"assets/assets/images/projects/fedemovil/4.webp": "28e9fc443250d3bfef7ff946af95796c",
"assets/assets/images/projects/fedemovil/3.webp": "6f33e63c5028f9e27735d2cce1614b58",
"assets/assets/images/projects/fedemovil/2.webp": "e1c7453cb43e6a30deb2dacec89b20a3",
"assets/assets/images/projects/fedemovil/1.webp": "af50c3b40df5ce30ab2ad51101c5c4c7",
"assets/assets/images/projects/comersal/4.webp": "11810013272a4db355bd31bdb891833c",
"assets/assets/images/projects/comersal/3.webp": "b0ca3a89547fac2bfa7c204ca2f064e1",
"assets/assets/images/projects/comersal/2.webp": "1403838bfa0ab462f6a97ed2e07e67f4",
"assets/assets/images/projects/comersal/1.webp": "5267f6211686ad44657214d900bc58e4",
"assets/assets/images/projects/bh/5.webp": "cc533b93375df9d421219f872afcdd82",
"assets/assets/images/projects/bh/4.webp": "737aea948832b7346190a03762701631",
"assets/assets/images/projects/bh/3.webp": "35403c65ffac1cd2fec51ce6e8587db9",
"assets/assets/images/projects/bh/2.webp": "2795a134d1fac9a2978ab0a8f35d8033",
"assets/assets/images/projects/bh/1.webp": "ca07d1e2fde0885965d6f06875420bc9",
"assets/assets/images/avatar.webp": "a2ab01d9bba249fe78f479e0f789d04c",
"assets/assets/images/logos/kmp%2520copy.webp": "36285031f7c9002f9c3b1140a3c47ca2",
"assets/assets/images/logos/git.webp": "c33870ba9d22fa16c1b91b18cec21ec8",
"assets/assets/images/logos/udb.webp": "b35fefce18af614b388bab5d6cf88054",
"assets/assets/images/logos/ktor.webp": "41eeb6c9a3bb4c1c7622f22286c20fd1",
"assets/assets/images/logos/elaniin.webp": "b6eb8da6fccfce1bffd3140f57e28d2e",
"assets/assets/images/logos/applaudo.webp": "e6420636a5b18862163f76a612e3db16",
"assets/assets/images/logos/tecnoin.webp": "5b2d9400032ca5fcef27c012359808c8",
"assets/assets/images/logos/cof.webp": "4edb5eb97e15cc9ae8024a75817821fa",
"assets/assets/images/logos/idigitalstudios.webp": "932b8adb2b4567e92f1823609776ee5b",
"assets/assets/images/logos/cusca.webp": "b339b6fcea2f7ad9bab810dc7ac19cb6",
"assets/assets/images/logos/comersal.webp": "3e1e3b81712b7b5737268651a03a9bf7",
"assets/assets/images/logos/fedemovil.webp": "7da1d39a1957882320b793589c9e7417",
"assets/assets/images/logos/ideaworks.webp": "8d10b09ecf9496e62176af1b4060a075",
"assets/assets/images/logos/laravel.webp": "c9b58f8c391aa99ec73e43b7009dfa0a",
"assets/assets/images/logos/kmp.webp": "36285031f7c9002f9c3b1140a3c47ca2",
"assets/assets/images/logos/tools.webp": "53559d4a91bd8f263281ec2ed70d12bf",
"assets/assets/images/logos/bh.webp": "710890981590e25ca5db957894d89e43",
"assets/assets/images/logos/avance.webp": "9a4aa1a33d7aeb74638765dfe9a8cd9c",
"assets/assets/images/logos/flutter.webp": "3a4cae2fb7ca800ea09691409a224401",
"assets/assets/images/logos/android.webp": "442bf3f3e8619a0873a039d0f45af0df",
"assets/assets/images/logos/sys.webp": "4ffd587e6fdce835280683abe1a18d45",
"assets/assets/images/logos/apple.webp": "8fa151e637e7d6b4b3319c035baccafc",
"assets/assets/images/icons/linkedin.webp": "eff5ff3196c42d708ef59de1141f4f07",
"assets/assets/images/icons/huawei.webp": "8ce686c3b521c785000e0fedababad9f",
"assets/assets/images/icons/github.webp": "dfe8caceaeabb77aeac84c4a7008de42",
"assets/assets/images/icons/whatsapp.webp": "c05e77ff82be069a83ab9f3064eee4ff",
"assets/assets/images/icons/gmail.webp": "c94ce9c3200b4f6d22c1148a4b48be26",
"assets/assets/images/icons/google_play.webp": "38188643e43485240a789591a7a925e0",
"assets/assets/data/portfolio.json": "208ec57159708a60df9c0ce646f5118e",
"assets/assets/data/projects.json": "32b06a7dcca9d6a9356c01468cf3c5aa",
"assets/assets/data/skills.json": "52bacc3008b848fb2b481cfb17c004a6",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
