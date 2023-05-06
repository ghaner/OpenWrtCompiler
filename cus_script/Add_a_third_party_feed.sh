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
# add a third-party feed:git clone feed-url package/third-party-feed
# 为避免多个feed中插件冲突，最好只添加一个feed。
#----------------------------------------------------------------------------------------------------------
 
echo
TIME y " cus_script/Add_a_third_party_feed.sh开始添加 a third-party feed:"
TIME y "-添加 https://github.com/ghaner/OpenWrtPackage "
git clone https://github.com/ghaner/OpenWrtPackage package/third-party-feed


chmod -R 755 package/third-party-feed
TIME y "添加 a third-party feed 结束" 
#===========================================================================================================================
