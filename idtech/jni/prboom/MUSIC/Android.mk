# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.crg/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(call my-dir)



include $(CLEAR_VARS)


LOCAL_MODULE    := doommusic


LOCAL_CFLAGS :=   -O2  -DANDROID -DUSE_GLES  -DHAVE_CONFIG_H -g -Wall -Wextra -Wno-missing-field-initializers -Wwrite-strings  -Wbad-function-cast  -Wcast-qual -Wdeclaration-after-statement -Wpointer-arith -ffast-math -Wno-unused -Wno-switch -Wno-sign-compare -Wno-pointer-sign  -fomit-frame-pointer -D_GNU_SOURCE=1 -D_REENTRANT
#-Wcast-align

LOCAL_LDLIBS += -lGLESv1_CM -lEGL

LOCAL_LDLIBS += -llog

LOCAL_CFLAGS += -march=armv7-a -mfloat-abi=softfp
LOCAL_LDLIBS += -Wl,--fix-cortex-a8


LOCAL_C_INCLUDES :=   $(TOP_DIR)/prboom/MUSIC/include/fluidsynth/ $(TOP_DIR)/prboom/fakeSDL   $(TOP_DIR)/prboom/



LOCAL_SRC_FILES =  \
 dbopl.c \
 dbopl.h \
 dumbplayer.c \
 dumbplayer.h \
 flplayer.c \
 flplayer.h \
 madplayer.c \
 madplayer.h \
 midifile.c \
 midifile.h \
 opl.c \
 opl.h \
 oplplayer.c \
 oplplayer.h \
 opl_queue.c \
 opl_queue.h \
 portmidiplayer.c \
 portmidiplayer.h \
 vorbisplayer.c \
 vorbisplayer.h \
 musicplayer.h



LOCAL_LDLIBS :=  -ldl -llog
LOCAL_STATIC_LIBRARIES := fluidsynth-static
include $(BUILD_STATIC_LIBRARY)








