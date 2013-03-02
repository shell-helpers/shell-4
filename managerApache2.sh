# @author linbin
# The shell that manager the apache2 server(include start,stop and restart)
# The apache2 server default document root is in /var/www/
#! /bin/bash
case $1 in
	start|START) sudo /etc/init.d/apache2 start
		     echo 'apache2 start success,the default documenation root is /var/www'
		;;
	stop|STOP) sudo /etc/init.d/apache2 stop
                   echo 'apache2 stop success'		   
		;;
	restart|RESTART) sudo /etc/init.d/apache2 restart
		         echo 'apache2 restart success,the default documenation root is /var/www'
		;;
	*) echo 'please input one param in(start,stop or restart)'
		;;
esac
exit 0
