#!/bin bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
  echo "run the script with root user access" | tee -a $LOGS_FILE
  exit 1
fi

mkdir -p $LOGS_FOLDER

validate(){
  if [ $1 -ne 0 ]; then
    echo "$2 is failed" | tee -a $LOGS_FILE
    exit 1
  else
    echo "$2 is Success" | tee -a $LOGS_FILE
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
  dnf install $package -y 
  validate $? "installing $package"
done
