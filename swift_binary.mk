LOCAL_DEPS ?=
LOCAL_SWIFT_FLAGS ?=

TARGET := $(OUT)/$(LOCAL_PATH)/$(LOCAL_NAME)
SRCS := $(addprefix $(LOCAL_PATH)/, $(LOCAL_SRCS))

$(TARGET): SWIFT_FLAGS := $(GLOBAL_SWIFT_FLAGS) $(LOCAL_SWIFT_FLAGS)
$(TARGET): $(SRCS)
	@echo SWIFTC $@
	@mkdir -p $(@D)
	@$(SWIFTC) $(SWIFT_FLAGS) -o $@ $^

$(LOCAL_PATH)($(LOCAL_NAME)) := $(TARGET)

TARGET :=
SRCS :=

LOCAL_NAME :=
LOCAL_SRCS :=
LOCAL_DEPS :=
LOCAL_SWIFT_FLAGS :=
