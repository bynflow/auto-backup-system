#!/bin/bash

# Cartelle locali da sincronizzare
SRC_PROGETTI="$HOME/agenda_quotidiana/flow-devops"
SRC_KEEPASS="$HOME/.keepassxc_syncthing"
SRC_JOPLIN="$HOME/.config/joplin-desktop"

# Cartella remota per backup con versioning (non criptata)
REMOTE="hetzner-nc:backup"

# Log file
LOG_DIR="$HOME/.local/logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/backup.log"

# Timestamp
NOW=$(date +"%Y-%m-%d %H:%M:%S")
echo "[$NOW] Avvio backup..." >> "$LOG_FILE"

# Sincronizza dati in remoto con timestamp
rclone copy "$SRC_PROGETTI" "$REMOTE/flow-devops-$(date +%F)" >> "$LOG_FILE" 2>&1
rclone copy "$SRC_KEEPASS" "$REMOTE/keepassxc_syncthing-$(date +%F).kdbx" >> "$LOG_FILE" 2>&1
rclone copy "$SRC_JOPLIN" "$REMOTE/joplin-$(date +%F)" >> "$LOG_FILE" 2>&1

echo "[$NOW] Backup completato." >> "$LOG_FILE"


