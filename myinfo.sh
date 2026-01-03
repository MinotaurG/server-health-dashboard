#!/bin/bash
#Practice with variables

# Your information
MY_NAME="Aditya"
MY_OS="Linux"
YEAR=2025

# System information
HOSTNAME=$(hostname)
CURRENT_USER=$(whoami)
CURRENT_DIR=$(pwd)

# Print everything
echo "=== My Information ==="
echo "Name: $MY_NAME"
echo "OS: $MY_OS"
echo "Year: $YEAR"
echo ""
echo "=== System Information ==="
echo "Hostname: $HOSTNAME"
echo "User: $CURRENT_USER"
echo "Directory: $CURRENT_DIR"
