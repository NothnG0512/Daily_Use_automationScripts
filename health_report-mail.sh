#!/bin/bash

REPORT="/tmp/health_report.txt"
DATE=$(date)

echo "Server Health Report - $DATE" > $REPORT
echo "-----------------------------" >> $REPORT

echo -e "\nCPU Usage:" >> $REPORT
top -bn1 | grep "Cpu(s)" >> $REPORT

echo -e "\nMemory Usage:" >> $REPORT
free -h >> $REPORT

echo -e "\nDisk Usage:" >> $REPORT
df -h >> $REPORT

echo -e "\nDocker Containers:" >> $REPORT
docker ps >> $REPORT

cat $REPORT 

mail -s "Daily Server Health Report" anujpal0512@gmail.com < /tmp/health_report.txt

## We can schedule this report for daily morng 9 AM using cron 

