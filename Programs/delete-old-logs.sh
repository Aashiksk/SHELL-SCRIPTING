#!/bin/bash

UserId=$(id -u)

SOURCE_DIR="/home/ec2-user/app-logs"


check_root(){
  if [ "$UserId" -ne 0 ]
  then 
      echo "you should need root access"
      exit 1
  fi    
}
check_root

FILE_TO_DELETE=$(find "$SOURCE_DIR" -name "*.log" -mtime +14)
echo "files to be deleted = $FILE_TO_DELETE"

while read -r file
do
  rm -rf $file
done <<<"$FILE_TO_DELETE"  

