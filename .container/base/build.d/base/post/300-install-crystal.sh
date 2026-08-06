#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT


  eval "$(b19-resolve-dep crystal "${TARGETARCH}")"

  b19-fetch "CRYSTAL" "${M6E_UPSTREAM__URL}" "${M6E_UPSTREAM__FILE}" "${M6E_UPSTREAM__HASH}"

  b19-run "CRYSTAL" "$(_p "Extract %s" "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}")" --      \
    tar --directory "${B19_PREFIX}"                                                       \
        --extract                                                                         \
        --file "${B19_TEMP_PATH}/${M6E_UPSTREAM__FILE}"                                   \
        --strip-components 2                                                              \
        --use-compress-program pigz

