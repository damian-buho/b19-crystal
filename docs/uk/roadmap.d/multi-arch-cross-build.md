<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Статичне крос-збирання для кількох архітектур з одного образу

- **Проблема.** `--cross-compile` Crystal лише видає об’єктний файл і команду компонування, яку потрібно виконати на цільовій машині, — найбільш покинутий робочий процес в екосистемі.
- **Розглядається.** Передвстановити бібліотеки чужих архітектур і обгортку `crystal-cross <triple>`, що виконує в образі крок компонування, виданий Crystal.
- **Спирається на.** multiarch Debian і Ubuntu разом із крос-ланцюжками cross-gcc встановлюються з apt; Crystal друкує точний рядок cc.

<!-- textlint-enable -->
