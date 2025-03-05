sed -i 's/192.168.1.1/192.168.23.1/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/OpenWrt/g' package/base-files/files/bin/config_generate

rm -rf $OPENWRT_PATH/.vermagic
mv $GITHUB_WORKSPACE/vermagic-imm21.02 $OPENWRT_PATH/vermagic
cd $OPENWRT_PATH
sed -i '109d' include/kernel-defaults.mk
sed -i '109i\\tcp $(TOPDIR)/vermagic $(LINUX_DIR)/.vermagic' include/kernel-defaults.mk
sed -i '27d' package/kernel/linux/Makefile
sed -i '27i\  STAMP_BUILT:=$(STAMP_BUILT)_$(shell cat $(LINUX_DIR)/.vermagic)' package/kernel/linux/Makefile

# 添加kenzok8_small插件库, 编译新版Sing-box和hysteria，需golang版本1.20或者以上版本 ，可以用以下命令
rm -rf feeds/packages/lang/golang
git clone --depth=1 https://github.com/kenzok8/golang feeds/packages/lang/golang
#删除自带的老旧依赖，ssr-plus，passwall
rm -rf feeds/packages/net/{brook,chinadns-ng,dns2socks,dns2tcp,hysteria,ipt2socks,microsocks,naiveproxy}
rm -rf feeds/packages/net/{pdnsd-alt,simple-obfs,sing-box,tcping,trojan*,tuic-client,v2ray*,xray*,mosdns,redsocks2}
rm -rf feeds/packages/net/{gn,ssocks,shadow-tls}
rm -rf feeds/packages/utils/v2dat
rm -rf feeds/luci/applications/{luci-app-passwall,luci-app-ssr-plus,luci-app-mosdns}
#下载安装kenzok8的small库
sed -i '$a src-git small https://github.com/kenzok8/small' feeds.conf.default
./scripts/feeds update -a
./scripts/feeds install -a
#新版ssr-libev和ss-rust缺少依赖，所以延用旧版，删除新版
rm -rf feeds/small/shadowsocks-rust
rm -rf feeds/small/shadowsocksr-libev

#安装最新openclash
rm -rf feeds/luci/applications/luci-app-openclash
git clone --depth=1 https://github.com/vernesong/OpenClash.git  package/openclash
mv package/openclash/luci-app-openclash feeds/luci/applications/
rm -rf package/openclash

# 添加其它插件
# git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon package/mypackage/luci-theme-argon
# git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/mypackage/luci-app-argon-config

# iStore
# git clone --depth=1 -b main https://github.com/linkease/istore.git package/mypackage/istore
# git clone --depth=1 -b master https://github.com/linkease/nas-packages.git package/mypackage/nas-packages
# git clone --depth=1 -b main https://github.com/linkease/nas-packages-luci.git package/mypackage/nas-luci
# mv package/mypackage/nas-packages/network/services/* package/mypackage/nas-packages/
# rm -rf package/mypackage/nas-packages/network

