---
description: Find and clean up zombie processes
model: anthropic/claude-haiku-4-5
---

Purpose: Find and clean up zombie (defunct) processes on macOS.

Scope: macOS systems. Identify zombies, their parents, and provide cleanup options.

Principles:
- Zombies are processes in 'Z' state (defunct)
- Can't be killed directly - must kill parent process
- Show parent process info before killing
- Protected parents: launchd (PID 1), system processes
- Confirm before killing parent processes
- Explain why zombie exists (parent didn't reap child)

Key Commands:
```bash
# Find zombie processes
ps aux | awk '$8 ~ /Z/ {print $0}'

# Find parent of zombie
ps -o ppid= -p <ZOMBIE_PID>

# Process tree showing zombie and parent
pstree -p <PARENT_PID> 2>/dev/null || ps -ejH | grep -A5 <PARENT_PID>

# Kill parent (last resort)
kill -HUP <PARENT_PID>  # Hangup signal
```

Output:
- Zombie Process Summary:
  - Count of zombies found
  - Table: Zombie PID | Parent PID | Parent Name | Zombie Command
- For each zombie:
  - Zombie: PID, original command
  - Parent: PID, name, CPU%, runtime
  - Explanation: "Parent process '<name>' failed to reap child process"
- Recommendations:
  - If parent is system process (launchd, etc.): Report only, suggest reboot
  - If parent is user process: Offer to restart/kill parent
  - If multiple zombies from same parent: Kill parent once
- Interactive Options:
  - Send HUP to parent (graceful cleanup)
  - Send TERM to parent (terminate parent)
  - Send KILL to parent (force kill - last resort)
  - Ignore and monitor
- Post-cleanup verification:
  - Re-scan for zombies
  - Confirm cleanup successful
- Note: "If zombies persist, system reboot recommended"
