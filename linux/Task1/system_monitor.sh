#!/bin/bash
DATE=$(date '+%Y-%m-%d %H:%M:%S')

echo "===== $DATE =====" >> /var/log/system-monitoring/metrics.log
df -h >> /var/log/system-monitoring/metrics.log
free -m >> /var/log/system-monitoring/metrics.log
top -b -n 1 | head -20 >> /var/log/system-monitoring/metrics.log
