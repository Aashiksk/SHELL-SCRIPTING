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
    echo "nginx is not installed, installing nginx"
else
    echo "nginx is already installed"
fi

