#!/bin/bash

#===========================================================================================================
# thanks:
# https://github.com/gd0772/AutoBuild-OpenWrt
# https://github.com/gd0772/patch/blob/main/gd772.sh
#==========================================================================================================
TIME() {
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31;1m";;
	g) export Color="\e[32;1m";;
	b) export Color="\e[34;1m";;
	y) export Color="\e[33;1m";;
	z) export Color="\e[35;1m";;
	l) export Color="\e[36;1m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}

#==========================================================================================================
# Modify default config:sed -i 's/default config/new config/g' package/config
#----------------------------------------------------------------------------------------------------------

echo
TIME b "Modify default config:"

echo
TIME b "修改默认登录IP为 192.168.10.1"
sed -i "s/192.168.1.1/192.168.10.1/g" package/base-files/files/bin/config_generate


# 修改主机名字，把OpenWrt-123修改你喜欢的就行（不能纯数字或者使用中文）
#sed -i '/uci commit system/i\uci set system.@system[0].hostname='OpenWrt'' package/lean/default-settings/files/zzz-default-settings

# 版本号里显示一个自己的名字（281677160 build $(TZ=UTC-8 date "+%Y.%m.%d") @ 这些都是后增加的）
#sed -i "s/OpenWrt /SunnyMan build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile


echo
TIME b "空置登录密码"
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

TIME b "空置空登录密码"
#sed -i 's/root::0:0:99999:7:::/root:$1$6Z4AhXZY$VybahykOsZ.5Afbm2gcm9/:19045:0:99999:7:::/g' package/base-files/files/etc/shadow



TIME b "Modify default config 结束"
#===========================================================================================================
