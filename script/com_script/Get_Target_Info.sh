#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild Functions


	[[ ${TARGET_PROFILE} == x86-64 ]] && {
		[[ `grep -c "CONFIG_TARGET_IMAGES_GZIP=y" ${Home}/.config` -ge '1' ]] && Firmware_sfxo=img.gz || Firmware_sfxo=img 
	}
	case "${REPO_BRANCH}" in
	"master")
		LUCI_Name="18.06"
		REPO_Name="lede"
		ZUOZHE="Lean's"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="openwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			UEFI_Firmware="openwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" == "phicomm_k3" ]]; then
			Up_Firmware="openwrt-bcm53xx-generic-phicomm_k3-squashfs.trx"
			Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" == "xiaomi_mi-router-3g" ]]; then
			TARGET_PROFILE="xiaomi_mir3g"
			Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" == "xiaomi_mi-router-3g-v2" ]]; then
			TARGET_PROFILE="xiaomi_mir3gv2"
			Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		else
			Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		fi
	;;
	"19.07") 
		LUCI_Name="19.07"
		REPO_Name="lienol"
		ZUOZHE="Lienol's"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="openwrt-x86-64-combined-squashfs.${Firmware_sfxo}"
			UEFI_Firmware="openwrt-x86-64-combined-squashfs-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" == "phicomm-k3" ]]; then
			Up_Firmware="openwrt-bcm53xx-phicomm-k3-squashfs.trx"
			Firmware_sfx="trx"
		else
			Up_Firmware="openwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		fi
	;;
	"openwrt-21.02")
		LUCI_Name="18.06"
		REPO_Name="mortal"
		ZUOZHE="ctcgfw"
		if [[ "${TARGET_PROFILE}" == "x86-64" ]]; then
			Legacy_Firmware="immortalwrt-x86-64-generic-squashfs-combined.${Firmware_sfxo}"
			UEFI_Firmware="immortalwrt-x86-64-generic-squashfs-combined-efi.${Firmware_sfxo}"
			Firmware_sfx="${Firmware_sfxo}"
		elif [[ "${TARGET_PROFILE}" == "phicomm_k3" ]]; then
			Up_Firmware="immortalwrt-bcm53xx-generic-phicomm_k3-squashfs.trx"
			Firmware_sfx="trx"
		elif [[ "${TARGET_PROFILE}" == "xiaomi_mi-router-3g" ]]; then
			TARGET_PROFILE="xiaomi_mir3g"
			Up_Firmware="openwrt-ramips-mt7621-xiaomi_mir3g-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		elif [[ "${TARGET_PROFILE}" == "xiaomi_mi-router-3g-v2" ]]; then
			TARGET_PROFILE="xiaomi_mir3gv2"
			Up_Firmware="openwrt-ramips-mt7621-xiaomi_mir3gv2-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		else
			Up_Firmware="immortalwrt-${TARGET_BOARD}-${TARGET_SUBTARGET}-${TARGET_PROFILE}-squashfs-sysupgrade.bin"
			Firmware_sfx="bin"
		fi
	;;
	esac
	



