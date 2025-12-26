---
description: Fix React/frontend anti-patterns
model: anthropic/claude-sonnet-4-5
---

Purpose: Identify and fix React/frontend anti-patterns (React primary, fallback: Preact, Vue, Svelte).

Scope: Only specific components, hooks, pages, or modules in context.

Categories:
- Performance: Missing memo/useMemo/useCallback, inline functions/objects, derived state in useState, wrong keys, unnecessary re-renders, missing code splitting
- State: Prop drilling (3+ levels), state mutations, stale closures, race conditions, missing cleanup, infinite loops
- Hooks: Conditional hooks, wrong/missing deps, useEffect for computed values, no cleanup/AbortController
- Component: God components (>300 lines), tight coupling, missing error boundaries, mixed business/presentation logic
- TypeScript: Excessive `any`, loose types, hiding issues with assertions
- Security: dangerouslySetInnerHTML without sanitization, XSS, secrets in client, missing validation
- Accessibility: Missing ARIA, non-semantic HTML, no keyboard nav, unlabeled inputs, poor contrast
- React-Specific: Wrong useEffect deps, missing loading/error states, no Suspense for lazy, legacy context

Severity:
- 🔴 HIGH: Security, infinite loops, memory leaks, XSS
- 🟡 MEDIUM: Performance, bad UX, accessibility
- 🟢 LOW: Code smell, minor optimizations

Output:
- Issues with file:line, severity, fix
- Summary by severity/category
- Before/after for major changes
- ESLint rule recommendations

