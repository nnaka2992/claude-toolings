# Design by Contract and Purity

- Functions must have no side effects. Given the same inputs, they must always produce the same outputs.
- Separate pure logic from side-effectful operations (I/O, state mutation) at the architecture level.
- Use Design by Contract: define preconditions, postconditions, and invariants for functions.
- Require 100% test coverage for all production code. No untested code paths.
- Use strict types everywhere. No `any`, no implicit conversions, no untyped interfaces.
- Comprehensive error handling: every function must handle all possible error paths explicitly. No swallowed errors, no bare catches, no ignoring return values. Use typed errors and propagate them to callers with meaningful context.
