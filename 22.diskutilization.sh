#!/bin/bash
USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
MESSAGE=""
IP_ADDRESS=$(curl -s http://169.254.169.254/latest/meta-data/local-ipv4)

log(){
  echo -e "$(date "+%Y-%m-%d-%H-%M-%S") | $1" | tee -a $LOGS_FILE
}

Disk_Usage=$(df -hT|grep -v Filesystem)
Usage_Threshold=3

while IFS= read -r line
  do
    usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
    partition=$(echo $line | awk '{print $7}')

    if [ "$usage" -gt "$Usage_Threshold" ]; then
      MESSAGE+="High disk usage on $partition: $usage% <br>"
    fi

  done <<< $Disk_Usage

echo -e "$MESSAGE"

sh mail.sh "ravishankarfrom1998@gmail.com" "High disk usage alert on $IP_ADDRESS" "$MESSAGE" "High disk usage alert" "$IP_ADDRESS" "TO DEVOPS TEAM"


