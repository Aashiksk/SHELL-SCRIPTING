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
        echo " nginx installation ...failed"
        exit 1
    else
        echo " nginx installation ...success"
    fi
else
    echo " nginx is already ...installed"
fi        

dnf list installed httpd
if [ $? -ne 0 ]
then
    dnf install httpd -y
    if [ $? -ne 0 ]
    then  
        echo " httpd installation ...failed"
        exit 1
    else
        echo " httpd installation ...success"
    fi
else
    echo " httpd is already ...installed"
fi   