<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Hot-reload dev loop

- **Problem.** Editing a Crystal app means stopping and rebuilding; there is no file-watcher built-in.
- **Under consideration.** A make dev target that detects file changes and re-evaluates the app automatically.
- **Rests on.** The bundled interpreter and standard file-watching support.
