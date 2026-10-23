#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

  set -eou pipefail

  # shellcheck source=/dev/null
  . b19-i18n

  TESTDIR=$(mktemp -d)
  mkdir --parents "${TESTDIR}/src"
  printf 'name: stdlib\nversion: 0.0.0\n' > "${TESTDIR}/shard.yml"

  # Each require pulls one C library the stdlib links: yaml, xml2, z, gmp, ssl/crypto, pcre2-8
  cat > "${TESTDIR}/src/stdlib.cr" <<'EOF'
require "yaml"
require "xml"
require "compress/zlib"
require "big"
require "openssl"
require "digest/sha256"
io = IO::Memory.new
Compress::Zlib::Writer.open(io) { |z| z.print "ok" }
io.rewind
puts [
  YAML.parse("k: ok")["k"].as_s,
  XML.parse("<k>ok</k>").first_element_child.try(&.content),
  Compress::Zlib::Reader.open(io, &.gets_to_end),
  (BigInt.new(2) ** 100).to_s.size == 31 ? "ok" : "big",
  Digest::SHA256.hexdigest("ok").size == 64 ? "ok" : "ssl",
  ("ok" =~ /^o.$/) ? "ok" : "pcre",
].uniq.join(",")
EOF
  binary="${TESTDIR}/dist/stdlib-$(uname -s | tr '[:upper:]' '[:lower:]')-$(uname -m)"

  for static in false true; do
    link=()
    [[ "${static}" == true ]] && link=(--static --link-flags "$(pkg-config --static --libs libssl libxml-2.0)")
    mkdir --parents "${TESTDIR}/dist"
    crystal build "${TESTDIR}/src/stdlib.cr" --release --no-debug "${link[@]}" --output "${binary}" 1>&2
    result="$("${binary}")"
    if [[ "${result}" != ok ]]; then
      b19-log error "CRYSTAL" "$(_p "stdlib link test with static %s printed %s, expected ok" "${static}" "${result}")"
      exit 1
    fi
    interpreter="$(readelf --program-headers "${binary}" | grep --count INTERP || true)"
    if [[ "${static}" == true && "${interpreter}" != 0 ]] || [[ "${static}" == false && "${interpreter}" == 0 ]]; then
      b19-log error "CRYSTAL" "$(_p "stdlib link test with static %s built %s with %s ELF interpreters" "${static}" "${binary}" "${interpreter}")"
      exit 1
    fi
    b19-log good "CRYSTAL" "$(_p "stdlib link test with static %s passed" "${static}")"
  done

  rm -rf "${TESTDIR}"
