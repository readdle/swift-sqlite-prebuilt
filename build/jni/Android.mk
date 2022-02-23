LOCAL_PATH:= $(call my-dir)

ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
  ARCH_FOLDER := armv7
endif
ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
  ARCH_FOLDER := aarch64
endif
ifeq ($(TARGET_ARCH_ABI),x86)
  ARCH_FOLDER := i686
endif
ifeq ($(TARGET_ARCH_ABI),x86_64)
  ARCH_FOLDER := x86_64
endif

include $(CLEAR_VARS)
LOCAL_MODULE    := icuuc
LOCAL_SRC_FILES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift-$(ARCH_FOLDER)/android/libicuucswift.so
LOCAL_EXPORT_C_INCLUDES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := icudata
LOCAL_SRC_FILES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift-$(ARCH_FOLDER)/android/libicudataswift.so
LOCAL_EXPORT_C_INCLUDES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := icui18n
LOCAL_SRC_FILES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift-$(ARCH_FOLDER)/android/libicui18nswift.so
LOCAL_EXPORT_C_INCLUDES += $(SWIFT_ANDROID_HOME)/toolchain/usr/lib/swift-aarch64
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := sqlite3
LOCAL_C_INCLUDES += $(LOCAL_PATH)/../sqlite-amalgamation
LOCAL_CFLAGS += -DHAVE_USLEEP=1
LOCAL_CFLAGS += -DSQLITE_ENABLE_API_ARMOR=1 
LOCAL_CFLAGS += -DSQLITE_ENABLE_ATOMIC_WRITE=1 
LOCAL_CFLAGS += -DSQLITE_ENABLE_COLUMN_METADATA=1 
LOCAL_CFLAGS += -DSQLITE_ENABLE_LOCKING_STYLE=0 
LOCAL_CFLAGS += -DSQLITE_ENABLE_FTS5=1 
LOCAL_CFLAGS += -DSQLITE_ENABLE_ICU=1
LOCAL_CFLAGS += -DSQLITE_ENABLE_RTREE=1
LOCAL_CFLAGS += -DSQLITE_ENABLE_UNLOCK_NOTIFY=1
LOCAL_SHARED_LIBRARIES = icudata icui18n icuuc
LOCAL_SRC_FILES  := ../sqlite-amalgamation/sqlite3.c
include $(BUILD_SHARED_LIBRARY)