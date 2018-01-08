ifeq ($(TARGET_QCOM_AUDIO_VARIANT),caf-msm8974)

ifneq ($(filter mpq8092 msm8960 msm8226 msm8x26 msm8610 msm8974 msm8x74 apq8084,$(TARGET_BOARD_PLATFORM)),)

MY_LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_USES_LEGACY_ALSA_AUDIO),true)
include $(MY_LOCAL_PATH)/legacy/Android.mk
else
ifneq ($(filter mpq8092,$(TARGET_BOARD_PLATFORM)),)
include $(MY_LOCAL_PATH)/hal_mpq/Android.mk
else
include $(MY_LOCAL_PATH)/hal/Android.mk
endif
include $(MY_LOCAL_PATH)/voice_processing/Android.mk
include $(MY_LOCAL_PATH)/mm-audio/Android.mk
include $(MY_LOCAL_PATH)/policy_hal/Android.mk
include $(MY_LOCAL_PATH)/visualizer/Android.mk
include $(MY_LOCAL_PATH)/post_proc/Android.mk
endif

ifeq ($(USE_LEGACY_AUDIO_DAEMON), true)
include $(MY_LOCAL_PATH)/audiod/Android.mk
endif

endif

endif
