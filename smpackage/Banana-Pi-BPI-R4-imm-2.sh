sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
# sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
# sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate
# sed -i 's#mirrors.vsean.net/openwrt#mirrors.pku.edu.cn/immortalwrt#g' package/emortal/default-settings/files/99-default-settings-chinese
# mv $GITHUB_WORKSPACE/patch/banner $OPENWRT_PATH/package/base-files/files/etc/banner
# mv $GITHUB_WORKSPACE/patch/immortalwrt-24.10/199-diy.sh package/base-files/files/etc/uci-defaults/199-diy.sh

# #完全删除luci版本
# sed -i "s/+ ' \/ ' : '') + (luciversion ||/:/g" feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/include/10_system.js
# #添加编译日期
# sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/usr/lib/os-release
# sed -i "s/%C/\/ Complied on $(date +"%Y.%m.%d")/g" package/base-files/files/etc/openwrt_release

# iStore
git clone --depth=1 -b main https://github.com/linkease/istore.git package/istore
# git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/nas-packages
# git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/nas-luci
# mv package/nas-packages/network/services/* package/nas-packages/
# rm -rf package/nas-packages/network

rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5 package/mosdns
git clone https://github.com/sbwml/v2ray-geodata package/v2ray-geodata

git clone --depth 1 https://github.com/fw876/helloworld.git package/helloworld

rm -rf feeds/packages/net/adguardhome
git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
# mv package/kz8-small/luci-app-ikoolproxy package/luci-app-ikoolproxy
# mv package/kz8-small/luci-app-partexp package/luci-app-partexp
# mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
# mv package/kz8-small/wrtbwmon package/wrtbwmon
mv package/kz8-small/luci-app-netspeedtest package/luci-app-netspeedtest
mv package/kz8-small/homebox package/homebox
mv package/kz8-small/luci-app-poweroff package/luci-app-poweroff
rm -rf package/kz8-small

# git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/luci package/imm23luci
# mv package/imm23luci/applications/luci-app-adbyby-plus package/luci-app-adbyby-plus
# rm -rf package/imm23luci
# git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/packages package/imm23packages
# mv package/imm23packages/net/adbyby package/adbyby
# rm -rf package/imm23packages

echo "

# 额外组件


# # Themes
CONFIG_PACKAGE_luci-theme-argon=y


# adguardhome
CONFIG_PACKAGE_luci-app-adguardhome=y


# # arpbind
CONFIG_PACKAGE_luci-app-arpbind=y


# 自动重启
CONFIG_PACKAGE_luci-app-autoreboot=y


# mosdns
CONFIG_PACKAGE_luci-app-mosdns=y


# netspeedtest chmod +x /etc/init.d/netspeedtest
CONFIG_PACKAGE_luci-app-netspeedtest=y


# nlbwmon
CONFIG_PACKAGE_luci-app-nlbwmon=y


# openclash
CONFIG_PACKAGE_luci-app-openclash=y


# 关机
CONFIG_PACKAGE_luci-app-poweroff=y


# passwall
CONFIG_PACKAGE_luci-app-passwall=y


CONFIG_PACKAGE_luci-app-passwall2=n


# quickstart
CONFIG_PACKAGE_luci-app-quickstart=y

# helloworld
CONFIG_PACKAGE_luci-app-ssr-plus=y

# store
CONFIG_PACKAGE_luci-app-store=y


# luci-app-ttyd=y
CONFIG_PACKAGE_luci-app-ttyd=y

# luci-app-uugamebooster
CONFIG_PACKAGE_luci-app-uugamebooster=n

# luci-app-webadmin=y
CONFIG_PACKAGE_luci-app-webadmin=y




" >> .config