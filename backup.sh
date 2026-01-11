#!/bin/bash

SOURCE_DIR="/home"
BACKUP_DIR="/backup/home_backup"
LOG_FILE="/var/log/backup.log"

mkdir -p "$BACKUP_DIR"

echo "Backup started at $(date)" >> "$LOG_FILE"

rsync -av --delete "$SOURCE_DIR" "$BACKUP_DIR" >> "$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "Backup completed successfully at $(date)" >> "$LOG_FILE"
else
    echo "Backup failed at $(date)" >> "$LOG_FILE"
fi

echo "----------------------------------------" >> "$LOG_FILE"

