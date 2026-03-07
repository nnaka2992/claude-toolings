# Rules

Rules are Markdown files that instruct Claude Code to follow specific conventions, patterns, or constraints.

## Directory Layout

```
rules/<name>/
├── README.md       — Documentation, usage examples, and notes
└── <name>.md       — The rule file
```

## Available Rules

- [git](git/) — Git workflow conventions (commit format, force push policy)

## Installation

Copy the `.md` file into your rules directory:

```bash
# Project-scoped (shared with team)
cp rules/<name>/<name>.md /path/to/project/.claude/rules/

# User-scoped (personal, all projects)
cp rules/<name>/<name>.md ~/.claude/rules/
```

See each rule's README for specific instructions.

## Notes

- Rules are additive — all matching rules are combined into the system prompt.
- Project rules (`.claude/rules/`) can be committed to version control for team-wide consistency.
- Global rules (`~/.claude/rules/`) apply to all projects and are useful for personal preferences.
- Keep rules concise and actionable. Overly long rules dilute their effectiveness.
- Use separate files for unrelated concerns (e.g., `git.md`, `python.md`, `security.md`).
