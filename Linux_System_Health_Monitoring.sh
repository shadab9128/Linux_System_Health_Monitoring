#!/bin/bash

# -----------------------------
# Linux System Health Monitoring Script
# -----------------------------

# Thresholds (adjust as needed)
CPU_THRESHOLD=60
MEM_THRESHOLD=60
DISK_THRESHOLD=60

# Log file (user-writable by default)
LOG_FILE="$HOME/system_health.log"

# Function to log messages
log_message() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') : $1" | tee -a "$LOG_FILE"
}

# Function to check CPU utilization
check_cpu() {
    cpu_util=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    log_message "CPU Utilization: $cpu_util%"
    if (( $(echo "$cpu_util < $CPU_THRESHOLD" | bc -l) )); then
        return 0
    else
        return 1
    fi
}

# Function to check memory utilization
check_memory() {
    memory_util=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
    log_message "Memory Utilization: $memory_util%"
    if (( $(echo "$memory_util < $MEM_THRESHOLD" | bc -l) )); then
        return 0
    else
        return 1
    fi
}

# Function to check disk space utilization
check_disk() {
    disk_util=$(df -h / | awk 'NR==2 {print $5}' | sed 's/%//')
    log_message "Disk Utilization: $disk_util%"
    if (( $(echo "$disk_util < $DISK_THRESHOLD" | bc -l) )); then
        return 0
    else
        return 1
    fi
}

# -----------------------------
# Main script logic
# -----------------------------
log_message "Analyzing VM health..."

check_cpu
cpu_healthy=$?

check_memory
memory_healthy=$?

check_disk
disk_healthy=$?

# Overall VM health
if [ $cpu_healthy -eq 0 ] && [ $memory_healthy -eq 0 ] && [ $disk_healthy -eq 0 ]; then
    log_message "VM State: Healthy ✅"
else
    log_message "VM State: Not Healthy ⚠️"
fi

