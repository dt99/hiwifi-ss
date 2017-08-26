#!/bin/sh
#
echo 'Go!'
echo '==> 删除旧版本'
opkg remove geewan-ss
rm -rf /tmp/geewan
echo ''

echo '==> 创建临时目录 /tmp/geewan'
mkdir -p /tmp/geewan
cd /tmp/geewan
echo 'Done! 成功创建临时目录!'
echo ''

echo '==> 下载插件...'
curl -k -L -o hiwifi-ss.tar.gz https://github.com/dt99/hiwifi-ss/tarball/master
echo 'Done! 下载完成'
echo ''
sleep 2

echo -n "==> 备份系统文件...."
if [ -f /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm.ssbak ]; then
    echo -e "...[\e[31m备份已存在\e[0m]"
else
    cp -a /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm /usr/lib/lua/luci/view/admin_web/menu/menu_left.htm.ssbak
    echo -e "....[\e[32m备份完成\e[0m]"
fi
echo ''

echo -n '==> 安装插件...'
tar xzvf hiwifi-ss.tar.gz
cd /tmp/geewan/*hiwifi-ss*
rm README.md shadow.sh ss-settings.png
cp -arf * /
echo -e '...[\e[32m安装成功\e[0m]'

echo ''
sleep 2
echo '==> 添加卸载信息...'
echo '' >>/usr/lib/opkg/status
echo 'Package: geewan-ss' >>/usr/lib/opkg/status
version=${PWD##*/}
timestr=$(date +"%Y%m%d-%H%M")
echo "Version: $version-$timestr" >>/usr/lib/opkg/status
echo 'Provides:' >>/usr/lib/opkg/status
echo 'Status: install hold installed' >>/usr/lib/opkg/status
echo 'Architecture: mtmips_1004kc' >>/usr/lib/opkg/status
now=$(date +"%s")
echo "Installed-Time: $now" >>/usr/lib/opkg/status
echo 'Auto-Installed: yes' >>/usr/lib/opkg/status
echo '' >>/usr/lib/opkg/status
echo ''
echo '==> 清理临时文件...'
if test -e /var/run/luci-indexcache; then
    rm /var/run/luci-indexcache && echo 'Done! 清理完成 ' && echo '';
else
    echo 'luci-cache does not exist! 无法找到luci-cache,请确定是否是极路由环境' && echo ''
fi
rm -rf /tmp/geewan
sleep 2
echo ''
echo '插件成功安装!'
echo '1987年9月14日21时07分'
echo '中国第一封电子邮件'
echo '从北京发往德国'
echo '越过长城，走向世界'
echo 'Done! Hello World! 一切就绪,你好世界!'
