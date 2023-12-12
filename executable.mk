# Define an executable target.
#
# Args:
#   LOCAL_PATH: Path to the target's root (required)
#   LOCAL_NAME: Name of the target (required)
#   LOCAL_SRCS: List of source files relative to LOCAL_PATH (required)
#   LOCAL_DEPS: Other modules this one depends on
#   LOCAL_LDFLAGS: Local LDFLAGS
#
# Returns:
#   $(LOCAL_PATH)($(LOCAL_NAME)): Target that other targets can depend on

include build/c_rules.mk

LOCAL_DEPS ?=
LOCAL_LDFLAGS ?=

TARGET := $(OUT)/$(LOCAL_PATH)/$(LOCAL_NAME)

$(TARGET): LDFLAGS := $(GLOBAL_LDFLAGS) $(LOCAL_LDFLAGS)
$(TARGET): $(LOCAL_OBJS) $(call expand_vars, $(LOCAL_DEPS))
	@echo LINK $@
	@mkdir -p $(@D)
	@$(CXX) $(LDFLAGS) -o $@ $^

$(LOCAL_PATH)($(LOCAL_NAME)) := $(TARGET)

TARGET :=

LOCAL_OBJS :=

LOCAL_NAME :=
LOCAL_SRCS :=
LOCAL_DEPS :=
LOCAL_LDFLAGS :=
