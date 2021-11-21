#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild Functions



	GET_TARGET_INFO
	AutoBuild_Firmware="${LUCI_Name}-${Openwrt_Version}"
	Firmware_Path="${Home}/upgrade"
	Mkdir ${Home}/bin/Firmware
	if [[ `ls ${Firmware_Path} | grep -c "sysupgrade.bin"` -ge '1' ]]; then
		Up_BinFirmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
		mv ${Firmware_Path}/*sysupgrade.bin ${Home}/bin/Firmware/${Up_BinFirmware}
		mv ${Home}/bin/Firmware/${Up_BinFirmware} ${Firmware_Path}/${Up_BinFirmware}
	fi
	cd ${Firmware_Path}
	if [[ `ls | grep -c "xiaomi_mi-router-3g"` -ge '1' ]]; then
		rename -v "s/xiaomi_mi-router-3g/xiaomi_mir3g/" * > /dev/null 2>&1
	fi
	if [[ `ls | grep -c "xiaomi_mi-router-3g-v2"` -ge '1' ]]; then
		rename -v "s/xiaomi_mi-router-3g-v2/xiaomi_mir3gv2/" * > /dev/null 2>&1
	fi
	case "${TARGET_PROFILE}" in
	x86-64)
		[[ -e ${Legacy_Firmware} ]] && {
			MD5=$(md5sum ${Legacy_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${Legacy_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${Legacy_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-Legacy-${SHA5BIT}.${Firmware_sfx}
		}
		[[ -e ${UEFI_Firmware} ]] && {
			MD5=$(md5sum ${UEFI_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${UEFI_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${UEFI_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-UEFI-${SHA5BIT}.${Firmware_sfx}
		}
	;;
	friendlyarm_nanopi-r2s | friendlyarm_nanopi-r4s | armvirt)
		echo "R2S/R4S/N1/晶晨系列,暂不支持定时更新固件!" > Update_Logs.json
		cp Update_Logs.json ${Home}/bin/Firmware/Update_Logs.json
	;;
	*)
		[[ -e ${Up_Firmware} ]] && {
			MD5=$(md5sum ${Up_Firmware} | cut -c1-3)
			SHA256=$(sha256sum ${Up_Firmware} | cut -c1-3)
			SHA5BIT="${MD5}${SHA256}"
			cp ${Up_Firmware} ${Home}/bin/Firmware/${AutoBuild_Firmware}-Sysupg-${SHA5BIT}.${Firmware_sfx}
		} || {
			echo "Firmware is not detected !"
		}
	;;
	esac
	cd ${Home}

