<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

<!-- textlint-disable terminology,common-misspellings -->

# Статичний одиночний бінарник (musl)

- **Проблема.** База Ubuntu з glibc не може чисто створити переносний статичний бінарник; власний посібник Crystal відраджує статичне компонування з glibc.
- **Розглядається.** Нашарувати ланцюжок інструментів musl плюс статичні архіви й обгортку `crystal-static`, що викликає `crystal build --static` з musl-gcc.
- **Спирається на.** musl-gcc — це пакет apt; включений tarball вже містить статичні архіви libgc, libpcre2 і libevent.

<!-- textlint-enable -->
