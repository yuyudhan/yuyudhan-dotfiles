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
Rewrite this file for exceptional quality, security, and maintainability:

**Structure:**
- Add file path comment on first line
- Include purpose header with key functionalities
- Organize into logical, modular sections
- Use consistent formatting and naming

**Quality:**
- Optimize performance (async, caching, efficient algorithms)
- Validate inputs and sanitize data
- Implement proper error handling with logging
- Add security measures (access control, rate limiting)

**Code Standards:**
- Add meaningful comments for complex logic only
- Ensure scalability and compatibility
- Include comprehensive logging (info, debug, warn, error)
- Design for maintainability and testing
`
};

// Rewrite snippets (names now start with "rewrite:") - Optimized for LLM prompting
const rewriteReactOnly = {
    name: "rewrite: React-Only with Tailwind Frontend File Rewrite",
    text: `
Rewrite this React file for exceptional quality and UX:

**Structure:**
- Add file path comment and purpose header
- Break into small, reusable components
- Use custom hooks for complex logic
- Optimize state management and memoization

**UI/UX:**
- Ensure WCAG accessibility compliance
- Implement responsive design with Tailwind CSS
- Add smooth animations and transitions
- Support dark mode with consistent theming

**Code Quality:**
- Use Tailwind CSS and shadcn/ui components
- Implement Error Boundaries and graceful degradation
- Add comprehensive logging for debugging
- Handle loading states and API errors
- Sanitize user inputs for security
`
};

const rewriteNextjsFrontend = {
    name: "rewrite: Next.js Frontend File Rewrite",
    text: `
Rewrite this Next.js frontend file for optimal performance and UX:

**Structure:**
- Add file path comment and Next.js role description
- Optimize data fetching (SSR/SSG/client-side)
- Use dynamic imports and lazy loading
- Implement proper routing and caching

**Code Quality:**
- Use TypeScript for type safety
- Implement Error Boundaries and API error handling
- Add comprehensive logging
- Ensure WCAG accessibility compliance

**Performance:**
- Use Next.js Image and Link components
- Implement prefetching and ISR
- Optimize bundle size with code splitting
- Use Tailwind CSS and shadcn/ui components

**Security:**
- Validate inputs in API routes
- Implement rate limiting and authentication
- Secure environment variables
`
};

const rewriteReactComponent = {
    name: "rewrite: React Component File Rewrite",
    text: `
Rewrite this React component for exceptional reusability, performance, and maintainability:

**Structure:**
- Add file path comment and component purpose header
- Break into small, reusable components with clear props
- Use functional components with custom hooks
- Implement proper prop validation and types

**Quality:**
- Optimize performance with React.memo, useCallback, useMemo
- Ensure WCAG accessibility compliance
- Add responsive design with Tailwind CSS
- Support animations and smooth transitions

**Implementation:**
- Use Tailwind CSS and shadcn/ui components
- Implement error boundaries and graceful error handling
- Add comprehensive logging for debugging
- Clean up side effects to prevent memory leaks
`
};

const rewriteGenericFrontend = {
    name: "rewrite: Generic Frontend File Rewrite",
    text: `
Rewrite this frontend file for exceptional quality, maintainability, and UX:

**Structure:**
- Add file path comment and purpose header
- Organize into logical modules with clear responsibilities
- Implement DRY principles and eliminate code duplication
- Separate UI logic, business logic, and data handling

**Performance:**
- Implement lazy loading for modules and resources
- Add caching mechanisms and memoization
- Optimize performance across all devices
- Minimize bundle size and improve load times

**UI/UX:**
- Ensure WCAG accessibility compliance
- Create responsive design with Tailwind CSS
- Add smooth animations and transitions
- Support dark mode compatibility

**Quality:**
- Implement robust error handling and logging
- Add comprehensive security measures (XSS prevention)
- Ensure cross-browser compatibility
- Use shadcn/ui components for consistency
`
};

const rewriteNextjsBackend = {
    name: "rewrite: Next.js Backend File Rewrite",
    text: `
Rewrite this Next.js backend file for optimal performance, security, and maintainability:

**Structure:**
- Add file path comment and Next.js API route purpose
- Organize API routes with RESTful design principles
- Structure server-side utilities for reusability
- Implement proper async/await handling

**Security:**
- Validate and sanitize all inputs rigorously
- Implement rate limiting and DDoS protection
- Use secure authentication (JWT, NextAuth.js)
- Configure CORS and security headers properly
- Manage secrets securely (environment variables)

**Performance:**
- Optimize database queries and connection pooling
- Implement server-side caching strategies
- Handle atomic transactions for data integrity
- Consider serverless function limitations

**Quality:**
- Add comprehensive logging for debugging
- Implement robust error handling with proper HTTP codes
- Ensure graceful failure responses
- Follow Next.js backend best practices
`
};

const rewriteFastifyBackend = {
    name: "rewrite: Fastify Backend File Rewrite",
    text: `
Rewrite this Fastify backend file for exceptional performance, security, and maintainability:

**Structure:**
- Add file path comment and Fastify role description
- Organize route handlers with clear separation of concerns
- Use Fastify plugins and decorators for modularity
- Implement efficient async/await operations

**Security:**
- Validate inputs with Fastify schema validation
- Implement rate limiting with Fastify plugins
- Use secure authentication (JWT, Fastify auth plugins)
- Configure CORS and security headers
- Log security events for monitoring

**Performance:**
- Leverage Fastify's high-performance routing
- Optimize database connections and pooling
- Implement caching strategies
- Ensure atomic database transactions

**Quality:**
- Use Fastify's Pino logger for structured logging
- Implement comprehensive error handling
- Add graceful shutdown procedures
- Follow Fastify best practices and conventions
`
};

const rewriteGenericBackend = {
    name: "rewrite: Generic Backend File Rewrite",
    text: `
Rewrite this backend file for exceptional scalability, security, and maintainability:

**Structure:**
- Add file path comment and backend purpose header
- Organize into logical modules (controllers, services, data access)
- Implement clear separation of concerns
- Use efficient async programming patterns

**Security:**
- Validate and sanitize all inputs rigorously
- Implement rate limiting and DDoS protection
- Use robust authentication/authorization (OAuth, JWT)
- Secure configuration and credential management
- Log security events for monitoring

**Performance:**
- Optimize database queries and connection pooling
- Implement server-side caching strategies
- Ensure atomic database transactions
- Design for horizontal scaling and load balancing

**Quality:**
- Add comprehensive structured logging (JSON format)
- Implement centralized error handling
- Return graceful failure responses
- Monitor performance and system health
`
};

const rewritePostgreSQL = {
    name: "rewrite: PostgreSQL File Rewrite",
    text: `
Rewrite this PostgreSQL script for optimal performance, data integrity, and maintainability:

**Structure:**
- Add file path comment and script purpose header
- Break complex scripts into modular functions/procedures
- Create reusable SQL functions and views
- Follow PostgreSQL naming conventions

**Performance:**
- Optimize indexing strategy (B-tree, Hash, GiST, GIN)
- Write efficient queries avoiding full table scans
- Use EXPLAIN to analyze query plans
- Leverage set-based operations over row-by-row processing

**Data Integrity:**
- Enforce constraints (NOT NULL, UNIQUE, FK, CHECK)
- Implement atomic transactions with BEGIN/COMMIT/ROLLBACK
- Validate input parameters to prevent SQL injection
- Use parameterized queries and prepared statements

**Security:**
- Review and enforce least privilege access control
- Hash/encrypt sensitive data appropriately
- Implement proper error handling with RAISE EXCEPTION
- Plan for rollback strategies and idempotent operations
`
};

const rewriteMySQL = {
    name: "rewrite: MySQL File Rewrite",
    text: `
Rewrite this MySQL script for optimal performance, data integrity, and maintainability:

**Structure:**
- Add file path comment and script purpose header
- Break complex scripts into modular stored procedures/functions
- Create reusable SQL functions and views
- Follow MySQL naming conventions and style guides

**Performance:**
- Optimize indexing strategy (B-Tree, Hash, Fulltext, Spatial)
- Write efficient queries using EXPLAIN for analysis
- Avoid full table scans and performance pitfalls
- Use appropriate transaction isolation levels

**Data Integrity:**
- Implement atomic transactions with START TRANSACTION/COMMIT/ROLLBACK
- Enforce proper constraints and data validation
- Use parameterized queries to prevent SQL injection
- Handle large datasets efficiently

**Security:**
- Implement strict access control and least privilege
- Hash/encrypt sensitive data using MySQL features
- Add proper error handling with DECLARE CONTINUE HANDLER
- Ensure scripts are idempotent and reversible
`
};

const rewriteDocumentation = {
    name: "rewrite: Documentation File Rewrite",
    text: `
Rewrite this documentation for exceptional clarity and developer effectiveness:

**Structure:**
- Add file path comment and document purpose header
- Organize content with logical sections and clear headings
- Use consistent terminology and formatting throughout
- Create actionable, step-by-step instructions

**Content Quality:**
- Write in clear, concise, developer-friendly language
- Include practical, runnable code examples
- Provide complete API references (endpoints, parameters, responses)
- Add diagrams and visual aids for complex concepts

**Best Practices:**
- Cross-reference related sections and external resources
- Include logging instructions in code snippets
- Ensure accuracy and up-to-date information
- Optimize for searchability and navigation

**Accessibility:**
- Follow accessibility guidelines for all content
- Tailor content to target audience technical level
- Maintain version control and update history
- Design for easy maintenance and collaboration
`
};

const rewriteMarkdown = {
    name: "rewrite: Markdown File Rewrite",
    text: `
Rewrite this Markdown file for exceptional clarity and readability:

**Structure:**
- Add file path comment and document purpose header
- Organize with logical sections and clear headings
- Use consistent Markdown formatting throughout
- Create proper information hierarchy

**Content Quality:**
- Write in clear, concise, natural language
- Use bullet points and numbered lists for clarity
- Include code blocks with syntax highlighting
- Add effective links for references and navigation

**Best Practices:**
- Incorporate images and visuals judiciously
- Ensure consistency in formatting elements
- Verify all links and image references work
- Include logging instructions in code examples (if applicable)

**Accessibility:**
- Ensure proper heading hierarchy
- Add alt text for images
- Test readability across different platforms
- Design for screen reader compatibility
`
};

const rewriteProductDocumentation = {
    name: "rewrite: Product Documentation (Markdown Format)",
    text: `
Rewrite this product documentation for comprehensive, accurate, and user-centric guidance:

**Structure:**
- Add file path comment and product metadata header
- Include product name, version, audience, and update date
- Organize with clear sections and navigation
- Use logical information hierarchy

**Content Quality:**
- Provide detailed, accurate product information
- Use natural language and consistent terminology
- Include actionable step-by-step instructions
- Add relevant examples and real-world use cases

**User Experience:**
- Create troubleshooting section with common issues
- Add FAQ section for frequent queries
- Include visual aids (screenshots, diagrams, videos)
- Embed code examples with logging instructions

**Best Practices:**
- Design for easy updates as product evolves
- Consider multiple user roles and personas
- Optimize for search engines (if hosted online)
- Ensure accessibility compliance for all users
`
};

const rewriteUserManuals = {
    name: "rewrite: User Manuals",
    text: `
Rewrite this user manual for exceptional clarity and user-friendliness:

**Structure:**
- Add file path comment and manual metadata header
- Include product name, version, manual type, and audience
- Organize with logical sections and easy navigation
- Create table of contents for quick access

**Content Quality:**
- Write in plain, simple, user-friendly language
- Provide step-by-step instructions with numbered lists
- Include clear examples and relatable use cases
- Add high-quality visual aids (screenshots, diagrams, videos)

**User Experience:**
- Create comprehensive troubleshooting section
- Add FAQ section for common questions
- Include glossary of technical terms
- Design for diverse user skill levels

**Best Practices:**
- Minimize code examples (keep user-friendly when needed)
- Ensure accessibility for all users
- Plan for translation and localization
- Establish regular update and maintenance process
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
Refactor and enhance the frontend code for exceptional quality, performance, and user experience:

**Code Quality & Structure:**
  - Enforce strict formatting and linting
  - Optimize component structure for reusability
  - Refactor for modularity and separation of concerns
  - Eliminate code duplication (DRY principle)

**Performance Optimization:**
  - Identify and eliminate performance bottlenecks
  - Implement lazy loading for modules and components
  - Optimize state management for efficient re-renders
  - Memoize components and functions to prevent unnecessary computations

**Accessibility & UX Enhancement:**
  - Ensure full accessibility (WCAG compliance)
  - Enhance responsiveness across all devices
  - Implement smooth animations and transitions
  - Review and improve UI design for clarity

**Tech Stack & Best Practices:**
  - Use Tailwind CSS for styling consistently
  - Utilize shadcn/ui components where appropriate
  - Adhere to React (or framework-specific) best practices

**Error Handling & Logging:**
  - Implement robust error handling to gracefully manage exceptions
  - Add comprehensive logging for debugging and monitoring
  - Ensure user-friendly error messages without exposing sensitive information

Apply these directives to elevate the frontend code to optimal quality and efficiency.
    `
};

const editingBackend = {
    name: "Editing: Backend Code Edit",
    text: `
Refactor and enhance the backend code for exceptional robustness, security, scalability, and maintainability:

**Security Enhancement:**
  - Conduct security review and address vulnerabilities (OWASP top 10)
  - Strengthen input validation and sanitization across all endpoints
  - Implement rate limiting and DDoS protection mechanisms
  - Review and enhance authentication and authorization mechanisms
  - Ensure secure handling of sensitive data and secrets

**Performance Optimization & Scalability:**
  - Identify and optimize performance bottlenecks
  - Enhance database query performance and optimize interactions
  - Implement caching strategies (server-side and database caching)
  - Optimize code for scalability and concurrency

**Error Handling & Logging Improvement:**
  - Enhance error handling for graceful failure responses
  - Implement centralized exception handling and standardized error formats
  - Expand logging for comprehensive tracking of requests, responses, and errors
  - Ensure structured logging for easier analysis and monitoring

**Code Quality & Maintainability:**
  - Enforce strict formatting and linting for code consistency
  - Refactor for improved modularity and reduced code duplication
  - Add comments to explain complex logic and API functionalities
  - Review and optimize API design for clarity and consistency

**Database Optimization (If Applicable):**
  - Review database schema for optimization and indexing
  - Optimize database queries and stored procedures
  - Ensure database transaction atomicity and data integrity

Apply these directives to elevate the backend code to peak performance, security, and maintainability.
    `
};

const editingSQL = {
    name: "Editing: SQL Code Edit",
    text: `
Refactor and optimize this SQL code for peak performance, data integrity, security, and maintainability:

**Performance Tuning:**
  - Analyze and optimize slow-performing queries using EXPLAIN
  - Enhance indexing strategies to improve query speed
  - Optimize database schema design for query performance

**Data Integrity & Consistency:**
  - Review and strengthen data integrity constraints (NOT NULL, UNIQUE, FOREIGN KEY, CHECK)
  - Ensure data type correctness and consistency across tables
  - Implement database triggers or stored procedures for data validation
  - Verify atomicity of database transactions for data consistency

**Security Hardening:**
  - Review SQL code for injection vulnerabilities and use parameterized queries
  - Implement database access control and permissions (least privilege principle)
  - Audit SQL code for compliance with security best practices

**Code Quality & Maintainability:**
  - Enforce clean SQL formatting and consistent naming conventions
  - Refactor complex queries into smaller, manageable units or views
  - Create reusable SQL functions or stored procedures to reduce duplication
  - Add meaningful comments to explain complex logic and data transformations

**Error Handling & Logging:**
  - Enhance SQL error handling within stored procedures and functions
  - Implement logging mechanisms to track SQL script execution and identify issues

Apply these directives to elevate the SQL code to optimal performance, security, and maintainability.
    `
};

const rewriteGolangBackend = {
    name: "rewrite: Golang Backend Code Rewrite",
    text: `
Rewrite this Golang backend file for exceptional performance, clarity, and maintainability:

**Structure:**
- Add file path comment and comprehensive purpose header
- Organize with idiomatic Go practices (grouped imports, clear packages)
- Break large functions into smaller, testable helpers
- Separate concerns (handlers, business logic, data access)

**Error Handling & Logging:**
- Use Go's error handling idioms with immediate checks
- Implement structured logging (logrus, standard log)
- Return wrapped errors with context
- Document non-obvious error handling logic

**Performance & Concurrency:**
- Ensure goroutines and channels are race-condition free
- Optimize critical code paths with profiling (pprof)
- Refactor blocking operations to non-blocking alternatives
- Use sync primitives correctly

**Code Quality:**
- Follow gofmt formatting and Effective Go conventions
- Write clear, concise, idiomatic Go code
- Remove redundant code and document complex logic
- Include unit tests for maintainability
`
};

const editingGolangBackend = {
    name: "editing: Golang Backend Code Edit",
    text: `
Refactor and enhance this Golang backend code for improved readability, maintainability, and performance:

**Code Quality & Readability:**
  - Clean up code formatting and remove redundant comments
  - Ensure variable and function names follow Go naming conventions
  - Refactor complex functions into smaller, reusable components
  - Remove duplicate code and consolidate common logic

**Error Handling & Logging Improvements:**
  - Review and improve error handling: check errors promptly and provide context
  - Standardize logging using structured logging library (e.g., logrus)
  - Add logging at critical points for debugging and monitoring

**Performance & Concurrency:**
  - Optimize performance by reviewing code paths and goroutine management
  - Use Go's race detector to ensure no data races exist
  - Refactor blocking operations to improve concurrency and throughput

**Security & Best Practices:**
  - Ensure all user inputs and external data are validated and sanitized
  - Review external packages for security and keep them up-to-date
  - Document security decisions in authentication and data processing areas

**Testing & Maintainability:**
  - Add or improve unit tests for key functions
  - Document assumptions or complex business logic with clear comments
  - Ensure code is modular for future extensions and maintenance

Apply these edits to enhance your Golang backend code quality, performance, and maintainability.
`
};

const rewriteRustBackend = {
    name: "rewrite: Rust Backend Code Rewrite",
    text: `
Rewrite this Rust backend file for exceptional performance, safety, and maintainability:

**Structure:**
- Add file path comment and comprehensive purpose header
- Organize with Rust's module system (related functions, types, traits)
- Break complex functions into smaller, well-defined helpers
- Use clear naming conventions (snake_case, CamelCase)

**Error Handling & Logging:**
- Use Result type and ? operator for clean error propagation
- Provide meaningful error messages with custom error types
- Implement structured logging (log, env_logger, tracing)
- Leverage ownership, borrowing, and lifetimes for memory safety

**Performance & Concurrency:**
- Write efficient, idiomatic Rust code
- Use async/await with Tokio for I/O-bound operations
- Leverage safe parallelism with threads or async tasks
- Profile with cargo flamegraph or perf for optimization

**Code Quality:**
- Enforce rustfmt formatting and clippy linting
- Remove redundant code and document complex logic
- Write unit tests for correctness and maintainability
- Manage dependencies wisely for fast builds
`
};

const editingRustBackend = {
    name: "editing: Rust Backend Code Edit",
    text: `
Refactor and enhance this Rust backend code for improved clarity, performance, and maintainability:

**Code Quality & Readability:**
  - Reformat code using rustfmt for consistent style
  - Review names to ensure they follow Rust naming conventions
  - Simplify complex logic using smaller functions or pattern matching
  - Remove duplicate code and consolidate common logic

**Error Handling & Logging Improvements:**
  - Handle all potential error cases using Result and the ? operator
  - Enhance error messages with context using 'anyhow' or 'thiserror'
  - Standardize logging using 'tracing' or 'log' with 'env_logger'

**Performance & Concurrency:**
  - Identify blocking operations and refactor to use async programming (Tokio)
  - Verify concurrent operations are free of data races using ownership rules
  - Run benchmarks and profiling to identify and optimize bottlenecks

**Security & Best Practices:**
  - Review code for security vulnerabilities (unsafe blocks, unchecked unwraps)
  - Ensure external data is validated and sanitized before use
  - Document critical business logic and decision points

**Testing & Maintainability:**
  - Add or enhance unit tests and integration tests
  - Refactor code to be more modular for easier testing and maintenance
  - Update documentation comments to reflect changes

Apply these edits to elevate your Rust backend code to higher standards of quality, clarity, and maintainability.
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

