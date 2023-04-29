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
#插件名称文件位置  luasrc/controller/shadowsocksr.lua或.po
#===========================================================================================================
#echo   
#TIME r "Rename_plug-in.sh开始重命名插件"       
#TIME b "解除网易云音乐播放限制重命名为网易云音乐"
#sed -i 's/"管理权"/"改密码"/g' feeds/luci/modules/luci-base/po/zh-cn/base.po

#sed -i 's/msgstr "Web 管理"/msgstr "Web"/g' package/lean/luci-app-webadmin/po/zh-cn/webadmin.po

#sed -i 's/TTYD 终端/命令行/g' package/lean/luci-app-ttyd/po/zh-cn/terminal.po

#sed -i 's/ShadowSocksR Plus+/SSR Plus+/g' package/gd772/ssrplus/luci-app-ssr-plus/luasrc/controller/shadowsocksr.lua

#sed -i 's/PassWall/Pass Wall/g' package/gd772/passwall/luci-app-passwall/po/zh-cn/passwall.po

#sed -i 's/广告屏蔽大师 Plus+/广告屏蔽/g' package/lean/luci-app-adbyby-plus/po/zh-cn/adbyby.po

#sed -i 's/("Dnsforwarder")/("广告过滤")/g' package/lean/luci-app-dnsforwarder/luasrc/controller/dnsforwarder.lua

#sed -i 's/"GodProxy滤广告"/"KPR去广告"/g' package/gd772/luci-app-godproxy/po/zh-cn/koolproxy.po

#sed -i 's/GodProxy滤广告/KoolProxyR去广告/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

#sed -i 's/GodProxy 访问控制/KoolProxyR 访问控制/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

#sed -i 's/GodProxy 帮助支持/KoolProxyR帮助支持/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

#sed -i 's/GodProxy是/是/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

#sed -i 's/GodProxy/KoolProxyR/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/global.lua

#sed -i 's/GodProxy滤广告/KPR去广告/g' package/gd772/luci-app-godproxy/luasrc/model/cbi/koolproxy/rss_rule.lua

#sed -i 's/Shaoxia的KoolProxyR详细使用说明/关于 KoolProxyR 的详细使用说明/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/feedback.htm

#sed -i 's/GodProxy/KoolProxyR/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/koolproxy_status.htm

#sed -i 's/KoolProxyR滤广告/KoolProxyR去广告/g' package/gd772/luci-app-godproxy/luasrc/view/koolproxy/koolproxy_status.htm

#sed -i 's/京东签到服务/京东签到/g' package/gd772/luci-app-jd-dailybonus/luasrc/controller/jd-dailybonus.lua

#sed -i 's/msgstr "KMS 服务器"/msgstr "KMS 激活"/g' package/lean/luci-app-vlmcsd/po/zh-cn/vlmcsd.po

#sed -i 's/msgstr "UPnP"/msgstr "UPnP设置"/g' feeds/luci/applications/luci-app-upnp/po/zh-cn/upnp.po

#sed -i 's/Frp 内网穿透/Frp 客户端/g' package/lean/luci-app-frpc/po/zh-cn/frp.po

#sed -i 's/Frps/Frp 服务端/g' package/lean/luci-app-frps/luasrc/controller/frps.lua

#sed -i 's/Nps 内网穿透/Nps 客户端/g' package/lean/luci-app-nps/po/zh-cn/nps.po

#sed -i 's/解锁网易云灰色歌曲/音乐解锁/g' package/lean/luci-app-unblockmusic/po/zh-cn/unblockmusic.po

#sed -i 's/Docker CE 容器/Docker容器/g' package/lean/luci-app-docker/po/zh-cn/docker.po

#sed -i 's/UU游戏加速器/UU加速器/g' package/lean/luci-app-uugamebooster/po/zh-cn/uuplugin.po

#sed -i 's/网络存储/存储/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po

#sed -i 's/挂载 SMB 网络共享/挂载共享/g' package/lean/luci-app-cifs-mount/po/zh-cn/cifs.po

#sed -i 's/"文件浏览器"/"文件管理"/g' package/gd772/luci-app-filebrowser/po/zh-cn/filebrowser.po

#sed -i 's/"阿里云盘 WebDAV"/"阿里云盘"/g' package/lean/luci-app-aliyundrive-webdav/po/zh-cn/aliyundrive-webdav.po

#sed -i 's/msgstr "FTP 服务器"/msgstr "FTP 服务"/g' package/lean/luci-app-vsftpd/po/zh-cn/vsftpd.po

#sed -i 's/Rclone/网盘挂载/g' package/lean/luci-app-rclone/luasrc/controller/rclone.lua

#sed -i 's/msgstr "Aria2"/msgstr "Aria2下载"/g' feeds/luci/applications/luci-app-aria2/po/zh-cn/aria2.po

#sed -i 's/_("qBittorrent")/_("BT下载")/g' package/lean/luci-app-qbittorrent/luasrc/controller/qbittorrent.lua

#sed -i 's/BaiduPCS Web/百毒网盘/g' package/lean/luci-app-baidupcs-web/luasrc/controller/baidupcs-web.lua

#sed -i 's/IPSec VPN 服务器/IPSec 服务/g' package/lean/luci-app-ipsec-vpnd/po/zh-cn/ipsec.po

#sed -i 's/"PPTP VPN 服务器"/"PPTP 服务"/g' package/lean/luci-app-pptp-server/po/zh-cn/pptp.po

#sed -i 's/V2ray 服务器/V2ray 服务/g' package/lean/luci-app-v2ray-server/po/zh-cn/v2ray_server.po

#sed -i 's/SoftEther VPN 服务器/SoftEther/g' package/lean/luci-app-softethervpn/po/zh-cn/softethervpn.po

#sed -i 's/"OpenVPN 服务器"/"OpenVPN"/g' package/lean/luci-app-openvpn-server/po/zh-cn/openvpn-server.po

#sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-zerotier/luasrc/controller/zerotier.lua

#sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-ipsec-vpnd/luasrc/controller/ipsec-server.lua

#sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-softethervpn/luasrc/controller/softethervpn.lua

#sed -i 's/firstchild(), "VPN"/firstchild(), "GFW"/g' package/lean/luci-app-openvpn-server/luasrc/controller/openvpn-server.lua

#sed -i 's/WireGuard 状态/WiGd状态/g' feeds/luci/applications/luci-app-wireguard/po/zh-cn/wireguard.po

#sed -i 's/Turbo ACC 网络加速/网络加速/g' package/lean/luci-app-turboacc/po/zh-cn/turboacc.po

#sed -i 's/MWAN3 分流助手/分流助手/g' package/lean/luci-app-mwan3helper/po/zh-cn/mwan3helper.po

#sed -i 's/带宽监控/统计/g' feeds/luci/applications/luci-app-nlbwmon/po/zh-cn/nlbwmon.po

#sed -i 's/实时流量监测/流量监测/g' package/lean/luci-app-wrtbwmon/po/zh-cn/wrtbwmon.po

#TIME b "rename_plug-in 结束"
