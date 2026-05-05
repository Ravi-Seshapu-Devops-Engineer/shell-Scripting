#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
MESSAGE=""

log(){
  echo -e "$(date "+%Y-%m-%d-%H-%M-%S") | $1" | tee -a $LOGS_FILE
}

Disk_Usage=$(df -hT|grep -v Filesystem)
Usage_Threshold=3

while IFS= read -r line
  do
    usage=$($line | awk '{print $6}' | cut -d % -f1)
    partition=$($line | awk '{print $7}')

    if [ "$usage" -gt "$Usage_Threshold" ]; then
      MESSAGE+="High disk usage on $partition:$usage"
    fi

  done <<< "$Disk_Usage"

echo "$MESSAGE"

