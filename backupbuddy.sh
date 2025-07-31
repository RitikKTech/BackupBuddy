#!/bin/bash


#load configration
CONFIG_FILE="$HOME/backupbuddy/config.ini"
source <(grep = "$CONFIG_FILE")

#timestamp
DATE=$(date +%Y-%m-%d_%H-%M)
BACKUP_DIR="$HOME/backupbuddy/backups"
LOG_DIR="$HOME/backupbuddy/logs"
LOG_FILE="$LOG_DIR/backup-$DATE.log"

#create directories
mkdir -p "$BACKUP_DIR" "$LOG_DIR"

#backup file path
BACKUP_FILE="$BACKUP_DIR/backup-$DATE.tar.gz"

#what to backup
SOURCE_DIR="$HOME/Documents"

#start logging
echo "=== Backup Started at $DATE ===" > "$LOG_FILE"

#backup command 
if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"; then
   echo "Backup Successful: $BACKUP_FILE" >> "$LOG_FILE"


#if tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"; then
#    echo "Backup Successful: $BACKUP_FILE" >> "$LOG_FILE"

#EMAIL ALERT
echo "Backup Successful at $DATE. File: $BACKUP_FILE" \
  |  mail -s "BackupBuddy Success" "$EMAIL"

#telegram alert

curl -s -X POST https://api.telegram.org/bot"$TELEGRAM_BOT_TOKEN"/sendMessage \
     -d chat_id=$TELEGRAM_CHAT_ID \
     -d text="Backup Success on $(hostname) at $DATE"
else
      echo "Backup failed at $DATE" >> "$LOG_FILE"

#EMAIL ALERT
echo "Backup Failed at $DATE." \
  | mail -s "BackupBuddy Failed" "$EMAIL"

#TELEGRAM ALERT 
curl -s -X POST https://api.telegram.org/bot"$TELEGRAM_BOT_TOKEN"/sendMessage \
     -d chat_id="$TELEGRAM_CHAT_ID" \
     -d text="Backup Failed on $(hostname) at $DATE"
fi

echo "=== Backup Finished === " >> "$LOG_FILE"
