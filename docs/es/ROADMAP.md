<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

[English](../../ROADMAP.md) · [Українська](../uk/ROADMAP.md)

# Hoja de ruta

## Hoja de ruta del proyecto

### Bucle de desarrollo con recarga en caliente

- **Problema.** Editar una aplicación Crystal implica detenerla y recompilar, y Crystal no incluye ningún vigilante de archivos.
- **En estudio.** Un destino `make dev` que ejecuta la aplicación bajo el intérprete de Crystal detrás de un vigilante de archivos, reevaluando al guardar.
- **Depende de.** El intérprete `crystal i` incluido y vigilantes estándar como watchexec; b19-exec ejecuta el servicio.

### Compilación cruzada estática multiarquitectura desde una sola imagen

- **Problema.** El `--cross-compile` de Crystal solo emite un archivo objeto y un comando de enlazado que debe ejecutarse en la máquina destino, el flujo de trabajo más abandonado del ecosistema.
- **En estudio.** Preinstalar bibliotecas de arquitecturas foráneas y un envoltorio `crystal-cross <triple>` que ejecuta en la imagen el paso de enlazado que emite Crystal.
- **Depende de.** El multiarch de Debian y Ubuntu junto con las cadenas cross-gcc se instalan desde apt; Crystal imprime la línea `cc` exacta.

### Imagen de ejecución para producción con un solo comando

- **Problema.** La separación compile-crystal → slim-runtime existe en el scaffold, pero ningún destino llave en mano impulsa una compilación optimizada.
- **En estudio.** Un destino release que ejecuta `crystal build --release --no-debug` hacia `/export` y emite un runtime mínimo con solo el binario y sus dependencias de bibliotecas compartidas en tiempo de ejecución.
- **Depende de.** La etapa compile-crystal y la convención `/export` ya existen; el patrón multietapa coincide con las imágenes oficiales de Crystal.

### Binario único estático (musl)

- **Problema.** Una base Ubuntu con glibc no puede producir limpiamente un binario estático portátil; la propia guía de Crystal desaconseja el enlazado estático con glibc.
- **En estudio.** Superponer una cadena de herramientas musl más archivos estáticos y un envoltorio `crystal-static` que invoca `crystal build --static` con musl-gcc.
- **Depende de.** musl-gcc es un paquete de apt; el tarball incluido ya incorpora los archivos estáticos de libgc, libpcre2 y libevent.
<!-- textlint-enable -->
