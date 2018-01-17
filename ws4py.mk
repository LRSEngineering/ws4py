
# ws4py.mk
# Makefile to include building sqlobject in a larger top-level project
# Copyright (C) 2018 Long Range Systems, LLC.  All rights reserved.

ifndef WS4PY_SRC_DIR
  WS4PY_SRC_DIR := $(dir $(lastword $(MAKEFILE_LIST)))
endif

ifndef BUILD_TOOLS_DIR
  ${error BUILD_TOOLS_DIR not defined! You must specify where build tools reside}
endif

# greenlet package version
WS4PY_PV = 1.4.1

# Build revision
WS4PY_PR = -r1

# Overall build version
WS4PY_BV = $(WS4PY_PV)$(WS4PY_PR)


WS4PY_DOTFILE = $(call python-cross-dotfile,ws4py,$(WS4PY_BV))

WS4PY_DEPS = $(WS4PY_DOTFILE)

$(WS4PY_DOTFILE): $(BUILD_PYTHON_NATIVE_MODULE_DEPS)
	$(call build-python-native-module,$(WS4PY_SRC_DIR))
	touch $@
