# Auto-Backup and Version Cleanup System

This project provides an **automatic backup script** and a **version cleanup script** using `rclone` to synchronize data to a remote storage (e.g., Hetzner Nextcloud).

## Contents

- `backup-auto.sh` ➔ Backup synchronization script.
- `cleanup-versions.sh` ➔ Old backups cleanup script.
- `backup-auto.service` ➔ systemd service to perform backups.
- `backup-auto.timer` ➔ systemd timer to run the backup every 3 hours.
- `cleanup-versions.service` ➔ systemd service for cleanup operations.
- `cleanup-versions.timer` ➔ systemd timer to run cleanup every 15 days.

## Backup Structure

Data is copied to remote storage, organized by date:

- `flow-devops-YYYY-MM-DD/`
- `keepassxc_syncthing-YYYY-MM-DD.kdbx`
- `joplin-YYYY-MM-DD/`

## Requirements

- `rclone` installed and configured.
- A Linux system compatible with `systemd --user` (user session services).

## Installation

1. **Copy the scripts**:

   Place the scripts in the following directory:

   ```
   ~/.local/scripts/
   ```

2. **Set permissions**:

   Make the scripts executable:

   ```bash
   chmod +x ~/.local/scripts/backup-auto.sh
   chmod +x ~/.local/scripts/cleanup-versions.sh
   ```

3. **Install the services and timers**:

   Copy the `.service` and `.timer` files to:

   ```
   ~/.config/systemd/user/
   ```

4. **Enable and start the timers**:

   ```bash
   systemctl --user daemon-reexec
   systemctl --user daemon-reload
   systemctl --user enable --now backup-auto.timer
   systemctl --user enable --now cleanup-versions.timer
   ```

## Useful Commands

- **Check timer status**:

  ```bash
  systemctl --user list-timers
  ```

- **Check backup and cleanup logs**:

  ```bash
  cat ~/.local/logs/backup.log
  cat ~/.local/logs/cleanup.log
  ```

## Custom Configuration

- Edit `SRC_PROGETTI`, `SRC_KEEPASS`, `SRC_JOPLIN` inside `backup-auto.sh` to match your local folder structure.
- Edit `REMOTE` to specify your configured `rclone` remote storage.
- Edit `RETENTION_DAYS` inside `cleanup-versions.sh` to change the retention policy.

## Warnings

- This system **does not encrypt data** before transferring it to the remote storage.
- The remote storage **should support versioning** to add extra safety against data loss.

---

**Author**: bynflow  
**Year**: 2025


