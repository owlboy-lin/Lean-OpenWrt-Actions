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
git clone https://github.com/openwrt-develop/luci-theme-atmaterial package/luci-theme-atmaterial
git clone https://github.com/rosywrt/luci-theme-rosy package/luci-theme-rosy
git clone https://github.com/superstarfly/openwrt-package package/lienol
git clone https://github.com/vernesong/OpenClash package/openclash
git clone https://github.com/tzxiaozhen88/luci-app-koolproxyR package/koolproxyR
git clone https://github.com/rufengsuixing/luci-app-adguardhome package/adguardhome
git clone https://github.com/frainzy1477/luci-app-clash package/clash
git clone https://github.com/fw876/helloworld package/ssrplus
# git clone 其他github插件源码地址 package/文件夹名称
