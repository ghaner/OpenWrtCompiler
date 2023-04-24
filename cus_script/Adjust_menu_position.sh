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







#sed -i 's/invalid/## invalid/g' feeds/packages/net/samba4/files/smb.conf.template
#=================================================================================================================================
# 软件菜单位置调整命令:sed -i 's/\"现处菜单\"/\"拟处菜单\"/g' luci文件下载目标编译工作区路径/luci-app-名称/luasrc/controller/luci名称.lua(action step Download Package查看路径)
# 菜单名称:参考浏览器位置栏内名称,以.lua .htm文件中entry后面的菜单栏位置名称为准
#----------------------------------------------------------------------------------------------------------------------------------
echo
TIME b "cus_script/adjust_menu_position.sh开始调整插件菜单位置:"
TIME b "调整 cpufreq 到 system菜单"
sed -i 's/\"services\"/\"system\"/g' feeds/luci/applications/luci-app-cpufreq/luasrc/controller/cpufreq.lua
#TIME b "调整 分流助手 到 网络菜单"
#sed -i 's/\"services\"/\"network\"/g' package/lean/luci-app-mwan3helper/luasrc/controller/mwan3helper.lua
#curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/mwan3helper_status.htm > ./package/lean/luci-app-mwan3helper/luasrc/view/mwan3helper/mwan3helper_status.htm
#TIME b "调整 Dockerman 到 服务 菜单"
#sed -i 's/"admin",/"admin","services",/g' package/gd772/luci-app-dockerman/luasrc/controller/*.lua
#sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/model/*.lua
#sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/model/cbi/dockerman/*.lua
#sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/view/dockerman/*.htm
#sed -i 's/"admin/"admin\/services/g' package/gd772/luci-app-dockerman/luasrc/view/dockerman/cbi/*.htm
#TIME b "调整 SSRP 到 GFW 菜单"
#sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/*.lua
#sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/model/cbi/shadowsocksr/*.lua
#sed -i 's/services/vpn/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/view/shadowsocksr/*.htm
#TIME b "调整 Pass Wall 到 GFW 菜单"
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/controller/*.lua
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
#sed -i 's/services/vpn/g' package/gd772/passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
#TIME b "调整 Hello World 到 GFW 菜单"
#sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/controller/*.lua
#sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/model/cbi/vssr/*.lua
#sed -i 's/services/vpn/g' package/gd772/luci-app-vssr/luasrc/view/vssr/*.htm
#TIME b "调整 Open Clash 到 GFW 菜单"
#sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/controller/*.lua
#sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/*.lua
#sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/model/cbi/openclash/*.lua
#sed -i 's/services/vpn/g' package/gd772/luci-app-openclash/luasrc/view/openclash/*.htm
#TIME b "调整 V2ray服务 到 GFW 菜单"
#sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/controller/*.lua
#sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/model/cbi/v2ray_server/*.lua
#sed -i 's/services/vpn/g' package/lean/luci-app-v2ray-server/luasrc/view/v2ray_server/*.htm
#TIME b "调整 阿里云盘 到 存储 菜单"
#sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/controller/*.lua
#sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/model/cbi/aliyundrive-webdav/*.lua
#sed -i 's/services/nas/g' package/lean/luci-app-aliyundrive-webdav/luasrc/view/aliyundrive-webdav/*.htm

TIME b "adjust_menu_position 结束"
