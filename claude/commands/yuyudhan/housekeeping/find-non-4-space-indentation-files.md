Purpose: Identify all files in provided directory/context that don't use 4-space indentation.

Input: Directory path or file pattern to scan (e.g., `docs/dashboard/`, `src/**/*.ts`).

Method:
- Use efficient detection without reading entire files
- Check first 50-100 lines for indentation patterns
- Detect tabs, 2-space, or mixed indentation
- Use grep/ripgrep with regex patterns for speed:
  - Tabs: `grep -l $'^\t' files`
  - 2-space: `grep -l '^  [^ ]' files` (2 spaces followed by non-space)
  - Odd indentation: patterns not divisible by 4

Exclusions (skip these):
- `node_modules/`, `.git/`, `dist/`, `build/`, `.next/`
- Makefiles (require tabs)
- Binary files
- Files with explicit indent config comments

Output Format:
```
Non-4-space indentation found:

Tabs (3 files):
  - path/to/file1.ts
  - path/to/file2.js

2-space (5 files):
  - path/to/component.tsx
  - path/to/util.ts

Mixed indentation (1 file):
  - path/to/legacy.py
```

Summary:
- Total files scanned
- Total non-compliant files by type
- Suggested next action (e.g., "Run change-to-4-space-indentation on these files")
