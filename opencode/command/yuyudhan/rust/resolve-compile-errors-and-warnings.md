---
description: Resolve Rust compilation errors and warnings
model: anthropic/claude-sonnet-4-5
---

Purpose: Resolve Rust compilation errors and warnings in the provided code context.

Scope: Focus on the specific files, endpoints, or features in the context provided when running this command.

Resolution Strategy:
- Fix compilation errors first (type mismatches, missing traits, lifetime issues, borrow checker violations)
- Address warnings based on severity and impact (unused code, deprecated APIs, clippy suggestions)
- Avoid blanket suppression (#[allow]) unless justified by architectural constraints
- Preserve code functionality and intended behavior

Warning Categories:
1. Critical: Dead code in public APIs, unused Result types, deprecated security functions
2. High: Type coercions, unsafe blocks, missing error propagation
3. Medium: Unused imports, redundant clones, suboptimal patterns
4. Low: Formatting suggestions, style preferences

Actions:
- Remove truly unused code after verification
- Refactor to address root cause before considering #[allow]
- Update deprecated APIs to modern equivalents
- Fix clippy warnings following Rust best practices

Ask Clarifying Questions:
- Which warnings are intentional/acceptable in this context?
- Should unused code be removed or kept for future use?
- Are there architectural reasons for specific patterns?

Output:
- Fixed errors with file:line locations
- Resolved warnings categorized by type
- Justification for any suppression directives used
- Summary: errors fixed, warnings resolved, suppressions added
