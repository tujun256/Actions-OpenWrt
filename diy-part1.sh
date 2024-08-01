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
cd ${GITHUB_WORKSPACE}/openwrt
pwd
#echo "src-git mtk_openwrt_feed https://git01.mediatek.com/openwrt/feeds/mtk-openwrt-feeds" >> feeds.conf.default

#cp -rf $GITHUB_WORKSPACE/mt7986a-2500wan-emmc-rfb.dts $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-2500wan-emmc-rfb.dts

# cp -rf $GITHUB_WORKSPACE/mt7986a-emmc-rfb.dts $GITHUB_WORKSPACE/openwrt/target/linux/mediatek/files-5.4/arch/arm64/boot/dts/mediatek/mt7986a-emmc-rfb.dts

sed -i '/tl-xdr6088/{n;s/lan1 lan2 lan3 lan4 lan5/lan0 lan1 lan2 lan3 lan4 lan5/}' target/linux/mediatek/filogic/base-files/etc/board.d/02_network
sed -i '/glinet,gl-mt6000)/,/;;/{s/factory 0x0a/factory 0x2A/}' target/linux/mediatek/filogic/base-files/etc/board.d/02_network

#sed -i '/glinet,gl-mt6000)/,/;;/{
    s/label_mac=\$(mmc_get_mac_binary factory 0x[0-9a-fA-F]\+)/wan_mac=$(mmc_get_mac_binary factory 0x2a)/
    s/wan_mac=\$label_mac/lan_mac=$(mmc_get_mac_binary factory 0x24)/
    s/lan_mac=\$(macaddr_add "\$label_mac" 2)/label_mac=$wan_mac/
}' target/linux/mediatek/filogic/base-files/etc/board.d/02_network

cat target/linux/mediatek/filogic/base-files/etc/board.d/02_network
