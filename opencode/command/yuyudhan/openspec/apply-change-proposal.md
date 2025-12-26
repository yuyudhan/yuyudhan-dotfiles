---
description: Implement OpenSpec change proposal tasks
model: anthropic/claude-haiku-4-5
---

## Purpose
Implement an OpenSpec change proposal by completing tasks sequentially.

## Commands to Run
```bash
# Before starting
openspec show <change-name>

# During implementation: manually update tasks.md after each task
# Mark complete: - [x] 1.1 Task description

# After all tasks complete, suggest archiving
```

## Steps
1. **Review the change**:
   ```bash
   openspec show <change-name>
   ```

2. **Read key files**:
   - `openspec/changes/<change-name>/proposal.md` - The why
   - `openspec/changes/<change-name>/tasks.md` - The what
   - `openspec/changes/<change-name>/specs/*/spec.md` - The requirements
   - `openspec/project.md` - Project conventions

3. **Implement tasks in order**:
   - Follow spec requirements exactly (SHALL/MUST are mandatory)
   - Write production code (no stubs unless requested)
   - Test after each task
   - Mark task complete in `tasks.md`: `- [x] 1.1 Description`

4. **Report progress** after each section:
   ```
   ✓ Section 1 complete (2/2 tasks)
   Current: 4/10 tasks complete (40%)
   Next: Starting Section 2
   ```

5. **When all tasks done**:
   ```
   All tasks complete (10/10 - 100%)
   Ready to archive with: openspec archive <change-name> --yes
   ```

## Task Format
```markdown
## 1. Database Setup
- [x] 1.1 Add OTP column        ✓ DONE
- [x] 1.2 Create logs table     ✓ DONE

## 2. Backend
- [x] 2.1 Add endpoint          ✓ DONE
- [ ] 2.2 Implement logic       ← NEXT
- [ ] 2.3 Add validation
```

## Guardrails
- ❌ Don't skip tasks or implement out of order
- ❌ Don't leave stubs/TODOs (write complete code)
- ❌ Don't suppress errors (fix them properly)
- ✅ Update `tasks.md` as you progress
- ✅ Test each implementation
- ✅ Keep logs clean (run `make logs-backend` or equivalent)
- ✅ Commit after each major section

## Example
```bash
# Start
openspec show add-2fa

# Implement tasks...
# Update tasks.md after each task

# When complete
"All tasks complete. Ready to archive: openspec archive add-2fa --yes"
```
