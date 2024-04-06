
MK_LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_PATH := $(MK_LOCAL_PATH)
USE_PC_NAME := 1
include $(LOCAL_PATH)/libusb/android/jni/libusb.mk

include $(CLEAR_VARS)
LOCAL_PATH := $(MK_LOCAL_PATH)/libuvc
UVC_ROOT_REL := .
UVC_ROOT_ABS := $(LOCAL_PATH)

LOCAL_SRC_FILES := \
    $(UVC_ROOT_REL)/src/ctrl.c \
    $(UVC_ROOT_REL)/src/device.c \
    $(UVC_ROOT_REL)/src/diag.c \
    $(UVC_ROOT_REL)/src/frame.c \
    $(UVC_ROOT_REL)/src/init.c \
    $(UVC_ROOT_REL)/src/stream.c

LOCAL_C_INCLUDES += \
    $(MK_LOCAL_PATH)/configs \
    $(UVC_ROOT_ABS)/include \
    $(UVC_ROOT_ABS)/include/libuvc

LOCAL_EXPORT_C_INCLUDES := \
    $(MK_LOCAL_PATH)/configs \
    $(UVC_ROOT_ABS)/include \
    $(UVC_ROOT_ABS)/include/libuvc

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)
LOCAL_CFLAGS += -DANDROID_NDK
LOCAL_CFLAGS += -DLOG_NDEBUG
LOCAL_CFLAGS += -DUVC_DEBUGGING

LOCAL_LDLIBS := -llog
LOCAL_EXPORT_LDLIBS := -llog

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES += usb-1.0

LOCAL_MODULE := libuvc
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_PATH := $(MK_LOCAL_PATH)
TC_ROOT_REL := .
TC_ROOT_ABS := $(LOCAL_PATH)

LOCAL_SRC_FILES := \
    $(TC_ROOT_REL)/thermal_camera.cpp

LOCAL_C_INCLUDES += \
    $(TC_ROOT_ABS)/..

LOCAL_EXPORT_C_INCLUDES := \
    $(TC_ROOT_ABS)/

LOCAL_CFLAGS := $(LOCAL_C_INCLUDES:%=-I%)
LOCAL_CFLAGS += -DANDROID_NDK
LOCAL_CFLAGS += -DLOG_NDEBUG
LOCAL_CFLAGS += -DUVC_DEBUGGING

LOCAL_EXPORT_LDLIBS := -llog

LOCAL_ARM_MODE := arm

LOCAL_SHARED_LIBRARIES += usb-1.0
LOCAL_SHARED_LIBRARIES += libuvc

LOCAL_MODULE := libthermalcamera
include $(BUILD_SHARED_LIBRARY)

