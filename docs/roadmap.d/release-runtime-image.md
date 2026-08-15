<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# One-command release runtime image

- **Problem.** The compile-crystal to slim-runtime split exists in the scaffold, but no turnkey release target drives an optimized build.
- **Under consideration.** A release target that runs crystal build --release --no-debug into /export and emits a minimal runtime with only the binary and its runtime shared-library dependencies.
- **Rests on.** The compile-crystal stage and /export convention already exist; the multi-stage pattern matches the official Crystal images.
