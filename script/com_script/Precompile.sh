#!/bin/bash
# https://github.com/mdtycl/Compile-OpenWrt
# common Module by mdtycl
# matrix.target=${Modelfile}
# https://github.com/281677160/common/blob/main/common.sh


TIME() {
Compte=$(date +%Y年%m月%d号%H时%M分)
[[ -z "$1" ]] && {
	echo -ne " "
} || {
     case $1 in
	r) export Color="\e[31m";;
	g) export Color="\e[32m";;
	b) export Color="\e[34m";;
	y) export Color="\e[33m";;
	z) export Color="\e[35m";;
	l) export Color="\e[36m";;
      esac
	[[ $# -lt 2 ]] && echo -e "\e[36m\e[0m ${1}" || {
		echo -e "\e[36m\e[0m ${Color}${2}\e[0m"
	 }
      }
}



################################################################################################################
# 为编译做最后处理
################################################################################################################


sed -i '$ s/exit 0$//' ${Home}/package/base-files/files/etc/rc.local
echo '
if [[ `grep -c "coremark" /etc/crontabs/root` -eq '1' ]]; then
  sed -i '/coremark/d' /etc/crontabs/root
fi
/etc/init.d/network restart
/etc/init.d/uhttpd restart
exit 0
' >> ${Home}/package/base-files/files/etc/rc.local

if [[ "${REPO_BRANCH}" == "19.07" ]]; then
	sed -i 's/PATCHVER:=4.9/PATCHVER:=4.14/g' target/linux/*/Makefile
	sed -i 's/PATCHVER:=4.19/PATCHVER:=4.14/g' target/linux/*/Makefile
fi

if [[ "${TARGET_BOARD}" == "x86" ]]; then
	cp -Rf "${Home}"/build/common/Custom/DRM-I915 target/linux/x86/DRM-I915
	for X in $(ls -1 target/linux/x86 | grep "config-"); do echo -e "\n$(cat target/linux/x86/DRM-I915)" >> target/linux/x86/${X}; done
fi

if [[ `grep -c "CONFIG_PACKAGE_ntfs-3g=y" ${Home}/.config` -eq '1' ]]; then
	mkdir -p files/etc/hotplug.d/block && curl -fsSL  https://raw.githubusercontent.com/281677160/openwrt-package/usb/block/10-mount > files/etc/hotplug.d/block/10-mount
fi


if [[ `grep -c "CONFIG_PACKAGE_luci-app-adguardhome=y" ${Home}/.config` -eq '1' ]]; then
	if [[ `grep -c "CONFIG_ARCH=\"x86_64\"" ${Home}/.config` -eq '1' ]]; then
		Arch="amd64"
	elif [[ `grep -c "CONFIG_ARCH=\"i386\"" ${Home}/.config` -eq '1' ]]; then
		Arch="i386"
	elif [[ `grep -c "CONFIG_ARCH=\"aarch64\"" ${Home}/.config` -eq '1' ]]; then
		Arch="arm64"
	fi
	if [[ `grep -c "CONFIG_ARCH=\"arm\"" ${Home}/.config` -eq '1' ]]; then
		if [[ `grep -c "CONFIG_arm_v7=y" ${Home}/.config` -eq '1' ]]; then
			Arch="armv7"
		fi	
	fi
	if [[ "${Arch}" =~ (amd64|i386|armeb|armv7) ]]; then
		downloader="curl -L -k --retry 2 --connect-timeout 20 -o"
		latest_ver="$($downloader - https://api.github.com/repos/AdguardTeam/AdGuardHome/releases/latest 2>/dev/null|grep -E 'tag_name' |grep -E 'v[0-9.]+' -o 2>/dev/null)"
		wget -q https://github.com/AdguardTeam/AdGuardHome/releases/download/${latest_ver}/AdGuardHome_linux_${Arch}.tar.gz
		tar -zxvf AdGuardHome_linux_${Arch}.tar.gz -C ${Home} > /dev/null 2>&1
		mkdir -p files/usr/bin
		mv -f AdGuardHome/AdGuardHome files/usr/bin
		chmod 777 files/usr/bin/AdGuardHome
		rm -rf {AdGuardHome_linux_${Arch}.tar.gz,AdGuardHome}
	fi
fi

if [[ "${COMPILE_INFORMATION}" == "true" ]]; then
	grep -i CONFIG_PACKAGE_luci-app .config | grep  -v \# > Plug-in
	grep -i CONFIG_PACKAGE_luci-theme .config | grep  -v \# >> Plug-in
	if [[ `grep -c "CONFIG_PACKAGE_luci-i18n-qbittorrent-zh-cn=y" ${Home}/.config` -eq '0' ]]; then
		if [[ `grep -c "luci-app-qbittorrent_static" ${Home}/Plug-in` -eq '1' ]]; then
			sed -i '/qbittorrent/d' Plug-in
		fi
	fi
	sed -i '/INCLUDE/d' Plug-in > /dev/null 2>&1
	sed -i '/=m/d' Plug-in > /dev/null 2>&1
	sed -i 's/CONFIG_PACKAGE_/、/g' Plug-in
	sed -i 's/=y/\"/g' Plug-in
	awk '$0=NR$0' Plug-in > Plug-2
	awk '{print "	" $0}' Plug-2 > Plug-in
	sed -i "s/^/TIME g \"/g" Plug-in
	cat /proc/cpuinfo | grep name | cut -f2 -d: | uniq -c > CPU
        cat /proc/cpuinfo | grep "cpu cores" | uniq >> CPU
        sed -i 's|[[:space:]]||g; s|^.||' CPU && sed -i 's|CPU||g; s|pucores:||' CPU
        CPUNAME="$(awk 'NR==1' CPU)" && CPUCORES="$(awk 'NR==2' CPU)"
        rm -rf CPU

	#if [[ `grep -c "KERNEL_PATCHVER:=" ${Home}/target/linux/${TARGET_BOARD}/Makefile` -eq '1' ]]; then
	#	PATCHVER=$(grep KERNEL_PATCHVER:= ${Home}/target/linux/${TARGET_BOARD}/Makefile | cut -c18-100)
	#elif [[ `grep -c "KERNEL_PATCHVER=" ${Home}/target/linux/${TARGET_BOARD}/Makefile` -eq '1' ]]; then
	#	PATCHVER=$(grep KERNEL_PATCHVER= ${Home}/target/linux/${TARGET_BOARD}/Makefile | cut -c17-100)
	#else
	#	PATCHVER="unknown"
	#fi
	#if [[ ! "${PATCHVER}" == "unknown" ]]; then
	#	PATCHVER=$(egrep -o "${PATCHVER}.[0-9]+" ${Home}/include/kernel-version.mk)
	#fi
	
	
fi
rm -rf ${Home}/files/{README,README.md}




