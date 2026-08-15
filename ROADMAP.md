<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

# Roadmap

## Project Roadmap

### Hot-reload dev loop

- **Problem.** Editing a Crystal app means stopping and rebuilding, and Crystal ships no file-watcher.
- **Under consideration.** A make dev target that runs the app under the Crystal interpreter behind a file-watcher, re-evaluating on save.
- **Rests on.** The bundled crystal i interpreter and standard watchers such as watchexec; b19-exec runs the service.

### Multi-arch static cross-build from one image

- **Problem.** Crystal’s --cross-compile only emits an object file and a link command that must be run on the target machine, the most-abandoned workflow in the ecosystem.
- **Under consideration.** Pre-install foreign-architecture libraries and a crystal-cross <triple> wrapper that runs Crystal’s emitted link step in-image.
- **Rests on.** Debian and Ubuntu multiarch plus cross-gcc toolchains are apt-installable; Crystal prints the exact cc line.

### One-command release runtime image

- **Problem.** The compile-crystal to slim-runtime split exists in the scaffold, but no turnkey release target drives an optimized build.
- **Under consideration.** A release target that runs crystal build --release --no-debug into /export and emits a minimal runtime with only the binary and its runtime shared-library dependencies.
- **Rests on.** The compile-crystal stage and /export convention already exist; the multi-stage pattern matches the official Crystal images.

### Static single-binary output (musl)

- **Problem.** A glibc and Ubuntu base cannot cleanly produce a portable static binary; Crystal’s own guide discourages glibc static linking.
- **Under consideration.** Layer a musl toolchain plus static archives and a crystal-static wrapper that calls crystal build --static with musl-gcc.
- **Rests on.** musl-gcc is an apt package; the bundled tarball already vendors static libgc, libpcre2, and libevent archives.
