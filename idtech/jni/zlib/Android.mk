LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# measurements show that the ARM version of ZLib is about x1.17 faster
# than the thumb one...
LOCAL_ARM_MODE := arm

zlib_files := \
	src/adler32.c \
	src/compress.c \
	src/crc32.c \
	src/deflate.c \
	src/gzclose.c \
	src/gzlib.c \
	src/gzread.c \
	src/gzwrite.c \
	src/infback.c \
	src/inflate.c \
	src/inftrees.c \
	src/inffast.c \
	src/trees.c \
	src/uncompr.c \
	src/zutil.c


include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_MODULE := libmy_z
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -O3 -DUSE_MMAP
LOCAL_SRC_FILES := $(zlib_files)
ifeq ($(TARGET_ARCH),arm)
  LOCAL_SDK_VERSION := 9
endif
include $(BUILD_STATIC_LIBRARY)




# libunz used to be an unzip-only subset of libz. Only host-side tools were
# taking advantage of it, though, and it's not a notion supported by zlib
# itself. This caused trouble during the 1.2.6 upgrade because libunz ended
# up needing to drag in most of the other files anyway. So this is a first
# step towards killing libunz. If you're reading this in the K release or
# later, please see if you can get a bit further in removing libunz...


