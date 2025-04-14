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
#===========================================================================================================
#添加的third-party feed与OpenWrt中的软件包同名且需要编译third-party feeds的数据包，则需要先把OpenWrt源码中的同名软件包删除，否则会优先编译 OpenWrt 中的软件包
# Delete original code:rm -rf code-路径
# 编译工作区路径 .yml Download Package
#tools/   
#toolchain/
#feeds/luci/; feeds/packages;package/firmware;
#package/kernel/;package/libs/;package/network/;package/system/;package/utils/;package/lean/;package/third-party feed;
#target/linux
#-----------------------------------------------------------------------------------------------------------

echo
TIME r "cus_scripts/Delete_original_code.sh开始删除openwrt编译源代码中不需要或与第三方feed重复或与最新官方插件冲突的代码:"

#TIME r "删除无用主题"
#rm -rf ./feeds/freifunk/themes

#rm -rf ./feeds/luci/themes/luci-theme-material
TIME r "删除源码中与third-party feed重复的插件:"
rm -rf feeds/luci/applications/luci-app-mosdns
rm -rf feeds/packages/net/{alist,adguardhome,mosdns,xray*,v2ray*,v2ray*,sing*,smartdns}
rm -rf feeds/packages/utils/v2dat

TIME r "删除argon主题"
rm -rf ./package/lean/luci-theme-argon

#TIME r "移除 openwrt feeds 自带的核心包"
#rm -rf feeds/packages/net/{xray-core,v2ray-core,v2ray-geodata,sing-box}


#TIME r "移除 golang 旧版本"
#rm -rf feeds/packages/lang/golang


#rm -rf ./feeds/luci/applications/luci-app-aliyundrive-webdav

#rm -rf ./feeds/packages/net/smartdns
#rm -rf ./feeds/packages/admin/netdata
#rm -rf ./package/lean/luci-app-netdata

#TIME r "-删除luci-app-jd-dailybonus"
#rm -rf ./package/lean/luci-app-jd-dailybonus
#rm -rf ./feeds/luci/applications/luci-app-rp-pppoe-server
#rm -rf ./package/lean/luci-app-usb-printer
TIME r "Delete original code 结束"
