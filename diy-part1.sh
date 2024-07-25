#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default


echo "src-git mtk_openwrt_feed https://git01.mediatek.com/openwrt/feeds/mtk-openwrt-feeds" >> feeds.conf.default

cp -rf $GITHUB_WORKSPACE/mt7986a-emmc-rfb.dts $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-emmc-rfb.dts
