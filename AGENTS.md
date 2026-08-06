<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# b19/crystal

Docker image built on [b19/Ubuntu](../ubuntu/AGENTS.md)

Crystal language runtime from upstream tarball.

## Key facts

- Base: `b19/ubuntu/${B19_UBUNTU_SERIES}` — single stage (no compiler stage)
- Installed from upstream release tarball (not Crystal PPA)
- No series axis (single image)
- Arch: amd64, arm64
- Pinned version: check `.container/base/deps/crystal/version.deps`

## ENV

- `SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards`
- `SHARDS_INSTALL_PATH=${B19_HOME}/lib`

## Behavior

`install-shards-from-deps` runs `shards install --production` if `shard.yml` is detected in the project.

## Documentation

- [Available make targets](@docs/MAKEFILE.md)
- [Known caveats and limitations](@docs/caveats.md)
- [Completed features](@docs/done.md)
- [Project fit and alignment](@docs/fit.md)
- [Project goals](@docs/goal.md)
- [Future roadmap](@docs/roadmap.md)
