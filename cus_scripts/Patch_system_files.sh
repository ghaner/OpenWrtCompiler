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
# patch_system_files:curl -fsSL patch-url > 系统文件路径
# 系统文件路径:
#       ./package/lean/default-settings/files/zzz-default-settings
#	   */index.htm
#	   */udpxy.lua
#----------------------------------------------------------------------------------------------------------
# echo
# TIME b "patch_system_files"
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/x86_index.htm > ./package/lean/autocore/files/x86/index.htm
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/udpxy.lua > ./feeds/luci/applications/luci-app-udpxy/luasrc/controller/udpxy.lua
# TIME b "系统文件 修改完成"

#===========================================================================================================
