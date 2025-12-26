---
description: View and manage OpenSpec specifications
model: anthropic/claude-haiku-4-5
---

## Purpose
View and manage OpenSpec source specifications (current truth).

## Commands to Run

### View Specs (Always Use CLI)
```bash
openspec list --specs           # List all specs
openspec spec show <spec-path>  # View specific spec
```

### Create New Specs (Manual)
Only when creating brand new spec domains.
For existing specs, use change proposals + archive.

## Steps

### Viewing Specs
```bash
# Step 1: List all specs
openspec list --specs

# Step 2: View specific spec
openspec spec show auth
openspec spec show profile
```

### Creating New Specs
1. Create directory: `openspec/specs/<domain>/`
2. Create `spec.md`:
   ```markdown
   # <Domain> Specification
   
   ## Purpose
   What this spec covers.
   
   ## Requirements
   
   ### Requirement: Name
   The system SHALL <description>.
   
   #### Scenario: scenario name
   - WHEN <condition>
   - THEN <expected behavior>
   ```

3. Follow format rules:
   - Use SHALL/MUST for requirements
   - Every requirement needs ≥1 scenario
   - Use WHEN/THEN format

## Example Execution

**List Specs**:
```bash
openspec list --specs

# Output:
# - auth/spec.md
# - profile/spec.md
# - api/spec.md
```

**View Spec**:
```bash
openspec spec show auth

# Shows complete auth specification
```

**Before Creating Change**:
```bash
# Always check existing spec first
openspec spec show auth

# Then create change proposal with proper deltas
```

## Spec Format
```markdown
# Authentication Specification

## Purpose
Authentication mechanisms and session management.

## Requirements

### Requirement: User Authentication
The system SHALL authenticate users via username and password.

#### Scenario: Valid credentials
- WHEN user submits valid credentials
- THEN system returns a JWT token
- AND token is valid for 24 hours

#### Scenario: Invalid credentials
- WHEN user submits invalid credentials
- THEN system returns 401 error
- AND no token is issued
```

## Guardrails
- ❌ Don't manually edit source specs for changes (use change proposals)
- ❌ Don't scan `openspec/specs/` directory manually
- ✅ Use CLI to view specs
- ✅ Create change proposals for modifications
- ✅ Only manually create brand new spec domains

## Workflow
```
Modify Existing Spec:
1. openspec spec show <spec>     # View current
2. Create change proposal         # With deltas
3. Implement + archive            # Merges into source

Create New Spec:
1. Manually create in openspec/specs/<domain>/spec.md
2. Follow spec format above
```
