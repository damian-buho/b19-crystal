#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

set -eou pipefail

ACTUAL=$(get-crystal-version)
EXPECTED=$(decomment < /deps/crystal/version.deps)

b19-assert equals "CRYSTAL" "${EXPECTED}" "${ACTUAL}"
