---
description: List OpenSpec changes with pending tasks
model: anthropic/claude-haiku-4-5
---

## Purpose
Show status of all OpenSpec changes with task completion.

## Commands to Run
```bash
# List all changes
openspec list

# Get details for each change
openspec show <change-name>
```

## Steps
1. **Get all changes**:
   ```bash
   openspec list
   ```

2. **Check each change**:
   ```bash
   openspec show add-2fa
   openspec show add-profile-filters
   # etc.
   ```

3. **Parse CLI output** and group by status:
   - ✅ Completed (100%)
   - 🚧 In-Progress (1-99%)
   - 📋 Not Started (0%)

## Output Format
```markdown
## OpenSpec Changes Status

Summary: 3 changes (1 complete, 2 in-progress)

### ✅ Completed (Ready to Archive)
- add-profile-filters (5/5 tasks - 100%)

### 🚧 In-Progress
- add-2fa (2/5 tasks - 40%)
  Pending: OTP verification, login flow updates
  Next: openspec show add-2fa

### 📋 Not Started
- update-auth-flow (0/3 tasks - 0%)

---
Actions:
- Archive complete: openspec archive add-profile-filters --yes
- Continue work: /openspec:apply add-2fa
- View details: openspec show <change-name>
```

## Example Execution
```bash
# Step 1: List changes
openspec list
# Output: add-2fa, add-profile-filters, update-auth-flow

# Step 2: Check each
openspec show add-2fa
# Output shows: (2/5 tasks - 40%)

openspec show add-profile-filters
# Output shows: (5/5 tasks - 100%)

openspec show update-auth-flow
# Output shows: (0/3 tasks - 0%)

# Step 3: Report grouped status
```

## Guardrails
- ❌ Don't manually read tasks.md files
- ✅ Use `openspec list` and `openspec show` commands
- ✅ Parse CLI output for task completion
- ✅ Provide actionable next steps
