#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================
# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Import external feeds
git clone https://github.com/Lienol/openwrt-package.git package/lienol

git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial

git clone https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy

# luci-theme-argon
cd openwrt/package/lean  
rm -rf luci-theme-argon  
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  

git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome

git clone https://github.com/vernesong/OpenClash package/openclash

git clone https://github.com/frainzy1477/luci-app-clash package/clash

git clone https://github.com/fw876/helloworld package/ssrplus

git clone https://github.com/tzxiaozhen88/luci-app-koolproxyR package/koolproxyR

# git clone 其他github插件源码地址 package/文件夹名称


