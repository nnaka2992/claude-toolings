# Security

- Never commit secrets, credentials, API keys, or tokens to the repository. Use environment variables or secret management tools.
- Sanitize and validate all input at system boundaries (user input, external APIs, file I/O, database queries).
- Audit dependencies before adding them. Check for known vulnerabilities and maintenance status.
- Follow the principle of least privilege: request only the permissions needed, expose only the interfaces required.
- No SQL string concatenation — use parameterized queries or prepared statements exclusively.
- Treat all external data as untrusted. Validate schemas and types before processing.
