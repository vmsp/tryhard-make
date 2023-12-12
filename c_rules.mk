# Generate rules that know how to compile C, C++, Objective-C and Objective-C++
# code.
#
# Args:
#   OUT: Output directory root (required)
#   LOCAL_PATH: Path to the target's root (required)
#   LOCAL_SRCS: List of source files relative to LOCAL_PATH (required)
#   LOCAL_CFLAGS: Local CFLAGS
#   LOCAL_CXXFLAGS: Local CXXFLAGS
#
# Returns:
#   LOCAL_OBJS: List of object files relative to the project's root

LOCAL_CFLAGS ?=
LOCAL_CXXFLAGS ?=

DEPS_FLAGS = -MMD -MF $(basename $@).d -MP

$(OUT)/$(LOCAL_PATH)/%.c.o: CFLAGS := $(GLOBAL_CFLAGS) $(LOCAL_CFLAGS)
$(OUT)/$(LOCAL_PATH)/%.c.o: $(LOCAL_PATH)/%.c
	@echo CC $@
	@mkdir -p $(@D)
	@$(CC) $(DEPS_FLAGS) $(CFLAGS) -c $< -o $@

$(OUT)/$(LOCAL_PATH)/%.m.o: CFLAGS := $(GLOBAL_CFLAGS) $(LOCAL_CFLAGS)
$(OUT)/$(LOCAL_PATH)/%.m.o: $(LOCAL_PATH)/%.m
	@echo CC $@
	@mkdir -p $(@D)
	@$(CC) $(DEPS_FLAGS) $(CFLAGS) -c $< -o $@

$(OUT)/$(LOCAL_PATH)/%.cc.o: CXXFLAGS := $(GLOBAL_CXXFLAGS) $(LOCAL_CXXFLAGS)
$(OUT)/$(LOCAL_PATH)/%.cc.o: $(LOCAL_PATH)/%.cc
	@echo CXX $@
	@mkdir -p $(@D)
	@$(CXX) $(DEPS_FLAGS) $(CXXFLAGS) -c $< -o $@

$(OUT)/$(LOCAL_PATH)/%.mm.o: CXXFLAGS := $(GLOBAL_CXXFLAGS) $(LOCAL_CXXFLAGS)
$(OUT)/$(LOCAL_PATH)/%.mm.o: $(LOCAL_PATH)/%.mm
	@echo CXX $@
	@mkdir -p $(@D)
	@$(CXX) $(DEPS_FLAGS) $(CXXFLAGS) -c $< -o $@

-include $(addprefix $(OUT)/$(LOCAL_PATH)/, $(LOCAL_SRCS:=.d))

LOCAL_OBJS := $(addprefix $(OUT)/$(LOCAL_PATH)/, $(LOCAL_SRCS:=.o))
