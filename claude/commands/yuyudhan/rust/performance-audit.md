Purpose: Analyze Rust codebase for performance bottlenecks and optimization opportunities.

Scope: Focus analysis on the specific context, files, or modules provided when running this command.

Focus Areas:
1. Memory allocations: Identify unnecessary clones, Vec reallocations, String allocations
2. Async patterns: Check for blocking calls in async contexts, improper runtime usage
3. Database interactions: Detect N+1 queries, missing connection pooling, inefficient queries
4. Algorithm efficiency: Look for O(n²) operations, unoptimized loops, redundant computations
5. Serialization overhead: Analyze serde usage, large struct copies
6. Lock contention: Review Mutex/RwLock usage patterns, identify contention points

Output Requirements:
- List specific file locations with line numbers for each issue
- Categorize findings by severity (critical/high/medium/low)
- Provide concrete refactoring suggestions with code examples
- Include estimated performance impact where measurable

Ask clarifying questions about:
- Specific modules or files to prioritize
- Known performance issues or hot paths
- Profiling data if available

