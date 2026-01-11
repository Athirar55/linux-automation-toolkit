#!/bin/bash

LOG_FILE="/var/log/system_monitor.log"

CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

echo "$(date) | CPU: ${CPU_USAGE}% | Memory: ${MEM_USAGE}% | Disk: ${DISK_USAGE}%" >> "$LOG_FILE"

