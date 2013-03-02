#!/bin/bash
# author linbin
# the bash is to check the program use the port and ask to delete it
echo "which port do you want to get its listener?"
read port
sudo lsof -i :$port
echo "Do you want to kill the program? y or n"
read choose
if [ $choose = "y" ]
then
   echo "Please input the PID in front"
   read PID
   sudo kill -9 $PID
   echo "the program had been killed!"
else
   echo "the program has not been killed!"
fi
exit 0
