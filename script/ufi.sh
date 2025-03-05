sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
mv $GITHUB_WORKSPACE/patch/ufi/199-diy.sh package/base-files/files/etc/uci-defaults/199-diy.sh
#完全删除luci版本
sed -i "s/+ ' \/ ' : '') + (luciversion ||/:/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
#添加编译日期
sed -i "s/%V/24.10-SNAPSHOT/g" package/base-files/files/usr/lib/os-release
sed -i "s/%V/24.10-SNAPSHOT/g" package/base-files/files/etc/openwrt_release
sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/usr/lib/os-release
sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/etc/openwrt_release

rm -rf feeds/luci/applications/luci-app-dockerman
mkdir package/mypkg
git clone --depth 1 -b openwrt-24.10 https://github.com/immortalwrt/luci.git package/imm-luci
mv package/imm-luci/luci.mk  package/luci.mk
mv package/imm-luci/applications/luci-app-cpufreq package/mypkg/luci-app-cpufreq
mv package/imm-luci/applications/luci-app-dockerman feeds/luci/applications/luci-app-dockerman
mv package/imm-luci/applications/luci-app-diskman package/mypkg/luci-app-diskman
mv package/imm-luci/applications/luci-app-ramfree package/mypkg/luci-app-ramfree
mv package/imm-luci/applications/luci-app-homeproxy package/mypkg/luci-app-homeproxy
mv package/imm-luci/applications/luci-app-nps package/mypkg/luci-app-nps
mv package/imm-luci/applications/luci-app-zerotier package/mypkg/luci-app-zerotier
rm -rf package/imm-luci

git clone --depth 1 https://github.com/sirpdboy/luci-app-advancedplus package/luci-app-advancedplus
git clone --depth 1 https://github.com/Siha06/my-openwrt-packages.git package/siha06
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone --depth 1 https://github.com/vernesong/OpenClash.git  package/openclash
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall.git package/paswall-app
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall2.git package/paswall2-app
git clone --depth 1 https://github.com/xiaorouji/openwrt-passwall-packages.git package/paswall-pkg
git clone --depth 1 https://github.com/morytyann/OpenWrt-mihomo.git package/mihomo

rm -rf feeds/packages/net/{adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat
git clone --depth 1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
mv package/kz8-small/luci-app-ikoolproxy package/luci-app-ikoolproxy
mv package/kz8-small/luci-app-macvlan package/luci-app-macvlan
mv package/kz8-small/nps package/nps
mv package/kz8-small/upx package/upx
mv package/kz8-small/luci-app-partexp package/luci-app-partexp
mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
mv package/kz8-small/wrtbwmon package/wrtbwmon
mv package/kz8-small/luci-app-webrestriction package/luci-app-webrestriction
rm -rf package/kz8-small

# iStore
git clone --depth 1 -b main https://github.com/linkease/istore.git package/istore
git clone --depth 1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
git clone --depth 1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
mv package/nas-packages/network/services/* package/nas-packages/
rm -rf package/nas-packages/network
