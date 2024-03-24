#!/bin/bash
# ==============================================================
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# ===============================================================

#修改默认IP
# sed -i 's/192.168.1.1/192.168.1.252/g' package/base-files/files/bin/config_generate   # 定制默认IP

# Configure pppoe connection
#uci set network.wan.proto=pppoe
#uci set network.wan.username='yougotthisfromyour@isp.su'
#uci set network.wan.password='yourpassword'

# 移除重复软件包
rm -rf feeds/luci/themes/luci-theme-argon

# Themes
# git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon

# 添加额外软件包


# 科学上网插件


# 科学上网插件依赖


# openclash
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-openclash  package/luci-app-openclash
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
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
svn export https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-adguardhome package/luci-app-adguardhome
# svn export https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/adguardhome

# mosdns
svn export https://github.com/kenzok8/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
svn export https://github.com/kenzok8/openwrt-packages/trunk/mosdns package/mosdns
svn export https://github.com/kenzok8/openwrt-packages/trunk/v2dat package/v2dat
# svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-mosdns package/luci-app-mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/mosdns package/mosdns
# svn export https://github.com/kiddin9/openwrt-packages/trunk/v2dat package/v2dat


# 添加自定义软件包
echo "
# 额外组件
# CONFIG_GRUB_IMAGES=y
# CONFIG_VMDK_IMAGES=y

# 固件大小
# CONFIG_TARGET_KERNEL_PARTSIZE=128
# CONFIG_TARGET_ROOTFS_PARTSIZE=512

# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y
CONFIG_PACKAGE_luci-i18n-autoreboot-zh-cn=y

# # Themes
CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_PACKAGE_luci-app-argone-config=y
CONFIG_PACKAGE_luci-i18n-argon-config-zh-cn=y
CONFIG_PACKAGE_luci-i18n-argone-config-zh-cn=y
CONFIG_PACKAGE_luci-theme-argone=y

# 关机
CONFIG_PACKAGE_luci-app-poweroff=y
CONFIG_PACKAGE_luci-i18n-poweroff-zh-cn=y

# openclash
CONFIG_PACKAGE_luci-app-openclash=y
CONFIG_PACKAGE_luci-i18n-openclash-zh-cn=y

# adguardhome
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-i18n-adguardhome-zh-cn=y

# mosdns
CONFIG_PACKAGE_luci-app-mosdns=y
CONFIG_PACKAGE_luci-i18n-mosdns-zh-cn=y

# netspeedtest chmod +x /etc/init.d/netspeedtest
CONFIG_PACKAGE_luci-app-netspeedtest=y
CONFIG_PACKAGE_luci-i18n-netspeedtest-zh-cn=y

# passwall
CONFIG_PACKAGE_luci-app-passwall=y
CONFIG_PACKAGE_luci-i18n-passwall-zh-cn=y

CONFIG_PACKAGE_luci-app-passwall2=y
CONFIG_PACKAGE_luci-i18n-passwall2-zh-cn=y

# VPN
CONFIG_PACKAGE_luci-app-ipsec-vpnd=y
CONFIG_PACKAGE_luci-i18n-ipsec-vpnd-zh-cn=y

CONFIG_PACKAGE_luci-app-openvpn=y
CONFIG_PACKAGE_luci-i18n-openvpn-zh-cn=y

# quickstart
CONFIG_PACKAGE_luci-app-quickstart=y
CONFIG_PACKAGE_luci-i18n-quickstart-zh-cn=y

# store
CONFIG_PACKAGE_luci-app-store=y

# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y
CONFIG_PACKAGE_luci-i18n-ttyd-zh-cn=y

# luci-app-uugamebooster=y
CONFIG_PACKAGE_luci-app-uugamebooster=y
CONFIG_PACKAGE_luci-i18n-uugamebooster-zh-cn=y


# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y
CONFIG_PACKAGE_luci-i18n-webadmin-zh-cn=y

# rclone
# CONFIG_PACKAGE_rclone=y
# CONFIG_PACKAGE_fuse3-utils=y

# 删除不用的插件
# CONFIG_PACKAGE_autosamba is not set
# CONFIG_PACKAGE_luci-app-accesscontrol is not set
# CONFIG_PACKAGE_luci-i18n-accesscontrol-zh-cn is not set
# CONFIG_PACKAGE_luci-app-upnp is not set
# CONFIG_PACKAGE_luci-i18n-upnp-zh-cn is not set
# CONFIG_PACKAGE_luci-app-vlmcsd is not set
# CONFIG_PACKAGE_luci-i18n-vlmcsd-zh-cn is not set
# CONFIG_PACKAGE_luci-app-vsftpd is not set
# CONFIG_PACKAGE_luci-i18n-vsftpd-zh-cn is not set
# CONFIG_PACKAGE_luci-app-samba4 is not set
# CONFIG_PACKAGE_luci-i18n-samba4-zh-cn is not set



" >> .config