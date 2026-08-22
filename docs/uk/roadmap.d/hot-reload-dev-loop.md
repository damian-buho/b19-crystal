<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Цикл розробки з гарячим перезавантаженням

- **Проблема.** Редагування застосунку Crystal означає зупинку і повторне збирання, а Crystal не постачає жодного спостерігача файлів.
- **Розглядається.** Ціль `make dev`, що запускає застосунок під інтерпретатором Crystal за спостерігачем файлів, повторно обчислюючи код під час збереження.
- **Спирається на.** Включений інтерпретатор `crystal i` і стандартні спостерігачі на кшталт watchexec; b19-exec запускає службу.

<!-- textlint-enable -->
