<!--
SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>

SPDX-License-Identifier: MIT
-->

# Встановлення Shards у продакшн-режимі

- Інструмент `install-shards-from-deps` запускає `shards install --production`, якщо в проєкті є `shard.yml`; інакше він записує це в журнал і пропускає крок.
- Кореневі каталоги встановлення зафіксовані через середовище: `SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards` (кеш завантажень) і `SHARDS_INSTALL_PATH=${B19_HOME}/lib` (встановлені бібліотеки).
- Працює як успадковуваний хук `user/post` (`.i.sh`), тож похідні образи отримують встановлення залежностей без жодного додаткового налаштування; монтування кешу shards використовує `sharing=locked` BuildKit.
