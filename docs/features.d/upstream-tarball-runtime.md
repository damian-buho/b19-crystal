<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Crystal runtime from the upstream release tarball

- Crystal is installed from the upstream GitHub release tarball (`crystal-{version}-1-linux-{arch}-bundled.tar.gz`), not from the Crystal APT PPA.
- The tarball is extracted with `--strip-components 2` into `${B19_PREFIX}` (`/usr/local`); the `-bundled` release variant is used.
- Single build stage on `b19/ubuntu` with no separate compiler stage and no series axis -- a single image.
- Version is pinned in `.container/base/deps/crystal/version.deps`; per-arch URL and hash live under `.container/base/deps/crystal/{arch}.url.deps` and `{arch}.hash.deps`.
- Supports amd64 and arm64.
