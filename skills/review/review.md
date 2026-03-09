---
name: review
description: Review code changes for code quality, performance, tests, docs, and security. Use when asked to review changes or a PR.
allowed-tools: Read, Grep, Glob, Bash(git diff:*), Bash(git log:*)
---

Perform a comprehensive code review using subagents for key areas:

- code-quality-reviewer
- performance-reviewer
- test-coverage-reviewer
- documentation-accuracy-reviewer
- security-code-reviewer

Instruct each to only provide noteworthy feedback. Once they finish, review the feedback and post only the feedback that you also deem noteworthy.

Report findings directly in the conversation. For each noteworthy issue:
- File path and line number
- What the issue is
- Suggested fix

Keep feedback concise.
