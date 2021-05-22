LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := android.hardware.lights-service.qti-sweet
LOCAL_MODULE_TAGS := optional

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/bin
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_INSTALLED_MODULE_STEM := android.hardware.lights-service.qti


LOCAL_REQUIRED_MODULES := \
    android.hardware.lights-service.sweet.rc

LOCAL_SHARED_LIBRARIES := \
        libbase \
        libhardware \
        libbinder_ndk \
        android.hardware.light-ndk_platform

LOCAL_SRC_FILES := \
        Light.cpp \
        service.cpp

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_MODULE := android.hardware.lights-service.sweet.rc
LOCAL_MODULE_TAGS  := optional
LOCAL_MODULE_CLASS := ETC

LOCAL_MODULE_PATH := $(TARGET_OUT_PRODUCT)/vendor_overlay/$(PRODUCT_TARGET_VNDK_VERSION)/etc/init
LOCAL_MODULE_STEM := android.hardware.lights-qti.rc

LOCAL_SRC_FILES := android.hardware.lights-service.sweet.rc

include $(BUILD_PREBUILT)
