#!/bin/sh
#
# Copyright (C) 2023, hanwckf <hanwckf@vip.qq.com>
#

append DRIVERS "mtwifi"

detect_mtwifi() {
	local idx ifname
	local band htmode htbsscoex ssid dbdc_main
	if [ -d "/sys/module/mt_wifi" ]; then
		dev_list="$(l1util list)"
		for dev in $dev_list; do
			config_get type ${dev} type
			[ "$type" = "mtwifi" ] || {
				ifname="$(l1util get ${dev} main_ifname)"

				idx="$(l1util get ${dev} subidx)"
				[ $idx -eq 1 ] && dbdc_main="1" || dbdc_main="0"

				band="$(l1util get ${dev} band)"
				if [ -z "$band" ] || [ "$band" = "nil" ]; then
					[ $idx -eq 1 ] && band="2g" || band="5g"
				fi

				if [ "$band" = "2g" ]; then
					htmode="HE40"
					htbsscoex="1"
					ssid="CMCC-E122"
				elif [ "$band" = "5g" ]; then
					htmode="HE160"
					htbsscoex="0"
					ssid="CMCC-E155"
				elif [ "$band" = "6g" ]; then
					htmode="HE160"
					htbsscoex="0"
					ssid="OpenWrt-6G"
				fi

				uci -q batch <<-EOF
					set wireless.${dev}=wifi-device
					set wireless.${dev}.type=mtwifi
					set wireless.${dev}.phy=${ifname}
					set wireless.${dev}.band=${band}
					set wireless.${dev}.dbdc_main=${dbdc_main}
					set wireless.MT7981_1_1.channel=3
					set wireless.MT7981_1_2.channel=40
					set wireless.${dev}.txpower=100
					set wireless.MT7981_1_1.htmode=HE40
					set wireless.MT7981_1_2.htmode=HE80
					set wireless.${dev}.country=CN
					set wireless.${dev}.mu_beamformer=1
					set wireless.${dev}.noscan=${htbsscoex}
					set wireless.${dev}.serialize=1

					set wireless.default_${dev}=wifi-iface
					set wireless.default_${dev}.device=${dev}
					set wireless.default_${dev}.network=lan
					set wireless.default_${dev}.mode=ap
					set wireless.default_${dev}.ssid=${ssid}
					set wireless.default_${dev}.encryption=psk2+ccmp
					set wireless.default_MT7981_1_1.key=86880959Liu
					set wireless.default_MT7981_1_2.key=86880959189
EOF
				uci -q commit wireless
			}
		done
	fi
}
