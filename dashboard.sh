#!/bin/bash
# Server Health Dashboard - Final Version with Auto-Refresh

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'  # No Color

# Refresh interval in seconds
REFRESH_INTERVAL=5

# Function to get status indicator based on percentage
get_status() {
    local value=$1
    local warning=${2:-70}
    local critical=${3:-90}
    
    # Remove % sign if present
    value=${value//%/}
    
    if [ "$value" -lt "$warning" ]; then
        echo -e "${GREEN}●${NC}"
    elif [ "$value" -lt "$critical" ]; then
        echo -e "${YELLOW}●${NC}"
    else
        echo -e "${RED}●${NC}"
    fi
}

# Function to display dashboard
show_dashboard() {
    # Gather system information
    HOSTNAME=$(hostname)
    OS=$(uname -s)
    KERNEL=$(uname -r)
    UPTIME=$(uptime -p 2>/dev/null || uptime | awk -F'up' '{print $2}' | awk -F',' '{print $1}')
    CURRENT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

    # CPU information
    CPU_CORES=$(nproc)
    LOAD_AVERAGE=$(uptime | awk -F'load average:' '{print $2}' | xargs)
    LOAD_1MIN=$(echo $LOAD_AVERAGE | cut -d',' -f1 | xargs)

    # Calculate load percentage (relative to cores)
    LOAD_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($LOAD_1MIN / $CPU_CORES) * 100}")
    CPU_STATUS=$(get_status $LOAD_PERCENT)

    # Memory information
    MEM_TOTAL=$(free -h | awk 'NR==2 {print $2}')
    MEM_USED=$(free -h | awk 'NR==2 {print $3}')
    MEM_AVAILABLE=$(free -h | awk 'NR==2 {print $7}')
    SWAP_TOTAL=$(free -h | awk 'NR==3 {print $2}')
    SWAP_USED=$(free -h | awk 'NR==3 {print $3}')

    # Calculate memory percentage
    MEM_TOTAL_KB=$(free | awk 'NR==2 {print $2}')
    MEM_USED_KB=$(free | awk 'NR==2 {print $3}')
    MEM_PERCENT=$(awk "BEGIN {printf \"%.0f\", ($MEM_USED_KB / $MEM_TOTAL_KB) * 100}")
    MEM_STATUS=$(get_status $MEM_PERCENT)

    # Disk information
    DISK_TOTAL=$(df -h / | awk 'NR==2 {print $2}')
    DISK_USED=$(df -h / | awk 'NR==2 {print $3}')
    DISK_AVAILABLE=$(df -h / | awk 'NR==2 {print $4}')
    DISK_PERCENT=$(df -h / | awk 'NR==2 {print $5}' | tr -d '%')
    DISK_STATUS=$(get_status $DISK_PERCENT 70 85)

    # Process count
    PROCESS_COUNT=$(ps aux | wc -l)
    
    # Network connections
    NET_CONNECTIONS=$(ss -tun 2>/dev/null | grep -c ESTAB || echo "0")

    # Clear screen
    clear

    # Print dashboard
    echo -e "${CYAN}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}║${NC}           🖥️  ${BOLD}${BLUE}SERVER HEALTH DASHBOARD${NC}                        ${CYAN}║${NC}"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  📍 Host: ${GREEN}$HOSTNAME${NC}"
    echo -e "${CYAN}║${NC}  🖥️  OS: $OS ($KERNEL)"
    echo -e "${CYAN}║${NC}  ⏱️  Uptime: $UPTIME"
    echo -e "${CYAN}║${NC}  🕐 Time: $CURRENT_TIME"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  🔥 CPU                                               $CPU_STATUS"
    echo -e "${CYAN}║${NC}     Cores: $CPU_CORES"
    echo -e "${CYAN}║${NC}     Load Average: $LOAD_AVERAGE"
    echo -e "${CYAN}║${NC}     Load Percent: ${LOAD_PERCENT}%"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  🧠 MEMORY                                            $MEM_STATUS"
    echo -e "${CYAN}║${NC}     Used: $MEM_USED / $MEM_TOTAL (${MEM_PERCENT}%)"
    echo -e "${CYAN}║${NC}     Available: $MEM_AVAILABLE"
    echo -e "${CYAN}║${NC}     Swap: $SWAP_USED / $SWAP_TOTAL"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  💾 DISK (/)                                          $DISK_STATUS"
    echo -e "${CYAN}║${NC}     Used: $DISK_USED / $DISK_TOTAL (${DISK_PERCENT}%)"
    echo -e "${CYAN}║${NC}     Available: $DISK_AVAILABLE"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  🌐 NETWORK"
    echo -e "${CYAN}║${NC}     Active Connections: $NET_CONNECTIONS"
    echo -e "${CYAN}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC}  🔝 TOP 5 PROCESSES (by CPU)                   Total: $PROCESS_COUNT"
    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}║${NC}     ${BOLD}USER       %CPU   %MEM   COMMAND${NC}"

    # Get top 5 CPU processes
    ps aux --sort=-%cpu | head -6 | tail -5 | while read -r line; do
        USER=$(echo $line | awk '{print $1}')
        CPU=$(echo $line | awk '{print $3}')
        MEM=$(echo $line | awk '{print $4}')
        CMD=$(echo $line | awk '{print $11}' | cut -c1-25)
        printf "${CYAN}║${NC}     %-10s %5s  %5s   %s\n" "$USER" "$CPU" "$MEM" "$CMD"
    done

    echo -e "${CYAN}║${NC}"
    echo -e "${CYAN}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo ""
    echo -e "Legend: ${GREEN}● OK (<70%)${NC}  ${YELLOW}● Warning (70-90%)${NC}  ${RED}● Critical (>90%)${NC}"
    echo ""
    echo -e "Refreshing every ${REFRESH_INTERVAL} seconds... Press ${BOLD}Ctrl+C${NC} to exit"
}

# Main loop
while true; do
    show_dashboard
    sleep $REFRESH_INTERVAL
done
