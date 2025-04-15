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
# patch_system_files:curl -fsSL patch-url > 系统文件路径
# 系统文件路径:
#       ./package/lean/default-settings/files/zzz-default-settings
#	   */index.htm
#	   */udpxy.lua
#----------------------------------------------------------------------------------------------------------
# echo
# TIME b "patch_system_files"
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/zzz-default-settings > ./package/lean/default-settings/files/zzz-default-settings
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/x86_index.htm > ./package/lean/autocore/files/x86/index.htm
# curl -fsSL https://raw.githubusercontent.com/gd0772/patch/main/udpxy.lua > ./feeds/luci/applications/luci-app-udpxy/luasrc/controller/udpxy.lua
# TIME b "系统文件 修改完成"
diff --git a/Makefile b/Makefile
index 24f5955c9066..f4519e00d28d 100644
--- a/Makefile
+++ b/Makefile
@@ -18,7 +18,8 @@  $(if $(findstring $(space),$(TOPDIR)),$(error ERROR: The path to the OpenWrt dir
 
 world:
 
-DISTRO_PKG_CONFIG:=$(shell which -a pkg-config | grep -E '\/usr' | head -n 1)
+WHICH:=command -pv
+DISTRO_PKG_CONFIG:=$(shell $(WHICH) pkg-config | grep -E '\/usr' | head -n 1)
 export PATH:=$(TOPDIR)/staging_dir/host/bin:$(PATH)
 
 ifneq ($(OPENWRT_BUILD),1)
diff --git a/include/cmake.mk b/include/cmake.mk
index 0a20530a16fe..ff00b5e779b5 100644
--- a/include/cmake.mk
+++ b/include/cmake.mk
@@ -15,7 +15,7 @@  MAKE_PATH = $(firstword $(CMAKE_BINARY_SUBDIR) .)
 ifeq ($(CONFIG_EXTERNAL_TOOLCHAIN),)
   cmake_tool=$(TOOLCHAIN_DIR)/bin/$(1)
 else
-  cmake_tool=$(shell which $(1))
+  cmake_tool=$(shell $(WHICH) $(1))
 endif
 
 ifeq ($(CONFIG_CCACHE),)
diff --git a/include/prereq.mk b/include/prereq.mk
index 83ac21242c65..a6ee2bb637f5 100644
--- a/include/prereq.mk
+++ b/include/prereq.mk
@@ -52,7 +52,7 @@  endef
 
 define RequireCommand
   define Require/$(1)
-    which $(1)
+    $(WHICH) $(1)
   endef
 
   $$(eval $$(call Require,$(1),$(2)))
@@ -106,7 +106,7 @@  define SetupHostCommand
 	           $(call QuoteHostCommand,$(11)) $(call QuoteHostCommand,$(12)); do \
 		if [ -n "$$$$$$$$cmd" ]; then \
 			bin="$$$$$$$$(PATH="$(subst $(space),:,$(filter-out $(STAGING_DIR_HOST)/%,$(subst :,$(space),$(PATH))))" \
-				which "$$$$$$$${cmd%% *}")"; \
+				$(WHICH) "$$$$$$$${cmd%% *}")"; \
 			if [ -x "$$$$$$$$bin" ] && eval "$$$$$$$$cmd" >/dev/null 2>/dev/null; then \
 				mkdir -p "$(STAGING_DIR_HOST)/bin"; \
 				ln -sf "$$$$$$$$bin" "$(STAGING_DIR_HOST)/bin/$(strip $(1))"; \
#===========================================================================================================
