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
# Load_Custom_Files:
#1.登录正在使用的路由器openwrt固件web管理页面.
#2.登录openwrt web 文件管理器FileBrowser.固件登录IP:端口/files/.
#3.下载etc文件夹,删除不需要保存设置数据的文件(夹).
#4.浏览器打开GitHub云编译脚本仓库./custom_files/file或./files/etc/,上传从openwrt下载后整理过的files或特殊插件的设置文件(夹)
#5.刷入Load_Custom_Files的编译固件,恢复出厂设置清除固件数据后不用再设置把设置数据保存在云编译脚本仓库customfiles文件夹中的插件参数.
#----------------------------------------------------------------------------------------------------------

echo
TIME r "开始加载custom files:"

TIME r "加载etc/config/filebrowser"
TIME r "加载etc/config/openclash"
TIME r "加载etc/config/turboacc"
TIME r "加载etc/config/unblockmusic"
TIME b "加载etc/AdGuardHome.yaml"
TIME b "加载etc/filebrowser.db/"



TIME b "加载etc/openclash/"


if [ -n "$(ls -A "${PATH_Custom}/diy" 2>/dev/null)" ]; then
    cp -Rf "${PATH_Custom}"/diy/* "${Home}"
fi
if [ -n "$(ls -A "${PATH_Custom}/files" 2>/dev/null)" ]; then
    cp -Rf "${PATH_Custom}/files" "${Home}" && chmod -R +x ${Home}/files
fi
if [ -n "$(ls -A "${PATH_Custom}/patches" 2>/dev/null)" ]; then
    find "${PATH_Custom}/patches" -type f -name '*.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -p1 --forward --no-backup-if-mismatch"
fi
rm -rf ${Home}/files/{README,README.md}
TIME b "加载custom files结束"
#===========================================================================================================
