#!/bin bash

set -e # this will check for errors and if there are error it will exit the code

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
  echo -e "$R run the script with root user access $N" | tee -a $LOGS_FILE
  exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
  if [ $1 -ne 0 ]; then
    echo -e "$R $2 is failed $N" | tee -a $LOGS_FILE
    exit 1
  else
    echo e "$G $2 is Success $N" | tee -a $LOGS_FILE
  fi
}


# dnf install nginx -y &>> $LOGS_FILE
# validate $? "installing nginx"

# dnf install mysql -y &>> $LOGS_FILE
# validate $? "installing mysql"

# dnf install nodejs -y &>> $LOGS_FILE
# validate $? "installing nodejs"

for package in $@  # sudo sh 13.loops.sh nginx nodejshtml( passing the aruments wile running the script)
do
  dnf list installed $package &>> LOGS_FILE
  if [ $? -ne 0 ]; then
    echo "$package is not installed, installing now"
    dnf install $package -y &>> $LOGS_FILE
    #validate $? "installing $package"
  else
    echo -e "$package is already installed, $Y skipping $N"
  fi

done
