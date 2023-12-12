# Define a source set target.
#
# A source set is a collection of sources that get compiled but are not linked
# to produce any kind of library. Instead, resulting object files are
# implicitly added to the linker line of all targets that depend on the source
# set.
#
# Args:
#   LOCAL_PATH: Path to the target's root (required)
#   LOCAL_NAME: Name of the target (required)
#   LOCAL_SRCS: List of source files relative to LOCAL_PATH (required)
#   LOCAL_DEPS: Other targets this one depends on
#   LOCAL_CFLAGS: Local CFLAGS
#
# Returns:
#   $(LOCAL_PATH)($(LOCAL_NAME)): Target that other targets can depend on

include build/c_rules.mk

LOCAL_DEPS ?=

$(LOCAL_PATH)($(LOCAL_NAME)) := $(LOCAL_OBJS) $(call expand_vars, $(LOCAL_DEPS))

LOCAL_OBJS :=

LOCAL_NAME :=
LOCAL_SRCS :=
LOCAL_DEPS :=
