#!/bin/bash
echo "请输入目录名称："
read path
if cd $path > /dev/null 2>&1
then
   echo "请输入要转换的后缀名："
   read suffix
   echo "请输入转换后的后缀名："
   read after
   rename 's/\.'$suffix'/\.'$after'/' *
   echo "转换成功" 
else
    echo "目录输入错误"
fi
exit 0;
