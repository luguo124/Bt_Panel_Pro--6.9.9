# Bt_Panel_Pro--6.9.9



更新技巧
1.大家之前安装了 6X 开心版宝塔的 直接 输入 bt命令 选择 0 升到最新 6.9.9 开心版（或者输入：curl https://raw.githubusercontent.com/luguo124/Bt_Panel_Pro--6.9.9/master/update6.sh|bash）！

2.如果 你是免费的 6.x 宝塔面板 可以使用脚本 升到最新的开心版 6.9.9 面板（或者输入：curl https://raw.githubusercontent.com/luguo124/Bt_Panel_Pro--6.9.9/master/update6.sh|bash）！

结束：该版本 防火墙7.2 更新较慢 停留当前版本！无需面板安装 防火墙 直接使用脚本安装防火墙（实际降级处理！）
安装 6.9.9 面板
Bt_Panel_Pro 腳本（Centos）：极速安装方式 (安装时间1至10分钟)
yum -y install wget;wget https://raw.githubusercontent.com/luguo124/Bt_Panel_Pro--6.9.9/master/install_6.0.sh && bash install_6.0.sh
Bt_Panel_Pro 腳本（Ubuntu）：极速安装方式 (安装时间1至10分钟)
待更新～！
Bt_Panel_Pro 腳本（Debian）：极速安装方式 (安装时间1至10分钟)
待更新～！
已经安装面板
Bt_Panel 脚本（升级开心版）：极速安装方式 (安装时间1至10秒)
curl https://raw.githubusercontent.com/luguo124/Bt_Panel_Pro--6.9.9/master/update6.sh|bash
Nginx防火墙脚本
Bt_Panel 防火墙脚本5.1（一定要安装好Nginx环境）：
防火墙需要面板先安装，然后在使用脚本安装防火墙，请勿在面板升级防火墙！（请勿面板私自升级防火墙，否则无法使用！）
wget https://raw.githubusercontent.com/luguo124/Bt_Panel_Pro--6.9.9/master/fhq.sh && bash fhq.sh
Apache防火墙脚本
emmm 不知道把文件丢哪儿了，暂时不出！
宝塔同步工具
安装此插件打开可能会报错，需要重启面板就可以正常使用！
不想使用開心版的，直接使用官方腳本轉成免費
wget -O update.sh http://download.bt.cn/install/update.sh && bash update.sh free
