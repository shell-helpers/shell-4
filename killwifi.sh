#!/bin/bash
a=`ps -ef | grep hostapd | grep -v 'killwifi' | grep -v 'grep' | awk {'print $2'}`
echo $a
for i in $a
do
    `kill -9 $i`
    echo '删除pid号为'$i'的hostapd进程！'
done
#关闭dnsmasq进程
echo 'closing the dnsmasq progress!!'
b=`sudo /etc/init.d/dnsmasq stop`
echo 'close the dnsmasq process successfully!!'
exit 0
