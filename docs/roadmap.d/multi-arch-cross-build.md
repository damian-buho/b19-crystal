<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Multi-arch static cross-build from one image

- **Problem.** Crystal cross-compilation only emits an object file and a link command that must be run on the target machine, the most-abandoned workflow in the ecosystem.
- **Under consideration.** Pre-install foreign-architecture libraries and a wrapper that runs the emitted link step in-image.
- **Rests on.** Debian and Ubuntu multiarch plus cross-gcc toolchains are apt-installable; Crystal prints the exact link command.
