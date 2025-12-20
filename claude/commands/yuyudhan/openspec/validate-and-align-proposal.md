## Purpose
Validate spec formatting and ensure deltas align with source specs.

## Commands to Run
```bash
# Primary validation (checks format + alignment)
openspec validate <change-name>

# If errors, view source and delta
openspec spec show <spec-path>
openspec show <change-name> --spec

# After fixes, re-validate
openspec validate <change-name>
```

## Steps
1. **Run validation**:
   ```bash
   openspec validate <change-name>
   ```

2. **If validation passes**: ✅ Done!

3. **If validation fails**, fix issues:
   - Format errors: Fix markdown structure
   - Alignment errors: Fix ADDED/MODIFIED/REMOVED sections

4. **For alignment issues**:
   ```bash
   # View source spec
   openspec spec show <spec-path>
   
   # View your delta
   openspec show <change-name> --spec
   
   # Fix delta based on CLI feedback
   ```

5. **Re-validate**:
   ```bash
   openspec validate <change-name>
   ```

## What CLI Validates
- ✅ Delta sections: `## ADDED/MODIFIED/REMOVED Requirements`
- ✅ Requirement format: `### Requirement: Name`
- ✅ Scenario format: `#### Scenario: name`
- ✅ SHALL/MUST language in requirements
- ✅ WHEN/THEN in scenarios
- ✅ Alignment with source specs

## Common Errors

**Error: "MODIFIED requirement not found in source"**
```bash
# View source to see what exists
openspec spec show auth

# Fix: Move to ADDED section (it's new, not modified)
```

**Error: "ADDED requirement already exists in source"**
```bash
# Fix: Move to MODIFIED section with updates
```

**Error: "Missing scenario for requirement"**
```bash
# Fix: Add at least one scenario with WHEN/THEN
```

## Example
```bash
# Validate
openspec validate add-2fa

# Output shows: "Error: MODIFIED requirement 'User OTP' not found in source"

# Check source
openspec spec show auth
# → OTP requirement doesn't exist

# Fix: Change from MODIFIED to ADDED in delta file

# Re-validate
openspec validate add-2fa
# ✓ Validation passed
```

## Guardrails
- ❌ Don't skip validation after creating/modifying proposals
- ❌ Don't archive without successful validation
- ✅ Trust CLI error messages (they tell you exactly what's wrong)
- ✅ Always re-validate after fixes
