<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Instalación de Shards en modo producción

- La herramienta `install-shards-from-deps` ejecuta `shards install --production` cuando el proyecto contiene un `shard.yml`; de lo contrario, lo registra en el log y lo omite.
- La caché de descargas queda fijada por entorno (`SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards`); las bibliotecas se instalan en el `lib/` propio del proyecto, donde las busca el compilador.
- Se ejecuta como un hook `user/post` heredable (`.i.sh`), de modo que las imágenes derivadas heredan la instalación de dependencias sin cableado extra; el montaje de la caché de shards usa `sharing=locked` de BuildKit.

<!-- textlint-enable -->
