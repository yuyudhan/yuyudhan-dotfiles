---
description: Comprehensive macOS system health diagnostic
model: anthropic/claude-haiku-4-5
---

Purpose: Comprehensive macOS system health diagnostic in one command.

Scope: macOS M1/M2/M3/M4 systems. Quick snapshot of all critical metrics.

Principles:
- Non-intrusive read-only checks
- Color-coded status: green (healthy), yellow (warning), red (critical)
- Thresholds: CPU >80%, Memory >85%, Disk >90%, Swap >2GB
- Include thermal state, battery health (if laptop), network connectivity
- Show top resource consumers

Key Commands:
```bash
# CPU load (1, 5, 15 min averages)
sysctl -n vm.loadavg

# Memory pressure
vm_stat | perl -ne '/page size of (\d+)/ and $size=$1; /Pages\s+([^:]+)[^\d]+(\d+)/ and printf("%-16s % 16.2f MB\n", "$1:", $2 * $size / 1048576);'

# Disk usage
df -h / | awk 'NR==2 {print $5, $4 " available"}'

# Swap usage
sysctl vm.swapusage

# Thermal state
pmset -g thermlog

# Battery health (laptops)
pmset -g batt && system_profiler SPPowerDataType | grep -E "Cycle Count|Condition"

# Network connectivity
ping -c 3 8.8.8.8 &>/dev/null && echo "Online" || echo "Offline"

# Top 5 CPU processes
ps aux | sort -k3 -rn | head -6 | awk '{printf "%-20s %5s%%\n", $11, $3}'

# Top 5 Memory processes
ps aux | sort -k4 -rn | head -6 | awk '{printf "%-20s %5s%%\n", $11, $4}'
```

Output:
- System Overview:
  - macOS version, uptime, CPU model
- Resource Status (with color coding):
  - CPU Load: 1/5/15 min averages (warn if >cores)
  - Memory: Used/Total, Pressure (green/yellow/red)
  - Swap: Usage (warn if >1GB)
  - Disk: Usage percentage and available
  - Thermal: Current state (nominal/warning/critical)
  - Battery: Percentage, health, cycle count (if laptop)
  - Network: Connectivity status
- Top Resource Consumers:
  - Top 5 CPU processes
  - Top 5 Memory processes
- Overall Health Score: Healthy/Warning/Critical
- Recommendations if any issues detected
