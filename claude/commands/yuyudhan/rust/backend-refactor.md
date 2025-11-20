Purpose: Refactor Rust backend code for better organization, reduced duplication, proper architecture.

Scope: Only the specific endpoints, modules, flows, or files in context.

Focus:
- Identify duplication across modules/functions - centralize shared logic
- Balance DRY: avoid premature abstraction (don't abstract <3 uses)
- Module boundaries: handlers → services → repositories → models
- Centralize middleware, validation, error handling
- Remove dead code, consolidate error types
- Proper dependency injection and trait usage

Output:
- Modules/functions created/modified/removed with file:line
- Before/after structure comparison
- Migration notes if breaking changes

Process:
1. Analyze and identify opportunities
2. Ask about priorities/constraints
3. Present plan with trade-offs
4. Execute and verify compilation

