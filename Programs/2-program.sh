# find the user is root or not and install the requirements if he is root user

#!/bin/bash

mID=$(id -u)
if [ "$mID" -eq 0 ]
then
  echo "You are root user"
fi