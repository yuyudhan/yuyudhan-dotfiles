## Purpose
View dashboard of all OpenSpec specifications and changes.

## Commands to Run

### Option 1: Interactive Dashboard (Best)
```bash
openspec view
```

### Option 2: Manual Overview
```bash
openspec list                 # All changes
openspec list --specs         # All specs
openspec show <change-name>   # Details per change
```

## Dashboard Shows
- All source specs in `openspec/specs/`
- All active changes in `openspec/changes/`
- Task completion status
- Recent archives

## Example Execution

**Interactive Dashboard**:
```bash
openspec view

# Output:
# SPECIFICATIONS
# - auth/spec.md
# - profile/spec.md
# 
# ACTIVE CHANGES
# ✅ add-profile-filters (5/5 - 100%)
# 🚧 add-2fa (2/5 - 40%)
# 📋 update-auth-flow (0/3 - 0%)
```

**Manual Overview**:
```bash
# Step 1: List specs
openspec list --specs
# auth/spec.md, profile/spec.md, api/spec.md

# Step 2: List changes
openspec list
# add-2fa, add-profile-filters, update-auth-flow

# Step 3: Get details
openspec show add-2fa
openspec show add-profile-filters
openspec show update-auth-flow
```

## Output Format
```markdown
# OpenSpec Overview

## Specifications (Source of Truth)
- auth/spec.md - Authentication and sessions
- profile/spec.md - User profiles

## Active Changes
✅ add-profile-filters (5/5 - 100%) - Ready to archive
🚧 add-2fa (2/5 - 40%) - In progress
📋 update-auth-flow (0/3 - 0%) - Not started

## Recent Archives
- implement-jwt-refresh (2 days ago)
```

## Use Cases
- 📊 Project overview for new team members
- 📋 Sprint planning (what's active/ready)
- 🔍 Code review context
- 📐 Architecture understanding

## Guardrails
- ❌ Don't manually scan directories
- ✅ Use `openspec view` if available
- ✅ Use `openspec list` + `openspec show` as fallback
- ✅ Let CLI format the output
