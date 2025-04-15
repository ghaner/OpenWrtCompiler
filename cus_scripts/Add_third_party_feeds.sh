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
# add a third-party feed:git clone feed-url package/third-party-feeds/每个feed须单独一个文件夹feed用户名-仓库名
# 为避免多个插件编译冲突，须删除openwrt相应源代码。
# 编译工作区路径 .yml Download Package
#tools/   
#toolchain/
#feeds/luci/; feeds/packages;package/firmware;
#package/kernel/;package/libs/;package/network/;package/system/;package/utils/;package/lean/;package/third-party feed;
#target/linux
#----------------------------------------------------------------------------------------------------------
 
echo
TIME y " cus_scripts/Add_third_party_feeds.sh开始添加third-party feeds:"
git clone https://github.com/ghaner/OpenWrtPackage package/third-party-feeds/ghaner-OpenWrtPackage
git clone https://github.com/kenzok8/openwrt-packages package/third-party-feeds/kenzok8-openwrt-packages
git clone https://github.com/kenzok8/small package/third-party-feeds/kenzok8-small
chmod -R 755 package/third-party-feeds
rm -rf feeds/packages/lang/golang
git clone https://github.com/kenzok8/golang feeds/packages/lang/golang 

rm -rf feeds/packages/lang/python
git clone -b openwrt-19.07 https://github.com/coolsnowwolf/packages/lang/python feeds/packages/lang/python  


TIME y "添加 third-party feeds 结束" 
#===========================================================================================================================
