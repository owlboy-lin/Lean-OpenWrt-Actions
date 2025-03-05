sed -i 's/192.168.6.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/ImmortalWrt/AX3000/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/AX3000/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh
sed -i 's/ImmortalWrt/AX3000/g' package/mtk/applications/luci-app-mtwifi-cfg/root/usr/share/luci-app-mtwifi-cfg/wireless-mtk.js

#安装最新openclash
#rm -rf feeds/luci/applications/luci-app-openclash
#git clone --depth=1 https://github.com/vernesong/OpenClash.git  package/openclash
#mv package/openclash/luci-app-openclash feeds/luci/applications/
#rm -rf package/openclash

#下载
git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem


sed -i 's/mirrors.vsean.net/mirror.nju.edu.cn/g' package/emortal/default-settings/files/99-default-settings-chinese
sed -i 's/openwrt/immortalwrt/g' package/emortal/default-settings/files/99-default-settings-chinese
