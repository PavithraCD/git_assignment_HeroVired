Task 3: Backup Configuration for Web Servers

Objective

To configure automated, verified backups for:
Sarah’s Apache web server
Mike’s Nginx web server

The solution ensures:
Scheduled backups
Secure storage
Proper naming conventions
Backup integrity verification
Logging for audit and troubleshooting

Step 1: Create Backup Directory (One-Time Setup)

from admin user:
sudo mkdir -p /backups
sudo chmod 755 /backups

Step 2: Apache Backup Script (Sarah)

Backup Targets
Config: /etc/apache2/
Web root: /var/www/html/

sudo vi /usr/local/bin/apache_backup.sh
sudo chmod +x /usr/local/bin/apache_backup.sh

step 3; ginx Backup Script (Mike)

Backup Targets
Config: /etc/nginx/
Web root: /usr/share/nginx/html/

sudo vi /usr/local/bin/nginx_backup.sh

sudo chmod +x /usr/local/bin/nginx_backup.sh

step 4: Test Backup Scripts Manually

run the scripts (sudp)

step 5: Verify Backup Files

sudo ls -lh /backups

step 6: Verify Backup Integrity
tar -tzf /backups/apache_backup_2026-01-16.tar.gz | head
tar -tzf /backups/nginx_backup_2026-01-16.tar.gz | head


step 7: Configure Cron Jobs (Every Tuesday at 12:00 AM)

0 0 * * 2
| | | | |
| | | | └─ Tuesday
| | | └── Every month
| | └─── Every day
| └───── 12:00 AM
└─────── Minute 0

sudo crontab -e

# Apache backup (Sarah)
0 0 * * 2 /usr/local/bin/apache_backup.sh

# Nginx backup (Mike)
0 0 * * 2 /usr/local/bin/nginx_backup.sh


step 7: Verify Cron Configuration

sudo crontab -l

step 9: Verify Backup Logs

sudo tail -20 /var/log/backup/apache_backup.log

sudo tail -20 /var/log/backup/nginx_backup.log

Expected Output

sudo crontab -l

ls /backups

/var/log/backup/apache_backup.log
/var/log/backup/nginx_backup.log
