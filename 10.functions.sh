#!/bin bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
  echo "run the script with root user access"
  exit 1
fi

validate(){
  if [ $1 -ne 0 ]; then
    echo "$2 is failed"
    exit 1
  else
    echo "$2 is Success"
  fi
}


dnf install nginx -y
validate $? "installing nginx"

dnf install mysql -y
validate $? "installing mysql"

dnf install nodejs -y
validate $? "installing nodejs"