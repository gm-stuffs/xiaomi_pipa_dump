#
# Copyright (C) 2024 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from pipa device
$(call inherit-product, device/xiaomi/pipa/device.mk)

PRODUCT_DEVICE := pipa
PRODUCT_NAME := lineage_pipa
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := 23043RP34G
PRODUCT_MANUFACTURER := xiaomi

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="pipa_eea-user 13 RKQ1.211001.001 V816.0.3.0.UMZEUXM release-keys"

BUILD_FINGERPRINT := Xiaomi/pipa_eea/pipa:13/RKQ1.211001.001/V816.0.3.0.UMZEUXM:user/release-keys
