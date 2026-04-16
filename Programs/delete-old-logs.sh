#!/bin/bash

UserId=$(id -u)

check_root(){
  if [ "$UserId" -ne 0 ]
  then 
      echo "you should need root access"
  fi    
}
check_root
