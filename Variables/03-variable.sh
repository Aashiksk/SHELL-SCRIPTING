#!/bin/bash

echo " Enter the Name:"

# "read" will take input at runtime and show the input in the terminal
read NAME
echo " Enter the Age:"

# "read" -s will not show the input in the terminal
read -s AGE 
echo " My name is $NAME and my age is $AGE"
