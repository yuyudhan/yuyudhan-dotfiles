Purpose: Run pre-commit validation for the provided code context.

Scope: Validate only the specific code flow, files, endpoints, or features provided in the context.

Validation:
1. Check Makefile for commands: test, lint, format, build, logs-*, dev-*
2. Run compilation/build (verify no errors)
3. Run tests (prefer fast commands: `make test-fast`)
4. Run linters and formatters
5. Check for hardcoded secrets, API keys, environment-specific values
6. Verify .env.example updated if new variables added
7. Run logs/dev commands if relevant to validation context

Output:
- Pass/fail status per step
- Errors with file:line locations
- Summary of validated items
- Required fixes before commit

