<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Runtime-образ для випуску однією командою

- **Проблема.** Поділ compile-crystal → slim-runtime існує в scaffold, але жодна готова ціль випуску не веде оптимізоване збирання.
- **Розглядається.** Ціль release, що виконує `crystal build --release --no-debug` у `/export` і видає мінімальний runtime лише з бінарником та його динамічними залежностями бібліотек.
- **Спирається на.** Етап compile-crystal і угода `/export` вже існують; багатоетапний шаблон збігається з офіційними образами Crystal.

<!-- textlint-enable -->
