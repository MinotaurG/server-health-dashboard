#!/bin/bash
# Demo: Refreshing display

echo "Watch the counter (Ctrl+C to stop)..."
sleep 2

COUNT=1
while true; do
    # Clear screen
    clear
    
    # Print current time and count
    echo "================================"
    echo "  LIVE COUNTER DEMO"
    echo "================================"
    echo ""
    echo "  Time: $(date '+%H:%M:%S')"
    echo "  Count: $COUNT"
    echo ""
    echo "  Press Ctrl+C to stop"
    echo "================================"
    
    # Increment counter
    COUNT=$((COUNT + 1))
    
    # Wait 1 second
    sleep 1
done
