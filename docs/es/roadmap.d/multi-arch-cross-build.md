<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Compilación cruzada estática multiarquitectura desde una sola imagen

- **Problema.** El `--cross-compile` de Crystal solo emite un archivo objeto y un comando de enlazado que debe ejecutarse en la máquina destino, el flujo de trabajo más abandonado del ecosistema.
- **En estudio.** Preinstalar bibliotecas de arquitecturas foráneas y un envoltorio `crystal-cross <triple>` que ejecuta en la imagen el paso de enlazado que emite Crystal.
- **Depende de.** El multiarch de Debian y Ubuntu junto con las cadenas cross-gcc se instalan desde apt; Crystal imprime la línea `cc` exacta.

<!-- textlint-enable -->
