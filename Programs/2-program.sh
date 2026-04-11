# find the user is root or not and install the requirements if he is root user

#!/bin/bash

mID=$(id -u)
if [ "$mID" -ne 0 ]
then
  echo "You are not root user"  
else
  yum install mariadb-server -y
  if [ $? -eq 0 ]
  then 
      echo "mariadb-server is installed successfully"
    else
      echo "mariadb-server installation failed"
    fi

fi