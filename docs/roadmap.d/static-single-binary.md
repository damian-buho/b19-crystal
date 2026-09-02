<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Static single-binary output (musl)

- **Problem.** A glibc and Ubuntu base cannot cleanly produce a portable static binary; Crystal’s own guide discourages glibc static linking.
- **Under consideration.** Layer a musl toolchain plus static archives and a wrapper that compiles with static linking.
- **Rests on.** musl-gcc is an apt package; the bundled tarball already vendors static library archives.
