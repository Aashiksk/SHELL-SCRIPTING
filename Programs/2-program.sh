# find the user is root or not and install the requirements if he is root user

#!/bin/bash

MYID=$(id -u)
if [ "$MYID" -ne 0 ]
then
  echo "You are not root user"  
  exit 1
fi

dnf list installed nginx
if [ $? -ne 0 ]
then 
    dnf install nginx -y
    if [ $? -ne 0 ]
    then
        echo "Failed to install nginx"
        exit 1
    else 
        echo "nginx is installed successfully"
    fi
else
    echo "nginx is already installed"
fi

dnf list installed httpd
if [ $? -ne 0 ]
then 
    dnf install httpd -y
    if [ $? -ne 0 ]
    then
        echo "Failed to install httpd"
        exit 1
    else 
        echo "httpd is installed successfully"
    fi
else
    echo "httpd is already installed"
fi

