## Purpose
Archive completed OpenSpec changes (100% tasks done).

## Commands to Run
```bash
# List changes
openspec list

# Check completion
openspec show <change-name>

# Validate before archiving
openspec validate <change-name>

# Archive
openspec archive <change-name> --yes
```

## Steps
1. **Find completed changes**:
   ```bash
   openspec list
   openspec show <change-name>
   # Look for: (X/X tasks - 100%)
   ```

2. **Validate before archiving**:
   ```bash
   openspec validate <change-name>
   ```

3. **Ask user for confirmation**:
   ```
   Ready to archive:
   - add-profile-filters (5/5 tasks - 100%)
   
   This will:
   - Move change to openspec/archive/
   - Merge spec deltas into openspec/specs/
   
   Proceed? (yes/no)
   ```

4. **Archive**:
   ```bash
   openspec archive <change-name> --yes
   ```

5. **Report results**:
   ```
   ✓ Archived: add-profile-filters
   ✓ Specs merged into openspec/specs/auth/spec.md
   ```

## Example Execution
```bash
# Step 1: List all changes
openspec list

# Step 2: Check completion
openspec show add-profile-filters
# Output: (5/5 tasks - 100%)

# Step 3: Validate
openspec validate add-profile-filters
# ✓ Validation passed

# Step 4: Archive
openspec archive add-profile-filters --yes
# ✓ Change archived successfully
```

## What Archiving Does
- Moves `openspec/changes/<change-name>/` → `openspec/archive/`
- Merges spec deltas into `openspec/specs/` (source of truth)
- Removes change from active list

## Guardrails
- ❌ Don't archive changes with incomplete tasks
- ❌ Don't skip validation before archiving
- ❌ Don't manually move files
- ✅ Use `--yes` flag for non-interactive archiving
- ✅ Let CLI handle all file operations
- ✅ Confirm with user before archiving multiple changes
