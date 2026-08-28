# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

ARG B19_UBUNTU_BASE_IMAGE=registry.invalid/b19/ubuntu/resolute:latest

FROM ${B19_UBUNTU_BASE_IMAGE} AS b19-crystal

ARG B19_COLOR
ARG B19_FETCH_DOCKER_CACHE
ARG B19_FETCH_LOCAL_CACHE
ARG B19_OFFGRID_MODE
ARG B19_VERBOSITY
ARG LANG=""
ARG M6E_AI=N
ARG M6E_APT_CACHE_HOST=""
ARG M6E_APT_CACHE_PORT=""
ARG M6E_NEAR_CACHE_HOST=""
ARG M6E_NAMESPACE
ARG M6E_PROJECT
ARG M6E_VERSION
ARG TARGETARCH

ENV B19_PREFIX="/usr/local"                         \
    SHARDS_CACHE_PATH=${XDG_CACHE_HOME}/shards      \
    SHARDS_INSTALL_PATH=${B19_HOME}/lib


WORKDIR ${B19_HOME}

USER 0

COPY --chown=${B19_UID}:${B19_GID} .container/base/ /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                             \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=cache,id=apt-cache-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/cache/apt,sharing=shared       \
    --mount=type=cache,id=apt-lists-${B19_UBUNTU_SERIES}-${TARGETARCH},target=/var/lib/apt,sharing=shared         \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                      \
    build-stage base

# hadolint ignore=DL3066 # B19_UID comes from the root
USER ${B19_UID}

COPY --chown=${B19_UID}:${B19_GID} .container/user/ /

RUN --mount=type=bind,from=fetch,source=.,target=/fetch                                             \
    --mount=type=cache,target=${B19_DOWNLOAD_PATH},sharing=shared,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=cache,target=${SHARDS_CACHE_PATH},sharing=locked,uid=${B19_UID},gid=${B19_GID}     \
    --mount=type=tmpfs,target=${B19_TEMP_PATH}                                                      \
    build-stage user

# ENTRYPOINT ["entrypoint.d"] is inherited
# HEALTHCHECK CMD ["healthcheck.d"] is inherited
# Don't use CMD ["sleep", "infinity"] here
