#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/nginx_backup_${DATE}.tar.gz"
LOG_FILE="/var/log/backup/nginx_backup.log"

tar -czf "$BACKUP_FILE" /etc/nginx /usr/share/nginx/html 2>> "$LOG_FILE"

# Verify backup integrity
tar -tzf "$BACKUP_FILE" &>> "$LOG_FILE"

echo "Nginx backup completed on $(date)" >> "$LOG_FILE"
