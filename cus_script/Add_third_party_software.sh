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

#===========================================================================================================================
# 第三方插件最好先拉进仓库https://github.com/ghaner/Package-updater ,再由之作为唯一的feed,除有条件的软件外不在此处单独添加第三方插件.
# Add a third-party software:git clone -b branch-name software-url.git package/third-party-software/software-name
# Add a third-party software:git clone --depth=1 software-url package/third-party-software/software-name
# Add a third-party software:svn co software-url(/trunk or branch/branch-name/software-name) package/third-party-software/software-name
# Makefile文件在仓库根目录下应用git clone命令，其他用svn co命令
#---------------------------------------------------------------------------------------------------------------------------
echo
TIME y "添加 third-party software:"
#if [[ ${REGULAR_UPDATE} == "true" ]]; then
#    echo
#    TIME y "添加 luci-app-autoupdate:"
#    git clone https://github.com/mdtycl/luci-app-autoupdate feeds/luci/applications/luci-app-autoupdate
#fi

echo
TIME y "添加 adguardhome"
svn co https://github.com/kenzok8/openwrt-packages/trunk/adguardhome package/third-party-software/adguardhome
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-adguardhome package/third-party-software/luci-app-adguardhome
echo
TIME y "添加 filebrowser"
svn co https://github.com/kenzok8/openwrt-packages/trunk/filebrowser package/third-party-software/filebrowser
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-filebrowser package/third-party-software/luci-app-filebrowser
echo
TIME y "添加 fileassistant"
svn co https://github.com/kenzok8/openwrt-packages/trunk/luci-app-fileassistant package/third-party-software/luci-app-fileassistant
echo
TIME y "添加 openclash"
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/third-party-software/luci-app-openclash
echo
TIME y "添加 timedreboot"
git clone --depth 1 https://github.com/kongfl888/luci-app-timedreboot package/third-party-software/luci-app-timedreboot
echo
TIME y "添加 ttyd"
svn co https://github.com/coolsnowwolf/luci/trunk/applications/luci-app-ttyd package/third-party-software/luci-app-ttyd
echo
TIME y "添加 unblockneteasemusic"
git clone --depth 1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic package/third-party-software/luci-app-unblockneteasemusic

#echo
#TIME y "添加 KPR去广告"
#git clone https://github.com/project-lede/luci-app-godproxy package/gd772/luci-app-godproxy
#echo
#TIME y "添加 微信推送"
#git clone https://github.com/tty228/luci-app-serverchan.git ./package/gd772/luci-app-serverchan
#echo
#TIME y "汉化 实时监控"
#rm -rf ./package/lean/luci-app-netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/luci-app-netdata ./package/lean/luci-app-netdata
#rm -rf ./feeds/packages/admin/netdata && svn co https://github.com/sirpdboy/sirpdboy-package/trunk/netdata ./feeds/packages/admin/netdata
#echo
#TIME y "添加 Dockerman"
#rm -rf package/gd772/luci-app-dockerman && svn co https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman package/gd772/luci-app-dockerman
#echo
#TIME y "添加 应用过滤"
#git clone https://github.com/destan19/OpenAppFilter package/gd772/OpenAppFilter
#echo
#TIME y "添加 网络测速"
#git clone https://github.com/sirpdboy/NetSpeedTest package/NetSpeedTest

TIME y "添加 third-party software 结束"
#----------------------------------------------------------------------------------------------------------
