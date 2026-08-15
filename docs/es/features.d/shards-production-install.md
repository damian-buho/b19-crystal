<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Instalación de Shards en modo producción

- La herramienta `install-shards-from-deps` ejecuta `shards install --production` cuando el proyecto contiene un `shard.yml`; de lo contrario, lo registra en el log y lo omite.
- Las raíces de instalación quedan fijadas por entorno: `SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards` (caché de descargas) y `SHARDS_INSTALL_PATH=${B19_HOME}/lib` (bibliotecas instaladas).
- Se ejecuta como un hook `user/post` heredable (`.i.sh`), de modo que las imágenes derivadas heredan la instalación de dependencias sin cableado extra; el montaje de la caché de shards usa `sharing=locked` de BuildKit.
