// FilePath: raycast/create-raycast-json.js

/**
 * @file This script generates snippet objects for rewrite, editing, and utility prompts,
 *       and compiles them into a 'snippets.json' file for Raycast.
 *       It ensures each snippet is optimized for LLM prompting to produce high-quality outputs
 *       by incorporating best practices, edge case considerations, and comprehensive instructions.
 *       Run this script using Node.js to regenerate 'snippets.json' after modifications.
 */

const fs = require('fs');
const path = require('path');

const rewriteGenericFile = {
    name: "rewrite: Generic File Rewrite",
    text: `
Rewrite this file to achieve exceptional standards of quality, scalability, security, and maintainability, regardless of its specific type or purpose. Follow these detailed instructions to ensure best practices are implemented comprehensively.

**File Header & Documentation:**
  - **File Path Comment:** Start with a comment on the first line indicating the file path (e.g., '// File: src/path/to/file.ext'). Follow with an empty second line.
  - **Informative Header:** Include a multi-line comment block documenting:
    - The file's purpose and role within the broader system or application.
    - Key functionalities or content implemented in the file.
    - General considerations relevant to the file type (e.g., code, configuration, documentation).
    - Guidance for future maintainers to ensure long-term usability and scalability.

**Content Quality & Best Practices:**
  - **Clean Formatting & Consistency:** Enforce rigorous formatting standards appropriate to the file type (e.g., code linting, text structuring) to ensure readability and consistency.
  - **Optimized, Scalable, and Reliable Content:**
    - Modularity & Separation of Concerns: Structure the file into logical sections, modules, or components with clear responsibilities to enhance maintainability and testability.
    - Efficient Processing: Optimize operations for performance, using asynchronous techniques, lazy loading, or efficient algorithms as applicable to the file’s context.
    - Validation & Integrity: Implement robust validation and integrity checks for any inputs, data, or configurations to prevent errors and ensure reliability.
    - Resource Management: Optimize resource usage (e.g., memory, connections, file handles) to support scalability and efficient operation under load.

**Functionality, Performance & Security:**
  - **Core Functionality:** Ensure the file fulfills its intended purpose effectively, with all critical operations or content clearly defined and executed.
  - **Performance Optimization:** Design for optimal performance by minimizing bottlenecks, employing caching where appropriate, and optimizing resource-intensive operations.
  - **Strict Security Practices:**
    - Input Validation & Sanitization: Rigorously validate and sanitize all inputs or data at entry points to prevent vulnerabilities (e.g., injection attacks, data corruption).
    - Access Control: Implement or reinforce access control mechanisms to protect sensitive operations or data, ensuring least privilege principles.
    - Rate Limiting & Abuse Prevention: Apply rate limiting or similar techniques if applicable to prevent abuse and ensure availability.
    - Secure Configuration: Externalize and protect sensitive configurations (e.g., credentials, keys) to avoid hardcoding and exposure.
    - Auditing & Monitoring: Incorporate mechanisms to log or track significant events for auditing and debugging purposes.

**Logging & Error Handling:**
  - **Robust Logging:** Implement comprehensive logging tailored to the file type (e.g., code-level logs, execution tracking) at appropriate levels (info, debug, warn, error) to aid monitoring and troubleshooting.
  - **Comprehensive Error Handling:**
    - Centralized Error Management: Use centralized mechanisms (e.g., try-catch, error handlers) to manage errors consistently, log them, and prevent unhandled failures.
    - Graceful Failure: Ensure the file handles failures gracefully, providing meaningful feedback or fallback options without exposing sensitive details.
    - Monitoring Integration: Design error handling to support integration with monitoring tools for proactive issue detection.

**Commenting Strategies:**
  - **Meaningful Guidance Comments:** Add comments judiciously to explain complex logic, critical decisions, or integration points, enhancing understanding for future maintainers.
  - **Avoid Superfluous Comments:** Refrain from redundant or obvious comments that do not add significant value to the file’s comprehension.

**Edge Cases & General Considerations:**
  - **Scalability:** Design the file to handle increased load or complexity, considering horizontal scaling, resource efficiency, or extensibility as relevant.
  - **Compatibility:** Ensure compatibility with intended environments, tools, or systems, addressing platform-specific nuances where necessary.
    - **Performance Under Load:** Optimize for performance under high usage or large data scenarios, addressing potential bottlenecks.
    - **Interoperability:** If the file interacts with other components, ensure robust and secure communication or data exchange mechanisms.
    - **Maintainability:** Structure the file to facilitate updates, testing, and debugging over time, reducing technical debt.

By meticulously adhering to these instructions, ensure this rewritten file becomes a robust, secure, scalable, and maintainable asset, embodying industry best practices tailored to its specific type and purpose, and performing reliably across diverse conditions.
`
};

// Rewrite snippets (names now start with "rewrite:") - Optimized for LLM prompting
const rewriteReactOnly = {
    name: "rewrite: React-Only with Tailwind Frontend File Rewrite",
    text: `
Rewrite this React frontend file to the highest standards of quality, maintainability, and user experience. Follow the detailed instructions below meticulously to ensure best practices and robust code.

**File Header & Documentation:**
  - **File Path Comment:** On the first line, add a comment with the full file path (e.g., '// File: src/components/ComponentName.jsx'). Follow with an empty second line.
  - **Descriptive Header:** Insert a multi-line comment block after the file path, explaining:
    - The file's purpose and role in the application.
    - Key functionalities implemented in this file.
    - Any important context or developer guidance for future maintainers.

**Code Quality & Best Practices:**
  - **Clean Code Formatting & Linting:** Enforce strict code formatting (Prettier-like) and resolve all linting errors/warnings (ESLint recommended).
  - **Maintainable & Optimized React Code:**
    - Componentization: Break down complex UI into smaller, reusable, and focused components.
    - Separation of Concerns:  Clearly separate UI, logic, and data handling. Use custom hooks for complex logic extraction.
    - DRY (Don't Repeat Yourself): Refactor any duplicated code into reusable components or functions.
    - Efficient State Management: Optimize state usage to minimize re-renders. Prefer simple useState/useReducer; consider Context or Redux for complex scenarios only when justified. Avoid prop drilling.
    - Performance Optimization: Memoize components (React.memo), functions (useCallback), and values (useMemo) to prevent unnecessary re-renders. Lazy load components where beneficial.

**Functionality & User Experience (UX):**
  - **Accessibility (A11y):** Ensure full WCAG compliance: semantic HTML, ARIA attributes, keyboard navigation, screen reader compatibility, sufficient color contrast.
  - **Responsiveness:**  Design for all screen sizes (desktop, tablet, mobile) using Tailwind CSS responsive modifiers (sm: , md: , lg: , xl: ). Implement flexible layouts.
  - **Smooth Animations & Transitions:** Enhance UX with subtle animations and transitions using Tailwind CSS utilities or dedicated animation libraries if complexity warrants.

**Logging & Error Handling:**
  - **Robust Logging:** Implement comprehensive logging using logger.(info, debug, warn, error) at key points: component lifecycle, user actions, API calls, and error conditions. Include contextual information in logs.
  - **Comprehensive Error Handling:**
    - try...catch blocks for synchronous operations.
    - Error Boundaries to catch React errors and provide fallback UI.
    - Graceful degradation: prevent complete failures; offer alternative functionality or user-friendly error messages.
    - Avoid exposing sensitive information in error messages. Log detailed errors internally.

**Output Quality & Tech Stack:**
  - **Elegant Output:** Deliver a visually polished and consistent UI. Ensure proper spacing, typography, and color palette alignment with the application's design system.
  - **Dark Mode Support:**  Fully support both standard and dark modes using Tailwind CSS dark mode variants (\`dark: \`). Ensure consistent visual experience across themes.
  - **Tailwind CSS & shadcn/ui:**  Strictly use Tailwind CSS for all styling. Utilize shadcn/ui components for UI elements wherever applicable to ensure consistency and accessibility. Minimize custom CSS; justify any exceptions with comments.

**Commenting Strategy:**
  - **Value-Driven Comments:**  Add comments only when they provide significant value: explain complex logic, non-obvious decisions, or guide fellow developers.
  - **Avoid Trivial Comments:** Do not comment on obvious code, input/output, or simply rephrase the code. Focus on 'why' over 'what'.

**Edge Cases & Considerations:**
  - **Data Handling:** Account for loading states, empty data sets, data validation, and potential API errors.
  - **Browser Compatibility:**  Ensure compatibility across modern browsers and address any browser-specific issues.
  - **Performance Bottlenecks:** Identify and optimize any performance-critical sections of the code, especially in rendering and data processing.
  - **Security:** Sanitize user inputs and be mindful of potential XSS vulnerabilities, especially when rendering user-generated content.

By following these detailed instructions, ensure the rewritten file represents the pinnacle of React frontend development, optimized for performance, maintainability, and a superior user experience.
`
};

const rewriteNextjsFrontend = {
    name: "rewrite: Next.js Frontend File Rewrite",
    text: `
Rewrite this Next.js frontend file to embody best practices for performance, scalability, and user experience within the Next.js ecosystem. Adhere to the following detailed instructions.

**File Header & Documentation:**
  - **File Path Comment:** Start with a comment on the first line indicating the file path (e.g., '// File: pages/dashboard/index.js'). Follow with an empty second line.
  - **Comprehensive Header:**  Include a multi-line comment block detailing:
    - The file's role within the Next.js application (e.g., page, component, API route).
    - Key functionalities and data flow implemented.
    - Next.js specific considerations (e.g., SSR, SSG, API route handling).
    - Guidance for future developers.

**Code Quality & Next.js Best Practices:**
  - **Clean Code & Linting:** Enforce strict formatting (Prettier) and eliminate linting issues (ESLint with Next.js config).
  - **Maintainable & Optimized Next.js Code:**
    - Pages & Components: Structure pages and components for reusability and maintainability. Leverage Next.js folder structure conventions.
    - Data Fetching Strategy: Optimize data fetching with appropriate strategies (getServerSideProps, getStaticProps, getStaticPaths, or client-side fetching with SWR/React Query) based on data freshness and performance needs.
    - API Routes:  For API routes, ensure proper routing, request handling, and response formatting following RESTful principles.
    - Dynamic Imports & Lazy Loading:  Implement dynamic imports for components and modules to improve initial load time and optimize bundle size.
    - State Management: Use efficient state management appropriate for Next.js apps (useState, useReducer, Context API, or state management libraries if complexity demands).
    - Performance: Optimize rendering, caching, and prefetching strategies specific to Next.js. Use \`< Image > \`, \` < Link > \` components effectively.

**Functionality & User Experience (UX):**
  - **Sleek & Responsive Design:** Create a visually appealing, modern design compatible with dark mode. Ensure responsiveness across all devices using Tailwind CSS.
  - **Accessibility (A11y):**  Prioritize accessibility adhering to WCAG standards. Use semantic HTML, ARIA, keyboard navigation, screen reader support, and sufficient color contrast.
  - **Smooth Animations:** Enhance UX with subtle, performant animations and transitions.

**Performance & Security in Next.js:**
  - **Routing & Caching:**  Optimize Next.js routing and leverage built-in caching mechanisms (e.g., ISR, client-side caching) to improve page load times and reduce server load.
  - **Prefetching:** Implement \`< Link > \` prefetching for smooth navigation and improved perceived performance.
  - **TypeScript Type Safety:**  Utilize TypeScript for robust type safety throughout the codebase to prevent runtime errors and improve maintainability.
  - **Security Best Practices:**
    - Input Validation:  Strictly validate all user inputs, especially in API routes.
    - Rate Limiting: Implement rate limiting in API routes to protect against abuse.
    - Authentication/Authorization: Secure API routes and pages requiring authentication using Next.js authentication patterns and libraries like NextAuth.js.

**Logging & Error Handling:**
  - **Robust Logging:** Implement comprehensive logging (logger.info, logger.debug, logger.warn, logger.error) across frontend and backend (API routes) for debugging, monitoring, and issue tracking.
  - **Comprehensive Error Handling:**
    - Frontend: Implement Error Boundaries, handle fetch errors gracefully, and display user-friendly error messages.
    - Backend (API Routes): Implement robust error handling in API routes to catch exceptions, log errors, and return appropriate HTTP error responses without exposing sensitive information.

**Tech Stack & Commenting:**
  - **Tailwind CSS & shadcn/ui:**  Consistently use Tailwind CSS for styling and shadcn/ui components for UI elements. Avoid inline styles or custom CSS unless absolutely necessary and well-documented.
  - **Meaningful Comments:** Add comments that explain complex logic, Next.js specific implementation details, or provide valuable context for other developers. Avoid obvious or redundant comments.

**Edge Cases & Next.js Specifics:**
  - **Server-Side Rendering (SSR) & Client-Side Rendering (CSR) Considerations:**  Carefully consider when to use SSR vs. CSR and optimize data fetching accordingly. Address potential hydration issues with SSR.
  - **API Route Security:**  Thoroughly secure Next.js API routes against common web vulnerabilities (CSRF, XSS, SQL Injection if interacting with databases, etc.).
  - **Environment Variables:**  Manage environment variables securely using Next.js environment variable conventions and avoid exposing secrets in client-side code.
  - **Image Optimization:**  Use Next.js \`< Image > \` component for optimized image loading and handling different image formats and sizes.

By diligently following these instructions, ensure the rewritten Next.js frontend file is a model of modern web development, leveraging Next.js features to their fullest potential while prioritizing performance, security, and an exceptional user experience.
`
};

const rewriteReactComponent = {
    name: "rewrite: React Component File Rewrite",
    text: `
Rewrite this React component file to be a paragon of reusability, performance, and maintainability. Adhere to the following instructions to create a best-in-class React component.

**File Header & Documentation:**
  - **File Path Comment:** Begin with a comment on the first line stating the file path (e.g., '// File: src/components/Button/Button.jsx'). Follow with an empty second line.
  - **Component Header:**  Include a multi-line comment block at the top, documenting:
    - The component's purpose and functionality.
    - Props accepted by the component, including types and descriptions.
    - Any specific usage instructions or context for developers.
    - Consider using JSDoc style comments for enhanced documentation.

**Code Quality & Component Best Practices:**
  - **Clean Formatting & Linting:** Ensure code is perfectly formatted and passes all linting checks.
  - **Optimized & Reusable React Component Code:**
    - Component Composition: Design the component to be composable and flexible, allowing for extension and customization through props and children.
    - Prop Types & Validation:  Define clear prop types and consider using PropTypes or TypeScript for prop validation to catch type-related errors early.
    - Stateless vs. Stateful: Choose the appropriate component type (functional with hooks or class-based) based on complexity and state management needs. Prefer functional components with hooks where possible for simplicity.
    - Hooks for Logic: Extract complex logic into custom hooks to enhance reusability and testability.
    - Performance Optimization: Implement memoization (React.memo) where component re-renders might be costly. Use useCallback and useMemo to optimize function and value creation within the component.

**Functionality & UX:**
  - **Accessibility (A11y):** Make the component fully accessible, following WCAG guidelines. Include semantic HTML, ARIA attributes, keyboard navigation, and screen reader compatibility.
  - **Responsiveness:**  Ensure the component is responsive and adapts to various screen sizes. Use Tailwind CSS responsive classes for styling.
  - **Animation Integration:** Design the component to seamlessly integrate with animations if needed. Consider using CSS transitions or animation libraries for smooth effects.

**Tech Stack & Implementation:**
  - **Tailwind CSS & shadcn/ui:**  Consistently use Tailwind CSS for styling and leverage shadcn/ui components for base UI elements (if applicable and enhances consistency).
  - **State Management (Within Component):**  Use efficient local state management (useState, useReducer) within the component as needed. Avoid over-complicating state if simpler solutions suffice.

**Logging & Error Handling (Component Level):**
  - **Logging (As Needed):** Include logging (logger.info, logger.debug, logger.warn, logger.error) at relevant points within the component lifecycle or event handlers for debugging purposes.
  - **Error Handling:** Implement error handling within the component to gracefully manage potential issues (e.g., input validation errors, unexpected data). Use try...catch for synchronous operations.

**Commenting Strategies:**
  - **Guidance-Focused Comments:** Add comments that provide valuable guidance, especially for component props, complex logic, or non-obvious implementation details.
  - **Avoid Redundant Comments:**  Do not add comments that merely repeat what the code is already doing.

**Edge Cases & Component Considerations:**
  - **Prop Variations & Edge Cases:**  Consider different prop combinations and edge cases for prop values. Document expected prop behavior and limitations.
  - **Component Lifecycle & Side Effects:**  Manage component lifecycle events (mounting, updating, unmounting) and side effects (API calls, DOM manipulations) carefully using hooks (useEffect). Clean up side effects to prevent memory leaks.
  - **Testing:**  Structure the component to be easily testable. (Note: Testing instructions can be expanded in separate prompts focusing on testing).

By adhering to these comprehensive instructions, ensure this rewritten React component is a robust, reusable, and high-performing building block for your application, embodying best practices in component design and development.
`
};

const rewriteGenericFrontend = {
    name: "rewrite: Generic Frontend File Rewrite",
    text: `
Rewrite this generic frontend file to achieve a high standard of quality, maintainability, and optimal user experience. Follow the detailed instructions below to ensure best practices across various frontend technologies.

**File Header & Documentation:**
  - **File Path Comment:** Begin with a comment on the first line indicating the file path (e.g., '// File: src/js/utils.js'). Follow with an empty second line.
  - **Descriptive Header:**  Include a multi-line comment block at the top explaining:
    - The file's purpose and role in the frontend application.
    - Key functionalities implemented in this file.
    - Any important context or guidance for other developers maintaining the code.

**Code Quality & Best Practices:**
  - **Clean Code & Linting:** Enforce rigorous code formatting and resolve all linting warnings and errors.
  - **Maintainable & Optimized Code:**
    - Modularity: Break down code into logical modules, functions, or classes with clear responsibilities.
    - Separation of Concerns:  Separate UI logic (if applicable), business logic, and data handling for better organization and maintainability.
    - DRY (Don't Repeat Yourself): Refactor duplicated code into reusable functions or modules.
    - Performance Optimization: Identify and address potential performance bottlenecks. Implement lazy loading, caching, and memoization where appropriate to enhance responsiveness.

**Functionality & User Experience (UX):**
  - **Elegant & Responsive Design:** Create a visually appealing and responsive design compatible with dark mode (if UI elements are present). Use CSS frameworks like Tailwind CSS or similar for styling and responsiveness.
  - **Accessibility (A11y):** Ensure accessibility compliance (WCAG guidelines) for any UI elements in the file. Use semantic HTML (if applicable), ARIA attributes, keyboard navigation, etc.
  - **Smooth Animations & Transitions:** Implement subtle animations and transitions to improve UX, using CSS or JavaScript animation libraries as needed.

**Performance & State Management:**
  - **Lazy Loading:** Implement lazy loading for modules, components, or resources to improve initial load times.
  - **Efficient State Management:** Choose appropriate state management strategies based on the complexity of the application. Consider simple state management for local needs and more robust solutions (like state management libraries) for complex application-wide state.
  - **Caching:** Implement caching mechanisms (client-side or server-side if applicable) to reduce redundant computations or data fetches.
  - **Memoization:** Utilize memoization techniques to optimize performance by avoiding unnecessary recalculations or re-renders.

**Tech Stack Specifics:**
  - **Tailwind CSS & shadcn/ui (If UI Present):** If the file includes UI-related code (HTML, components), consistently use Tailwind CSS for styling and shadcn/ui components where applicable for visual consistency and accessibility.

**Logging & Error Handling:**
  - **Robust Logging:** Add comprehensive logging (logger.info, logger.debug, logger.warn, logger.error) throughout the code to aid debugging, monitoring, and understanding application behavior.
  - **Comprehensive Error Handling:** Implement robust error handling using try...catch blocks, error boundaries (if React or similar UI framework), and graceful failure mechanisms. Provide user-friendly error messages without exposing sensitive technical details. Log detailed errors internally for debugging.

**Commenting Strategies:**
  - **Useful Guidance Comments:**  Include comments that provide real value to other developers: explaining complex algorithms, non-trivial logic, or design decisions.
  - **Avoid Superfluous Comments:** Do not add comments that are obvious, redundant, or simply restate what the code is already doing.

**Edge Cases & Generic Frontend Considerations:**
  - **Cross-Browser Compatibility:**  Ensure code compatibility across different browsers and address browser-specific issues.
  - **Performance Across Devices:** Optimize performance for various devices, including low-powered mobile devices.
  - **Security (Frontend Specific):** Be mindful of frontend security best practices, including preventing XSS vulnerabilities and handling user input securely.
  - **Resource Management:** Optimize loading of external resources (images, scripts, stylesheets) to improve page load performance.

By meticulously following these instructions, ensure this rewritten generic frontend file becomes a model of high-quality frontend code, optimized for performance, maintainability, and a superior user experience, regardless of the specific frontend framework or libraries in use.
`
};

const rewriteNextjsBackend = {
    name: "rewrite: Next.js Backend File Rewrite",
    text: `
Rewrite this Next.js backend (API route or backend logic) file to meet the highest standards of performance, security, and maintainability, leveraging Next.js backend capabilities. Adhere strictly to the following instructions.

**File Header & Documentation:**
  - **File Path Comment:** Start with a comment on the first line with the file path (e.g., '// File: pages/api/users.js'). Follow with an empty second line.
  - **Detailed Header:** Include a multi-line comment block explaining:
    - The file's purpose as a Next.js backend component (API route, server-side utility).
    - Functionalities implemented, including API endpoints and data handling.
    - Next.js backend specific considerations (API route handlers, server-side functions).
    - Developer guidance for maintenance and extension.

**Code Quality & Backend Best Practices in Next.js:**
  - **Clean Code & Linting:** Enforce strict code formatting and eliminate all linting errors and warnings.
  - **Optimized, Scalable, and Bug-Free Code:**
    - API Route Structure: Organize API routes logically and adhere to RESTful principles for API design.
    - Server-Side Functions:  Structure server-side utility functions for reusability and testability.
    - Asynchronous Operations:  Handle asynchronous operations properly using async/await and Promises to avoid blocking the event loop.
    - Data Validation & Sanitization:  Implement robust input validation and sanitization to prevent security vulnerabilities and data integrity issues.
    - Database Interactions (if applicable):  Optimize database queries, use connection pooling, and follow ORM/database best practices.

**Functionality, Performance & Security (Backend Focus):**
  - **Efficient Routing:** Ensure efficient Next.js API routing and handle different HTTP methods appropriately.
  - **Atomic Transactions:** Implement atomic transactions for operations involving database modifications to ensure data consistency and integrity.
  - **Performance Optimization:** Optimize backend performance through efficient algorithms, caching (server-side caching), and connection pooling.
  - **Strict Security Practices:**
    - Input Validation: Validate and sanitize all inputs rigorously to prevent injection attacks (SQL, NoSQL, command injection, etc.).
    - Rate Limiting: Implement rate limiting to protect against DDoS attacks and abuse.
    - Authentication/Authorization: Secure API routes using robust authentication and authorization mechanisms (JWT, NextAuth.js, etc.) to protect sensitive data and operations.
    - CORS & Headers: Configure CORS and HTTP headers appropriately to enhance security and control access.
    - Secrets Management: Securely manage API keys, database credentials, and other secrets; avoid hardcoding secrets in code.

**Logging & Error Handling (Backend):**
  - **Robust Logging:** Implement comprehensive logging (logger.info, logger.debug, logger.warn, logger.error) for all critical backend operations, requests, responses, errors, and security events. Utilize structured logging for easier analysis.
  - **Comprehensive Error Handling:**
    - API Route Error Handling: Implement robust error handling in API route handlers to catch exceptions, log errors, and return appropriate HTTP error responses (e.g., 500 for server errors, 400 for bad requests) without exposing sensitive data or stack traces to clients.
    - Graceful Failure Responses: Ensure graceful failure responses and informative error messages for API consumers.

**Commenting Strategies:**
  - **Meaningful Guidance Comments:**  Include comments that provide meaningful guidance, especially for complex backend logic, security considerations, API endpoint documentation, or database interactions.
  - **Avoid Trivial Comments:** Refrain from adding comments that are self-evident or do not add value to understanding the backend logic.

**Edge Cases & Backend Specifics for Next.js:**
  - **API Route Concurrency & Scalability:**  Consider concurrency limits and scalability of Next.js API routes under heavy load. Implement measures to handle high traffic.
  - **Serverless Functions Limits (If Deploying as Serverless):** Be aware of limitations of serverless function environments (if deploying Next.js API routes as serverless functions), such as execution timeouts and memory limits. Optimize code to stay within these limits.
  - **Database Connection Management:**  Manage database connections efficiently, especially in serverless environments where connection pooling and reuse are crucial.
  - **Security Vulnerability Scanning:**  Regularly scan backend code and dependencies for security vulnerabilities and apply necessary patches and updates.

By meticulously following these instructions, ensure this rewritten Next.js backend file is a highly secure, performant, and maintainable component of your Next.js application, adhering to backend development best practices and leveraging Next.js server-side capabilities effectively.
`
};

const rewriteFastifyBackend = {
    name: "rewrite: Fastify Backend File Rewrite",
    text: `
Rewrite this Fastify backend file to exemplify high performance, robust security, and maintainability, leveraging Fastify's strengths as a backend framework. Adhere strictly to the following instructions.

**File Header & Documentation:**
  - **File Path Comment:** Begin with a comment on the first line stating the file path (e.g., '// File: src/routes/users.js'). Follow with an empty second line.
  - **Detailed Header:** Include a multi-line comment block at the beginning, documenting:
    - The file's purpose within the Fastify application (e.g., route definition, plugin, utility function).
    - Functionalities implemented, including API endpoints and data processing.
    - Fastify-specific considerations (e.g., route handlers, plugins, hooks).
    - Developer guidance for future modifications and maintenance.

**Code Quality & Fastify Backend Best Practices:**
  - **Strict Formatting & Linting:** Enforce rigorous code formatting and resolve all linting errors/warnings to maintain code consistency.
  - **Optimized, Scalable, and Bug-Free Fastify Code:**
    - Route Handlers:  Structure route handlers to be concise, efficient, and focused on specific API endpoint logic. Separate business logic into services or utility functions.
    - Plugins & Decorators: Utilize Fastify plugins and decorators to extend Fastify's functionality in a modular and organized way.
    - Asynchronous Operations:  Handle asynchronous operations with async/await efficiently. Fastify is built for asynchronous processing; ensure non-blocking I/O operations.
    - Schema Validation:  Implement schema validation using Fastify's built-in schema support or libraries like Joi to validate request and response data.
    - Database Interactions (if applicable):  Optimize database interactions, use connection pooling, and consider ORMs or query builders for maintainable data access logic.

**Functionality, Performance & Security (Backend Focus with Fastify):**
  - **Efficient Routing:** Leverage Fastify's highly performant routing engine. Design efficient and well-structured routes.
  - **Atomic Operations:** Ensure atomic operations when dealing with data modifications, especially in database transactions, to maintain data integrity.
  - **High Performance:** Optimize for performance throughout the backend: efficient code, minimal blocking operations, connection reuse, and potentially caching. Fastify is designed for high performance; maximize its potential.
  - **Best Security Practices in Fastify:**
    - Input Validation & Sanitization: Rigorously validate and sanitize all inputs using schemas and validation libraries to prevent injection vulnerabilities.
    - Rate Limiting: Implement rate limiting using Fastify plugins to protect against DDoS and brute-force attacks.
    - Authentication/Authorization: Secure API endpoints using robust authentication and authorization strategies (JWT, Fastify plugins for authentication).
    - CORS & Security Headers: Configure CORS and security headers appropriately using Fastify plugins to control access and enhance security posture.
    - Logging Security Events: Log security-related events (authentication failures, authorization violations, suspicious activity) for monitoring and auditing.

**Logging & Error Handling (Backend in Fastify):**
  - **Robust Logging:** Implement extensive logging using Fastify's logging system (Pino or custom logger). Log requests, responses, errors, and critical application events at appropriate levels (info, debug, warn, error). Structure logs for efficient analysis.
  - **Comprehensive Error Handling:**
    - Route Handler Error Handling: Implement error handling within route handlers to catch exceptions, log errors using Fastify logger, and return standardized error responses with appropriate HTTP status codes.
    - Custom Error Responses: Define custom error response structures to provide informative error messages to clients without exposing sensitive server details.
    - Error Handling Plugins: Consider using Fastify error handling plugins for centralized error management and consistent error response formatting.
    - Graceful Shutdown: Implement graceful shutdown handling for Fastify server to properly close connections and resources on server termination.

**Commenting Strategies (Fastify Backend):**
  - **Judicious Comments for Guidance:**  Use comments thoughtfully to provide meaningful guidance on complex route logic, Fastify plugin configurations, security implementations, or database interactions.
  - **Avoid Unnecessary Comments:**  Refrain from adding comments that are redundant, self-explanatory, or clutter the code without adding real value.

**Edge Cases & Fastify Specifics:**
  - **Asynchronous Operations Handling:**  Ensure all asynchronous operations are handled correctly in Fastify, especially within route handlers and plugins, to prevent blocking the event loop and maintain performance.
  - **Plugin Compatibility & Versioning:**  Be mindful of Fastify plugin compatibility and versioning when using community plugins. Choose well-maintained and reliable plugins.
  - **Performance Monitoring & Tuning:**  Implement performance monitoring for Fastify applications to identify bottlenecks and areas for optimization. Use Fastify's performance hooks or external monitoring tools.
  - **Security Auditing:**  Conduct regular security audits of Fastify backend applications to identify and address potential security vulnerabilities.

By adhering meticulously to these instructions, ensure this rewritten Fastify backend file becomes a model of high-performance, secure, and maintainable backend code, leveraging the best features of Fastify and following industry-leading backend development practices.
`
};

const rewriteGenericBackend = {
    name: "rewrite: Generic Backend File Rewrite",
    text: `
Rewrite this generic backend file to achieve a high standard of scalability, security, and maintainability, irrespective of the specific backend framework. Follow these detailed instructions to ensure best practices for backend development are implemented.

**File Header & Documentation:**
  - **File Path Comment:** Start with a comment on the first line indicating the file path (e.g., '// File: src/server/routes.js'). Follow with an empty second line.
  - **Informative Header:** Include a multi-line comment block documenting:
    - The file's purpose within the backend application (e.g., route definitions, middleware, utility functions).
    - Key functionalities implemented, including API endpoints, data processing, and business logic.
    - Framework-agnostic backend considerations.
    - Developer guidance for future maintenance and scalability.

**Code Quality & Generic Backend Best Practices:**
  - **Clean Formatting & Linting:** Enforce rigorous code formatting and resolve all linting errors and warnings to ensure code consistency and readability.
  - **Optimized, Scalable, and Bug-Free Code:**
    - Modularity & Separation of Concerns: Structure code into logical modules, layers (controllers, services, data access), and functions with clear responsibilities. Separate concerns effectively to improve maintainability and testability.
    - Asynchronous Programming:  Utilize asynchronous programming paradigms (async/await, Promises, callbacks) to handle I/O-bound operations efficiently and avoid blocking the main thread.
    - Data Validation & Sanitization: Implement robust input validation and sanitization at all entry points to prevent data integrity issues and security vulnerabilities.
    - Database Interactions (if applicable):  Optimize database queries, use connection pooling, and employ ORMs or query builders for maintainable and secure data access.

**Functionality, Performance & Security (Generic Backend Focus):**
  - **Atomic Operations:** Ensure atomicity for operations involving data modifications, especially within database transactions, to maintain data consistency.
  - **Optimized Performance:** Design backend for optimal performance. Employ caching (server-side caching), efficient algorithms, connection reuse, and load balancing if necessary.
  - **Strict Security Practices (Framework Agnostic):**
    - Input Validation & Sanitization: Rigorously validate and sanitize all inputs at every layer of the application to prevent injection attacks.
    - Rate Limiting & DDoS Protection: Implement rate limiting and other DDoS mitigation techniques to protect against abuse and ensure service availability.
    - Authentication/Authorization: Implement robust authentication and authorization mechanisms (OAuth 2.0, JWT, session-based authentication) to secure API endpoints and protect sensitive resources.
    - Secure Configuration Management: Manage configuration securely, externalize configurations, and protect sensitive credentials (API keys, database passwords).
    - Logging & Monitoring Security Events:  Log security-related events (authentication failures, authorization attempts, suspicious requests) for monitoring and auditing.
    - Regular Security Audits: Conduct periodic security audits and penetration testing to identify and address vulnerabilities.

**Logging & Error Handling (Generic Backend):**
  - **Robust Logging:** Implement comprehensive, structured logging across all backend components. Log requests, responses, errors, security events, and performance metrics at appropriate levels (info, debug, warn, error). Use structured logging formats (JSON) for easier analysis.
  - **Comprehensive Error Handling:**
    - Centralized Exception Handling: Implement centralized exception handling mechanisms (middleware, error handlers) to catch unhandled exceptions, log errors, and return consistent error responses.
    - Graceful Failure Responses: Ensure backend returns graceful failure responses with appropriate HTTP status codes and informative error messages to clients, without exposing sensitive server-side details.
    - Error Monitoring & Alerting:  Integrate error monitoring and alerting systems to proactively identify and address backend issues in production.

**Commenting Strategies (Generic Backend):**
  - **Meaningful, Guiding Comments:**  Use comments judiciously to provide meaningful guidance on complex backend algorithms, security implementations, data models, or integration points with other systems.
  - **Avoid Superfluous Comments:**  Refrain from adding comments that are redundant, obvious, or do not significantly enhance the understanding of the backend logic.

**Edge Cases & Generic Backend Considerations:**
  - **Scalability & Load Balancing:** Design backend with scalability in mind. Consider horizontal scaling, load balancing, and efficient resource utilization to handle increasing traffic.
  - **Database Scalability & Performance:** Address database scalability and performance bottlenecks, especially under high load. Consider database sharding, replication, and caching strategies.
  - **Inter-Service Communication (Microservices):**  If part of a microservices architecture, ensure robust and secure inter-service communication mechanisms.
  - **Security in Distributed Systems:**  Address security considerations in distributed systems, including secure service-to-service communication and distributed tracing for security auditing.
  - **Monitoring & Observability:**  Implement comprehensive monitoring and observability for backend applications to track performance, identify issues, and ensure system health.

By meticulously following these instructions, ensure this rewritten generic backend file becomes a robust, secure, scalable, and maintainable component of your backend system, embodying industry best practices for backend development and designed to perform reliably under diverse conditions.
`
};

const rewritePostgreSQL = {
    name: "rewrite: PostgreSQL File Rewrite",
    text: `
Rewrite this PostgreSQL SQL script file to optimize for performance, data integrity, and maintainability, following PostgreSQL best practices. Adhere to the following detailed instructions for SQL script enhancement.

**File Header & Documentation:**
  - **File Path Comment:** Start with a comment on the first line with the file path (e.g., '-- File: db/migrations/create_users_table.sql'). Follow with an empty second line.
  - **SQL Script Header:** Include a multi-line comment block at the beginning, explaining:
    - The script's purpose (e.g., schema migration, data seeding, stored procedure).
    - Actions performed by the script, including table creation, modifications, or data manipulation.
    - Any preconditions or dependencies for running the script.
    - Developer guidance for understanding and maintaining the SQL code.

**SQL Quality & Best Practices:**
  - **Clean Formatting & Naming Conventions:** Enforce clean SQL formatting and consistent naming conventions for tables, columns, indexes, and functions. Follow PostgreSQL SQL style guides.
  - **Maintainable & Optimized SQL Code:**
    - Modular SQL: Break down complex SQL scripts into smaller, logical units (functions, procedures, reusable queries).
    - SQL Code Reusability:  Create reusable SQL functions and views to avoid code duplication and improve maintainability.
    - Optimized Queries: Write efficient SQL queries, avoiding performance pitfalls like full table scans. Use EXPLAIN to analyze query plans and identify performance bottlenecks.
    - Indexing Strategy: Optimize indexing for frequently queried columns to improve query performance. Choose appropriate index types (B-tree, Hash, GiST, GIN) based on query patterns.

**Functionality, Performance & Security (SQL Script Focus):**
  - **Optimize Indexing:**  Review and optimize table indexing strategy. Create indexes on columns frequently used in WHERE clauses, JOIN conditions, and ORDER BY clauses. Avoid over-indexing, which can degrade write performance.
  - **Constraints & Data Integrity:**  Enforce data integrity using appropriate constraints (NOT NULL, UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK constraints). Ensure data consistency and prevent data anomalies.
  - **Query Efficiency:**  Optimize query efficiency. Avoid SELECT *, use specific column lists, minimize use of cursors and loops, and leverage set-based operations instead of row-by-row processing where possible.
  - **Atomic Transactions:**  Ensure atomic transactions for operations that modify data to maintain data consistency. Use BEGIN, COMMIT, and ROLLBACK to manage transactions explicitly.
  - **Security Best Practices in SQL:**
    - Input Validation:  If the SQL script accepts input parameters, validate and sanitize them to prevent SQL injection vulnerabilities. Use parameterized queries or prepared statements.
    - Access Control & Permissions:  Review and enforce database access control and permissions. Grant least privilege necessary to users and roles.
    - Avoid Storing Sensitive Data in Plain Text:  Hash or encrypt sensitive data when storing it in the database.

**Logging & Error Handling (SQL Context):**
  - **Logging Comments or Guidelines:**  Include comments or guidelines within the SQL script on how to monitor script execution, log relevant events, and debug potential issues. Recommend using PostgreSQL logging features for production monitoring.
  - **Proper Error Handling Strategies:**
    - SQL Error Handling: Use exception handling mechanisms within procedural SQL code (functions, procedures) to catch and handle errors gracefully. Use RAISE EXCEPTION to signal errors and provide informative error messages.
    - Transaction Rollback on Error: Ensure transactions are rolled back appropriately on error to maintain data integrity.

**Commenting Strategies (SQL Scripts):**
  - **Explain Complex Logic or Decisions:** Add comments to explain complex SQL logic, intricate queries, stored procedure algorithms, or critical schema design decisions.
  - **Avoid Unnecessary Comments:** Refrain from adding trivial comments that simply restate SQL syntax or do not add value to understanding the script's logic.

**Edge Cases & SQL Script Considerations:**
  - **Large Data Sets & Performance:**  Optimize SQL scripts for performance with large datasets. Test scripts with representative data volumes and load conditions.
  - **Concurrency & Locking:**  Consider concurrency and locking implications, especially in high-transaction environments. Design scripts to minimize locking and avoid deadlocks.
  - **Data Migration & Schema Changes:**  For data migration scripts or schema changes, ensure scripts are idempotent and reversible where possible. Plan for rollback strategies in case of errors.
  - **Database Version Compatibility:**  Ensure SQL scripts are compatible with the target PostgreSQL version and consider version-specific syntax or features.

By meticulously adhering to these instructions, ensure this rewritten PostgreSQL SQL script is highly performant, maintainable, and secure, reflecting best practices in SQL database development and optimized for PostgreSQL environments.
`
};

const rewriteMySQL = {
    name: "rewrite: MySQL File Rewrite",
    text: `
Rewrite this MySQL SQL script file to ensure optimal performance, data integrity, and maintainability, aligning with MySQL best practices. Follow these detailed instructions for enhancing the SQL script.

**File Header & Documentation:**
  - **File Path Comment:** Begin with a comment on the first line including the file path (e.g., '-- File: db/migrations/create_orders_table.sql'). Follow with an empty second line.
  - **SQL Script Header:** Include a multi-line comment block at the top, documenting:
    - The script's purpose (e.g., schema migration, data population, stored procedure definition).
    - Actions performed, such as table creation, schema alterations, or data manipulations.
    - Prerequisites or dependencies for executing the script.
    - Developer guidance for understanding and maintaining the SQL code.

**SQL Quality & Best Practices (MySQL):**
  - **Clean Formatting & Consistent Naming:**  Enforce clean, readable SQL formatting and consistent naming conventions for database objects (tables, columns, indexes, stored procedures, functions). Adhere to MySQL SQL style guides.
  - **Optimized & Bug-Free SQL Code:**
    - Modular SQL Design: Break down complex scripts into smaller, manageable, and logical units (stored procedures, functions, views, reusable queries).
    - SQL Code Reusability:  Develop reusable SQL functions, stored procedures, and views to minimize code duplication and improve maintainability.
    - Optimized Queries: Write efficient SQL queries. Analyze query performance using EXPLAIN and optimize slow-performing queries. Avoid common performance pitfalls like full table scans.
    - Indexing Strategies: Optimize indexing for frequently queried columns to enhance query speed. Choose appropriate index types (B-Tree, Hash, Fulltext, Spatial) depending on query patterns.

**Functionality, Performance & Security (MySQL Focus):**
  - **Optimize Queries & Indexing:**  Thoroughly optimize SQL queries for performance. Ensure appropriate indexes are in place for efficient data retrieval and filtering. Regularly review and optimize query execution plans using EXPLAIN.
  - **Atomic Transactions:**  Implement atomic transactions for any data modification operations to guarantee data consistency. Use START TRANSACTION, COMMIT, and ROLLBACK statements to manage transactions explicitly.
  - **Security Best Practices in MySQL:**
    - Input Validation & Prepared Statements:  Always validate and sanitize user inputs if the SQL script dynamically constructs queries. Use parameterized queries or prepared statements to prevent SQL injection vulnerabilities.
    - Access Control & Permissions:  Implement strict database access control and permissions. Grant minimal privileges necessary to users and roles.
    - Secure Data Storage:  Hash or encrypt sensitive data when storing it in the database. Use MySQL's encryption features where applicable.
    - Avoid Storing Secrets in Scripts: Never hardcode sensitive information like database passwords or API keys directly in SQL scripts.

**Logging & Error Handling (MySQL Context):**
  - **Logging Comments/Guidelines:** Include comments or guidelines in the script on how to monitor execution, log relevant events, and debug potential issues. Recommend utilizing MySQL's logging features for production monitoring and auditing.
  - **Robust Error Handling:**
    - SQL Error Handling:  Implement error handling within procedural SQL code (stored procedures, functions, triggers) to catch and handle errors gracefully. Use DECLARE CONTINUE HANDLER and similar constructs to manage exceptions.
    - Transaction Rollback on Error: Ensure that transactions are rolled back appropriately when errors occur to maintain database integrity.

**Commenting Strategies (MySQL Scripts):**
  - **Meaningful Comments for Complex Logic:** Add comments to explain complex SQL logic, intricate algorithms within stored procedures or functions, or critical database schema design decisions.
  - **Avoid Trivial Comments:**  Do not include comments that are self-explanatory, redundant, or fail to provide additional insight into the SQL code.

**Edge Cases & MySQL Script Considerations:**
  - **Handling Large Datasets:**  Optimize SQL scripts to handle large datasets efficiently. Test scripts with representative data volumes to identify and resolve performance bottlenecks.
  - **Concurrency & Locking in MySQL:**  Consider concurrency and locking issues, especially in high-concurrency environments. Design scripts to minimize locking and prevent deadlocks. Use appropriate transaction isolation levels.
  - **Data Migration & Schema Evolution:**  For data migration or schema change scripts, ensure they are idempotent and reversible whenever feasible. Develop rollback plans to handle potential failures during migration or schema updates.
  - **MySQL Version Compatibility:** Verify that SQL scripts are compatible with the intended MySQL server version and be aware of version-specific syntax or features.

By meticulously following these comprehensive instructions, ensure this rewritten MySQL SQL script is performant, secure, and easily maintainable, adhering to best practices for MySQL database development and optimized for robust operation in production environments.
`
};

const rewriteDocumentation = {
    name: "rewrite: Documentation File Rewrite",
    text: `
Rewrite this documentation file to be clear, concise, and highly effective for developers. Follow these instructions to create developer-centric, high-quality documentation.

**File Header & Metadata:**
  - **File Path Comment:** Start with a comment on the first line with the file path (e.g., '// File: docs/api-reference.md'). Follow with an empty second line.
  - **Document Header:** Include a concise header summarizing the document's purpose and the intended audience. Specify the type of documentation (API reference, tutorial, how-to guide, etc.).

**Content Quality & Clarity:**
  - **Clear, Concise, Developer-Friendly Language:**  Write in clear, concise, and direct language aimed at developers. Avoid jargon, ambiguity, and unnecessary complexity.
  - **Well-Structured & Actionable Content:**  Organize content logically with clear headings, subheadings, and bullet points. Ensure the documentation is actionable, providing developers with the information they need to perform tasks effectively.
  - **Consistent Terminology & Formatting:** Maintain consistent terminology throughout the documentation. Use consistent formatting (e.g., code blocks, headings, lists) to enhance readability.

**Best Practices & Readability for Developers:**
  - **Logical Sections & Flow:** Structure documentation into logical sections that flow naturally. Guide the reader step-by-step through concepts and tasks.
  - **Code Examples & Instructions:**  Include practical code examples in relevant programming languages. Provide step-by-step instructions that are easy to follow and test. Ensure code examples are correct, up-to-date, and runnable.
  - **API References (If Applicable):** For API documentation, provide complete API reference information, including endpoints, request parameters, request bodies, response formats, status codes, and error codes. Use clear and consistent API documentation formats (e.g., OpenAPI/Swagger if applicable).
  - **Diagrams & Visual Aids (Where Useful):** Use diagrams, flowcharts, or visual aids to illustrate complex concepts, workflows, or architectures where appropriate.
  - **Cross-Referencing & Linking:**  Cross-reference related documentation sections and link to relevant external resources or specifications.

**Logging & Code References (Documentation Context):**
  - **Logging Instructions in Code Snippets:**  For any embedded code snippets demonstrating functionality, include clear logging instructions (logger.info, logger.debug, logger.warn, logger.error) where applicable to guide developers on how to implement logging in their code. Emphasize the importance of logging for debugging and monitoring.

**Commenting Strategies (Documentation Files):**
  - **Comments for Enhanced Understanding:**  Use comments within the documentation source (e.g., Markdown comments) to clarify complex instructions, explain design decisions, or highlight important notes for readers.
  - **Avoid Redundant Explanations:** Do not include comments that are overly generic, restate obvious points, or clutter the documentation without adding significant value. Focus on enhancing clarity and actionability for developers.

**Edge Cases & Documentation Considerations:**
  - **Accuracy & Up-to-Date Information:**  Prioritize accuracy and ensure documentation is always up-to-date with the latest code changes and feature updates. Establish a process for regular documentation review and updates.
  - **Target Audience Needs:**  Tailor the documentation to the specific needs and technical level of the target audience (e.g., beginners, experienced developers, system administrators).
  - **Searchability & Navigation:**  Optimize documentation for searchability and easy navigation. Use clear headings, tags, and consider implementing a documentation search functionality.
  - **Accessibility of Documentation:**  Ensure documentation is accessible to developers with disabilities. Follow accessibility guidelines for text, images, code blocks, and interactive elements in documentation.
  - **Version Control & History:**  Manage documentation under version control (e.g., Git) to track changes, manage versions, and enable collaboration. Maintain a history of documentation updates.

By meticulously following these instructions, ensure this rewritten documentation file becomes a highly valuable resource for developers, characterized by its clarity, accuracy, actionability, and adherence to best practices in technical documentation.
`
};

const rewriteMarkdown = {
    name: "rewrite: Markdown File Rewrite",
    text: `
Rewrite this Markdown file to be clear, concise, and effectively communicate its intended message. Follow these instructions to enhance the quality and readability of the Markdown document.

**File Header & Metadata:**
  - **File Path Comment:** Begin with a comment on the first line indicating the file path (e.g., '// File: README.md'). Follow with an empty second line.
  - **Document Header:**  Include a concise header summarizing the document's purpose and intended use. Specify the document type (README, guide, article, etc.).

**Content Quality & Clarity (Markdown Specific):**
  - **Clear, Concise, Natural Language:**  Write in clear, concise, and natural language. Avoid overly technical jargon unless necessary for the context. Ensure the writing style is engaging and easy to understand.
  - **Consistent Markdown Formatting:** Ensure consistent Markdown formatting throughout the document. Use headings, lists, code blocks, links, images, and other Markdown elements effectively and consistently.
  - **Well-Organized Structure:** Structure the Markdown document logically using headings, subheadings, and bullet points. Create a clear information hierarchy and guide the reader through the content in a structured way.

**Best Practices & Readability in Markdown:**
  - **Logical Sections & Headings:** Organize content into logical sections with clear and descriptive headings. Use headings to break up long text and improve scannability.
  - **Bullet Points & Lists for Clarity:**  Use bullet points and numbered lists to present information concisely and improve readability.
  - **Code Blocks for Code Display:**  Use Markdown code blocks (with language syntax highlighting where appropriate) to display code snippets clearly and accurately.
  - **Links for References & Navigation:** Use Markdown links effectively to reference external resources, internal sections within the document, or related files.
  - **Images & Visuals (Use Judiciously):**  Incorporate images, diagrams, or other visual aids where they enhance understanding and break up text. Ensure images are properly sized and optimized.

**Logging & Code References (Markdown Context - Optional):**
  - **Logging Instructions in Embedded Code (If Applicable):** If the Markdown document includes embedded code examples, consider adding brief logging instructions (logger.info, etc.) within comments in the code blocks, if relevant to the example's purpose. This is optional and depends on the document's context.

**Commenting Strategies (Markdown Files - For Source Markdown):**
  - **Meaningful Guidance Comments (In Source Markdown):** Use Markdown comments ( \`\` ) in the source Markdown file to clarify ambiguous sections, explain complex formatting choices, or add notes for future editors of the document.
  - **Avoid Unnecessary Commentary (In Output Markdown):** Ensure that the final rendered Markdown output is clean and free of unnecessary comments that might clutter the presentation. Comments are primarily for the source Markdown for maintainability and collaboration.

**Edge Cases & Markdown Document Considerations:**
  - **Consistency in Formatting:** Pay close attention to consistency in Markdown formatting (headings, lists, emphasis, code blocks) throughout the document. Inconsistent formatting detracts from readability.
  - **Link and Image Integrity:**  Verify that all links and image references are correct and not broken. Ensure images are accessible and load properly.
  - **Readability on Different Platforms:**  Check how the Markdown document renders on different Markdown viewers and platforms (e.g., GitHub, web browsers, Markdown editors). Ensure it is readable and well-formatted across platforms.
  - **Accessibility of Markdown Content:** Consider the accessibility of the Markdown document. Ensure proper heading hierarchy, alt text for images, and semantic structure for screen reader users.
  - **Version Control for Markdown:** Manage Markdown documents under version control (Git) to track changes, facilitate collaboration, and maintain a history of document revisions.

By meticulously following these instructions, ensure this rewritten Markdown file is clear, well-structured, highly readable, and effectively communicates its intended message, adhering to best practices for Markdown document creation and presentation.
`
};

const rewriteProductDocumentation = {
    name: "rewrite: Product Documentation (Markdown Format)",
    text: `
Rewrite this product documentation file (in Markdown format) to be comprehensive, accurate, and user-centric. Follow these instructions to create world-class product documentation that effectively guides users.

**File Header & Product Metadata:**
  - **File Path Comment:** Start with a comment on the first line indicating the file path (e.g., '// File: docs/user-guide.md'). Follow with an empty second line.
  - **Product Documentation Header:**  Include a comprehensive header that clearly identifies:
    - The product name and version being documented.
    - The specific section or topic covered in this file.
    - Intended audience (e.g., end-users, developers, administrators).
    - Date of last update or version.

**Content Quality & Accuracy (Product Focus):**
  - **Detailed, Clear, and Accurate Information:**  Provide detailed, clear, and accurate product information. Ensure all technical details, features, and functionalities are correctly documented.
  - **Natural Language & Consistent Terminology:** Write in natural, easy-to-understand language. Maintain consistent terminology throughout all product documentation. Define key terms and concepts where needed.
  - **Structured Format & Information Hierarchy:**  Organize content with a clear and logical structure. Use headings, subheadings, and bullet points to create an information hierarchy that is easy to navigate.

**Best Practices & User-Centric Approach:**
  - **Well-Defined Sections & Navigation:**  Organize content into well-defined sections with descriptive headings. Ensure easy navigation within the document and across the entire product documentation set. Include a table of contents where appropriate.
  - **Actionable Instructions & Step-by-Step Guides:**  Provide actionable instructions and step-by-step guides for users to accomplish tasks. Ensure instructions are clear, concise, and testable.
  - **Examples, Use Cases, and Scenarios:**  Include relevant examples, use cases, and real-world scenarios to illustrate product features and functionalities. Show users how to apply the product in practical situations.
  - **Embedded Code Examples (with Logging):**  Incorporate embedded code examples (with syntax highlighting) where applicable to demonstrate APIs, configurations, or coding tasks. Include logging instructions (logger.info, etc.) in code examples to guide developers on debugging and monitoring.
  - **Troubleshooting Tips & FAQs:**  Include a troubleshooting section with common issues and their solutions. Add a FAQ (Frequently Asked Questions) section to address common user queries.
  - **Visual Aids (Screenshots, Diagrams, Videos):**  Use screenshots, diagrams, videos, and other visual aids to enhance understanding and break up long blocks of text. Ensure visuals are clear, relevant, and accessible.

**Logging & Code References (Product Documentation Context):**
  - **Logging in Code Snippets (Emphasize Importance):**  For all code snippets included in product documentation, consistently add logging instructions (logger.info, logger.debug, logger.warn, logger.error) where relevant. Emphasize the importance of logging for debugging, monitoring, and understanding system behavior.

**Commenting Strategies (Product Documentation Markdown):**
  - **Meaningful Comments for Clarity (in Source):** Use comments within the source Markdown files to clarify complex explanations, document intended document structure, or add notes for documentation maintenance and updates.
  - **Avoid Redundant Comments (in Output):**  Ensure the final rendered product documentation is clean and free of unnecessary comments that could clutter the user experience. Comments are primarily for source document maintenance and collaboration.

**Edge Cases & Product Documentation Considerations:**
  - **Product Evolution & Updates:**  Design documentation to be easily updatable and maintainable as the product evolves. Establish a clear process for documentation updates with each product release.
  - **Multiple User Roles & Personas:**  Consider documentation needs for different user roles and personas (e.g., end-users, administrators, developers). Tailor content and level of detail to each audience.
  - **Localization & Internationalization (If Applicable):** If the product is used globally, plan for documentation localization and internationalization to support multiple languages and regions.
  - **Search Engine Optimization (SEO) for Online Documentation:** Optimize online product documentation for search engines (if hosted online) to improve discoverability. Use relevant keywords, clear headings, and proper meta descriptions.
  - **Accessibility of Product Documentation:** Ensure product documentation is accessible to users with disabilities, adhering to accessibility guidelines for text, images, multimedia, and navigation.

By diligently following these comprehensive instructions, ensure this rewritten product documentation file becomes a highly valuable and user-friendly resource for product users, characterized by its accuracy, completeness, clarity, and user-centric design, reflecting world-class standards for product documentation.
`
};

const rewriteUserManuals = {
    name: "rewrite: User Manuals",
    text: `
Rewrite this user manual file to be exceptionally clear, user-friendly, and comprehensive, guiding users effectively through product usage. Follow these instructions to create outstanding user manuals that enhance user experience.

**File Header & Manual Metadata:**
  - **File Path Comment:** Start with a comment on the first line indicating the file path (e.g., '// File: manuals/user-manual-v2.md'). Follow with an empty second line.
  - **User Manual Header:**  Include a detailed header that clearly identifies:
    - The product name and version the manual is for.
    - The specific manual type (user guide, quick start guide, reference manual, etc.).
    - Intended audience (e.g., beginner users, advanced users, system administrators).
    - Date of publication or last revision.
    - Manual version number (if applicable).

**Content Quality & User Accessibility:**
  - **Clear, Accessible, User-Friendly Language:** Write in plain, simple, and user-friendly language. Avoid technical jargon unless absolutely necessary and always explain it clearly. Target the language to the intended audience's level of technical expertise.
  - **Step-by-Step Guidance:**  Provide step-by-step instructions for all tasks and procedures. Use numbered lists and break down complex processes into manageable steps. Start with simple tasks and gradually introduce more complex ones.
  - **Clear Examples & Use Cases:**  Use clear, practical examples and relatable use cases to illustrate how to use product features and functionalities. Show users how the product solves real-world problems.
  - **Visual Aids (Screenshots, Illustrations, Videos):**  Incorporate screenshots, illustrations, diagrams, and videos to visually guide users and make instructions easier to follow. Ensure visuals are high-quality, relevant, and accessible.

**Best Practices & User Experience Focus:**
  - **Logical Sections & Easy Navigation:**  Organize content into logical sections with clear headings and subheadings. Create a table of contents and ensure easy navigation throughout the manual. Design for users to quickly find the information they need.
  - **Troubleshooting Tips & Error Resolution:** Include a comprehensive troubleshooting section that addresses common user issues and errors. Provide clear solutions and workarounds. Anticipate potential user problems and offer proactive guidance.
  - **FAQs (Frequently Asked Questions):**  Add a FAQ section to answer common questions users might have about the product. Address both basic and more advanced queries.
  - **Glossary of Terms:** Include a glossary of technical terms or product-specific terminology used in the manual to aid user understanding, especially for manuals targeting less technical users.
  - **Index (For Longer Manuals):** For longer, more complex user manuals, include an index to facilitate quick lookup of specific topics or keywords.

**Logging & Code References (User Manual Context - Minimize):**
  - **Minimize Code Examples (User Manuals):** User manuals should generally minimize embedded code examples unless absolutely essential for demonstrating specific user-facing features (e.g., scripting interfaces for end-users). If code examples are necessary, keep them simple and user-friendly.
  - **Logging Instructions (If Code Examples Included):** If user manuals do include code examples, add basic logging instructions (e.g., "check the application logs for more details") where relevant to guide users on debugging or monitoring their actions. However, prioritize user-friendliness over technical logging details in user manuals.

**Commenting Strategies (User Manual Files - Source Comments):**
  - **Clarify Instructions & Key Points (Source Comments):**  Use comments within the source files of the user manual to clarify complex instructions, highlight key points for users, or add notes for manual updates and revisions.
  - **Avoid Technical Jargon in Comments:**  Even in source comments, avoid overly technical jargon. Keep comments user-centric and focused on improving the user manual's clarity and effectiveness.

**Edge Cases & User Manual Considerations:**
  - **Diverse User Skill Levels:** Design user manuals to cater to a diverse range of user skill levels, from beginners to advanced users. Structure content to allow users to find information appropriate to their expertise.
  - **Accessibility for All Users:** Ensure user manuals are accessible to all users, including those with disabilities. Follow accessibility guidelines for text, images, multimedia, and navigation. Consider providing manuals in multiple formats (e.g., HTML, PDF, ePub).
  - **Translation & Localization (If Applicable):**  Plan for user manual translation and localization if the product is used in multiple languages or regions. Ensure cultural appropriateness and accurate translations.
  - **Regular Updates & Maintenance:** Establish a process for regular review and updates of user manuals to keep them current with product changes and user feedback. Track user feedback to improve manual content continuously.
  - **Usability Testing of User Manuals:** Conduct usability testing of user manuals with target users to identify areas for improvement in clarity, navigation, and overall user-friendliness.

By meticulously adhering to these comprehensive instructions, ensure this rewritten user manual becomes an invaluable asset for product users, characterized by its clarity, user-friendliness, comprehensiveness, and effectiveness in guiding users to successfully utilize the product, reflecting world-class standards for user documentation.
`
};

// New objects - Refined and optimized

const replyGenericMail = {
    name: "Reply: Generic Mail Reply",
    text: `
Hi,

Thank you for your email. I have received your message and will respond as soon as possible, typically within [Response Timeframe, e.g., 24-48 hours].

If your matter is urgent, please indicate "URGENT" in the subject line or call me directly at [Your Phone Number] if available.

Best regards,

`
};

const replyPromotionalNotInterested = {
    name: "Reply: Promotional Not Interested",
    text: `
Hi,

Thank you for reaching out and sharing information about your product.

While your offering seems interesting, at this time it does not align with our current priorities or needs at Signzy.

We appreciate you considering us, and we will keep your information on file should our needs evolve.

Best regards,
`
};

const snippetCategoryPrimary = {
    name: "Snippet: category: primary label:unread",
    text: `category:primary label:unread`
};

const editingFrontend = {
    name: "Editing: Frontend Code Edit",
    text: `
Refactor and enhance the frontend code to meet exceptional standards of quality, maintainability, performance, and user experience. Follow these directives to ensure comprehensive improvements:

**Code Quality & Structure:**
  - Enforce strict code formatting and linting.
  - Optimize component structure for reusability and clarity.
  - Refactor for improved modularity and separation of concerns.
  - Eliminate code duplication (DRY principle).

**Performance Optimization:**
  - Identify and eliminate performance bottlenecks.
  - Implement lazy loading for modules and components where applicable.
  - Optimize state management for efficient re-renders.
  - Memoize components and functions to prevent unnecessary computations.

**Accessibility & UX Enhancement:**
  - Ensure full accessibility (WCAG compliance).
  - Enhance responsiveness across all devices and screen sizes.
  - Implement smooth animations and transitions for improved UX.
  - Review and improve UI design for clarity and user-friendliness.

**Tech Stack & Best Practices:**
  - Ensure consistent use of Tailwind CSS for styling.
  - Utilize shadcn/ui components where appropriate for UI elements.
  - Adhere to React (or framework-specific) best practices.

**Error Handling & Logging:**
  - Implement robust error handling to gracefully manage exceptions.
  - Add comprehensive logging for debugging and monitoring.
  - Ensure user-friendly error messages without exposing sensitive information.

**Code Review Focus:**
  - Review code for clarity, maintainability, and adherence to best practices.
  - Check for potential security vulnerabilities (e.g., XSS).
  - Ensure code is well-commented where necessary for understanding complex logic.

Apply these editing directives to elevate the frontend code to a state of optimal quality and efficiency.
    `
};

const editingBackend = {
    name: "Editing: Backend Code Edit",
    text: `
Refactor and enhance the backend code to achieve exceptional levels of robustness, security, scalability, and maintainability. Implement the following edits to optimize the backend system:

**Security Enhancement:**
  - Conduct a thorough security review and address any identified vulnerabilities (OWASP top 10).
  - Strengthen input validation and sanitization across all API endpoints and data entry points.
  - Implement or reinforce rate limiting and DDoS protection mechanisms.
  - Review and enhance authentication and authorization mechanisms.
  - Ensure secure handling of sensitive data and secrets.

**Performance Optimization & Scalability:**
  - Identify and optimize performance bottlenecks throughout the backend system.
  - Enhance database query performance and optimize database interactions.
  - Implement caching strategies (server-side caching, database caching) where beneficial.
  - Review and optimize code for scalability and concurrency.

**Error Handling & Logging Improvement:**
  - Enhance error handling to provide graceful failure responses and prevent crashes.
  - Implement centralized exception handling and standardized error response formats.
  - Expand logging to include comprehensive tracking of requests, responses, errors, and security events.
  - Ensure structured logging for easier log analysis and monitoring.

**Code Quality & Maintainability:**
  - Enforce strict code formatting and linting to maintain code consistency.
  - Refactor code for improved modularity, separation of concerns, and reduced code duplication.
  - Ensure code is well-commented to explain complex logic and API functionalities.
  - Review and optimize API design for clarity, consistency, and ease of use.

**Database Optimization (If Applicable):**
  - Review database schema for optimization and indexing.
  - Optimize database queries and stored procedures for performance.
  - Ensure database transaction atomicity and data integrity.

Apply these editing directives to elevate the backend code to a state of peak performance, security, and maintainability, ensuring a robust and reliable backend system.
    `
};

const editingSQL = {
    name: "Editing: SQL Code Edit",
    text: `
Refactor and optimize this SQL code to achieve peak performance, data integrity, security, and maintainability. Apply the following edits for comprehensive SQL code improvement:

**Performance Tuning:**
  - Analyze and optimize slow-performing SQL queries. Use EXPLAIN to review query execution plans.
  - Enhance indexing strategies to improve query speed. Review existing indexes and add or modify indexes as needed.
  - Optimize database schema design for query performance and data access patterns.

**Data Integrity & Consistency:**
  - Review and strengthen data integrity constraints (e.g., NOT NULL, UNIQUE, FOREIGN KEY, CHECK constraints).
  - Ensure data type correctness and consistency across tables.
  - Implement or enhance database triggers or stored procedures for data validation and integrity enforcement.
  - Verify atomicity of database transactions to maintain data consistency.

**Security Hardening:**
  - Review SQL code for potential SQL injection vulnerabilities. Enforce use of parameterized queries or prepared statements.
  - Implement or enhance database access control and permissions. Ensure least privilege principle.
  - Audit SQL code for compliance with security best practices and data protection regulations.

**Code Quality & Maintainability:**
  - Enforce clean SQL formatting and consistent naming conventions.
  - Refactor complex SQL queries into smaller, more manageable units or views.
  - Create reusable SQL functions or stored procedures to reduce code duplication and improve modularity.
  - Add meaningful comments to explain complex SQL logic, algorithms, or data transformations.
  - Review and optimize database object naming conventions for clarity and consistency.

**Error Handling & Logging (SQL Context):**
  - Enhance SQL error handling within stored procedures or functions. Ensure graceful error handling and informative error messages.
  - Implement logging mechanisms within SQL code (e.g., using custom logging tables or database logging features) to track SQL script execution and identify issues.

Apply these editing directives to elevate the SQL code to a state of optimal performance, security, and maintainability, ensuring robust and efficient database operations.
    `
};

const rewriteGolangBackend = {
    name: "rewrite: Golang Backend Code Rewrite",
    text: `
Rewrite this Golang backend file to conform to best practices in Go, emphasizing performance, clarity, and maintainability. Follow these detailed instructions:

**File Header & Documentation:**
  - Add a file comment at the top with the full file path (e.g., '// File: internal/api/handlers.go').
  - Include a comprehensive comment block describing:
      - The purpose of the file and its role in the backend.
      - A summary of key functionalities and any notable design decisions.
      - Guidelines for future maintenance and contribution.

**Code Organization & Structure:**
  - Organize the code using idiomatic Go practices: group imports, use clear package names, and separate concerns (handlers, business logic, data access).
  - Break down large functions into smaller, testable helper functions.
  - Ensure that functions have clear input/output parameters and minimal side effects.

**Error Handling & Logging:**
  - Use Go's error handling idioms: check errors immediately and return wrapped errors where necessary.
  - Implement structured logging (e.g., with logrus or the standard log package) to capture relevant context.
  - Add comments to explain non-obvious error handling or fallback logic.

**Performance & Concurrency:**
  - Ensure that any concurrent operations (using goroutines, channels, sync primitives) are safe and free of race conditions.
  - Optimize critical code paths and use profiling tools (like pprof) to identify bottlenecks.
  - Refactor blocking operations to use non-blocking alternatives where feasible.

**Code Quality & Best Practices:**
  - Adhere to Go’s standard formatting using gofmt and follow established conventions (Effective Go).
  - Write clear, concise, and idiomatic Go code.
  - Remove any redundant or dead code and document non-trivial logic.
  - Include unit tests for complex functions to ensure maintainability.

By following these directives, the rewritten Golang backend file should become a model of clarity, performance, and maintainability, aligned with Go’s idiomatic standards.
`
};

const editingGolangBackend = {
    name: "editing: Golang Backend Code Edit",
    text: `
Refactor and enhance this Golang backend code to improve readability, maintainability, and performance. Implement the following edits:

**Code Quality & Readability:**
  - Clean up the code formatting and remove any redundant comments.
  - Ensure variable and function names are descriptive and follow Go naming conventions.
  - Refactor complex functions into smaller, reusable components.
  - Remove duplicate code and consolidate common logic into utility functions or packages.

**Error Handling & Logging Improvements:**
  - Review and improve error handling: check errors promptly and provide context when wrapping errors.
  - Standardize logging across the module using a structured logging library (e.g., logrus).
  - Add logging at critical points (entry/exit of functions, error conditions, significant state changes) to aid debugging and monitoring.

**Performance & Concurrency:**
  - Optimize performance by reviewing code paths and ensuring that any goroutines or concurrent processes are well-managed.
  - Use Go’s race detector to ensure no data races exist.
  - Refactor any blocking operations to improve concurrency and throughput.

**Security & Best Practices:**
  - Ensure all user inputs and external data are validated and sanitized.
  - Review the usage of external packages to ensure they are up-to-date and secure.
  - Add comments to document decisions around security, especially in areas dealing with authentication, data processing, or external communications.

**Testing & Maintainability:**
  - Add or improve unit tests for key functions to ensure future changes don’t break existing functionality.
  - Document any assumptions or complex business logic with clear comments.
  - Ensure the code is modular enough to facilitate future extensions and maintenance.

Apply these edits to enhance the overall quality of your Golang backend code, ensuring it meets high standards for performance, reliability, and maintainability.
`
};

const rewriteRustBackend = {
    name: "rewrite: Rust Backend Code Rewrite",
    text: `
Rewrite this Rust backend file to align with idiomatic Rust practices, focusing on performance, safety, and maintainability. Follow these detailed instructions:

**File Header & Documentation:**
  - Add a file comment at the very top with the full file path (e.g., '// File: src/api/handlers.rs').
  - Include a detailed comment block describing:
      - The purpose of the file and its role in the backend.
      - A summary of the key functionalities and any important design decisions.
      - Guidelines for future maintainers, including potential areas for improvement or known limitations.

**Code Organization & Structure:**
  - Organize code using Rust’s module system; group related functions, types, and traits into modules.
  - Break complex functions into smaller, well-defined helper functions.
  - Use clear and descriptive naming conventions following Rust’s style guidelines (snake_case for functions and variables, CamelCase for types and traits).
  - Leverage Rust’s ownership, borrowing, and lifetimes to ensure memory safety and avoid data races.

**Error Handling & Logging:**
  - Utilize Rust’s error handling patterns, such as the Result type and the ? operator, to propagate errors cleanly.
  - Provide meaningful error messages and use custom error types if needed.
  - Implement structured logging (using crates like 'log' with a concrete logger, e.g., 'env_logger' or 'tracing') to capture context for debugging and monitoring.

**Performance & Concurrency:**
  - Ensure performance by writing efficient, idiomatic Rust code. Consider using asynchronous programming (with async/await and Tokio or async-std) for I/O-bound operations.
  - Optimize critical sections and, where applicable, leverage parallelism safely with threads or async tasks.
  - Use Rust’s profiling tools (like 'cargo flamegraph' or 'perf') to identify and optimize bottlenecks.

**Code Quality & Best Practices:**
  - Enforce code formatting with rustfmt and linting with clippy.
  - Remove redundant code, and document non-obvious logic.
  - Write unit tests for complex functions to ensure correctness and facilitate future changes.
  - Use Cargo features and dependency management wisely to keep the build fast and the binary lean.

By following these directives, the rewritten Rust backend file should exemplify idiomatic Rust, achieving high performance, safety, and maintainability.
`
};

const editingRustBackend = {
    name: "editing: Rust Backend Code Edit",
    text: `
Refactor and enhance this Rust backend code to improve clarity, performance, and maintainability. Apply the following edits:

**Code Quality & Readability:**
  - Reformat the code using rustfmt to ensure consistent style.
  - Review variable, function, and module names to ensure they are descriptive and follow Rust naming conventions.
  - Simplify complex logic by breaking it into smaller functions or using Rust’s powerful pattern matching.
  - Remove duplicate code and consolidate common logic into reusable functions or modules.

**Error Handling & Logging Improvements:**
  - Ensure all potential error cases are properly handled using Result and the ? operator.
  - Enhance error messages with context using libraries like 'anyhow' or 'thiserror' where appropriate.
  - Improve logging by standardizing the use of a logging crate (e.g., 'tracing' or 'log' with 'env_logger'), ensuring that all critical operations and error conditions are logged with sufficient context.

**Performance & Concurrency:**
  - Identify any blocking operations or inefficient algorithms and refactor them to use asynchronous programming if applicable (e.g., using Tokio).
  - Verify that concurrent operations (threads, async tasks) are free of data races by using Rust’s ownership and borrowing rules effectively.
  - Run benchmarks and profiling (using tools like 'cargo bench' or 'cargo flamegraph') to identify performance bottlenecks and optimize them.

**Security & Best Practices:**
  - Review the code for potential security vulnerabilities (e.g., unsafe blocks, unchecked unwraps) and replace them with safer alternatives.
  - Ensure that any external data is validated and sanitized before use.
  - Document any critical business logic and decision points in comments for future reference.

**Testing & Maintainability:**
  - Add or enhance unit tests and integration tests to cover critical functionality.
  - Refactor code to be more modular, making it easier to test and maintain.
  - Update documentation comments to reflect any changes and to guide future developers.

Apply these edits to elevate your Rust backend code to a higher standard of quality, ensuring it is clear, efficient, and maintainable.
`
};

const gitConfigGlobalSignzy = {
    name: "Git config global Signzy",
    text: `
git config --global user.name "yuyudhan"
git config --global user.email "ankur@signzy.com"
`,
};

const gitConfigGlobalPersonal = {
    name: "Git config global Personal",
    text: `
git config --global user.name "yuyudhan"
git config --global user.email "ankurkumarpandey@gmail.com"
`,
};

const gitConfigLocalPersonal = {
    name: "Git config local Personal",
    text: `
git config user.name "yuyudhan"
git config user.email "ankurkumarpandey@gmail.com"
`,
};

const gitConfigLocalSignzy = {
    name: "Git config local Signzy",
    text: `
git config user.name "yuyudhan"
git config user.email "ankur@signzy.com"
`,
};

// Merge all snippet objects into one object
const allSnippets = [
    rewriteGenericFile,
    rewriteReactOnly,
    rewriteNextjsFrontend,
    rewriteReactComponent,
    rewriteGenericFrontend,
    rewriteNextjsBackend,
    rewriteFastifyBackend,
    rewriteGenericBackend,
    rewritePostgreSQL,
    rewriteMySQL,
    rewriteDocumentation,
    rewriteMarkdown,
    rewriteProductDocumentation,
    rewriteUserManuals,
    replyGenericMail,
    replyPromotionalNotInterested,
    snippetCategoryPrimary,
    editingFrontend,
    editingBackend,
    editingSQL,
    rewriteGolangBackend,
    editingGolangBackend,
    rewriteRustBackend,
    editingRustBackend,
    gitConfigLocalPersonal,
    gitConfigLocalSignzy,
    gitConfigGlobalPersonal,
    gitConfigGlobalSignzy,
];

const outputPath = path.join(__dirname, 'snippets.json');

fs.writeFile(outputPath, JSON.stringify(allSnippets, null, 2), 'utf8', (err) => {
    if (err) {
        console.error('Error writing snippets.json:', err);
    } else {
        console.info('snippets.json has been created successfully at', outputPath);
    }
});

