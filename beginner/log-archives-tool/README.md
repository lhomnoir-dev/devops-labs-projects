# Log Archives Tool

This script creates compressed archives of log directories and manages backup retention.

## Features

- Creates timestamped tar.gz backups of specified directories
- Automatic cleanup of backups older than 7 days
- Displays backup size and count of retained backups

## Usage

```bash
./archive-tool.sh <source_directory>
```

### Example

```bash
./archive-tool.sh /var/log/nginx
```

This will create a backup file like `backups/backup_2024-01-15.tar.gz` and remove any backups older than 7 days.

## Requirements

- tar command
- Standard Unix tools (find, du, wc)

## Output

The script provides feedback on:
- Success/failure of backup creation
- Path and size of created backup
- Number of retained backup files