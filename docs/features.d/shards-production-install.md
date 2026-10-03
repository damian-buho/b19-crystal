<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Shards install in production mode

- The `install-shards-from-deps` tool runs `shards install --production` when a `shard.yml` is present in the project, otherwise it logs and skips.
- The download cache is pinned by environment (`SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards`); libraries install into the project’s own `lib/`, where the compiler looks.
- It runs as an inheritable `user/post` hook (`.i.sh`), so downstream images inherit dependency installation with no extra wiring; the shards cache mount uses BuildKit `sharing=locked`.
