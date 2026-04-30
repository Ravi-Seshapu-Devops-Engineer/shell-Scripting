#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "Run the script withsudo access"
    exit 1
fi

echo "installing nginx"
dnf remove nginx -y

if [ $? -ne 0 ]; then
  echo "installation failed"
  exit 1
else
  echo "deletion is success"
fi