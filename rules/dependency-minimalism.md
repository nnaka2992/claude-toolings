# Dependency Minimalism

- Justify every new dependency. Prefer the standard library over third-party packages.
- Before adding a dependency, evaluate: maintenance status, transitive dependency count, license compatibility, and security history.
- If the needed functionality is small, implement it instead of importing a library.
- Pin dependency versions explicitly. No floating versions or ranges in lock files.
- Periodically audit existing dependencies for vulnerabilities and unused packages.
