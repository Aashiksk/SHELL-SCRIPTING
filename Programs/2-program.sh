# find the user is root or not and install the requirements if he is root user

#!/bin/bash

mID=$(id -u)
if [ "$mID" -ne 0 ]
then
  echo "You are root user"  

yum install httpd -y
fi