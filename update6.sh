#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8

if [ ! -d /www/server/panel/BTPanel ];then
	echo "============================================="
	echo "错误, 5.x不可以使用此命令升级!"
	echo "5.9平滑升级到6.0的命令：curl http://download.bt.cn/install/update_to_6.sh|bash"
	exit 0;
fi

chmod +x /www/server/panel/install/public.sh
chattr -i /www/server/panel/install/public.sh
chattr -i /www/server/panel/class/panelAuth.py
chattr -i /www/server/panel/class/panelPlugin.py

public_file=/www/server/panel/install/public.sh
if [ ! -f $public_file ];then
	wget -O $public_file https://download.btpanel.net/install/public.sh -T 5;
fi

publicFileMd5=$(md5sum ${public_file}|awk '{print $1}')
md5check="db0bc4ee0d73c3772aa403338553ff77"
if [ "${publicFileMd5}" != "${md5check}"  ]; then
	wget -O $public_file https://download.btpanel.net/install/public.sh -T 5;
fi

chattr +i /www/server/panel/install/public.sh

. $public_file

download_Url=$NODE_URL
btpanel_Url=https://download.btpanel.net
setup_path=/www
version=$(curl -Ss --connect-timeout 5 -m 2 http://www.bt.cn/api/panel/get_version)
if [ "$version" = '' ];then
	version='6.9.8'
fi

wget -T 5 -O /tmp/panel.zip $btpanel_Url/install/update/LinuxPanel-6.9.9.zip
dsize=$(du -b /tmp/panel.zip|awk '{print $1}')
if [ $dsize -lt 10240 ];then
	echo "获取更新包失败，请稍后更新或联系宝塔运维"
	exit;
fi
chmod +x /www/server/panel/install/public.sh
chattr -i /www/server/panel/install/public.sh
chattr -i /www/server/panel/class/panelAuth.py
chattr -i /www/server/panel/class/panelPlugin.py
unzip -o /tmp/panel.zip -d $setup_path/server/ > /dev/null
rm -f /tmp/panel.zip
chmod +x /www/server/panel/install/public.sh
chattr +i /www/server/panel/install/public.sh
chattr +i /www/server/panel/class/panelAuth.py
chattr +i /www/server/panel/class/panelPlugin.py
cd $setup_path/server/panel/
check_bt=`cat /etc/init.d/bt`
if [ "${check_bt}" = "" ];then
	rm -f /etc/init.d/bt
	wget -O /etc/init.d/bt $download_Url/install/src/bt6.init -T 10
	chmod +x /etc/init.d/bt
fi
rm -f /www/server/panel/*.pyc
rm -f /www/server/panel/class/*.pyc
#pip install flask_sqlalchemy
#pip install itsdangerous==0.24
request_v=$(pip list|grep requests|grep -E "(2.20|2.21|2.22|2.23|2.24)")
if [ "$request_v" = "" ];then
	pip install requests==2.20 -I
fi
pip uninstall pyOpenssl -y
pip install pyOpenssl
openssl_v=$(pip list|grep pyOpenSSL)
if [ "$openssl_v" = "" ];then
	pip install pyOpenSSL -I
fi

cffi_v=$(pip list|grep cffi|grep 1.12.)
if [ "$cffi_v" = "" ];then
	pip install cffi==1.12.3 -I
fi

pip install -U psutil
chattr -i /etc/init.d/bt
chmod +x /etc/init.d/bt
echo "====================================="

firewall-cmd --permanent --zone=public --add-port=8899/tcp > /dev/null 2>&1
firewall-cmd --reload
/etc/init.d/bt restart
echo "已成功升级到[6.9.9]${Ver}";
echo "为了保障本机安全性，从现在起开心版面板端口为:8899";
echo "若面板无法访问，请放行安全组，以及关闭机器的防火墙！";


