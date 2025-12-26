---
description: Add comprehensive logging for debugging
model: anthropic/claude-sonnet-4-5
---

Purpose: Add comprehensive logging to the provided code context for debugging and production diagnosis.

Scope: Add logs only to the specific files, functions, or code flow provided when running this command.

Log Levels:
- DEBUG: Function entry/exit, loop iterations, state transitions, branch paths
- INFO: Business milestones, successful operations, external call results
- WARN: Recoverable issues, retries, deprecations, resource warnings
- ERROR: Exceptions with stack traces, failed operations, validation failures

Categories (prefix every log):
[TIMING], [DIAGNOSIS], [NETWORK], [DATABASE], [AUTH], [VALIDATION], [STATE], [BUSINESS], [CACHE], [FILE], [CONFIG], [SECURITY]
Create domain-specific categories as needed.

Format: `[CATEGORY] Description: key1=value1, key2=value2`

Critical Placement:
- Function boundaries (entry/exit with params/returns)
- External interactions (API, DB, file ops - before/after with timing)
- Error handling (all catch blocks with stack traces)
- State changes (significant transitions)
- Performance-critical operations (with [TIMING] and duration)

Security (NEVER log):
- Passwords, API keys, tokens, secrets
- Credit cards, SSNs, sensitive PII
- Full request/response bodies with sensitive data
- Mask: `card_number=****1234`, log IDs not raw PII

Use existing logging framework in codebase. If none exists, use language standard:
- Rust: `log` crate or `tracing`, format: `debug!("[TIMING] Op: duration={:?}", dur)`
- JS/TS: winston/pino or console, format: `logger.debug('[TIMING] Op', { duration })`
- Python: logging/loguru, format: `logger.debug("[TIMING] Op: duration=45ms")`
- Go: zap/zerolog, format: `log.Debug("[TIMING] Op", "duration", dur)`

Output:
- Statistics: count by level and category
- Key areas instrumented
- Security considerations (sanitized data)
- Brief summary of logging strategy applied
