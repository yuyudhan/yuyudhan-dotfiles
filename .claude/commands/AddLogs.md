# Add Comprehensive Logging

Add debug, info, warn, and error logs to the provided file(s) or codebase context to enable effective debugging and production diagnosis.

## Log Levels - When to Use Each

1. **DEBUG** - Development and detailed troubleshooting:
   - Function entry/exit with relevant parameters
   - Loop iterations for complex operations
   - Intermediate calculation results and state transitions
   - Cache hits/misses, conditional branch paths taken
   - *Use liberally in development; typically disabled in production*

2. **INFO** - Normal operational events and milestones:
   - Significant business logic milestones
   - Successful completion of major operations
   - Configuration loading and initialization
   - User-initiated actions completing successfully
   - Scheduled task execution

3. **WARN** - Unexpected but recoverable situations:
   - Deprecated API usage or fallback to defaults
   - Retry attempts and performance degradation warnings
   - Configuration issues that don't prevent operation
   - Approaching resource limits

4. **ERROR** - Failures requiring attention:
   - Exceptions and caught errors (ALWAYS include stack traces)
   - Failed external service calls
   - Data validation failures
   - Resource exhaustion
   - Operations that fail but are handled gracefully

## Log Categories - Prefix EVERY Log

Every log line MUST start with a category prefix in square brackets:

**Core Categories:**
- `[TIMING]` - Performance measurements, operation duration
- `[DIAGNOSIS]` - Detailed diagnostic information for debugging
- `[NETWORK]` - HTTP requests, API calls, external service interactions
- `[DATABASE]` - Database queries, connections, transactions
- `[AUTH]` - Authentication and authorization events
- `[VALIDATION]` - Input validation, data integrity checks
- `[STATE]` - State changes and lifecycle events
- `[BUSINESS]` - Business logic milestones

**Additional Categories:**
- `[CACHE]` - Cache operations (hits, misses, invalidations)
- `[FILE]` - File system operations
- `[CONFIG]` - Configuration loading and changes
- `[INIT]` - Initialization and startup events
- `[SHUTDOWN]` - Cleanup and shutdown events
- `[SECURITY]` - Security-related events (failed logins, access denied)

Create new categories when needed for the specific domain.

## Strategic Log Placement

**Always add logs at these critical points:**

1. **Function/method boundaries**:
   - Entry: DEBUG level with parameters
   - Exit: DEBUG level with return values

2. **External interactions**:
   - Before external calls (INFO with request details)
   - After external calls (INFO/ERROR for results with status codes, response times)
   - API calls, database queries, file operations, network requests

3. **Error handling**:
   - All catch blocks (ERROR with full context and stack traces)
   - Validation failures (WARN/ERROR with details)

4. **State changes**:
   - Significant state transitions (INFO)
   - Minor state changes (DEBUG)
   - Configuration changes

5. **Business logic**:
   - Conditional branch decisions (DEBUG which path taken)
   - Loop processing (DEBUG entry, INFO summary at completion)
   - Transaction boundaries (INFO for start/commit/rollback)

6. **Performance-critical operations**:
   - Start time capture
   - End time with duration calculation
   - Use `[TIMING]` category

## Log Content Guidelines

### Include WHO, WHAT, WHY, HOW as Needed

- **WHO**: User ID, session ID, request ID, service name, actor
- **WHAT**: Specific action, event, or operation being performed
- **WHY**: Trigger, reason, or business context
- **HOW**: Method parameters, input values, configuration, execution path

### Log Message Format

```
[CATEGORY] Clear description: key1=value1, key2=value2, key3=value3
```

**Examples:**
```
logger.debug("[DIAGNOSIS] Processing payment request: user_id=12345, amount=99.99, currency=USD")
logger.info("[TIMING] Database query completed: duration=245ms, rows_returned=150")
logger.warn("[NETWORK] API call retry attempt: attempt=2/3, endpoint=/api/users")
logger.error("[DATABASE] Connection failed: host=db.example.com, error=timeout_after_30s")
```

## Security - What NOT to Log

**NEVER log these:**
- ❌ Passwords, API keys, tokens, secrets, private keys
- ❌ Credit card numbers, SSNs, or sensitive PII
- ❌ Full request/response bodies with sensitive data
- ❌ Session cookies or authentication credentials

**Instead, sanitize and mask:**
- ✅ Log user IDs, not usernames with PII
- ✅ Log presence and type: `[AUTH] Processing login for user_id=12345`
- ✅ Truncate large payloads: `payload_size=1024kb (truncated)`
- ✅ Mask sensitive fields: `card_number=****1234`

## Best Practices

- Use existing logging utilities/frameworks in the codebase
- Use structured logging with key=value pairs
- Include relevant identifiers (request IDs, transaction IDs)
- Add timing logs for performance-critical operations
- Be liberal with DEBUG logs for development
- Keep INFO logs focused on significant milestones
- ALWAYS include stack traces in ERROR logs
- Avoid expensive computations in log statements
- Use lazy evaluation for costly DEBUG logs

## Language-Specific Guidelines

**IMPORTANT**: Always prefer to use existing logging utilities in the codebase. If none exist, use the industry-standard logging library or framework for the language.

### JavaScript/TypeScript
- Prefer existing logger; if none, use logging frameworks (winston, pino, bunyan) or `console` methods
- Format: `logger.debug('[TIMING] Function executed: duration=45ms')`
- Include context objects: `logger.info('[NETWORK] API request', { url, method, statusCode })`
- Timing pattern:
  ```javascript
  const start = performance.now();
  logger.debug('[TIMING] Starting data processing', { batchSize: 1000 });
  // ... operation ...
  const duration = performance.now() - start;
  logger.info('[TIMING] Data processing completed', { duration: `${duration.toFixed(2)}ms`, recordsProcessed: 1000 });
  ```

### Python
- Prefer existing logger; if none, use `logging` module or frameworks (loguru, structlog)
- Format: `logger.debug("[TIMING] Function executed: duration=45ms")`
- Include extra context: `logger.info("[NETWORK] API request", extra={"url": url, "method": method})`
- Timing pattern:
  ```python
  import time
  start_time = time.time()
  logger.debug("[TIMING] Starting data processing: batch_size=1000")
  # ... operation ...
  duration = time.time() - start_time
  logger.info(f"[TIMING] Data processing completed: duration={duration:.2f}s, records_processed=1000")
  ```

### Java
- Prefer existing logger; if none, use SLF4J, Log4j2, or JUL (java.util.logging)
- Format: `logger.debug("[TIMING] Function executed: duration={}ms", duration)`
- Use parameterized logging for performance
- Timing pattern:
  ```java
  long startTime = System.currentTimeMillis();
  logger.debug("[TIMING] Starting data processing: batchSize={}", 1000);
  // ... operation ...
  long duration = System.currentTimeMillis() - startTime;
  logger.info("[TIMING] Data processing completed: duration={}ms, recordsProcessed={}", duration, 1000);
  ```

### Go
- Prefer existing logger; if none, use `log`, `zap`, `zerolog`, or `logrus`
- Format: `log.Debug("[TIMING] Function executed", "duration", duration)`
- Use structured logging with key-value pairs
- Timing pattern:
  ```go
  start := time.Now()
  log.Debug("[TIMING] Starting data processing", "batchSize", 1000)
  // ... operation ...
  duration := time.Since(start)
  log.Info("[TIMING] Data processing completed", "duration", duration.Milliseconds(), "recordsProcessed", 1000)
  ```

### Rust
- Prefer existing logger; if none, use `log` crate with `env_logger`, or `tracing` framework
- Format: `debug!("[TIMING] Function executed: duration={:?}", duration)`
- Use structured logging with tracing spans
- Timing pattern:
  ```rust
  let start = Instant::now();
  debug!("[TIMING] Starting data processing: batch_size={}", 1000);
  // ... operation ...
  let duration = start.elapsed();
  info!("[TIMING] Data processing completed: duration={:?}, records_processed={}", duration, 1000);
  ```

## Good vs Bad Logging Examples

### ✅ GOOD Logs

```python
# Good - Specific, categorized, with context
logger.debug("[DIAGNOSIS] Processing payment: user_id=12345, amount=99.99, currency=USD, payment_method=credit_card")
logger.info("[TIMING] Database query completed: duration=245ms, rows_returned=150, query_type=user_lookup")
logger.warn("[NETWORK] API retry attempt: attempt=2/3, endpoint=/api/users, error=connection_timeout")
logger.error("[DATABASE] Connection pool exhausted: active=50, max=50, waiting_requests=15")

# Good - Entry/exit with context
logger.debug("[DIAGNOSIS] Entering validate_user: user_id=12345, validate_permissions=true")
logger.debug("[DIAGNOSIS] Exiting validate_user: user_id=12345, is_valid=true, permissions=[read, write]")

# Good - Security-conscious
logger.info("[AUTH] Login successful: user_id=12345, ip_address=192.168.1.100, session_id=abc123")
logger.error("[SECURITY] Failed login attempt: user_id=12345, reason=invalid_password, ip_address=192.168.1.100")
```

### ❌ BAD Logs

```python
# Bad - No category prefix
logger.info("Processing payment")

# Bad - Missing context
logger.debug("Query completed")

# Bad - Logs sensitive data
logger.info("Login attempt: username=john@example.com, password=secret123")  # NEVER DO THIS

# Bad - Too vague
logger.error("Something failed")

# Bad - No useful information
logger.debug("Here")
logger.debug("In function")

# Bad - Excessive/noisy
logger.info("Loop iteration 1")
logger.info("Loop iteration 2")
logger.info("Loop iteration 3")  # Use DEBUG for iterations, INFO for summary
```

## Output Summary

After adding logs, provide a summary including:

1. **Statistics**:
   - Total number of logs added (by level: DEBUG, INFO, WARN, ERROR)
   - Categories used (e.g., TIMING, DIAGNOSIS, NETWORK, etc.)

2. **Key Areas Instrumented**:
   - Functions/methods enhanced with logging
   - Critical paths covered (error handling, external calls, state changes)
   - Performance-critical operations with timing logs

3. **Logging Strategy Applied**:
   - Brief explanation of the logging approach for this code
   - Any existing logging patterns respected and maintained

4. **Security Considerations**:
   - Sensitive data that was sanitized or masked
   - Areas requiring manual review for PII/secrets

5. **Recommendations** (if any):
   - Suggested logging infrastructure improvements
   - Missing logging utilities that should be added

