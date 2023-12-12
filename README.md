# TryHard Make

Rules for writing slightly better Makefiles in the style of Bazel, Buck and GN.

Features:

* Includes rules for building executables, static libraries, shared libraries, source sets -- a collection of source files -- and macOS app bundles.

* Supports C, C++, Objective-C and Objective-C++. Untested rules for Swift are also included.

* Can output artifacts in both optimized and debug modes by passing a `MODE` variable to Make. E.g. `make my_executable MODE=opt`.

* Builds are completely out-of-source. Build artifacts are placed in `/out/` and don't pollute your source tree.

Besides the already mentioned build systems, it's also heavily inspired by [Android.mk](https://developer.android.com/ndk/guides/android_mk) and [LK's build system](https://github.com/littlekernel/lk/blob/master/make/module.mk).

## Usage

``` makefile
# /my_library/build.mk
LOCAL_PATH := $(THIS_PATH)

LOCAL_NAME := my_library
LOCAL_SRCS := my_library.cc

include build/source_set.mk

# /mac_client/build.mk
LOCAL_PATH := $(THIS_PATH)

LOCAL_NAME := mac_executable
LOCAL_SRCS := \
  app_delegate.mm \
  main.mm \
  main_controller.mm
LOCAL_DEPS := my_library(my_library)
LOCAL_LDFLAGS := -framework Cocoa

include build/executable.mk

LOCAL_NAME := MacApp
LOCAL_EXE := mac_client(mac_executable)
LOCAL_INFO_PLIST := Info.plist

include build/app_bundle.mk
```

And then you can build an optimized macOS bundle:

``` sh
$ make out/mac_client/MacApp.app MODE=opt
```

## License

[MIT](https://choosealicense.com/licenses/mit/)
