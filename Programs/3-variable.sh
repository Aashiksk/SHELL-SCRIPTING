#!/bin/bash

MYID=$(id -u)
G="\e[32m"
Y="\e[33m"
R="\e[31m"
N="\e[0m"
if [ "$MYID" -ne 0 ]
then
  echo -e "$R You are not root user $N"  
  exit 1
fi

Validate(){
    if [ $1 -ne 0 ]
    then  
        echo -e " $2 installation ... $R failed $N"
        exit 1
    else
        echo " $2 installation ... $G success $N"
    fi
}


dnf list installed nginx
if [ $? -ne 0 ]
then
    dnf install nginx -y
    Validate $? " nginx installation"
else
    echo -e " nginx is already ... $Y installed  $N"
fi        

dnf list installed httpd
if [ $? -ne 0 ]
then
    dnf install httpd -y
    Validate $? "httpd installation"
else
    echo -e " httpd is already ... $Y installed $N"
fi   