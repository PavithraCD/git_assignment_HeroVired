#!/bin/bash

DATE=$(date +%F)
BACKUP_FILE="/backups/apache_backup_${DATE}.tar.gz"
LOG_FILE="/var/log/backup/apache_backup.log"

tar -czf "$BACKUP_FILE" /etc/apache2 /var/www/html 2>> "$LOG_FILE"

# Verify backup integrity
tar -tzf "$BACKUP_FILE" &>> "$LOG_FILE"

echo "Apache backup completed on $(date)" >> "$LOG_FILE"
