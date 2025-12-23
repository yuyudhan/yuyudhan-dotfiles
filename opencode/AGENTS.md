<!-- FilePath: opencode/AGENTS.md -->

# Agent Development Guidelines

Core development guidelines for AI assistants. Project-specific rules in `docs/constitution.md` take precedence.

## Critical Rules

- 4 spaces indentation (all files, all languages)
- 80 char line width
- Split files at ~300 lines into modules/components
- ALWAYS use Make commands (never run docker/npm/cargo directly)
- Check logs after changes: `make logs-<service>`
- Backend must compile: `cargo check` before proceeding
- Never commit broken code (linters pass, tests pass, no debug statements)
- Keep `.editorconfig`, `.gitignore`, `README.md` updated

## Documentation & Libraries

- Always use context7 MCP tools when you need code generation, setup steps, or library/API documentation
- Use context7 to resolve library IDs and fetch up-to-date docs without being asked
- For specific libraries, use the slash syntax (e.g., `/nextjs/docs`, `/supabase/supabase`) to skip resolution

## Code Quality

- Use language-specific best practices
- Modular, well-structured, well-designed code
- Check linters/clippy and resolve all issues
- Add proper logging: INFO, WARN, DEBUG, ERROR
- Comments explain WHY, not WHAT
- Never log secrets (passwords, tokens, API keys)
- Include context in logs (user_id, request_id)

## Environment Variables

- Single `.env` at root with project prefix (`DHRUV_`, `MUKHAM_`)
- Service-specific vars in `docker-compose.yml` environment sections
- Always update `.env.example` when changing `.env`

## Database (Development)

- NO migrations during development
- Edit base files and reset: `make db-reset`
- Structure:
  - `setup/db/init/003_create_tables.sql` - ALL tables ONLY
  - `setup/db/init/005_create_indexes.sql` - ALL indexes ONLY
  - `setup/db/seed/` - Seeding only
- NO ALTER TABLE statements

## API Response Format

All endpoints use this structure:

```json
{
    "success": true,
    "message": "...",
    "timestamp": "2024-01-01T12:00:00Z",
    "reference_id": "uuid-v4",
    "response_time_ms": 45.23,
    "data": {},
    "error": {
        "code": "ERROR_CODE",
        "errorMessage": "Technical message",
        "userMessage": "User-friendly message"
    }
}
```

- Error codes: UPPER_SNAKE_CASE (VALIDATION_ERROR, NOT_FOUND)
- `data` is null on error, `error` is null on success

## Testing

- Tests simulate real clients (use public APIs, no direct imports)
- Organization: `tests/api-category/feature/{happy-path,errors,edge-cases}.test.js`
- Categories: Happy path, Errors, Edge cases, Performance, Integration

## Backend Architecture

**Three-layer pattern:**
1. Routes - Router config
2. Controllers - Validation, request/response handling
3. Services - Business logic, database ops

**Flow:**
Request → Routes → Controller (validate) → Service (process) → Controller (format) → Response

**Error handling:**
- Services return `Result<T, ServiceError>`
- Controllers map to HTTP responses

## Security Essentials

- JWT for sessions, API keys for programmatic access
- Bcrypt cost 12+
- Multi-tenant: strict `org_id` separation at database level
- CORS whitelisting, rate limiting, request size limits

## Git Commits

Emoji prefixes:
- ⚙️ Config
- 🗄️ Database
- 🐳 Docker
- ✨ Features
- 🐛 Bugs
- ♻️ Refactor
- 📝 Docs

