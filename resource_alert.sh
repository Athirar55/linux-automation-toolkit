#!/bin/bash

CPU_THRESHOLD=80
MEM_THRESHOLD=80
DISK_THRESHOLD=90
ALERT_LOG="/var/log/resource_alert.log"

CPU=$(top -bn1 | grep "Cpu(s)" | awk '{print int($2 + $4)}')
MEM=$(free | awk '/Mem/ {print int($3/$2 * 100)}')
DISK=$(df / | awk 'NR==2 {print int($5)}')

if [ "$CPU" -gt "$CPU_THRESHOLD" ]; then
    echo "$(date) ALERT: CPU usage high - ${CPU}%" >> "$ALERT_LOG"
fi

if [ "$MEM" -gt "$MEM_THRESHOLD" ]; then
    echo "$(date) ALERT: Memory usage high - ${MEM}%" >> "$ALERT_LOG"
fi

if [ "$DISK" -gt "$DISK_THRESHOLD" ]; then
    echo "$(date) ALERT: Disk usage high - ${DISK}%" >> "$ALERT_LOG"
fi

