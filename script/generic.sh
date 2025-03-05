# 修改默认IP，主机名，WiFi名称
sed -i 's/192.168.1.1/192.168.13.1/g' package/base-files/files/bin/config_generate
sed -i 's/r1.2/v24.5.22/g' package/emortal/default-settings/files/99-default-settings
sed -i 's/OpenWRT/OpenWrt/g' package/emortal/default-settings/files/99-default-settings
#默认WiFi设置
sed -i 's/OpenWrt/CMCC-8Hd5/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
#sed -i 's/disabled=0/disabled=1/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
sed -i 's/encryption=none/encryption=psk2/g' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
sed -i '214i\\t\t\tset wireless.default_${name}.key=123456qwerty' package/network/config/wifi-scripts/files/lib/wifi/mac80211.sh
