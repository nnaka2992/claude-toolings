# git

Git workflow conventions for Claude Code.

## What it does

- Enforces conventional commit format (`feat:`, `fix:`, `chore:`, etc.)
- Prevents `git push --force` (allows `--force-with-lease` when necessary)
- Encourages concise, intent-focused commit messages
- Prevents Co-Authored-By lines in commit messages

## Installation

```bash
# Project-scoped
cp rules/git/git.md /path/to/project/.claude/rules/

# User-scoped (global)
cp rules/git/git.md ~/.claude/rules/
```
