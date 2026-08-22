<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Bucle de desarrollo con recarga en caliente

- **Problema.** Editar una aplicación Crystal implica detenerla y recompilar, y Crystal no incluye ningún vigilante de archivos.
- **En estudio.** Un destino `make dev` que ejecuta la aplicación bajo el intérprete de Crystal detrás de un vigilante de archivos, reevaluando al guardar.
- **Depende de.** El intérprete `crystal i` incluido y vigilantes estándar como watchexec; b19-exec ejecuta el servicio.

<!-- textlint-enable -->
