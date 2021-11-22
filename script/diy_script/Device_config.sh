#!/bin/bash
# https://github.com/Hyy2001X/AutoBuild-Actions
# AutoBuild Module by Hyy2001
# AutoBuild Functions
# 在 cat >> .config <<EOF 到 EOF 之间粘贴配置

cat >> .config <<EOF
#MODULES:
CONFIG_TARGET_ipq40xx=y
CONFIG_TARGET_ipq40xx_DEVICE_asus_rt-acrh17=y
EOF
