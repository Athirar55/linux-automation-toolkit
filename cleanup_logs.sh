#!/bin/bash

LOG_DIR="/var/log"
DAYS=7
CLEANUP_LOG="/var/log/log_cleanup.log"

echo "Log cleanup started at $(date)" >> "$CLEANUP_LOG"

find "$LOG_DIR" -type f -name "*.log" -mtime +$DAYS -exec rm -f {} \;

echo "Logs older than $DAYS days deleted" >> "$CLEANUP_LOG"
echo "Cleanup completed at $(date)" >> "$CLEANUP_LOG"
echo "-------------------------------------" >> "$CLEANUP_LOG"

