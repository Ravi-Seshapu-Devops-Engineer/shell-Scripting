#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER=/home/ec2-user/app_logs
LOGS_FILE=$LOGS_FOLDER/$0.log

if [ ! -d $LOGS_FOLDER ]; then
  echo "$LOGS_FOLDER does not exist"
  exit 1
fi

files_to_delete=$(find $LOGS_FOLDER -name "*.log" -type f -mtime +14)
echo "$files_to_delete"

while IFS= read -r filepath; do
  echo "deleting the $filepath"
  rm -f $filepath
  echo "deleting the file $filepath"
done <<< $files_to_delete

