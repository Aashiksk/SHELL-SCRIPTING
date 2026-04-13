#!/bin/bash

MYID=$(id -u)
G="\e[32m"
Y="\e[33m"
R="\e[31m"
N="\e[0m"
if [ "$MYID" -ne 0 ]
then
  echo -e "{$R} You are not root user"  
  exit 1
fi

Validate(){
    if [ $1 -ne 0 ]
    then  
        echo " $2 installation ...failed"
        exit 1
    else
        echo " $2 installation ...success"
    fi
}


dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    Validate $? " nginx installation"
else
    echo " nginx is already ...installed"
fi        

dnf list installed httpd
if [ $? -ne 0 ]
then
    dnf install httpd -y
    Validate $? "httpd installation"
else
    echo " httpd is already ...installed"
fi   