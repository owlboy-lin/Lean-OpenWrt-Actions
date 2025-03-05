#!/bin/sh

# 设置所有网口可访问网页终端
uci delete ttyd.@ttyd[0].interface

# 设置所有网口可连接 SSH
uci set dropbear.@dropbear[0].Interface=''

uci set network.lan.ip6assign=64
uci del network.globals.ula_prefix
uci set dhcp.lan.dns_service='0'

uci commit

#sed -i 's/root::0:0:99999:7:::/root:$1$wKsL1h.7$rqVC6MhBRN3YHpLj2KDNr.:20079:0:99999:7:::/g' /etc/shadow
#sed -i 's/root:::0:99999:7:::/root:$1$wKsL1h.7$rqVC6MhBRN3YHpLj2KDNr.:20079:0:99999:7:::/g' /etc/shadow
sed -ri '/check_signature/s@^[^#]@#&@' /etc/opkg.conf
sed -i '/core/d' /etc/opkg/distfeeds.conf
sed -i '/openstick/d' /etc/opkg/distfeeds.conf
sed -i 's#downloads.openwrt.org/snapshots#mirrors.pku.edu.cn/openwrt/releases/24.10.0#g' /etc/opkg/distfeeds.conf
sed -i '$a src/gz immortawrt_base https://mirrors.pku.edu.cn/immortalwrt/releases/24.10.0/packages/aarch64_generic/base' /etc/opkg/customfeeds.conf
sed -i '$a src/gz immortawrt_packages https://mirrors.pku.edu.cn/immortalwrt/releases/24.10.0/packages/aarch64_generic/packages' /etc/opkg/customfeeds.conf
sed -i '$a src/gz immortawrt_luci https://mirrors.pku.edu.cn/immortalwrt/releases/24.10.0/packages/aarch64_generic/luci' /etc/opkg/customfeeds.conf

/etc/init.d/network restart

exit 0
