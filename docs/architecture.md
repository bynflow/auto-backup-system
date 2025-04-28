# Architecture of the Auto-Backup System

## Main Components

- **Backup script (`backup-auto.sh`)**:
  - Copies selected local directories to a remote storage using `rclone`.
  - Organizes backups by date.
  - Logs operations in `~/.local/logs/backup.log`.

- **Cleanup script (`cleanup-versions.sh`)**:
  - Automatically deletes backups older than a defined retention period (default: 630 days).
  - Cleanup actions are logged.

- **systemd services and timers**:
  - `backup-auto.timer`: triggers backups every 3 hours.
  - `cleanup-versions.timer`: runs cleanup every 15 days.
  - All services run under the user session (`systemd --user`).

## Daily Workflow

1. **System boot**:
   - Backup is initiated 5 minutes after boot.
2. **During the day**:
   - Backups run every 3 hours.
3. **Every 15 days**:
   - Cleanup script removes outdated backups.

## Reliability Notes

- `rclone copy` ensures only new or modified files are transferred, optimizing time and bandwidth.
- Backup versions are preserved; older versions are not overwritten.
- Logs allow tracking and troubleshooting backup and cleanup operations.

## Future Improvements

- Implement encrypted backups with `rclone crypt`.
- Add notification system (email, Telegram) on success/failure.
- Different retention policies for different file types.


