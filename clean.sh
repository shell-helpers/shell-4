#! /bin/bash
#ubuntu to clean the system
# author linbin
echo "Do you want to clean your System now?"
echo "y or n"
read choose
if [ $choose = "y" ]
then
   # clean the useless package
   sudo apt-get autoclean
   sudo apt-get clean
   sudo apt-get autoremove
   
   # clean the firefox cache
   sudo rm -rf ~/.mozilla/firefox/*.default/Cache
   sudo rm -rf ~/.opera/cache
   # 清除已删除软件的配置信息，如果报错，就证明无残余文件
   dpkg -l | grep ^rc | awk '{print $2}' |sudo xargs dpkg -P 2> /dev/null
   # 清除系统的僵尸进程
   ps -eal | awk '{ if ($2 == "Z") {print $4}}' | xargs sudo kill -9
   echo "clean the rubbish successfully!"
else
   echo "the clean bash is stop and not clean at all!"
fi
exit 0
