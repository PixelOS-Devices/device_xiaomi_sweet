# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,org.lineageos.snap,com.android.camera2 \
    media.settings.xml=/vendor/etc/media_profiles_vendor.xml

#DPI
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=440

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
	debug.sf.disable_backpressure=1 \
	debug.sf.enable_hwc_vds=1 \
	ro.surface_flinger.max_frame_buffer_acquired_buffers=3 \
	vendor.display.disable_metadata_dynamic_fps=1

# LMKD
PRODUCT_PRODUCT_PROPERTIES += \
    ro.config.low_ram=false \
    ro.lmk.log_stats=true

# Audio
PRODUCT_PRODUCT_PROPERTIES += \
    ro.bluetooth.a2dp_offload.supported=false \
    persist.bluetooth.a2dp_offload.disabled=true \
    persist.bluetooth.bluetooth_audio_hal.disabled=true \
    persist.vendor.qcom.bluetooth.enable.splita2d=false \
    vendor.audio.feature.a2dp_offload.enable = false

# Media
PRODUCT_PROPERTY_OVERRIDES += \
	ro.config.media_vol_default=10 \
	ro.config.media_vol_steps=15 \
	ro.config.vc_call_vol_default=7 \
	ro.config.vc_call_vol_steps=11

# Phase Gffset
PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.use_phase_offsets_as_durations=1 \
    debug.sf.late.sf.duration=10500000 \
    debug.sf.late.app.duration=16600000 \
    debug.sf.early.sf.duration=16600000 \
    debug.sf.early.app.duration=16600000 \
    debug.sf.earlyGl.sf.duration=16600000 \
    debug.sf.earlyGl.app.duration=16600000

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
	persist.dbg.volte_avail_ovr=1 \
	persist.dbg.vt_avail_ovr=1 \
	persist.dbg.wfc_avail_ovr=1 \
	persist.sys.fflag.override.settings_provider_model=false \
	persist.vendor.radio.enable_temp_dds=true \
	persist.vendor.radio.report_codec=1 \
	persist.vendor.ims.disableADBLogs=1 \
	persist.vendor.ims.disableDebugLogs=1 \
	persist.vendor.ims.disableIMSLogs=1 \
	persist.vendor.ims.disableQXDMLogs=1