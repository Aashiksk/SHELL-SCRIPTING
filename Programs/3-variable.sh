#!/bin/bash

MYID=$(id -u)
G="\e[32m"
Y="\e[33m"
R="\e[31m"
N="\e[0m"



FOLDER_NAME="/var/log/SHELL_SCRIPTS_LOGS"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +"%Y-%m-%d%H-%M-%S")
LOG_FILE_NAME=$FOLDER_NAME/$LOG_FILE-$TIMESTAMP.log

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
        echo -e " $2 installation ... $G success $N"
    fi
}


dnf list installed nginx &>>$LOG_FILE_NAME 
if [ $? -ne 0 ]
then
    dnf install nginx -y &>>$LOG_FILE_NAME
    Validate $? " nginx installation"
else
    echo -e " nginx is already ... $Y installed  $N"
fi        

dnf list installed httpd &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install httpd -y &>>$LOG_FILE_NAME
    Validate $? "httpd installation"
else
    echo -e " httpd is already ... $Y installed $N"
fi   