<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Imagen de ejecución para producción con un solo comando

- **Problema.** La separación compile-crystal → slim-runtime existe en el scaffold, pero ningún destino llave en mano impulsa una compilación optimizada.
- **En estudio.** Un destino release que ejecuta `crystal build --release --no-debug` hacia `/export` y emite un runtime mínimo con solo el binario y sus dependencias de bibliotecas compartidas en tiempo de ejecución.
- **Depende de.** La etapa compile-crystal y la convención `/export` ya existen; el patrón multietapa coincide con las imágenes oficiales de Crystal.

<!-- textlint-enable -->
