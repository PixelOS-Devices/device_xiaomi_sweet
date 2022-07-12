#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
    vendor/lib64/libsdmcore.so)
        # This patch is valid for libsdmcore @ V13.0.10.0 SKFEUXM
        LIBSDMCORE_SHASUM="c1fb37069254edeefc008e290490825719d9af4c"
        echo "Patching libsdmcore"

        xxd -p "${2}" > /tmp/libsdmcore.hex

        sed -i s:2b18621e:1f2003d5:g /tmp/libsdmcore.hex
        sed -i s:00540a18621e4:00541f2003d54:g /tmp/libsdmcore.hex

        xxd -r -p /tmp/libsdmcore.hex "${2}"

        rm /tmp/libsdmcore.hex

        echo "Done, checking the sha1sum"
        echo "${LIBSDMCORE_SHASUM} ${2}" | sha1sum -c
        sleep 2
        ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=sweet
export DEVICE_COMMON=sm6150-common
export VENDOR=xiaomi

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"
