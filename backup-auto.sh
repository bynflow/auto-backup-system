#!/bin/bash

# Local folders to synchronize
SRC_[USER-DIR]="$HOME/[user-dir]"

# Remote folder for backup with versioning (unencrypted)
REMOTE="[PROVIDER]:[REMOTE BACKUP DIR]"

# Log file
LOG_DIR="$HOME/.local/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

# Timestamp
NOW=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$NOW] Start backup..." >> "$LOG_FILE"

# Synchronize data remotely with timestamps
rclone copy "$SRC_[USER-DIR]" "$REMOTE/[user-dir]-$(date +%F)" >> "$LOG_FILE" 2>&1

echo "[$NOW] Backup completed." >> "$LOG_FILE"


