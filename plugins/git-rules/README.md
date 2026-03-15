# git-rules

Git workflow conventions for Claude Code.

## Install

```shell
/plugin marketplace add nnaka2992/claude-toolings
/plugin install git-rules@claude-toolings
```

## What it does

- Enforces conventional commit format (`feat:`, `fix:`, `chore:`, etc.)
- Prevents `git push --force` (allows `--force-with-lease` when necessary)
- Encourages concise, intent-focused commit messages
- Prevents Co-Authored-By lines in commit messages
