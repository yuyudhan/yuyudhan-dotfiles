---
description: Analyze disk space usage on macOS
model: anthropic/claude-haiku-4-5
---

Purpose: Identify directories and files consuming excessive disk space on macOS.

Scope: macOS systems. Focus on common development bloat and user-accessible areas.

Principles:
- Scan /Users/$USER, excluding system directories and hidden caches initially
- Flag directories >1GB, files >100MB
- Identify common dev bloat: node_modules, target/, dist/, build/, .next/, vendor/
- Show Docker images/containers space usage
- Highlight old log files, downloads, temporary files
- Never scan: /System, /Library (system), /private/var (system logs)

Key Commands:
```bash
# Top 20 largest directories
du -sh ~/* ~/.*/ 2>/dev/null | sort -rh | head -20

# Find large files >100MB
find ~ -type f -size +100M 2>/dev/null -exec ls -lh {} \; | awk '{print $5, $9}' | sort -rh

# Docker space usage
docker system df -v 2>/dev/null

# All node_modules directories
find ~ -name "node_modules" -type d -prune -exec du -sh {} \; 2>/dev/null | sort -rh

# Rust target directories
find ~ -name "target" -type d -path "*/Cargo.toml" -prune -exec du -sh {} \; 2>/dev/null
```

Output:
- Disk summary: Total/Used/Available with percentage
- Top space consumers by category:
  - Directories (size, path)
  - Large files (size, path, last modified)
  - Dev bloat (node_modules, target, build - total count and size)
  - Docker (images, containers, volumes)
- Actionable suggestions with estimated space recovery
- Interactive cleanup menu with confirmation
