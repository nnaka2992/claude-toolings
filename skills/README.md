# Skills (Custom Slash Commands)

Skills are custom slash commands that extend Claude Code with reusable prompts.

## Directory Layout

```
skills/<name>/
├── README.md       — Documentation, usage examples, and notes
└── <name>.md       — The skill prompt template
```

## Installation

Copy the `.md` file into your commands directory:

```bash
# Project-scoped (shared with team)
cp skills/<name>/<name>.md /path/to/project/.claude/commands/

# User-scoped (personal, all projects)
cp skills/<name>/<name>.md ~/.claude/commands/
```

## Notes

- Skills are Markdown files — no YAML frontmatter or special syntax required.
- `$ARGUMENTS` captures everything the user types after the command name.
- Project-scoped commands (`.claude/commands/`) can be committed to version control for team sharing.
