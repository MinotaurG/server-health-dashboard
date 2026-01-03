#!/bin/bash
# Output formatting

# Basic echo
echo "Plain text"

# Echo with newline interpretation
echo -e "Line 1\nLine 2\nLine 3"

# Echo without trailing newline
echo -n "No newline after this"
echo " - continues here"

# Using printf (more control)
printf "Name: %s, Age: %d\n" "John" 25

# printf formatting
printf "%-10s %5d %8.2f\n" "Apple" 10 1.50
printf "%-10s %5d %8.2f\n" "Banana" 25 0.75
printf "%-10s %5d %8.2f\n" "Orange" 5 2.00

# Explanation:
# %-10s  = String, 10 chars wide, left-aligned (- means left)
# %5d    = Integer, 5 chars wide, right-aligned
# %8.2f  = Float, 8 chars wide, 2 decimal places

echo ""
echo "=== Creating a Box ==="

# Box drawing
echo "╔════════════════════════════════════╗"
echo "║        SERVER DASHBOARD            ║"
echo "╠════════════════════════════════════╣"
echo "║  CPU:     45%                      ║"
echo "║  Memory:  62%                      ║"
echo "║  Disk:    78%                      ║"
echo "╚════════════════════════════════════╝"

echo ""
echo "=== Colors! ==="

# Colors using ANSI escape codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'  # No Color (reset)

echo -e "${RED}This is red${NC}"
echo -e "${GREEN}This is green${NC}"
echo -e "${YELLOW}This is yellow${NC}"
echo -e "${BLUE}This is blue${NC}"

# Practical: Status indicators
echo ""
echo "=== Status with Colors ==="

CPU=45
MEM=85
DISK=95

# CPU status
if [ $CPU -lt 70 ]; then
    echo -e "CPU:  ${GREEN}${CPU}%${NC} ✓"
elif [ $CPU -lt 90 ]; then
    echo -e "CPU:  ${YELLOW}${CPU}%${NC} ⚠"
else
    echo -e "CPU:  ${RED}${CPU}%${NC} ✗"
fi

# Memory status
if [ $MEM -lt 70 ]; then
    echo -e "MEM:  ${GREEN}${MEM}%${NC} ✓"
elif [ $MEM -lt 90 ]; then
    echo -e "MEM:  ${YELLOW}${MEM}%${NC} ⚠"
else
    echo -e "MEM:  ${RED}${MEM}%${NC} ✗"
fi

# Disk status
if [ $DISK -lt 70 ]; then
    echo -e "DISK: ${GREEN}${DISK}%${NC} ✓"
elif [ $DISK -lt 90 ]; then
    echo -e "DISK: ${YELLOW}${DISK}%${NC} ⚠"
else
    echo -e "DISK: ${RED}${DISK}%${NC} ✗"
fi
