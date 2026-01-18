Task 1: System Monitoring Setup

Objective:

To monitor system performance, identify resource bottlenecks, and maintain logs for future analysis and capacity planning.

My machine is ubuntu:

Step 1: sudo apt install -y htop

 
Step 2: Monitor CPU, Memory, and Processes using htop

*CPU UTILIZATION PER CORE
*MEMORY AND SWAP USAGE
*RUNNING PROCESSES
*HIGH RESOURCE-CONSUMING APPLICATIONS


Step 3: Disk Usage Monitoring

Overall disk usage:  df -h
Directory-wise usage: du -sh /var/*

Step 4: Identify Resource-Intensive Processes
ps aux --sort=-%cpu | head -10
ps aux --sort=-%mem | head -10


Step 5: Logging System Metrics

Option A: Script

Create a directory for logs: sudo mkdir -p /var/log/system-monitoring

Create a monitoring script: sudo nano /usr/local/bin/system_monitor.sh

make executable : sudo chmod +x /usr/local/bin/system_monitor.sh



Option B: Also directly take a log:

Create a Log Directory: sudo mkdir -p /var/log/system-monitoring

permission: sudo chmod 755 /var/log/system-monitoring or sudo chown -R pavithra-prod:pavithra-prod /var/log/system-monitoring

Log CPU, Memory, and Process Usage: top -b -n 1 >> /var/log/system-monitoring/top.log

Log Disk Usage: 
df -h >> /var/log/system-monitoring/disk.log
du -sh /var/* >> /var/log/system-monitoring/directory_usage.log
