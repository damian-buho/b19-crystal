<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
SPDX-License-Identifier: MIT
-->

[Español](docs/es/ROADMAP.md) · [Українська](docs/uk/ROADMAP.md)

# Roadmap

## Project Roadmap

### Hot-reload dev loop

- **Problem.** Editing a Crystal app means stopping and rebuilding; there is no file-watcher built-in.
- **Under consideration.** A make dev target that detects file changes and re-evaluates the app automatically.
- **Rests on.** The bundled interpreter and standard file-watching support.

### Multi-arch static cross-build from one image

- **Problem.** Crystal cross-compilation only emits an object file and a link command that must be run on the target machine, the most-abandoned workflow in the ecosystem.
- **Under consideration.** Pre-install foreign-architecture libraries and a wrapper that runs the emitted link step in-image.
- **Rests on.** Debian and Ubuntu multiarch plus cross-gcc toolchains are apt-installable; Crystal prints the exact link command.

### One-command release runtime image

- **Problem.** The compile-to-slim-runtime split exists in the scaffold, but no turnkey release target drives an optimized build.
- **Under consideration.** A release target that compiles the app with full optimizations and emits a minimal runtime with only the binary and its runtime shared-library dependencies.
- **Rests on.** The existing compile stage and export convention; the multi-stage pattern matches the official Crystal images.

### Static single-binary output (musl)

- **Problem.** A glibc and Ubuntu base cannot cleanly produce a portable static binary; Crystal’s own guide discourages glibc static linking.
- **Under consideration.** Layer a musl toolchain plus static archives and a wrapper that compiles with static linking.
- **Rests on.** musl-gcc is an apt package; the bundled tarball already vendors static library archives.
