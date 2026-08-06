# SPDX-FileCopyrightText: 2026 Damián Búho <damian.buho@proton.me>
#
# SPDX-License-Identifier: MIT

# M6E MAKEFILE T3

# Rules

# Includes — core only; the autoloader pulls container/b19/languages by tier marker

all: .makefile/core/initialize.mk

.makefile/core/initialize.mk:
	git submodule update --init --recursive
	$(MAKE) bootstrap

-include .makefile/core/initialize.mk
