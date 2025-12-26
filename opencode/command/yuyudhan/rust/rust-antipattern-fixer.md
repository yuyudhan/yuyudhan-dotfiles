---
description: Fix Rust anti-patterns
model: anthropic/claude-sonnet-4-5
---

Purpose: Identify and fix Rust anti-patterns in the provided code context.

Scope: Analyze only the specific code flow, endpoint(s), files, functions, or modules provided when running this command.

Categories:

Performance:
- Unnecessary clones/allocations (`.clone()`, `String` vs `&str`, `to_owned()`)
- Wrong collection types, missing capacity hints
- Blocking in async contexts, inefficient `.await` usage
- Lock contention

Security & Safety:
- `.unwrap()`/`.expect()` in production code
- Ignored `Result` types, panic-prone paths
- Unnecessary `unsafe` blocks
- Missing input validation, integer overflow risks

Design:
- Overly complex lifetimes or borrow checker workarounds
- Primitive obsession (missing newtype wrappers)
- Non-idiomatic APIs, poor visibility modifiers

Severity:
- 🔴 HIGH: Panics, security issues, blocking async, unsafe problems
- 🟡 MEDIUM: Hot path performance, poor error handling
- 🟢 LOW: Minor optimizations, style issues

Output:
- List issues with file:line, severity, and concrete fix
- Apply fixes directly to code
- Summary: count by severity/category
- Testing recommendations if applicable

