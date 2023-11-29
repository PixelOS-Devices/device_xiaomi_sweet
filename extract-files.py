#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'hardware/qcom-caf/sm8150',
    'hardware/xiaomi',
    'vendor/qcom/opensource/display',
    'vendor/xiaomi/sm6150-common',
]

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
}

blob_fixups: blob_fixups_user_type = {
    'vendor/etc/init/init.batterysecret.rc': blob_fixup()
        .regex_replace(' +seclabel u:r:batterysecret:s0\n', ''),
    'vendor/etc/init/init.mi_thermald.rc': blob_fixup()
        .regex_replace(' +seclabel u:r:mi_thermald:s0\n', ''),
    'vendor/lib64/camera/components/com.qti.node.watermark.so': blob_fixup()
        .add_needed('libpiex_shim.so'),
    ('vendor/lib64/hw/camera.qcom.so', 'vendor/lib64/libFaceDetectpp-0.5.2.so', 'vendor/lib64/libfacedet.so'): blob_fixup()
        .binary_regex_replace(b'libmegface.so', b'libfacedet.so')
        .binary_regex_replace(b'libMegviiFacepp-0.5.2.so', b'libFaceDetectpp-0.5.2.so')
        .binary_regex_replace(b'megviifacepp_0_5_2_model', b'facedetectpp_0_5_2_model'),
    ('vendor/lib64/libalLDC.so', 'vendor/lib64/libalhLDC.so'): blob_fixup()
        .clear_symbol_version('AHardwareBuffer_allocate')
        .clear_symbol_version('AHardwareBuffer_describe')
        .clear_symbol_version('AHardwareBuffer_lock')
        .clear_symbol_version('AHardwareBuffer_release')
        .clear_symbol_version('AHardwareBuffer_unlock'),
    ('vendor/lib64/libarcsoft_hta.so', 'vendor/lib64/libarcsoft_super_night_raw.so', 'vendor/lib64/libhvx_interface.so', 'vendor/lib64/libmialgo_rfs.so'): blob_fixup()
        .clear_symbol_version('remote_handle_close')
        .clear_symbol_version('remote_handle_invoke')
        .clear_symbol_version('remote_handle_open')
        .clear_symbol_version('remote_handle64_close')
        .clear_symbol_version('remote_handle64_invoke')
        .clear_symbol_version('remote_handle64_open')
        .clear_symbol_version('remote_register_buf_attr')
        .clear_symbol_version('remote_register_buf')
        .clear_symbol_version('rpcmem_alloc')
        .clear_symbol_version('rpcmem_free')
        .clear_symbol_version('rpcmem_to_fd'),
    # Dolby START
    'odm/bin/hw/vendor.dolby_sp.media.c2@1.0-service': blob_fixup()
        .replace_needed('libcodec2_hidl@1.0.so', 'libcodec2_hidl@1.0_sp.so')
        .replace_needed('libcodec2_vndk.so', 'libcodec2_vndk_sp.so'),
    'odm/lib64/libcodec2_store_dolby_sp.so': blob_fixup()
        .replace_needed('libcodec2_vndk.so', 'libcodec2_vndk_sp.so'),
    ('odm/lib64/libcodec2_soft_ac4dec_sp.so', 'odm/lib64/libcodec2_soft_ddpdec_sp.so'): blob_fixup()
        .replace_needed('libcodec2_vndk.so', 'libcodec2_vndk_sp.so')
        .replace_needed('libcodec2_soft_common.so', 'libcodec2_soft_common_sp.so')
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    ('odm/lib64/libcodec2_soft_common_sp.so', 'odm/lib64/libcodec2_hidl_plugin_sp.so'): blob_fixup()
        .replace_needed('libcodec2_vndk.so', 'libcodec2_vndk_sp.so')
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    (
        'odm/lib/libdlbdsservice_v3_6.so',
        'odm/lib/libstagefright_soft_ddpdec.so',
        'odm/lib64/libdlbdsservice_sp.so',
        'odm/lib64/libdlbdsservice_v3_6.so'
    ): blob_fixup().replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    'odm/lib64/libcodec2_vndk_sp.so': blob_fixup()
        .replace_needed('libui.so', 'libui_sp.so')
        .replace_needed('libstagefright_foundation.so', 'libstagefright_foundation-v33.so'),
    'odm/lib64/libcodec2_hidl@1.0_sp.so': blob_fixup()
        .replace_needed('libcodec2_hidl_plugin.so', 'libcodec2_hidl_plugin_sp.so')
        .replace_needed('libcodec2_vndk.so', 'libcodec2_vndk_sp.so'),
    'odm/lib64/libui_sp.so': blob_fixup()
        .replace_needed('android.hardware.graphics.common-V3-ndk.so', 'android.hardware.graphics.common-V6-ndk.so')
        .replace_needed('android.hardware.graphics.allocator-V1-ndk.so', 'android.hardware.graphics.allocator-V2-ndk.so'),
    # Dolby END
}  # fmt: skip

module = ExtractUtilsModule(
    'sweet',
    'xiaomi',
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'sm6150-common', module.vendor
    )
    utils.run()
