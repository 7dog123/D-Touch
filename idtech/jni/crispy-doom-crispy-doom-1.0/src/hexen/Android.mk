
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE    := hexen


LOCAL_CFLAGS :=  -O2 -g -Wall -Wdeclaration-after-statement  -D_GNU_SOURCE=1 -D_REENTRANT
LOCAL_CFLAGS += -DPROGRAM_PREFIX=\"ANDROID\"

LOCAL_LDLIBS += -llog

LOCAL_CFLAGS += -march=armv7-a -mfloat-abi=softfp
LOCAL_LDLIBS += -Wl,--fix-cortex-a8


LOCAL_C_INCLUDES :=  $(TOP_DIR)/SDL/include $(TOP_DIR)/SDL_net/include $(TOP_DIR)/SDL_mixer $(TOP_DIR)/SDL_image  $(TOP_DIR)/libpng $(TOP_DIR)/jpeg8d $(TOP_DIR)/TouchControls  $(TOP_DIR)/TinyXML $(TOP_DIR)/
LOCAL_C_INCLUDES +=  $(LOCAL_PATH)/../ $(LOCAL_PATH)/../../
SOURCE_FILES = \
a_action.c                            \
                    am_data.h         \
am_map.c            am_map.h          \
ct_chat.c                             \
                    ct_chat.h         \
d_net.c                               \
f_finale.c                            \
g_game.c                              \
                    h2def.h           \
h2_main.c                             \
                    i_header.h        \
info.c              info.h            \
in_lude.c                             \
m_misc.c                              \
m_random.c          m_random.h        \
mn_menu.c                             \
p_acs.c                               \
p_anim.c                              \
p_ceilng.c                            \
p_doors.c                             \
p_enemy.c                             \
p_floor.c                             \
p_inter.c                             \
p_lights.c                            \
                    p_local.h         \
p_map.c                               \
p_maputl.c                            \
p_mobj.c                              \
po_man.c                              \
p_plats.c                             \
p_pspr.c                              \
p_setup.c                             \
p_sight.c                             \
p_spec.c           p_spec.h           \
p_switch.c                            \
p_telept.c                            \
p_things.c                            \
p_tick.c                              \
p_user.c                              \
r_bsp.c                               \
r_data.c                              \
r_draw.c                              \
                    r_local.h         \
r_main.c                              \
r_plane.c                             \
r_segs.c                              \
r_things.c                            \
s_sound.c           s_sound.h         \
sb_bar.c                              \
sc_man.c                              \
sn_sonix.c                            \
sounds.c            sounds.h          \
st_start.c          st_start.h        \
sv_save.c                             \
                    textdefs.h        \
                    xddefs.h 



LOCAL_SRC_FILES = $(SOURCE_FILES)

LOCAL_LDLIBS :=  -ldl  -lz
LOCAL_STATIC_LIBRARIES := SDL_net libjpeg
LOCAL_SHARED_LIBRARIES :=  SDL SDL_mixer SDL_image 

include $(BUILD_STATIC_LIBRARY)






