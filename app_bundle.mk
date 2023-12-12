# Define a macOS app bundle.
#
# Args:
#   LOCAL_PATH: Path to the target's root (required)
#   LOCAL_NAME: Name of the target (required)
#   LOCAL_EXE: Executable target (required)
#   LOCAL_INFO_PLIST: Path to Info.plist file (required)

$(OUT)/$(LOCAL_PATH)/$(LOCAL_NAME).app: $($(LOCAL_EXE))
	@echo BUNDLE $@
	@mkdir -p $@/Contents/MacOS $@/Contents/Resources
	@cp $(LOCAL_PATH)/$(LOCAL_INFO_PLIST) $@/Contents/
	@cp $($(LOCAL_EXE)) $@/Contents/MacOS
