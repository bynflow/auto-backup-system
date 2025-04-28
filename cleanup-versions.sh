#!/bin/bash

# Number of days of retention
RETENTION_DAYS=[YOUR INTEGER VALUE] # For example 365
REMOTE="[PROVIDER]:[REMOTE BACKUP DIR]"

# Log file
LOG_DIR="$HOME/.local/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/cleanup.log"

NOW=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$NOW] Start cleanup..." >> "$LOG_FILE"

# Delete folders with too old timestamp
rclone delete --min-age ${RETENTION_DAYS}d "$REMOTE" >> "$LOG_FILE" 2>&1

echo "[$NOW] Cleanup completed." >> "$LOG_FILE"


