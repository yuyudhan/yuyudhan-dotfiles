---
description: Identify potential memory leaks
model: anthropic/claude-sonnet-4-5
---

Purpose: Identify processes with growing memory usage indicating potential memory leaks.

Scope: macOS systems. Monitor memory growth over time with snapshots.

Principles:
- Take 3 snapshots at 30-second intervals to detect growth
- Flag processes with >50MB growth or >10% increase
- Calculate growth rate (MB/hour projection)
- Exclude system processes with normal growth (kernel_task, WindowServer)
- Protected processes: WindowServer, Dock, Finder, loginwindow, kernel_task (report only, never kill)
- Show memory pressure and swap usage context

Key Commands:
```bash
# Memory snapshot (RSS - Resident Set Size)
ps aux | awk '{print $2, $4, $6, $11}' | sort -k3 -rn

# Memory pressure
memory_pressure

# Swap usage
sysctl vm.swapusage | awk '{print $4, $7}'

# Process memory details
vmmap <PID> | grep -E "Physical|malloc|TOTAL"
```

Process:
1. Take initial memory snapshot of all processes
2. Wait 30 seconds
3. Take second snapshot, calculate delta
4. Wait 30 seconds  
5. Take third snapshot, confirm growth pattern
6. Project growth rate (MB/hour)

Output:
- Memory Context:
  - Current memory pressure (normal/warning/critical)
  - Swap usage
- Growing Processes Table:
  - PID | Process | Initial Mem | Current Mem | Growth | Growth Rate (MB/hr) | Status
- Color coding:
  - Green: <50MB growth (normal)
  - Yellow: 50-200MB growth (monitor)
  - Red: >200MB growth (likely leak)
- Interactive menu:
  - Restart process (graceful)
  - Kill process (with confirmation)
  - Inspect process details (vmmap)
  - Monitor longer (extend observation)
- Summary: Leak candidates, recommended actions
