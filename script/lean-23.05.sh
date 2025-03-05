sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i "s/192\.168\.[0-9]*\.[0-9]*/192.168.23.1/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/files/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/base-files/luci2/bin/config_generate
sed -i 's/LEDE/OpenWrt/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

mv $GITHUB_WORKSPACE/patch/banner package/base-files/files/etc/banner
mv $GITHUB_WORKSPACE/patch/lean/defset package/lean/default-settings/files/zzz-default-settings

#下载5g模块
#git clone --depth=1 https://github.com/Siriling/5G-Modem-Support.git package/5g-modem
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh-cn/modem.po
#sed -i 's/移动通信模组/通信模组/g' package/5g-modem/luci-app-modem/po/zh_Hans/modem.po

#UA2F校园网
git clone https://github.com/lucikap/luci-app-ua2f.git package/luci-app-ua2f
git clone https://github.com/EOYOHOO/UA2F.git package/UA2F
git clone https://github.com/EOYOHOO/rkp-ipid.git package/rkp-ipid
rm -rf feeds/packages/net/ua2f

rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/luci/applications/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-app-argon-config.git  package/luci-app-argon-config
git clone --depth 1 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon

#rm -rf package/luci-app-amlogic
#git clone https://github.com/ophub/luci-app-amlogic.git package/luci-app-amlogic
#git clone --depth=1 https://github.com/kiddin9/openwrt-clouddrive2.git  package/clouddrive2
#git clone --depth=1 https://github.com/fw876/helloworld.git package/helloworld

rm -rf feeds/packages/utils/docker
rm -rf feeds/packages/utils/dockerd
rm -rf feeds/packages/utils/containerd
rm -rf feeds/packages/utils/runc
git clone --depth 1 -b openwrt-23.05 https://github.com/immortalwrt/packages package/imm23pkg
mv package/imm23pkg/utils/containerd feeds/packages/utils/containerd
mv package/imm23pkg/utils/docker feeds/packages/utils/docker
mv package/imm23pkg/utils/dockerd feeds/packages/utils/dockerd
mv package/imm23pkg/utils/runc feeds/packages/utils/runc
rm -rf package/imm23pkg

rm -rf feeds/packages/net/adguardhome
rm -rf feeds/packages/net/alist
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/packages/net/lucky
rm -rf feeds/luci/applications/luci-app-lucky
rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/luci/applications/luci-app-openclash
rm -rf feeds/luci/applications/luci-app-passwall
rm -rf feeds/luci/applications/luci-app-passwall2
rm -rf feeds/packages/net/smartdns
rm -rf feeds/luci/applications/luci-app-smartdns
rm -rf feeds/luci/applications/luci-app-softether
git clone --depth=1 https://github.com/kenzok8/small-package.git package/kz8-small
mv package/kz8-small/adguardhome package/adguardhome
mv package/kz8-small/luci-app-adguardhome package/luci-app-adguardhome
mv package/kz8-small/alist package/alist
mv package/kz8-small/luci-app-alist package/luci-app-alist
#mv package/kz8-small/luci-app-bypass package/luci-app-bypass
mv package/kz8-small/luci-app-control-timewol package/luci-app-control-timewol
mv package/kz8-small/luci-app-control-webrestriction package/luci-app-control-webrestriction
mv package/kz8-small/luci-app-control-weburl package/luci-app-control-weburl
mv package/kz8-small/luci-app-chatgpt-web package/luci-app-chatgpt-web
mv package/kz8-small/luci-app-easymesh package/luci-app-easymesh
mv package/kz8-small/luci-app-eqosplus package/luci-app-eqosplus
mv package/kz8-small/luci-app-guest-wifi package/luci-app-guest-wifi
mv package/kz8-small/luci-app-ipsec-server package/luci-app-ipsec-server
mv package/kz8-small/iptvhelper package/iptvhelper
mv package/kz8-small/luci-app-iptvhelper package/luci-app-iptvhelper
mv package/kz8-small/lucky package/lucky
mv package/kz8-small/luci-app-lucky package/luci-app-lucky
mv package/kz8-small/mosdns package/mosdns
mv package/kz8-small/luci-app-mosdns package/luci-app-mosdns
mv package/kz8-small/luci-app-onliner package/luci-app-onliner
mv package/kz8-small/luci-app-partexp package/luci-app-partexp
mv package/kz8-small/luci-app-pushbot package/luci-app-pushbot
mv package/kz8-small/luci-app-poweroffdevice package/luci-app-poweroffdevice
mv package/kz8-small/luci-app-pptp-server package/luci-app-pptp-server
mv package/kz8-small/smartdns package/smartdns
mv package/kz8-small/luci-app-smartdns package/luci-app-smartdns
mv package/kz8-small/luci-app-softethervpn package/luci-app-softethervpn
mv package/kz8-small/luci-app-wolplus package/luci-app-wolplus
mv package/kz8-small/wrtbwmon package/wrtbwmon
mv package/kz8-small/luci-app-wrtbwmon package/luci-app-wrtbwmon
#sed -i 's/联机用户/已连接用户/g' package/luci-app-onliner/po/zh-cn/onliner.po
rm -rf package/kz8-small
