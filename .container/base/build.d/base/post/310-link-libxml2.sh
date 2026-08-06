#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  # What we are trying to do: satisfy the C linker contract for Crystal's XML stdlib.
  # Crystal links user programs with -lxml2, which resolves against the unversioned
  # libxml2.so symlink. The runtime package ships only libxml2.so.<soname>, so we
  # expose it under the unversioned name and `crystal spec` / `crystal build` work
  # out of the box for any project using `require "xml"`.
  # We deliberately do NOT install libxml2-dev: Crystal's XML bindings are baked
  # into the compiler, so only the link-time symlink is missing.
  # Disable with: B19_BUILD_DISABLE_LIBXML2_LINK=1

  # shellcheck source=/dev/null
  . b19-i18n

  if [ -n "${B19_BUILD_DISABLE_LIBXML2_LINK:-}" ]
  then
    b19-log info "LIBXML2" "$(_ "Skipping libxml2 link (B19_BUILD_DISABLE_LIBXML2_LINK set)")"
    return 0
  fi

  shopt -s nullglob
  for soname_path in /usr/lib/*/libxml2.so.* /lib/*/libxml2.so.*
  do
    # Only act on the soname symlink (libxml2.so.N); the real .so.N.m.p file is a
    # regular file and is skipped by the -L test. Under usrmerge /lib and /usr/lib
    # alias the same inode, so the existence guard below dedups the second hit.
    [ -L "$soname_path" ] || continue
    soname_dir="$(dirname "$soname_path")"
    soname_file="$(basename "$soname_path")"
    if [ ! -e "${soname_dir}/libxml2.so" ]
    then
      b19-run "LIBXML2" "$(_p "Link %s -> %s" "${soname_dir}/libxml2.so" "${soname_file}")" --      \
        ln -s "$soname_file" "${soname_dir}/libxml2.so"
    else
      b19-log info "LIBXML2" "$(_p "Already linked: %s" "${soname_dir}/libxml2.so")"
    fi
  done
