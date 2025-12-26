---
description: Verify type consistency between backend and frontend
model: anthropic/claude-haiku-4-5
---

Purpose: Verify type consistency between backend and frontend.

Scope: Check types only for the specific endpoints, models, or features provided in the context.

Checks:
- Compare backend models/structs vs frontend types
- Identify missing, mismatched, or outdated types
- Detect breaking changes (field removals, type changes, required vs optional)
- Verify enum values match between backend/frontend
- Check API request/response types align with backend contracts

Generate:
- Missing type definitions for frontend
- Updated types for changed backend models
- Migration path for breaking changes if needed

Output:
- Mismatches with file:line locations (backend and frontend)
- Severity: critical (breaking changes), high (missing types), medium (optional mismatches)
- Generated type definitions ready to use
- Migration steps for breaking changes
- Summary: total issues by severity
