#!/bin/bash
# command substitution examples

# Capture date
TODAY=$(date)
echo "Today: $TODAY"

# Capture just the year
YEAR=$(date +%Y)
echo "Year: $YEAR"

# Capture hostname
HOST=$(hostname)
echo "Hostname: $HOST"

# Capture command output with options
PROCESS_COUNT=$(ps aux | wc -l)
echo "Running processes: $PROCESS_COUNT"

# Capture disk usage of root
ROOT_USAGE=$(df -h / | awk 'NR==2 {print$3}')
echo "Root disk usage: $ROOT_USAGE"

# Capture memory info
MEMORY_USED=$(free -h | awk 'NR==2 {print $3}')
MEMORY_TOTAL=$(free -h | awk 'NR==2 {print $2}')
echo "Memory: $MEMORY_USED / $MEMORY_TOTAL"

# Capture CPU load
LOAD=$(uptime | awk -F'load average:' '{print $2}')
echo "Load average: $LOAD"

# Nesting command substitution 
FILES_IN_HOME=$(ls $(echo $HOME) | wc -l)
echo "Files in home: $FILES_IN_HOME"
