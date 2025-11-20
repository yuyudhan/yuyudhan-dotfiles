Purpose: Migrate hardcoded values to centralized settings configuration.

Scope: Only specific files, endpoints, flows, or features in context.

Find and Fix:
- Magic numbers: timeouts, retry limits, rate limits, buffer/batch sizes, thresholds
- Configuration: API endpoints, URLs, ports, feature flags, pool sizes, cache TTL
- Business logic constants embedded in code

Settings Structure:
- Centralize: Single source of truth, logical grouping (database, server, cache, apis)
- Type safety: Duration not u64, Url not String, custom domain types
- Validation: serde validators, sensible defaults with justification
- Required vs optional: no defaults for critical prod config

Output:
- Hardcoded values moved with file:line
- Settings fields added/changed
- Environment variables updated
- Validation added
- Update .env.example, config.toml.example

