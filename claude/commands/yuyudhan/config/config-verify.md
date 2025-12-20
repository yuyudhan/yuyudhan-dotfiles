---
description: Audit configuration compliance
model: anthropic/claude-haiku-4-5
---

Purpose: Audit configuration compliance for the provided code context.

Scope: Verify configuration only in the specific code flow, files, endpoints, or features provided. If no context given, audit entire codebase.

Checks:
- Environment variables use consistent project prefix
- .env and .env.example in sync (all keys present in example)
- No hardcoded secrets, API keys, URLs, or environment-specific values
- Configuration centralized in proper config files/modules
- No committed .env files (check .gitignore)
- Type safety for config values if applicable

Output:
- Violations with file:line locations
- Severity: critical (secrets/keys), high (hardcoded URLs), medium (missing prefix), low (sync issues)
- Specific fixes per violation
- Updated .env.example if new variables found
- Summary: total issues by severity

