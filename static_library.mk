# Define a static library.
#
# Args:
#   LOCAL_PATH: Path to the target's root (required)
#   LOCAL_NAME: Name of the target (required)
#   LOCAL_SRCS: List of source files relative to LOCAL_PATH (required)
#   LOCAL_DEPS: Other modules this one depends on
#
# Returns:
#   $(LOCAL_PATH)($(LOCAL_NAME)): Target that other targets can depend on

include build/c_rules.mk

LOCAL_DEPS ?=

TARGET := $(OUT)/$(LOCAL_PATH)/lib$(LOCAL_NAME).a

$(TARGET): $(LOCAL_OBJS) $(call expand_vars, $(LOCAL_DEPS))
	ar rcs $@ $?

$(LOCAL_PATH)($(LOCAL_NAME)) := $(TARGET)

TARGET :=

LOCAL_OBJS :=

LOCAL_NAME :=
LOCAL_SRCS :=
LOCAL_DEPS :=
