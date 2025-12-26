---
description: Display OpenSpec changes or specifications
model: anthropic/claude-haiku-4-5
---

## Purpose
Display OpenSpec change proposals or source specifications.

## Commands to Run

### For Changes
```bash
openspec show <change-name>           # Full details
openspec show <change-name> --spec    # Only spec deltas
openspec show <change-name> --tasks   # Only tasks
```

### For Source Specs
```bash
openspec list --specs                 # List all specs
openspec spec show <spec-path>        # View specific spec
```

## Use Cases

### Before Implementation
```bash
# View full change before starting work
openspec show add-2fa

# Output shows:
# - Proposal (why/what)
# - Tasks (2/5 complete - 40%)
# - Spec deltas (ADDED/MODIFIED/REMOVED)
```

### During Code Review
```bash
# Show what this PR implements
openspec show add-2fa --spec

# Output shows only spec changes
```

### Before Creating Change
```bash
# View existing spec to understand current state
openspec spec show auth

# Then create change with proper deltas
```

## Example Execution

**View Change**:
```bash
openspec show add-2fa
```

**View Source Spec**:
```bash
openspec list --specs
# Output: auth/spec.md, profile/spec.md, api/spec.md

openspec spec show auth
# Shows current auth specification
```

**View Only Deltas**:
```bash
openspec show add-2fa --spec
# Shows only spec changes (ADDED/MODIFIED/REMOVED)
```

**View Only Tasks**:
```bash
openspec show add-2fa --tasks
# Shows only task list with completion status
```

## CLI Output Includes
- Proposal text (purpose, scope, impact)
- Task completion status (X/Y - Z%)
- Spec deltas with requirements and scenarios
- Design docs (if present)

## Guardrails
- ❌ Don't manually read proposal.md, tasks.md, etc.
- ✅ Always use CLI commands
- ✅ View source specs before creating deltas
- ✅ Use `--spec` or `--tasks` flags for focused views
