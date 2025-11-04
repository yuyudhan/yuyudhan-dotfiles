Purpose: Enhance UI for visual elegance and professional appearance using ShadCN and Tailwind.

Scope: Enhance only the specific UI components, pages, or features provided in the context.

Philosophy: Elegant simplicity, enterprise-grade aesthetic, usability first, purposeful subtle animations, consistent design.

Assessment Areas:

Layout & Spacing:
- Consistent padding/margin scale (4, 8, 16, 24, 32px)
- Max-width containers (`max-w-7xl`, `max-w-5xl`)
- Page padding (`px-4 md:px-6 lg:px-8`)
- Responsive breakpoints, no layout shift

Typography:
- Heading hierarchy (h1-h6)
- Readable sizes (14px min body, 1.5-1.75 line-height)
- Proper weights, muted text (`text-muted-foreground`)

Color & Contrast:
- WCAG AA compliance
- Consistent palette, neutrals dominant, accent colors sparse

Components:
- Use ShadCN components, match style for custom ones
- Consistent border radius (`rounded-md`), subtle shadows
- Defined hover/focus states

Interactions:
- Loading states, success/error feedback, form validation
- Smooth transitions (hover: 150ms, standard: 200ms, page: 300ms, max: 500ms)
- Animate: page/modal transitions, loading, confirmations, expand/collapse
- Don't animate: static content, typing, excessive decorations

Accessibility:
- Visible focus indicators, ARIA labels, keyboard navigation
- Color not sole indicator, sufficient contrast

Output:
- Summary: visual improvements, components refactored, animations added
- Changes by category: Layout, Typography, Components, Interactions, Polish
- Before/after highlights with file:line references
- Further recommendations if applicable

