 #
# Copyright 2013 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/ctp-common/overlay

# Art
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# Asus properties
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.build.asus.sku=WW

# Audio
PRODUCT_PACKAGES += \
    libtinycompress \
    libtinyalsa \
    audio.a2dp.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    device/asus/ctp-common/audio/asound.conf:system/etc/asound.conf \
    device/asus/ctp-common/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/ctp-common/audio/route_criteria.conf:system/etc/route_criteria.conf

# Boot image hackery
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/releasetools/mkbootimg:install/bin/mkbootimg \
    device/asus/ctp-common/releasetools/unmkbootimg:install/bin/unmkbootimg \
    device/asus/ctp-common/releasetools/sign_boot.sh:install/bin/sign_boot.sh

# Bluetooth
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf

PRODUCT_PROPERTY_OVERRIDES += \
    bt.hfp.WideBandSpeechEnabled=true

# Camera
PRODUCT_PACKAGES += \
    bspcapability \
    camera.redhookbay \
    libshim_camera \
    Snap

#MDS
PRODUCT_PACKAGES += \
  libmultidisplay \
  libmultidisplayjni \
  com.intel.multidisplay.xml

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Dalvik
PRODUCT_PROPERTY_OVERRIDES += \
    ro.dalvik.vm.isa.arm=x86 \
    dalvik.vm.implicit_checks=none

# Display
PRODUCT_PACKAGES += \
    pvr_drv_video

PRODUCT_COPY_FILES += \
    device/asus/ctp-common/powervr.ini:system/etc/powervr.ini

# Factory reset protection
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.frp.pst=/dev/block/by-name/persistent

# GPS
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/configs/gps.conf:system/etc/gps.conf \
    device/asus/ctp-common/configs/gps.xml:system/etc/gps.xml

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.gnss.sv.status=true

# Houdini (arm native bridge)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.enable.native.bridge.exec=1

# Keystore
PRODUCT_PACKAGES += \
	keystore.clovertrail

# Nougat Compatibility Library
PRODUCT_PACKAGES += \
	libncompat

ADDITIONAL_DEFAULT_PROPERTIES += ro.dalvik.vm.native.bridge=libhoudini.so

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/ctp-common/keylayout/ftxxxx_ts.kcm:system/usr/keychars/ftxxxx_ts.kcm \
    device/asus/ctp-common/keylayout/ftxxxx_ts.kl:system/usr/keylayout/ftxxxx_ts.kl \
    device/asus/ctp-common/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/ctp-common/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl \
    device/asus/ctp-common/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
    device/asus/ctp-common/keylayout/Vendor_0b05_Product_1803.kl:system/usr/keylayout/Vendor_0b05_Product_1803.kl

# Lights
PRODUCT_PACKAGES += \
    lights.redhookbay

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true \
    ro.com.widevine.cachesize=16777216 \
    media.stagefright.cache-params=10240/20480/15 \
    media.aac_51_output_enabled=true \

PRODUCT_COPY_FILES += \
    device/asus/ctp-common/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/ctp-common/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/ctp-common/media/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    device/asus/ctp-common/media/video_isv_profile.xml:system/etc/video_isv_profile.xml \
    device/asus/ctp-common/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Media: SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# Media: libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

# Media: libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

# libmix
PRODUCT_PACKAGES += \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp_mpeg2 \
    libva_videodecoder \
    libva_videoencoder

PRODUCT_PACKAGES += \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoDecoderMPEG2 \
    libOMXVideoDecoderVP9HWR \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderVP8

# Media: libISV
PRODUCT_PACKAGES += \
    libisv_omx_core

# PowerHAL
PRODUCT_PACKAGES += \
    power.redhookbay

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
	ro.ril.status.polling.enable=0 \
	rild.libpath=/system/lib/librapid-ril-core.so \
	ro.ril.telephony.mqanelements=5 \
	ro.telephony.ril.config=simactivation \
	ro.telephony.default_network=2,1

# Ramdisk
PRODUCT_PACKAGES += \
    config_init.sh \
    fstab.redhookbay \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.class_main.sh \
    init.common.rc \
    init.config_init.rc \
    init.debug.rc \
    init.diag.rc \
    init.firmware.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.redhookbay.rc \
    init.nfc.rc \
    init.platform.usb.rc \
    init.recovery.redhookbay.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.zram.rc \
    intel_prop \
    intel_prop.cfg \
    thermald \
    ueventd.redhookbay.rc

# Sensors
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/configs/sensor_hal_config_default.xml:system/etc/sensor_hal_config_default.xml

# Shims
PRODUCT_PACKAGES += \
    libshim_icu \
    libshim_gpsd

# Thermal itux
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

# IMG graphics
PRODUCT_PACKAGES += \
    hwcomposer.redhookbay

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    libdrm \
    dristat \
    drmstat

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Keystore
PRODUCT_PACKAGES += \
	keystore.clovertrail

PRODUCT_COPY_FILES += \
    device/asus/ctp-common/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf


# stlport required for our LP blobs
PRODUCT_PACKAGES += \
    libstlport

# Add WiFi Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4339/device-bcm.mk)

# specific management of sep_policy.conf
PRODUCT_COPY_FILES += \
    device/asus/ctp-common/sep_policy.conf:system/etc/security/sep_policy.conf

# hardware optimizations
#PRODUCT_PROPERTY_OVERRIDES += \
#    dalvik.vm.isa.x86.features=sse4_2,aes_in,popcnt,movbe
