#!/bin/bash

# Numero di giorni di retention
RETENTION_DAYS=630  # circa 21 mesi
REMOTE="hetzner-nc:backup"

# Log file
LOG_DIR="$HOME/.local/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/cleanup.log"

NOW=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$NOW] Avvio cleanup..." >> "$LOG_FILE"

# Elimina cartelle con timestamp troppo vecchio
rclone delete --min-age ${RETENTION_DAYS}d "$REMOTE" >> "$LOG_FILE" 2>&1

echo "[$NOW] Cleanup completato." >> "$LOG_FILE"


