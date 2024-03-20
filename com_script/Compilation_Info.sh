#!/bin/bash
# https://github.com/mdtycl/Compile-OpenWrt
# common Module by mdtycl
# matrix.target=${Modelfile}

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
# 编译信息
################################################################################################################


echo
TIME b "编译源码: ${CODE}"
TIME b "源码链接: ${REPO_URL}"
TIME b "源码分支: ${REPO_BRANCH}"
TIME b "源码作者: ${ZUOZHE}"
#TIME b "固件内核: ${PATCHVER}"
TIME b "Luci版本: ${OpenWrt_name}"
[[ "${Modelfile}" == "openwrt_amlogic" ]] && {
	TIME b "编译机型: ${TARGET_model}"
	TIME b "打包内核: ${TARGET_kernel}"
} || {
	TIME b "编译机型: ${TARGET_PROFILE}"
}
TIME b "固件作者: ${Author}"
TIME b "仓库地址: ${Github}"
TIME b "启动编号: #${Run_number}（${CangKu}仓库第${Run_number}次启动[${Run_workflow}]工作流程）"
TIME b "编译时间: ${Compte}"
[[ "${Modelfile}" == "openwrt_amlogic" ]] && {
	TIME g "友情提示：您当前使用【${Modelfile}】文件夹编译【${TARGET_model}】固件"
} || {
	TIME g "友情提示：您当前使用【${Modelfile}】文件夹编译【${TARGET_PROFILE}】固件"
}
echo

if [[ ${UPLOAD_CONFIG} == "true" ]]; then
	TIME y "上传配置至github actions Artifacts: 开启"
else
	TIME r "上传配置至github actions Artifacts: 关闭"
fi
if [[ ${UPLOAD_BIN_DIR} == "true" ]]; then
	TIME y "上传BIN至github actions Artifacts: 开启"
else
	TIME r "上传BIN至github actions Artifacts: 关闭"
fi
if [[ ${UPLOAD_Artifacts} == "true" ]]; then
        TIME y "上传固件至github actions Artifacts: 开启"
else
        TIME r "上传固件至github actions Artifacts: 关闭"
fi
if [[ ${UPLOAD_COWTRANSFER} == "true" ]]; then
	TIME y "上传固件至【CowTransfer】: 开启"
else
	TIME r "上传固件至【CowTransfer】: 关闭"
fi
if [[ ${UPLOAD_WETRANSFER} == "true" ]]; then
        TIME y "上传固件至【WeTransfer】: 开启"
else
        TIME r "上传固件至【WeTransfer】: 关闭"
fi
if [[ ${UPLOAD_RELEASE} == "true" ]]; then
	TIME y "发布固件: 开启"
else
	TIME r "发布固件: 关闭"
fi




echo
TIME z " 系统空间      类型   容量  已用  可用 使用率"
cd ../ && df -hT $PWD && cd openwrt
echo
TIME z "  本次编译服务器的CPU型号为[ ${CPUNAME} ]"
echo
TIME z "  使用核心数为[ ${CPUCORES} ], 线程数为[ $(nproc) ]"
echo
TIME z "  CPU编译速度:8370C>8272CL>8171M>E5系列  [ AMDEPYC776364-CoreProcessor ]"
echo
TIME z "  如果编译的插件较多，而又分配到E5系列的CPU，常常会因为超过免费用户连续使用6小时的限制而被取消导致编译失败，建议关闭 重新再来！"
echo
TIME z "  下面将使用[ $(nproc) 线程 ]编译固件"
echo
if [ -n "$(ls -A "${Home}/EXT4" 2>/dev/null)" ]; then
	echo
	echo
	chmod -R +x ${Home}/EXT4
	source ${Home}/EXT4
	rm -rf EXT4
fi
if [ -n "$(ls -A "${Home}/Chajianlibiao" 2>/dev/null)" ]; then
	echo
	echo
	chmod -R +x ${Home}/CHONGTU
	source ${Home}/CHONGTU
	rm -rf {CHONGTU,Chajianlibiao}
	echo
	echo
fi
if [ -n "$(ls -A "${Home}/Plug-in" 2>/dev/null)" ]; then
	TIME r "	      已选插件列表"
	chmod -R +x ${Home}/Plug-in
	source ${Home}/Plug-in
	rm -rf {Plug-in,Plug-2}
	echo
fi

