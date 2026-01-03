#!/bin/bash
# Loops in Bash

echo "=== For Loop: List of items ==="
for FRUIT in apple banana orange grape; do
    echo "I like $FRUIT"
done

echo ""
echo "=== For Loop: Number range ==="
for i in {1..5}; do
    echo "Number: $i"
done

echo ""
echo "=== For Loop: Files in directory ==="
for FILE in /etc/*.conf; do
    if [ -f "$FILE" ]; then
        echo "Config file: $FILE"
    fi
done | head -5 # Show only first 5

echo ""
echo "=== For Loop: Command Output ==="
for USER in $(who | awk '{print $1}' | sort -u); do
    echo "Logged in user: $USER"
done

echo ""
echo "=== C-style For Loop ==="
for ((i=0; i<5; i++)) do
    echo "Counter: $i"
done

echo ""
echo "=== While Loop ==="
COUNT=1
while [ $COUNT -le 5 ]; do
      echo "While count: $COUNT"
      COUNT=$((COUNT + 1))
done

echo ""
echo "=== While Loop: Reading file line by line ==="
echo -e "line1\nline2\nline3" | while read LINE; do
    echo "Read: $LINE"
done

echo ""
echo "=== Practical: Loop through processes ==="
echo "Top 3 CPU processes:"
ps aux --sort=-%cpu | head -4 | tail -3 | while read LINE; do
     USER=$(echo $LINE | awk '{print $1}')
     CPU=$(echo $LINE | awk '{print $3}')
     CMD=$(echo $LINE | awk '{print $11}')
     echo " $USER is running $CMD at $CPU% CPU"
done
