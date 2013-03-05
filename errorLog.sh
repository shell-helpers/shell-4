#The program that open the apache log file and php log file
#!/bin/bash
#The apache error log(In httpd.conf)
sudo gedit /var/log/apache2/error.log&
#The php error log(In php.ini)
sudo gedit /home/linbin/Zend/phperr.log&
#The project error log(In the virtualhost config)
sudo gedit /home/linbin/Zend/teacherLog.log&
#The rewrite log(In httpd.conf)
#RewriteLogLevel 9
#RewriteLog ...
sudo gedit /home/linbin/Zend/Rewrite.log&
