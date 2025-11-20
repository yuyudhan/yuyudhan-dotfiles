Purpose: Migrate hardcoded values to centralized frontend configuration.

Scope: Only specific components, pages, features, or modules in context.

Find and Fix:
- API/Services: base URLs, endpoints, WebSocket URLs, API keys, timeouts, retry logic
- UI Config: pagination limits, debounce delays, animation durations, upload sizes
- Feature Flags: embedded booleans, toggles, A/B tests
- Business Logic: validation rules, thresholds, formats, defaults

Configuration:
- Centralize: Single config module (src/config/index.ts), logical grouping
- Env Variables: Proper prefixes (VITE_, NEXT_PUBLIC_, REACT_APP_)
- Type Safety: TypeScript interfaces, const assertions, validate at startup
- Access: Import from config not process.env, avoid prop drilling

Output:
- Hardcoded values moved with file:line
- Config structure/types created/updated
- .env.example updated
- Runtime validation (zod/yup) if needed
