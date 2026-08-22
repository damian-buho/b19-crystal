<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Binario único estático (musl)

- **Problema.** Una base Ubuntu con glibc no puede producir limpiamente un binario estático portátil; la propia guía de Crystal desaconseja el enlazado estático con glibc.
- **En estudio.** Superponer una cadena de herramientas musl más archivos estáticos y un envoltorio `crystal-static` que invoca `crystal build --static` con musl-gcc.
- **Depende de.** musl-gcc es un paquete de apt; el tarball incluido ya incorpora los archivos estáticos de libgc, libpcre2 y libevent.

<!-- textlint-enable -->
