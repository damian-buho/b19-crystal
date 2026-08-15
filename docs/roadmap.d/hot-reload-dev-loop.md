<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Hot-reload dev loop

- **Problem.** Editing a Crystal app means stopping and rebuilding, and Crystal ships no file-watcher.
- **Under consideration.** A make dev target that runs the app under the Crystal interpreter behind a file-watcher, re-evaluating on save.
- **Rests on.** The bundled crystal i interpreter and standard watchers such as watchexec; b19-exec runs the service.
