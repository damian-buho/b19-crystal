<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Multi-arch static cross-build from one image

- **Problem.** Crystal’s --cross-compile only emits an object file and a link command that must be run on the target machine, the most-abandoned workflow in the ecosystem.
- **Under consideration.** Pre-install foreign-architecture libraries and a crystal-cross <triple> wrapper that runs Crystal’s emitted link step in-image.
- **Rests on.** Debian and Ubuntu multiarch plus cross-gcc toolchains are apt-installable; Crystal prints the exact cc line.
