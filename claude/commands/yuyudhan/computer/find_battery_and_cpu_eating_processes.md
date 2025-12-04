
Purpose: Identify processes consuming excessive CPU/battery on Mac and provide kill options with user confirmation.

Scope: macOS systems (M1/M2/M3/M4). Fresh diagnostics—ignore previous state.

Principles:
- Use `powermetrics` for real-time CPU/GPU power (requires sudo)
- Flag processes >10% CPU or running >24 hours
- Protected processes: WindowServer, Dock, Finder, loginwindow, kernel_task (never kill)
- Always confirm before killing—show PID, name, CPU%, runtime
- Graceful kill (SIGTERM) first, force (SIGKILL) if needed
- Color-coded output: green (<3W good), yellow (3-6W moderate), red (>6W bad)

Key Commands:
```bash
# Power consumption
sudo powermetrics -n 1 -i 1000 --samplers cpu_power,tasks | grep -E "CPU Power|GPU Power"

# Top CPU hogs
ps aux | awk '{if($3>5.0) print $2, $3"%", $10, $11}' | sort -k2 -rn

# Stuck processes (running days)
ps aux | awk '$10 ~ /^[0-9]+-/ {print $2, $3"%", $10, $11}'
```

Output:
- Current power: CPU/GPU in mW with status (good/moderate/bad)
- Table: PID | CPU% | Runtime | Process Name
- Interactive kill menu with confirmation
- Summary: Power before/after, processes killed

