# claude-toolings

A collection of sharable Claude Code tool sets — skills, hooks, and rules.

## Structure

```
<type>/
├── README.md                — Overview of the category (format, conventions)
└── <name>/
    ├── README.md            — Documentation for this specific tool set
    ├── <name>.<suffix>      — The tool file (e.g., .md for rules/skills, .json for hooks)
    └── ...                  — Supporting files (scripts, configs, etc.)
```

### Categories

- **skills/** — Reusable custom slash commands for Claude Code
- **hooks/** — Event-driven shell commands triggered by Claude Code actions (may include scripts)
- **rules/** — Markdown rules that guide Claude Code behavior

See each category's README for format details and each tool set's README for usage instructions.

## License

[MIT](LICENSE)
