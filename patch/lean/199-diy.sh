#!/bin/sh


# 设置所有网口可访问网页终端
uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
uci set dropbear.@dropbear[0].Interface=''

uci set luci.main.mediaurlbase=/luci-static/design
uci commit luci

#其他网络设置
uci set network.lan.ip6ifaceid='eui64'
#uci set network.lan.ipaddr=192.168.5.1
uci commit network

uci commit

date_version=$(date +"%Y.%m.%d")
sed -i '/DISTRIB_REVISION/d' /etc/openwrt_release
echo "DISTRIB_REVISION='V${date_version}'" >> /etc/openwrt_release
#echo "DISTRIB_REVISION='${date_version}'" >> /etc/openwrt_release
sed -i '/DISTRIB_DESCRIPTION/d' /etc/openwrt_release
echo "DISTRIB_DESCRIPTION='OpenWrt '" >> /etc/openwrt_release

sed -i '/core/d' /etc/opkg/distfeeds.conf
sed -i '/smpackage/d' /etc/opkg/distfeeds.conf
sed -i 's#downloads.openwrt.org#mirror.nju.edu.cn/immortalwrt#g' /etc/opkg/distfeeds.conf
sed -i 's#24.10.0/packages/aarch64_cortex-a53/luci#18.06-k5.4-SNAPSHOT/packages/aarch64_cortex-a53/luci#g' /etc/opkg/distfeeds.conf

/etc/init.d/network restart

exit 0
