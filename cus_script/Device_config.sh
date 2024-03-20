#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild Functions
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
# 在 cat >> .config <<EOF 到 EOF 之间粘贴配置 同时注释掉其他路由器型号
#-----------------------------------------------------------------------------------------------------------
echo
TIME r "cus_script/Device_config.sh开始载入路由器型号:asus_rt-acrh17"
cat >> .config <<EOF
#MODULES:
#CONFIG_TARGET_ipq40xx=y
#CONFIG_TARGET_ipq40xx_DEVICE_asus_rt-acrh17=y
#CONFIG_TARGET_BOARD="ipq40xx"
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_generic=y
CONFIG_TARGET_ipq40xx_generic_DEVICE_asus_rt-ac42u=y
EOF


#MODULES
# CONFIG_MODULES=y
# CONFIG_HAVE_DOT_# CONFIG=y
# CONFIG_TARGET_sunxi is not set
# CONFIG_TARGET_apm821xx is not set
# CONFIG_TARGET_ath25 is not set
# CONFIG_TARGET_ath79 is not set
# CONFIG_TARGET_bcm27xx is not set
# CONFIG_TARGET_bcm53xx is not set
# CONFIG_TARGET_bcm47xx is not set
# CONFIG_TARGET_bcm4908 is not set
# CONFIG_TARGET_bcm63xx is not set
# CONFIG_TARGET_bmips is not set
# CONFIG_TARGET_octeon is not set
# CONFIG_TARGET_gemini is not set
# CONFIG_TARGET_mpc85xx is not set
# CONFIG_TARGET_mxs is not set
# CONFIG_TARGET_lantiq is not set
# CONFIG_TARGET_malta is not set
# CONFIG_TARGET_pistachio is not set
# CONFIG_TARGET_mvebu is not set
# CONFIG_TARGET_kirkwood is not set
# CONFIG_TARGET_mediatek is not set
# CONFIG_TARGET_ramips is not set
# CONFIG_TARGET_at91 is not set
# CONFIG_TARGET_tegra is not set
# CONFIG_TARGET_layerscape is not set
# CONFIG_TARGET_imx6 is not set
# CONFIG_TARGET_octeontx is not set
# CONFIG_TARGET_oxnas is not set
# CONFIG_TARGET_armvirt is not set
# CONFIG_TARGET_ipq40xx=y
# CONFIG_TARGET_ipq806x is not set
# CONFIG_TARGET_ipq807x is not set
# CONFIG_TARGET_realtek is not set
# CONFIG_TARGET_rockchip is not set
# CONFIG_TARGET_arc770 is not set
# CONFIG_TARGET_archs38 is not set
# CONFIG_TARGET_omap is not set
# CONFIG_TARGET_uml is not set
# CONFIG_TARGET_zynq is not set
# CONFIG_TARGET_x86 is not set
# CONFIG_TARGET_MULTI_PROFILE is not set
# CONFIG_TARGET_ipq40xx_Default is not set
#DEVICE
# CONFIG_TARGET_ipq40xx_DEVICE_8dev_habanero-dvk is not set
# CONFIG_TARGET_ipq40xx_DEVICE_8dev_jalapeno is not set
# CONFIG_TARGET_ipq40xx_DEVICE_alfa-network_ap120c-ac is not set
# CONFIG_TARGET_ipq40xx_DEVICE_asus_map-ac2200 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_asus_rt-ac58u is not set
# CONFIG_TARGET_ipq40xx_DEVICE_asus_rt-acrh17=y
# CONFIG_TARGET_ipq40xx_DEVICE_avm_fritzbox-4040 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_avm_fritzbox-7530 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_avm_fritzrepeater-1200 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_avm_fritzrepeater-3000 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_aruba_ap-303 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_aruba_ap-303h is not set
# CONFIG_TARGET_ipq40xx_DEVICE_aruba_ap-365 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_buffalo_wtr-m2133hp is not set
# CONFIG_TARGET_ipq40xx_DEVICE_cellc_rtl30vw is not set
# CONFIG_TARGET_ipq40xx_DEVICE_century_wr142ac is not set
# CONFIG_TARGET_ipq40xx_DEVICE_century_wr142ac-nand is not set
# CONFIG_TARGET_ipq40xx_DEVICE_meraki_mr33 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_compex_wpj419 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_compex_wpj428 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_cilab_meshpoint-one is not set
# CONFIG_TARGET_ipq40xx_DEVICE_dlink_dap-2610 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_ezviz_cs-w3-wd1200g-eup is not set
# CONFIG_TARGET_ipq40xx_DEVICE_engenius_eap1300 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_engenius_eap2200 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_engenius_emd1 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_engenius_emr3500 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_engenius_ens620ext is not set
# CONFIG_TARGET_ipq40xx_DEVICE_glinet_gl-b1300 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_glinet_gl-s1300 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_hiwifi_c526a is not set
# CONFIG_TARGET_ipq40xx_DEVICE_hugo_ac1200 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_linksys_ea6350v3 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_linksys_ea8300 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_mobipromo_cm520-79f is not set
# CONFIG_TARGET_ipq40xx_DEVICE_netgear_ex6100v2 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_netgear_ex6150v2 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_netgear_ex6200v2 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_openmesh_a42 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_openmesh_a62 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_p2w_r619ac is not set
# CONFIG_TARGET_ipq40xx_DEVICE_p2w_r619ac-128m is not set
# CONFIG_TARGET_ipq40xx_DEVICE_qcom_ap-dk01.1-c1 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_qcom_ap-dk04.1-c1 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_qxwlan_e2600ac-c1 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_qxwlan_e2600ac-c2 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_unielec_u4019-32m is not set
# CONFIG_TARGET_ipq40xx_DEVICE_zyxel_nbg6617 is not set
# CONFIG_TARGET_ipq40xx_DEVICE_zyxel_wre6606 is not set
#
# CONFIG_HAS_DEVICES=y
# CONFIG_TARGET_BOARD="ipq40xx"
# CONFIG_TARGET_SUBTARGET="generic"
# CONFIG_TARGET_PROFILE="DEVICE_asus_rt-acrh17"
# CONFIG_TARGET_ARCH_PACKAGES="arm_cortex-a7_neon-vfpv4"
# CONFIG_DEFAULT_TARGET_OPTIMIZATION="-Os -pipe"
# CONFIG_CPU_TYPE="cortex-a7+neon-vfpv4"
TIME r "路由器型号载入完成"
