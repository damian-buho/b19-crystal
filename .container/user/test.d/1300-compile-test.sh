#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  TESTDIR=$(mktemp -d)

  # crystal build
  CRYSTAL_VERSION=$(crystal --version | head -n1 | grep -oP '\d+(?:\.\d+)+')
  echo 'puts "ok"' > "${TESTDIR}/hello.cr"
  crystal build "${TESTDIR}/hello.cr" -o "${TESTDIR}/hello"
  "${TESTDIR}/hello"
  b19-log good "CRYSTAL" "$(_p "crystal-%s compile test passed" "${CRYSTAL_VERSION}")"

  # crystal eval
  crystal eval "puts \"ok\""
  b19-log good "CRYSTAL" "$(_p "crystal-%s eval test passed" "${CRYSTAL_VERSION}")"

  rm -rf "${TESTDIR}"
