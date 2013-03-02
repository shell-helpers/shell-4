#!/bin/bash
# To update firefox
echo 'Input the location of the firefox(like /home/linbin/下载/firefox):'
read location

# remove the origin firefox
sudo rm -rf /usr/lib/firefox

#cp the firefox
sudo cp -r $location /usr/lib

#remove all file
rm -rf $location
echo 'Update firefox is successfully!!'
