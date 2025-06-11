#!/bin/bash 

# server-stats.sh - A script to analyze basic server performance stats 

echo"****************************************************************"
echo "			SERVER PERFORMANCE STATS REPORT		    "
echo "***************************************************************"

# Total CPU Usage
echo -e "\n-- CPU Usage --"
top -bn1 | grep "Cpu(s)" | awk '{print "CPU Usage: " 100 - $8 "%"}'

# Total Memory Usage
echo -e "\n-- Memory Usage --"
free -m | awk 'NR==2{printf "Used: %sMB / Total: %sMB (%.2f%%)\n", $3,$2,$3*100/$2 }'

# Total Disk Usage
echo -e "\n-- Disk Usage --"
df -h --total | awk '/^total/ {printf "Used: %s / Total: %s (%.2f%%)\n", $3,$2,$5}'

#Top 5 processes by CPU usage 
echo -e "\n-- Top 5 Processes by CPU --"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 processes by Memory usage
echo -e "\n-- Top 5 Processes by Memory --"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

echo -e "\n===== End of Report ====="
