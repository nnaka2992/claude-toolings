# git-rules

Git workflow conventions for Claude Code.

## Install

```shell
/plugin marketplace add nnaka2992/claude-toolings
/plugin install git-rules@nnaka2992-claude-toolings
```

## What it does

- Enforces conventional commit format (`feat:`, `fix:`, `chore:`, etc.)
- Prevents `git push --force` (allows `--force-with-lease` when necessary)
- Encourages concise, intent-focused commit messages
- Prevents Co-Authored-By lines in commit messages

## Manual installation

Copy the rule file into your rules directory:

```bash
# Project-scoped (shared with team)
cp plugins/git-rules/rules/git.md /path/to/project/.claude/rules/

# User-scoped (personal, all projects)
cp plugins/git-rules/rules/git.md ~/.claude/rules/
```
