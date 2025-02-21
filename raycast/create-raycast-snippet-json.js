
// FilePath: raycast/create-raycast-json.js

/**
 * This script creates individual snippet objects for various rewrite and editing prompts,
 * as well as additional snippets for generic mail replies and label management.
 * It then merges them into a single object and writes the resulting JSON to "snippets.json".
 * Run this script using Node.js to generate the JSON file.
 */

const fs = require('fs');
const path = require('path');

// Rewrite snippets (names now start with "rewrite:")
const rewriteReactOnly = {
    name: "rewrite: React-Only with Tailwind Frontend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise file header explaining the file’s purpose and developer guidance.
Code Quality:
  - Enforce clean code formatting and linting.
  - Write clean, maintainable, and optimized React code following best practices.
Functionality & UX:
  - Ensure accessibility, responsiveness, and smooth animations.
  - Optimize state management and performance.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) liberally.
  - Implement comprehensive error handling without exposing sensitive information.
Output Quality:
  - Deliver elegant output that supports both standard and dark mode.
Tech Stack Specifics:
  - Use Tailwind CSS and shadcn/ui components consistently.
Commenting Strategies:
  - Add comments only where they offer valuable guidance to developers.
  - Avoid trivial comments that merely state inputs and outputs.
`
};

const rewriteNextjsFrontend = {
    name: "rewrite: Next.js Frontend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header documenting the file’s purpose and guidance for developers.
Code Quality:
  - Enforce clean code formatting and linting.
  - Write clean, maintainable, and optimized code following Next.js best practices.
Functionality & UX:
  - Ensure a sleek, responsive, dark mode-compatible design.
  - Implement dynamic imports for lazy loading and efficient state management.
  - Enhance UX with smooth animations and accessible components.
Performance & Security:
  - Optimize routing, caching, and prefetching.
  - Ensure type safety with TypeScript.
Tech Stack Specifics:
  - Use Tailwind CSS and shadcn/ui components consistently.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) liberally.
  - Implement comprehensive error handling and graceful failure responses.
Commenting Strategies:
  - Include meaningful comments to guide developers.
  - Avoid unnecessary comments that do not add value.
`
};

const rewriteReactComponent = {
    name: "rewrite: React Component File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header explaining the component’s functionality and developer guidance.
Code Quality:
  - Enforce clean formatting, linting, and maintainable code practices.
  - Write optimized, performant, and reusable React component code.
Functionality & UX:
  - Ensure component accessibility, responsiveness, and integration with animations if needed.
  - Use efficient state management and dynamic imports where applicable.
Tech Stack Specifics:
  - Use Tailwind CSS and shadcn/ui components consistently.
Logging & Error Handling:
  - Include logging (logger.info, logger.debug, logger.warn, logger.error) as needed.
  - Provide comprehensive error handling and graceful failure responses.
Commenting Strategies:
  - Add comments where they offer clear guidance.
  - Avoid cluttering the code with trivial comments.
`
};

const rewriteGenericFrontend = {
    name: "rewrite: Generic Frontend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header summarizing the file’s purpose and offering guidance to developers.
Code Quality:
  - Enforce clean code formatting and linting.
  - Write clean, maintainable, and optimized code.
Functionality & UX:
  - Ensure an elegant, responsive, dark mode-compatible design.
  - Implement smooth animations and accessible UI components.
Performance & State Management:
  - Optimize with lazy loading, efficient state management, caching, and memoization.
Tech Stack Specifics:
  - Use Tailwind CSS and shadcn/ui components consistently.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) liberally.
  - Implement comprehensive error handling and graceful failure responses.
Commenting Strategies:
  - Add useful, guiding comments for developers.
  - Avoid superfluous comments that do not enhance clarity.
`
};

const rewriteNextjsBackend = {
    name: "rewrite: Next.js Backend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header documenting the file’s purpose and providing developer guidance.
Code Quality:
  - Enforce clean code formatting, linting, and maintainability.
  - Write optimized, scalable, and bug-free code.
Functionality, Performance & Security:
  - Ensure efficient routing, atomic transactions, and optimal performance.
  - Follow strict security practices including input validation, rate limiting, and authentication/authorization.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) liberally.
  - Implement comprehensive error handling with graceful failure responses without exposing sensitive data.
Commenting Strategies:
  - Include comments only where they add meaningful guidance for developers.
  - Avoid trivial or redundant comments.
`
};

const rewriteFastifyBackend = {
    name: "rewrite: Fastify Backend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header that explains the file’s purpose and offers developer guidance.
Code Quality:
  - Enforce strict code formatting and linting for maintainability.
  - Write optimized, scalable, and bug-free Fastify backend code.
Functionality, Performance & Security:
  - Ensure efficient routing, atomic operations, and overall high performance.
  - Follow best security practices including input validation, rate limiting, and proper authentication/authorization.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) throughout the code.
  - Implement comprehensive error handling and graceful failure responses.
Commenting Strategies:
  - Use comments judiciously to provide meaningful developer guidance.
  - Avoid unnecessary comments that do not add value.
`
};

const rewriteGenericBackend = {
    name: "rewrite: Generic Backend File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header summarizing the file’s purpose and offering developer guidance.
Code Quality:
  - Enforce clean code formatting, linting, and maintainability.
  - Write optimized, scalable, and bug-free code.
Functionality, Performance & Security:
  - Ensure atomic operations and optimized performance.
  - Implement strict security practices including input validation, rate limiting, and secure authentication/authorization.
Logging & Error Handling:
  - Add robust logging (logger.info, logger.debug, logger.warn, logger.error) liberally.
  - Provide comprehensive error handling with graceful failure responses.
Commenting Strategies:
  - Include meaningful comments that guide developers effectively.
  - Avoid superfluous comments that do not enhance clarity.
`
};

const rewritePostgreSQL = {
    name: "rewrite: PostgreSQL File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header explaining the SQL script’s purpose and developer guidance.
SQL Quality:
  - Enforce clean formatting and consistent naming conventions.
  - Write maintainable and optimized SQL code that is bug-free.
Functionality, Performance & Security:
  - Optimize indexing, constraints, and query efficiency.
  - Ensure atomic transactions and data consistency.
  - Follow security best practices including input validation and access control.
Logging & Error Handling:
  - Include logging comments or guidelines for monitoring/debugging where applicable.
  - Implement proper error handling strategies.
Commenting Strategies:
  - Add comments that explain complex logic or critical decisions.
  - Avoid unnecessary comments that do not add value.
`
};

const rewriteMySQL = {
    name: "rewrite: MySQL File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header detailing the script’s purpose and developer guidance.
SQL Quality:
  - Enforce clean formatting, consistent naming conventions, and maintainable structure.
  - Write optimized and bug-free SQL code.
Functionality, Performance & Security:
  - Optimize queries, indexing, and ensure atomic transactions.
  - Follow strict security practices including input validation and access control.
Logging & Error Handling:
  - Include logging comments or guidelines for monitoring/debugging if applicable.
  - Implement robust error handling.
Commenting Strategies:
  - Add meaningful comments that clarify complex logic.
  - Avoid trivial comments that do not enhance clarity.
`
};

const rewriteDocumentation = {
    name: "rewrite: Documentation File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header summarizing the document’s purpose and providing developer guidance.
Content Quality:
  - Write clear, concise, and developer-friendly documentation.
  - Ensure the content is well-structured, natural, and actionable.
Best Practices & Readability:
  - Maintain consistent terminology, formatting, and logical sections.
  - Include examples and instructions that are easy to follow.
Logging & Code References:
  - For embedded code snippets, include logging instructions (logger.info, logger.debug, logger.warn, logger.error) where applicable.
Commenting Strategies:
  - Use comments to enhance understanding without cluttering the document.
  - Avoid overly generic or redundant explanations.
`
};

const rewriteMarkdown = {
    name: "rewrite: Markdown File Rewrite",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header explaining the document’s purpose and usage guidance.
Content Quality:
  - Write in clear, concise language that is natural and developer-friendly.
  - Ensure consistent markdown formatting and a well-organized structure.
Best Practices & Readability:
  - Use logical sections, headings, and bullet points for clarity.
  - Provide actionable instructions and helpful examples.
Logging & Code References:
  - For any embedded code examples, include logging instructions as needed.
Commenting Strategies:
  - Add comments that offer meaningful guidance.
  - Avoid unnecessary commentary that clutters the content.
`
};

const rewriteProductDocumentation = {
    name: "rewrite: Product Documentation (Markdown Format)",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header explaining the document’s purpose and offering developer guidance.
Content Quality:
  - Write detailed, clear, and accurate product information.
  - Use natural language with consistent terminology and a structured format.
Best Practices & Readability:
  - Organize content into well-defined sections, headings, and bullet points.
  - Include actionable instructions, examples, and embedded code with logging instructions where applicable.
Logging & Code References:
  - For any code snippets, add logging (logger.info, logger.debug, logger.warn, logger.error) as necessary.
Commenting Strategies:
  - Include only meaningful comments that aid understanding.
  - Avoid comments that are redundant or add no value.
`
};

const rewriteUserManuals = {
    name: "rewrite: User Manuals",
    text: `
File Header:
  - Include the file path as a comment on the first line, followed by an empty second line.
  - Add a concise header explaining the manual’s purpose and intended audience.
Content Quality:
  - Write clear, accessible, and user-friendly instructions.
  - Use step-by-step guidance, clear examples, and visual aids where applicable.
Best Practices & Readability:
  - Organize content with logical sections and clear headings.
  - Include troubleshooting tips, FAQs, and actionable steps.
Logging & Code References:
  - For any embedded code examples, include appropriate logging instructions (logger.info, logger.debug, logger.warn, logger.error) if relevant.
Commenting Strategies:
  - Use comments to clarify instructions and highlight key points.
  - Avoid unnecessary technical jargon or redundant explanations.
`
};

// New objects

const replyGenericMail = {
    name: "Reply: Generic Mail Reply",
    text: `
Hi,

Thank you for reaching out. I appreciate your message and will get back to you as soon as possible. If you have any urgent queries, please let me know.

Best regards,
[Your Name]
`
};

const replyPromotionalNotInterested = {
    name: "Reply: Promotional Not Interested",
    text: `
Hi,

Thanks for reaching out. However, this doesn't seem to be of interest to us right now. We have made a note of it and will get back to you if we identify any synergies.

Best regards,
[Your Name]
`
};

const snippetCategoryPrimary = {
    name: "Snippet: category: primary label:unread",
    text: `
category: primary label:unread
`
};

const editingFrontend = {
    name: "Editing: Frontend Code Edit",
    text: "Edit the frontend code to ensure it is clean, maintainable, and optimized. Follow best practices for code formatting, accessibility, performance, and responsiveness. Incorporate dynamic imports and efficient state management while ensuring a sleek design using Tailwind CSS and shadcn/ui components."
};

const editingBackend = {
    name: "Editing: Backend Code Edit",
    text: "Edit the backend code to ensure robust error handling, security, and scalability. Optimize performance with atomic operations and comprehensive logging. Follow best practices for maintainability and adhere to industry standards."
};

const editingSQL = {
    name: "Editing: SQL Code Edit",
    text: "Edit the SQL code to ensure clean formatting, optimized queries, and proper indexing. Follow best practices for data consistency, security, and maintainability. Ensure the code is efficient and bug-free."
};

// Merge all snippet objects into one object
const allSnippets = [
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
];

const outputPath = path.join(__dirname, 'snippets.json');

fs.writeFile(outputPath, JSON.stringify(allSnippets, null, 2), 'utf8', (err) => {
    if (err) {
        console.error('Error writing snippets.json:', err);
    } else {
        console.info('snippets.json has been created successfully at', outputPath);
    }
});

