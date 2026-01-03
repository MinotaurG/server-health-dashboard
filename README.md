# 🖥️ Server Health Dashboard

A real-time terminal dashboard that monitors server health metrics built with Bash.

## Features

- 📍 System information (hostname, OS, kernel, uptime)
- 🔥 CPU monitoring (cores, load average, load percentage)
- 🧠 Memory monitoring (used, available, swap)
- 💾 Disk monitoring (usage, available space)
- 🌐 Network connections count
- 🔝 Top 5 processes by CPU usage
- 🎨 Color-coded status indicators (green/yellow/red)
- 🔄 Auto-refresh every 5 seconds

## Screenshot
╔══════════════════════════════════════════════════════════════╗
║ 🖥️ SERVER HEALTH DASHBOARD ║                                  
╠══════════════════════════════════════════════════════════════╣
║ 📍 Host: my-server                                           ║
║ 🔥 CPU: 4 cores, Load: 0.52, 0.48, 0.45 ●                    ║ 
║ 🧠 Memory: 2.7Gi / 7.6Gi (35%) ●                             ║
║ 💾 Disk: 16G / 1007G (2%) ●                                  ║
╚══════════════════════════════════════════════════════════════╝



## Requirements

- Linux/Unix system (or WSL on Windows)
- Bash 4.0+
- Standard Linux utilities: `ps`, `free`, `df`, `awk`, `uptime`

## Installation

# Clone the repository
```bash
git clone git@github.com:YOUR_USERNAME/server-health-dashboard.git
```
# Navigate to directory
```bash
cd server-health-dashboard
```
# Make script executable
```bash
chmod +x dashboard.sh
```
# Run the dashboard
```bash
./dashboard.sh
```

# Press Ctrl+C to exit
## How It Works

The dashboard uses standard Linux commands to gather system metrics:

| Metric | Command Used |
|--------|--------------|
| Hostname | `hostname` |
| OS/Kernel | `uname -s`, `uname -r` |
| Uptime | `uptime -p` |
| CPU Cores | `nproc` |
| Load Average | `uptime` + `awk` |
| Memory | `free -h` + `awk` |
| Disk | `df -h` + `awk` |
| Processes | `ps aux` |
| Network | `ss -tun` |

## Status Indicators

| Color | Meaning | Threshold |
|-------|---------|-----------|
| 🟢 Green | OK | < 70% |
| 🟡 Yellow | Warning | 70-90% |
| 🔴 Red | Critical | > 90% |

## Skills Demonstrated

- Bash scripting (variables, functions, loops, conditionals)
- Linux system administration commands
- Text processing with awk
- Process and resource monitoring
- Terminal UI formatting with ANSI colors

## Author

MinotaurG

## License

MIT License - feel free to use and modify!
