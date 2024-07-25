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
df -h

#append_to_mk
FILE="${GITHUB_WORKSPACE}/openwrt/target/linux/mediatek/image/mt7986.mk"

# 定义要追加的内容
CONTENT=$(cat <<'END'
define Device/mt7986a-2500wan-emmc-rfb
  DEVICE_VENDOR := MediaTek
  DEVICE_MODEL := mt7986a-2500wan-emmc-rfb
  DEVICE_DTS := mt7986a-2500wan-emmc-rfb
  DEVICE_DTS_DIR := $(DTS_DIR)/mediatek
  SUPPORTED_DEVICES := mediatek,mt7986a-emmc-rfb
  DEVICE_PACKAGES := mkf2fs e2fsprogs blkid blockdev losetup kmod-fs-ext4 \
                     kmod-mmc kmod-fs-f2fs kmod-fs-vfat kmod-nls-cp437 \
                     kmod-nls-iso8859-1
  IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += mt7986a-2500wan-emmc-rfb
END
)

# 将内容追加到文件末尾
echo "$CONTENT" >> "$FILE"

touch target/linux/*/Makefile

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

#cp -af ./feeds/mtk_openwrt_feed/21.02/files/* .

#cp -af ./feeds/mtk_openwrt_feed/tools .

#for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-base -name "*.patch" | sort); do patch -f -p1 -i ${file}; done

#for file in $(find ./feeds/mtk_openwrt_feed/21.02/patches-feeds -name "*.patch" | sort); do patch -f -p1 -i ${file}; done
