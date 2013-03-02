#!/bin/bash
#ubuntu控制触摸屏的开启和关闭
echo "请选择是否关闭触摸屏，y：关闭 n：不关闭"
read choose
if [ $choose = "y" ]
then
    sudo modprobe -r psmouse
else
    sudo modprobe psmouse
fi
echo "修改成功！"
exit 0; 
