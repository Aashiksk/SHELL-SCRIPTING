#!/bin/bash

MYID=$(id -u)
G="\e[32m"
Y="\e[33m"
R="\e[31m"
N="\e[0m"


FOLDER_NAME="/var/log/SHELL_SCRIPT_LOGS"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +"%Y-%m-%d-%H-%M-%S")
LOG_FILE_NAME="$FOLDER_NAME/$LOG_FILE-$TIMESTAMP.log"

Check_root(){
    if [ "$MYID" -ne 0 ]
    then
        echo -e "$R You are not root user $N"  
        exit 1
    fi
}
echo "Script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME
Check_root



VALIDATE(){
    if [ $1 -ne 0 ]
    then  
        echo -e " $2  ... $R failed $N"
        exit 1
    else
        echo -e " $2  ... $G success $N"
    fi
}


for package in $@
do
    dnf list installed $package &>>$LOG_FILE_NAME 
    if [ $? -ne 0 ]
    then
        dnf install $package -y &>>$LOG_FILE_NAME
        VALIDATE $? "$package installation"
else
    echo -e "$package is already ... $Y installed  $N"
fi  


