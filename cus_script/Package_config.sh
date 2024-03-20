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
# 在 cat >> .config <<EOF 到 EOF 之间粘贴配置
# 需要配置的非原生源码默认package:
# CONFIG_PACKAGE_PACKAGE-name=y
# 禁止原生源码默认package配置:
# CONFIG_DEFAULT_PACKAGE-name=n
# 添加新package时需要在# dependencies:添加新package需要的依赖，具体依赖见源码官方仓库说明。
#-------- ---------------------------------------------------------------------------------------------------
echo
TIME r "cus_script/Package_config.sh开始选择安装的插件:"
TIME r "luci-app-adguardhome"
TIME r "luci-app-cpufreq"

#TIME r "luci-app-ttyd"
TIME r "luci-app-fileassistant"
TIME r "luci-app-filebrowser"
TIME r "luci-app-firewall"

#TIME r "luci-app-ikoolproxy"

TIME r "luci-app-openclash"
#TIME r "luci-app-unblockneteasemusic"
TIME r "luci-app-timedreboot"
TIME r "luci-app-turboacc"


#TIME r "luci-theme-argon"
TIME r "luci-theme-bootstrap"
#TIME r "luci-theme-infinityfreedom"


cat >> .config <<EOF
#KERNEL_BUILD
CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"
CONFIG_KERNEL_BUILD_USER="Ghaner"

# IPv6:
CONFIG_PACKAGE_dnsmasq_full_dhcpv6=y
CONFIG_PACKAGE_ip6tables=y
CONFIG_PACKAGE_ipv6helper=y

# 增减插件时同步增减feed中相同插件的同步 https://github.com/ghaner/openwrt-package/blob/main/.github/workflows/Package%20updater.yml

# dependencies:
CONFIG_PACKAGE_bash=y
CONFIG_PACKAGE_ca-bundle=y
CONFIG_PACKAGE_ca-certificates=y
CONFIG_PACKAGE_coreutils=y
CONFIG_PACKAGE_coreutils-nohup=y
CONFIG_PACKAGE_curl=y
CONFIG_PACKAGE_diffutils=y
CONFIG_PACKAGE_dnsmasq-full=y
CONFIG_PACKAGE_dnsmasq-extra=y
CONFIG_PACKAGE_ip-full=y
CONFIG_PACKAGE_ipset=y
CONFIG_DEFAULT_iptables=y
CONFIG_PACKAGE_iptables-mod-extra=y
CONFIG_PACKAGE_iptables-mod-nat-extra=y
CONFIG_PACKAGE_iptables-mod-tproxy=y
CONFIG_PACKAGE_ip6tables-mod-nat=y
CONFIG_PACKAGE_kmod-inet-diag=y
CONFIG_PACKAGE_kmod-ipt-extra=y
CONFIG_PACKAGE_kmod-tun=y
CONFIG_PACKAGE_libcap=y
CONFIG_PACKAGE_libcap-bin=y
CONFIG_PACKAGE_libustream-openssl=y
#CONFIG_PACKAGE_lua-maxminddb=y
CONFIG_PACKAGE_lua-openssl=y
CONFIG_PACKAGE_luci=y
CONFIG_PACKAGE_luci-base=y
CONFIG_PACKAGE_luci-compat=y
CONFIG_PACKAGE_luci-lib-fs=y
CONFIG_PACKAGE_openssl-util=y
CONFIG_PACKAGE_ruby=y
CONFIG_PACKAGE_ruby-yaml=y
CONFIG_BUSYBOX_DEFAULT_WGET=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_AUTHENTICATION=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_HTTPS=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_LONG_OPTIONS=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_OPENSSL=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_STATUSBAR=y
CONFIG_BUSYBOX_DEFAULT_FEATURE_WGET_TIMEOUT=y
CONFIG_PACKAGE_wget-nossl=y
CONFIG_PACKAGE_wget-ssl=y
#CONFIG_PACKAGE_xray-core=y
#CONFIG_PACKAGE_xray-plugin=y

#application:
##system:
#CONFIG_PACKAGE_luci-app-autotimeset=y
CONFIG_PACKAGE_luci-app-timedreboot=y
#CONFIG_PACKAGE_luci-app-ttyd=y


##NAS:
CONFIG_PACKAGE_luci-app-filebrowser=y
CONFIG_PACKAGE_luci-app-fileassistant=y
##services:
CONFIG_PACKAGE_luci-app-adguardhome=y
CONFIG_PACKAGE_luci-app-openclash=y
#CONFIG_PACKAGE_luci-app-unblockneteasemusic=y

#CONFIG_PACKAGE_luci-app-aliyundrive-webdav=y
#CONFIG_PACKAGE_luci-app-ikoolproxy=y
#CONFIG_PACKAGE_luci-app-jd-dailybonus=y
#CONFIG_PACKAGE_luci-app-unblockmusic=y


##network:
CONFIG_PACKAGE_luci-app-firewall=y
CONFIG_PACKAGE_luci-app-turboacc=y

# LuCI-theme
#CONFIG_PACKAGE_luci-theme-argon=y
#CONFIG_PACKAGE_luci-app-argon-config=y
CONFIG_DEFAULT_luci-theme-bootstrap=y
#CONFIG_PACKAGE_luci-theme-infinityfreedom=y


#block default PACKAGE:CONFIG_PACKAGE_PACKAGE-name=n

CONFIG_PACKAGE_adbyby=n
CONFIG_PACKAGE_autosamba=n
CONFIG_PACKAGE_ddns-scripts_aliyun=n
CONFIG_PACKAGE_ddns-scripts_dnspod=n
CONFIG_PACKAGE_luci-app-accesscontrol=n
CONFIG_PACKAGE_luci-app-adbyby-plus=n
CONFIG_PACKAGE_luci-app-arpbind=n
CONFIG_PACKAGE_luci-app-autoreboot=n
CONFIG_PACKAGE_luci-app-ddns=n
CONFIG_PACKAGE_luci-app-filetransfer=n
CONFIG_PACKAGE_luci-app-nlbwmon=n
CONFIG_PACKAGE_luci-app-qbittorrent_dynamic=n
CONFIG_PACKAGE_luci-app-samba4=n
CONFIG_DEFAULT_luci-app-ssr-plus=n
CONFIG_PACKAGE_luci-app-vlmcsd=n
CONFIG_PACKAGE_luci-app-ipsec-vpnd=n
CONFIG_PACKAGE_luci-app-unblockmusic=n
CONFIG_PACKAGE_luci-app-upnp=n
CONFIG_PACKAGE_luci-app-vsftpd=n
CONFIG_PACKAGE_luci-app-wol=n
CONFIG_PACKAGE_luci-app-zerotier=n
CONFIG_PACKAGE_vsftpd-alt=n
CONFIG_PACKAGE_wol=n


EOF
TIME r "选择安装的插件完成"
