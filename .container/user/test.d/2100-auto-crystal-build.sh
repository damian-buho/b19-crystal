#!/usr/bin/env bash

# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

set -eou pipefail

work="$(mktemp --directory)"
trap 'rm --recursive --force "${work}"' EXIT

host_os="$(uname -s)"; host_os="${host_os,,}"
case "$(uname -m)" in x86_64) host_arch=amd64 ;; aarch64) host_arch=arm64 ;; *) host_arch="$(uname -m)" ;; esac

project="${work}/project"
mkdir --parents "${project}/src"
cat > "${project}/projectfile.yaml" <<'EOF'
identity:
  name: fixture
org:
  projectfile:
    artifacts:
      fx:
        kind: binary
        path: dist/fx
        command: fx
        version-env: M6E_VERSION
EOF
printf 'name: fx\nversion: 0.0.0\n' > "${project}/shard.yml"
printf 'puts {{ env("M6E_VERSION") || "unset" }}\n' > "${project}/src/fx.cr"

asset="${project}/dist/fx-${host_os}-$(uname -m)"
(cd "${project}" && GITHUB_REF_NAME=1.2.3 auto-crystal-build)
[[ "$("${asset}")" == 1.2.3 ]] || { echo "FATAL: ${asset} reads $("${asset}"), expected 1.2.3" >&2; exit 1; }

# The ref name wins over an inherited M6E_VERSION, and the macro sees the resolved one
(cd "${project}" && GITHUB_REF_NAME=4.5.6 M6E_VERSION=0.0.1 auto-crystal-build)
[[ "$("${asset}")" == 4.5.6 ]] || { echo "FATAL: the second build reads $("${asset}"), expected 4.5.6" >&2; exit 1; }

# The release tag wins over the branch name a main run carries
(cd "${project}" && GITHUB_REF_NAME=main M6E_RELEASE_TAG=7.8.9 auto-crystal-build)
[[ "$("${asset}")" == 7.8.9 ]] || { echo "FATAL: the release tag lost to the ref name, ${asset} reads $("${asset}")" >&2; exit 1; }

# A foreign cell fails rather than ship a host binary under its name
foreign=riscv64
[[ "${host_arch}" == riscv64 ]] && foreign=amd64
if (cd "${project}" && TARGET_OS=linux TARGET_ARCH="${foreign}" auto-crystal-build) 2>/dev/null; then
  echo "FATAL: the linux/${foreign} cell built green on a ${host_arch} host" >&2
  exit 1
fi

# A missing program file fails, naming it
sed --in-place 's|^        command: fx$|        command: fx\n        package: src/missing.cr|' "${project}/projectfile.yaml"
if (cd "${project}" && auto-crystal-build) 2>/dev/null; then
  echo "FATAL: a missing program file built green" >&2
  exit 1
fi

# A project with no binary artifact is a green no-op
mkdir "${work}/empty"
printf 'identity:\n  name: empty\n' > "${work}/empty/projectfile.yaml"
(cd "${work}/empty" && auto-crystal-build)
