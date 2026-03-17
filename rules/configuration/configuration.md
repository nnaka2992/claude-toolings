# Configuration

- No hardcoded values: URLs, ports, thresholds, timeouts, connection strings, and feature flags must come from configuration.
- Use environment variables or configuration files for all environment-specific values.
- Fail fast on missing or invalid configuration at startup. Do not fall back to silent defaults that mask misconfiguration.
- Validate all configuration values at load time with the same rigor as external input.
- Document every configuration option: purpose, type, valid range, and default if any.
