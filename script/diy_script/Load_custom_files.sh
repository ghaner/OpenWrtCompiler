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
# Load_Custom_Files
#----------------------------------------------------------------------------------------------------------

echo
TIME b "开始加载custom files:"
if [ -n "$(ls -A "${PATH_Custom}/diy" 2>/dev/null)" ]; then
    cp -Rf "${PATH_Custom}"/diy/* "${Home}"
fi
if [ -n "$(ls -A "${PATH_Custom}/files" 2>/dev/null)" ]; then
    cp -Rf "${PATH_Custom}/files" "${Home}" && chmod -R +x ${Home}/files
fi
if [ -n "$(ls -A "${PATH_Custom}/patches" 2>/dev/null)" ]; then
    find "${PATH_Custom}/patches" -type f -name '*.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -p1 --forward --no-backup-if-mismatch"
fi

TIME b "加载custom files结束"
#===========================================================================================================
