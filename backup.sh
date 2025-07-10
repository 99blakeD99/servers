#!/bin/bash

# FSCompliance Backup Script
# Creates daily snapshots excluding large VS Code files

BACKUP_DIR="$HOME/backups"
PROJECT_DIR="$HOME"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="$BACKUP_DIR/fscompliance_backup_$DATE.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Create backup with exclusions
tar -czf "$BACKUP_FILE" \
  --exclude='.vscode-server/bin' \
  --exclude='.vscode-server/data/logs' \
  --exclude='node_modules' \
  --exclude='__pycache__' \
  --exclude='*.pyc' \
  --exclude='.git/objects' \
  --exclude='lightrag_data' \
  --exclude='cache' \
  --exclude='temp' \
  --exclude='logs' \
  -C "$PROJECT_DIR" \
  .

# Keep only last 7 days of backups
find "$BACKUP_DIR" -name "fscompliance_backup_*.tar.gz" -mtime +7 -delete

echo "Backup created: $BACKUP_FILE"
echo "Backup size: $(du -h "$BACKUP_FILE" | cut -f1)"