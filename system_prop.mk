#
# Copyright (C) 2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.btstack.a2dp_offload_cap=sbc-aptx-aptxtws-aptxhd-aptxadaptive-aac-ldac \
    persist.vendor.btstack.enable.splita2dp=true \
    vendor.bluetooth.soc=cherokee
    
# ZRAM writeback
PRODUCT_PROPERTY_OVERRIDES += \
ro.zram.mark_idle_delay_mins=60 \
ro.zram.first_wb_delay_mins=180 \
ro.zram.periodic_wb_delay_hours=24
