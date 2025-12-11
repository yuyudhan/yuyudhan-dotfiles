Purpose: Create frontend UI with stubbed backend responses in API integration layer only.

Scope: Specific features/components provided in context.

Pre-Implementation:
- Examine existing API integration structure and stubbing patterns
- Identify similar features for consistency
- Find shared utilities/helpers

Core Principles:
- API Layer Only: ALL stubbing in integration layer, never in pages/components/templates
- Presentation Agnostic: Components receive data via props/state as if real backend
- Backend-Driven Design: Stubs define future backend contract
- Realistic Structures: Pagination, filtering, sorting, error states

UX Considerations (ASK when unclear):
- Loading/error/empty states
- Data dependencies and relationships
- User actions triggering updates
- Edge case handling

Implementation:
- Follow existing file organization and naming
- Design realistic request/response structures
- Include multiple scenarios (empty, partial, full, error)
- Add JSDoc comments for contract
- Wire to components via proper channels (props, context, stores)
- Keep components pure, avoid hardcoded data

Output:
- API integration files created/modified
- Stub data scenarios included
- Component wiring approach
- Type definitions/interfaces
- Future backend considerations

Remember: Only API integration layer changes when backend is built.
