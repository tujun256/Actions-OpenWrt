#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
cd ${GITHUB_WORKSPACE}/openwrt

df -h

# #append_to_mk
# FILE="${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/image/mt7986.mk"

# # 定义要追加的内容
# CONTENT=$(cat <<'END'
# define Device/mt7986a-emmc-rfb
#   DEVICE_VENDOR := MediaTek
#   DEVICE_MODEL := mt7986a-emmc-rfb
#   DEVICE_DTS := mt7986a-emmc-rfb
#   DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
#   SUPPORTED_DEVICES := mediatek,mt7986a-emmc-rfb
#   DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
#                      kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
#                      kmod-nls-iso8859-1
#   IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
# endef
# TARGET_DEVICES += mt7986a-emmc-rfb

# END
# )

# # 将内容追加到文件末尾
# echo "$CONTENT" >> "$FILE"

cp -af ./feeds/mtk_openwrt_feed/master/files/* .
for file in $(find ./feeds/mtk_openwrt_feed/master/patches-base -name "*.patch" | sort); do patch -f -p1 -i ${file}; done
touch target/linux/*/Makefile
exit 0
