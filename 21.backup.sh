#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-Scripting"
LOGS_FILE="/var/log/shell-Scripting/backup.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

log(){
  echo -e "$(date "+%Y-%m-%d-%H-%M-%S") | $1" | tee -a $LOGS_FILE
}

if [ $USERID -ne 0 ]; then
  echo -e "$R run the script with root user access $N" | tee -a $LOGS_FILE
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

if [ ! -d "$SOURCE_DIR" ]; then
  log "$R Source directory $SOURCE_DIR $N does not exist"
  exit 1
fi

if [ ! -d "$DEST_DIR" ]; then
  log "$R Destination directory $DEST_DIR $N does not exist"
  exit 1
fi

#find the files
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS")

log "BACKUP started"
log "Source directory: $SOURCE_DIR"
log "Dest dir :$DEST_DIR"
log "Days: $DAYS"

if [ -z "${FILES}" ]; then
  log "no files to archive   skipping"
else
  # app-logs-$timestamp.zip
  log "files found to archie $FILES"
  TIMESTAMP=$(date +%F-%H-%M-%S)
  ZIP_FILE_NAME="$DEST_DIR/app_logs-$TIMESTAMP.tar.gz"
  log "Archive name: $ZIP_FILE_NAME"
  tar -zcvf "$ZIP_FILE_NAME" "$(find "$SOURCE_DIR" -name "*.log" -type f -mtime +"$DAYS")"
  
  
  if [ -f "$ZIP_FILE_NAME" ]; then
        log "Archeival is ... $G SUCCESS $N"

        while IFS= read -r filepath; do
        # Process each line here
        log "Deleting file: $filepath"
        rm -f "$filepath"
        log "Deleted file: $filepath"
        done <<< "$FILES"
    else
        log "Archeival is ... $R FAILURE $N"
        exit 1
    fi
fi