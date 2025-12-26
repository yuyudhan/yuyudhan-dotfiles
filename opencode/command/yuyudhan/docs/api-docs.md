---
description: Generate and update API documentation
model: anthropic/claude-sonnet-4-5
---

Purpose: Generate and update API documentation for the provided endpoints or modules.

Scope: Document only the specific API endpoints, modules, or routes provided in the context.

Location:
- Primary: documentation portal if exists in project
- Fallback: `docs/api/` directory (create if doesn't exist)
- Always keep `docs/api/` up to date regardless

Content Requirements:
- Endpoint path, method (GET/POST/PUT/DELETE)
- Request parameters (path, query, body) with types
- Request/response examples (JSON/format used)
- Authentication/authorization requirements
- Error codes with meanings and examples
- Rate limiting or other constraints if applicable

Format:
- Markdown with clear sections per endpoint
- Code blocks for request/response examples
- Tables for parameters/error codes
- Clear headings: Endpoint → Request → Response → Errors

Output:
- File path(s) where documentation saved
- List of endpoints documented
- Brief summary of API functionality
