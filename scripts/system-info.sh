#!/usr/bin/env bash

set -euo pipefail

echo "=== System Info ==="
echo "Hostname : $(hostname)"
echo "User     : $(whoami)"
echo "Date     : $(date -u +'%Y-%m-%d %H:%M:%S UTC')"
echo "Kernel   : $(uname -sr)"
echo "Uptime   : $(uptime -p)"
echo "Memory   :"
free -h | head -n 2
echo "Disk (/) :"
df -h / | head -n 2