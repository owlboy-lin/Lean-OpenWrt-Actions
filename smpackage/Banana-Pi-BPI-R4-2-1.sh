#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# 修改openwrt登陆地址,把下面的 10.0.0.1 修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.89.1/g' package/base-files/files/bin/config_generate

# 修改 子网掩码
# sed -i 's/255.255.255.0/255.255.0.0/g' package/base-files/files/bin/config_generate

# 修改主机名字，把 iStore OS 修改你喜欢的就行（不能纯数字或者使用中文）
# sed -i 's/OpenWrt/iStore OS/g' package/base-files/files/bin/config_generate

# 替换终端为bash
# sed -i 's/\/bin\/ash/\/bin\/bash/' package/base-files/files/etc/passwd

# ttyd 自动登录
# sed -i "s?/bin/login?/usr/libexec/login.sh?g" ${GITHUB_WORKSPACE}/openwrt/package/feeds/packages/ttyd/files/ttyd.config

# 添加新的主题
# git clone https://github.com/kenzok8/luci-theme-ifit.git package/lean/luci-theme-ifit

# 添加常用软件包
# git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages

# 删除默认密码
# sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

# 取消bootstrap为默认主题
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 修改 WiFi 名称
# sed -i 's/OpenWrt/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# 默认打开 WiFi
# sed -i 's/disabled=1/disabled=0/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Configure pppoe connection
#uci set network.wan.proto=pppoe
#uci set network.wan.username='yougotthisfromyour@isp.su'
#uci set network.wan.password='yourpassword'

# 移除重复软件包
# rm -rf feeds/luci/themes/luci-theme-argon

# Themes
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git lpackage/uci-theme-argon
# echo 'src-git argon https://github.com/jerrykuku/luci-theme-argon' >>feeds.conf.default
# git clone -b 18.06 https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
# echo 'src-git argon-config https://github.com/jerrykuku/luci-app-argon-config' >>feeds.conf.default

# 添加额外软件包


# 科学上网插件


# 科学上网插件依赖



# openclash
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-openclash  package/luci-app-openclash
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-openclash  package/luci-app-openclash
# 加入OpenClash核心
# chmod -R a+x $GITHUB_WORKSPACE/preset-clash-core.sh
# if [ "$1" = "rk33xx" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh arm64
# elif [ "$1" = "rk35xx" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh arm64
# elif [ "$1" = "x86" ]; then
#     $GITHUB_WORKSPACE/preset-clash-core.sh amd64
# fi

# adguardhome
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-adguardhome package/luci-app-adguardhome
# svn export https://github.com/kenzok8/openwrt-packages/adguardhome package/adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/adguardhome

# mosdns
# svn export https://github.com/kenzok8/openwrt-packages/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/kenzok8/openwrt-packages/mosdns package/mosdns
# svn export https://github.com/kenzok8/openwrt-packages/v2dat package/v2dat
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/mosdns package/mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/v2dat package/v2dat

#!/bin/bash

#删除feeds中的插件
# rm -rf ./feeds/packages/net/mosdns
# rm -rf ./feeds/packages/net/v2ray-geodata
# rm -rf ./feeds/packages/net/geoview
# rm -rf ./feeds/packages/net/shadowsocks-libev
# rm -rf ./feeds/packages/net/chinadns-ng


#克隆依赖插件
# git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/pwpage


#克隆的源码放在small文件夹
mkdir package/small
pushd package/small


## adguardhome
# git clone -b 2023.10 --depth 1 https://github.com/XiaoBinin/luci-app-adguardhome.git

## lucky
# git clone -b main --depth 1 https://github.com/sirpdboy/luci-app-lucky.git

## smartdns
# git clone -b lede --depth 1 https://github.com/pymumu/luci-app-smartdns.git
# git clone -b master --depth 1 https://github.com/pymumu/smartdns.git

## ssrp
# git clone -b master --depth 1 https://github.com/fw876/helloworld.git

## passwall
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall.git

## passwall2
# git clone -b main --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git

## #mosdns
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone -b v5 https://github.com/sbwml/luci-app-mosdns.git
git clone -b master https://github.com/sbwml/v2ray-geodata 

## openclash
# git clone -b master --depth 1 https://github.com/vernesong/OpenClash.git

## poweroff
git clone -b master https://github.com/esirplayground/luci-app-poweroff.git

## iStore
git clone -b main https://github.com/linkease/istore.git
./scripts/feeds install -d y -p istore luci-app-store

## netspeedtest
git clone -b master https://github.com/sirpdboy/netspeedtest.git

git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld

popd

echo "packages executed successfully!"

# 添加自定义软件包

echo "

# 额外组件
#
# Root filesystem images
#
# CONFIG_TARGET_ROOTFS_EXT4FS=y
# CONFIG_TARGET_EXT4_RESERVED_PCT=0
# CONFIG_TARGET_EXT4_BLOCKSIZE_4K=y
# # CONFIG_TARGET_EXT4_BLOCKSIZE_2K is not set
# # CONFIG_TARGET_EXT4_BLOCKSIZE_1K is not set
# CONFIG_TARGET_EXT4_BLOCKSIZE=4096
# # CONFIG_TARGET_EXT4_JOURNAL is not set
# CONFIG_GRUB_IMAGES=y
# CONFIG_VMDK_IMAGES=y

# 固件大小
#
# Image Options
#
# CONFIG_TARGET_KERNEL_PARTSIZE=512
# CONFIG_TARGET_ROOTFS_PARTSIZE=1024
CONFIG_TARGET_SQUASHFS_BLOCK_SIZE=512

# # Themes
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-theme-argon=y


# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# 关机
CONFIG_PACKAGE_luci-app-poweroff=y


# adguardhome
CONFIG_PACKAGE_luci-app-adguardhome=y


# mosdns
# CONFIG_PACKAGE_luci-app-mosdns=y


# netspeedtest chmod +x /etc/init.d/netspeedtest
CONFIG_PACKAGE_luci-app-netspeedtest=y


# passwall
CONFIG_PACKAGE_luci-app-passwall=y


# ssr-plus
CONFIG_PACKAGE_luci-app-ssr-plus=y

# quickstart
# CONFIG_PACKAGE_luci-app-quickstart=y

# store
# CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# turboacc
CONFIG_PACKAGE_luci-app-turboacc=y

# luci-app-uugamebooster=y


# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y



" >> .config

# 移除 ddns 和 ddnsto
# sed -i 's/CONFIG_PACKAGE_ddns-scripts=y/CONFIG_PACKAGE_ddns-scripts=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-cloudflare=y/CONFIG_PACKAGE_ddns-scripts-cloudflare=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-dnspod=y/CONFIG_PACKAGE_ddns-scripts-dnspod=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts-services=y/CONFIG_PACKAGE_ddns-scripts-services=n/' .config
# sed -i 's/CONFIG_PACKAGE_ddns-scripts_aliyun=y/CONFIG_PACKAGE_ddns-scripts_aliyun=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-ddns=y/CONFIG_PACKAGE_luci-app-ddns=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddns-zh-cn=n/' .config

# sed -i 's/CONFIG_PACKAGE_ddnsto=y/CONFIG_PACKAGE_ddnsto=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-app-ddnsto=y/CONFIG_PACKAGE_luci-app-ddnsto=n/' .config
# sed -i 's/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=y/CONFIG_PACKAGE_luci-i18n-ddnsto-zh-cn=n/' .config

# 移除 bootstrap 主题
# sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config

# 移除网卡驱动
# sed -i 's/CONFIG_PACKAGE_kmod-ath=y/CONFIG_PACKAGE_kmod-ath=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-ath10k=y/CONFIG_PACKAGE_kmod-ath10k=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9888=y/CONFIG_PACKAGE_ath10k-board-qca9888=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca988x=y/CONFIG_PACKAGE_ath10k-board-qca988x=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-board-qca9984=y/CONFIG_PACKAGE_ath10k-board-qca9984=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9888=y/CONFIG_PACKAGE_ath10k-firmware-qca9888=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca988x=y/CONFIG_PACKAGE_ath10k-firmware-qca988x=n/' .config
# sed -i 's/CONFIG_PACKAGE_ath10k-firmware-qca9984=y/CONFIG_PACKAGE_ath10k-firmware-qca9984=n/' .config

# sed -i 's/CONFIG_PACKAGE_iw=y/CONFIG_PACKAGE_iw=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwinfo=y/CONFIG_PACKAGE_iwinfo=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-iwlwifi=y/CONFIG_PACKAGE_kmod-iwlwifi=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax101=y/CONFIG_PACKAGE_iwlwifi-firmware-ax101=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax200=y/CONFIG_PACKAGE_iwlwifi-firmware-ax200=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax201=y/CONFIG_PACKAGE_iwlwifi-firmware-ax201=n/' .config
# sed -i 's/CONFIG_PACKAGE_iwlwifi-firmware-ax210=y/CONFIG_PACKAGE_iwlwifi-firmware-ax210=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192c-common=y/CONFIG_PACKAGE_kmod-rtl8192c-common=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192cu=y/CONFIG_PACKAGE_kmod-rtl8192cu=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192de=y/CONFIG_PACKAGE_kmod-rtl8192de=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8192se=y/CONFIG_PACKAGE_kmod-rtl8192se=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8812au-ct=y/CONFIG_PACKAGE_kmod-rtl8812au-ct=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8821ae=y/CONFIG_PACKAGE_kmod-rtl8821ae=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtl8xxxu=y/CONFIG_PACKAGE_kmod-rtl8xxxu=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi=y/CONFIG_PACKAGE_kmod-rtlwifi=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=y/CONFIG_PACKAGE_kmod-rtlwifi-btcoexist=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-pci=y/CONFIG_PACKAGE_kmod-rtlwifi-pci=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtlwifi-usb=y/CONFIG_PACKAGE_kmod-rtlwifi-usb=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-rtw88=y/CONFIG_PACKAGE_kmod-rtw88=n/' .config

# sed -i 's/CONFIG_PACKAGE_kmod-mt7915e=y/CONFIG_PACKAGE_kmod-mt7915e=n/' .config

# sed -i 's/CONFIG_PACKAGE_kmod-mt7921-common=y/CONFIG_PACKAGE_kmod-mt7921-common=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921-firmware=y/CONFIG_PACKAGE_kmod-mt7921-firmware=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921e=y/CONFIG_PACKAGE_kmod-mt7921e=n/' .config
# sed -i 's/CONFIG_PACKAGE_kmod-mt7921u=y/CONFIG_PACKAGE_kmod-mt7921u=n/' .config


