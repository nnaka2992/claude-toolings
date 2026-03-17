# Observability

- Use structured logging (key-value pairs / JSON). No unstructured print statements or bare `console.log`.
- Log at system boundaries: incoming requests, outgoing calls, errors, and state transitions.
- Include context in every log entry: request ID, operation name, relevant identifiers.
- Never log secrets, credentials, PII, or full request/response bodies in production.
- Remove all debug/temporary logging before committing.
- Distinguish log levels clearly: error for failures requiring attention, warn for degraded but functional, info for significant state changes, debug for development only.
