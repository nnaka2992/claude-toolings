# review-changes

Review code changes for code quality, performance, tests, docs, and security.

## Install

```shell
/plugin marketplace add nnaka2992/claude-toolings
/plugin install review-changes@nnaka2992-claude-toolings
```

## What it reviews

| Area | Focus |
|---|---|
| Code quality | Readability, maintainability, patterns |
| Performance | Inefficiencies, unnecessary allocations |
| Test coverage | Missing or weak tests |
| Documentation | Accuracy relative to code changes |
| Security | Vulnerabilities (OWASP top 10, etc.) |

Each area is reviewed by a dedicated subagent. Only noteworthy findings are reported.

## Usage

```
/review
```

Or when reviewing a specific PR:

```
/review #123
```

## Manual installation

Copy the skill into your commands directory:

```bash
# Project-scoped (shared with team)
cp skills/review/review.md /path/to/project/.claude/skills/

# User-scoped (personal, all projects)
cp skills/review/review.md ~/.claude/skills/
```

## Notes

- Uses `allowed-tools` frontmatter to restrict tool access to read-only git and file operations.
- Findings include file path, line number, issue description, and suggested fix.
