<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Shards install in production mode

- The `install-shards-from-deps` tool runs `shards install --production` when a `shard.yml` is present in the project, otherwise it logs and skips.
- Install roots are pinned by environment: `SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards` (download cache) and `SHARDS_INSTALL_PATH=${B19_HOME}/lib` (installed libraries).
- It runs as an inheritable `user/post` hook (`.i.sh`), so downstream images inherit dependency installation with no extra wiring; the shards cache mount uses BuildKit `sharing=locked`.
