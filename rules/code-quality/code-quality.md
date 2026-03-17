# Code Quality Standards

- All code must pass strict lint checks with zero warnings.
- All tests must pass before committing.
- Run validation (type checks, lint, tests) before every commit.
- Cyclomatic complexity must be less than 8 per function. Break complex functions into smaller ones.
- DRY: do not repeat yourself in non-test production code. Extract shared logic to reduce duplication and similarity.
- Test code is exempt from DRY — clarity and explicitness are preferred over abstraction in tests.
