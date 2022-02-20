1./script/com_script/Precompile.sh 

1.1 有错误,导致编译在Compilation Information step自动中断,提示是"Process completed with exit code 1",删除该文件后导致Compilation Information显示不全.

只是初步确定是这个文件的问题,具体错误在哪里不清楚.

此文件曾经正常使用过,初步考虑是openwrt源码改动后两者不匹配造成的.

1.2 20220220 根据https://github.com/281677160/common/blob/main/common.sh 对比修改后目前Compilation Information step不再自动中断 ,但是编译信息显示不全{缺固件内核),保持此文件暂时不再考虑改变,除非再导致编译自动中断.

2.luci-app-cpufreq在编译前的位置?
