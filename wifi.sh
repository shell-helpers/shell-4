#! /bin/sh
# 为无线添加路由规则
iptables -F
iptables -X
iptables -t nat -F
iptables -t nat -X
iptables -t nat -A POSTROUTING -s 10.0.0.0/8 -o eth0 -j MASQUERADE
iptables -A FORWARD -s 10.0.0.0/8 -o eth0 -j ACCEPT
iptables -A FORWARD -d 10.0.0.0/8 -m conntrack --ctstate ESTABLISHED,RELATED -i eth0 -j ACCEPT
#dnsmasq与named一般情况下bind的named会占了53端口，
#  然后dnsmasq会启动不了，所以我用killall named来杀了named再启动dnsmasq。
killall named
killall hostapd
ifconfig wlan0 10.0.0.1
#“-B”后台运行,之后的hostapd.conf需要指名路径.
hostapd -B /etc/hostapd.conf
/etc/init.d/dnsmasq restart
# dnsmasq启动后会出现电脑突然上不了网，
# 因为dnsmasq更改了/etc/resolv.conf的原因。可以在/etc/resolv.conf加一行
# nameserver x.x.x.x
#填入DNS服务器地址，根据自己的情况修改。
echo "nameserver 202.116.160.32" >> /etc/resolv.conf
