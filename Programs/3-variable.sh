#!/bin/bash

MYID=$(id -u)
if [ "$MYID" -ne 0 ]
then 
    echo "you are not a root user"
    exit 1
fi

dnf list installed nginix
if [ $? -ne 0]
then
    dnf install ngnix -y
    if [ $? -ne 0]
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
if [ $? -ne 0]
then
    dnf install httpd -y
    if [ $? -ne 0]
    then  
        echo " httpd installation ...failed"
        exit 1
    else
        echo " httpd installation ...success"
    fi
else
    echo " httpd is already ...installed"
fi   