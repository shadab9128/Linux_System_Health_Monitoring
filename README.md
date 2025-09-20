# Linux System Health Monitoring Script

A simple Bash script to monitor the health of a Linux system by checking **CPU usage**, **memory usage**, **disk space**, and overall VM health. The script logs results to a file and prints them to the console with timestamps.

---

## Features

- Monitors **CPU utilization**
- Monitors **Memory utilization**
- Monitors **Disk space usage**
- Provides overall **VM health status**
- Logs all results to a file in the user's home directory
- Works on **Linux** systems
- Easy to customize thresholds for CPU, memory, and disk usage

---

## Prerequisites

- Linux system
- Bash shell (`#!/bin/bash`)
- `top`, `free`, `df`, `awk`, `sed`, and `bc` installed (standard Linux utilities)

---

## Usage

1. Clone or download the script:

```bash
git clone <your-repo-url>
cd <repo-directory>
```
2. Make the script executable:
```bash
chmod +x Linux_System_Health_Monitoring.sh
```
3. Run the script:
```bash
./Linux_System_Health_Monitoring.sh
```
4. View the log file
```bash
cat ~/system_health.log
```
