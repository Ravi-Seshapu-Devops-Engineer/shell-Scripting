#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/home/ec2-user/app-logs
LOGS_FILE=$LOGS_FOLDER/$0.log

if [ ! -d $LOGS_FOLDER ]; then
  echo "$LOGS_FOLDER does not exist"
  exit 1
fi

find $LOGS_FOLDER -name "*.log" -type f -mtime +14
