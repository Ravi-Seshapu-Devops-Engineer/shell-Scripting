#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/lo/shell-Scripting/"
LOGS_FILE="/var/log/shell-Scripting/backup.log"


if [ ! -d $LOGS_FOLDER ]; then
  echo "$LOGS_FOLDER does not exist"
  exit 1
fi

mkdir -p $LOGS_FOLDER

usage(){
  echo -e "$R Usage backup from to <SOURCE_DIR> <DEST_DIR> <DAYS> [default 14 days] $N "
  exit 1
}

if [ $# -lt 2 ]; then
  usage
fi