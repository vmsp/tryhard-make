# Define globally accessible variables. These must not be overwritten.
#
# Args:
#   MODE: Build mode. `dbg` for debug or `opt` for optimized. Defaults to `dbg`

MODE ?= dbg

HOST_OS := $(shell uname)
ifeq ($(HOST_OS), Darwin)
HOST_OS := mac
IS_MAC := true
else
ifeq ($(HOST_OS), Linux)
HOST_OS := linux
IS_LINUX := true
endif
endif

CC := clang
CXX := clang++

GLOBAL_CFLAGS :=
GLOBAL_CXXFLAGS := -I. -std=c++20 -fno-rtti -fno-exceptions
GLOBAL_LDFLAGS := -fuse-ld=lld

ifeq ($(MODE), opt)
GLOBAL_CXXFLAGS += -g0 -Ofast -flto -DNDEBUG
else
ifeq ($(MODE), dbg)
SAN_FLAGS := -fsanitize=address,undefined
GLOBAL_CXXFLAGS += -g3 -O0 -Wall -Wextra -DDEBUG $(SAN_FLAGS)
GLOBAL_LDFLAGS += $(SAN_FLAGS)
endif
endif
