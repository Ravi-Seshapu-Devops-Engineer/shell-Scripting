#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Run the script withsudo access"
    exit 1
fi

echo "installing nginx"
dnf install nginx -y

if [ $? -ne 0 ]; then
  echo "installation failed"
  exit 1
else
  echo "installation is success"
fi