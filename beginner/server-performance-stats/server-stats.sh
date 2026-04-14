#!/bin/bash

echo "#---------------------------#"
echo "#  SERVER PERFORMANCE STATS #"
echo "#---------------------------#"


echo

# cpu usage
echo -e "Total cpu usage:"
top -bn1 | grep "Cpu(s)" | awk '{print "used: " $2"%"}'

echo 

# memory usage (Free vs used including percentage )
TOTAL_MEM=$(free| awk 'NR==2 {print $2}')
FREE_MEM=$(free -h | awk 'NR==2 {print $4}')
USED_MEM=$(free | awk 'NR==2 {print $3}')
PERCENT_USED=$(( USED_MEM * 100 / TOTAL_MEM ))

echo -e "Total memory usage:"
echo "free: $FREE_MEM "
echo "used: $(free -h | awk 'NR==2 {print $3}') ($PERCENT_USED%)"

echo 

# disk usage 
USED=$(df -h  / | awk 'NR==2 {print $3}')
AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
PERCENT=$(df -h  / | awk 'NR==2 {print $5}')
echo  "Total disk usage:"
echo -e "free: $AVAILABLE\nused: $USED ($PERCENT)"

echo

# top 5 processes by CPU
ps aux --sort -%cpu | head -n 6 | awk '{print $1 "\t" $2 "\t" $3 "\t" $11}'
echo

# top 5 memory usage
ps aux --sort -%mem | head -n 6 | awk '{print $1 "\t" $2 "\t" $4 "\t" $11}'
