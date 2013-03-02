#!/bin/bash
# 使用mysqldump对mysql数据库进行备份或者恢复数据库
echo '请输入mysql用户名:'
read user
echo '请输入mysql密码:'
read password
echo '请选择数据库:'
read database
echo '请选择数据库操作类型，备份(B) 或者 恢复(R):'
read operate
echo '请输入文件目录:'
read dir
while [ ! -d "$dir" ]
do
	echo '输入目录有误,请重新输入:'
	read dir
done

#file = $dir/$database.sql

if [ $operate = "B" -o $operate = 'b' ]
then
	if [ ! -w "$dir" ]
	then
		echo '目录不可写。。。。'
		exit 0
	fi
       mysqldump -u$user -p$password $database --add-drop-database > $dir/$database.sql
fi

# recover
if [ $operate = "R" -o $operate = "r" ]
then
	if [ ! -e "$dir/$database.sql" -o ! -f "$dir/$database.sql" ]
	then
		echo "备份文件不存在或者不是文件!!"
	fi

	mysql -u$user -p$password $database < $dir/$database.sql
fi
exit 0
