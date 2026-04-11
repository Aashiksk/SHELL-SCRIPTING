# find the user is root or not and install the requirements if he is root user

#!/bin/bash

MYID=$(id -u)
if [ "$MYID" -ne 0 ]
then
  echo "You are not root user"  
else
  sudo yum install python3 -y
  if [ $? -eq 0 ]
  then 
      echo "python3 is installed successfully"
    else
      echo "python3 installation failed"
    fi

fi