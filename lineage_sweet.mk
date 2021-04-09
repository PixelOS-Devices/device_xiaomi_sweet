#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sweet device
$(call inherit-product, device/xiaomi/sweet/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := lineage_sweet
PRODUCT_DEVICE := sweet
PRODUCT_BRAND := Redmi
PRODUCT_MODEL := Redmi Note 10 Pro
PRODUCT_MANUFACTURER := Xiaomi

# Build info
BUILD_FINGERPRINT := "Redmi/sweetin/sweetin:11/RKQ1.200826.002/V12.0.1.0.RKFINXM:user/release-keys"
PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=sweetin \
    PRODUCT_NAME=sweetin \
    PRIVATE_BUILD_DESC="sweetin-user 11 RKQ1.200826.002 V12.0.1.0.RKFINXM release-keys"

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi
