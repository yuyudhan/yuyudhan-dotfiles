Purpose: Refactor frontend code for proper architecture, reusability, and maintainability.

Scope: Refactor only the specific components, pages, or features provided in the context.

Pre-Analysis:
- Search for existing reusable components (don't reinvent)
- Identify established patterns for similar functionality
- Find code duplication opportunities
- Note current state management and styling patterns

Principles:
- Single responsibility: one purpose per component, separate presentation from logic
- Reusability first: prefer existing components, extract repeated patterns, make generic/configurable
- Proper hierarchy: logical parent-child, clear data flow (props down, events up)
- Separation: business logic in hooks/utilities, UI focused on presentation

State Strategy:
- Local: component-specific
- Context: shared within feature/module
- Global store: app-wide (Zustand/Redux)
- Server: async data (React Query/SWR)

Output:
- Summary: components created/modified/removed, existing components reused
- Changes: hierarchy updates, new patterns, state management changes
- Files modified with specific refactoring applied
- Trade-offs or follow-up recommendations if applicable
