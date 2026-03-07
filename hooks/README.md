# Hooks

Hooks are shell commands that run automatically in response to Claude Code events such as tool calls or notifications.

## Available Hooks

- [log_interaction](log_interaction/) — Logs Claude Code interactions (user prompts, tool calls, assistant responses) to hourly log files organized by date

## Directory Layout

```
hooks/<name>/
├── README.md              — Documentation, usage examples, and notes
├── <name>.json            — Hook configuration (to merge into settings.json)
├── settings.json.sample   — Example settings.json showing how to integrate
└── ...                    — Supporting scripts, configs, or other files
```

Hooks may include scripts or other supporting files that the hook commands reference.

## Installation

Merge the `.json` hook entries into your project or global settings file:

```bash
# Project-scoped — merge into .claude/settings.json
# Global — merge into ~/.claude/settings.json
```

If the hook includes supporting scripts, copy them to an appropriate location and update the command paths accordingly. See each hook's README for specific instructions.

## Notes

- Hook commands run in the project's root directory.
- `PreToolUse` hooks that exit non-zero will block the tool call and surface the hook's stdout as feedback to Claude.
- Keep hook commands fast — they run synchronously and block Claude Code while executing.
- The `matcher` field is a regex matched against the tool name. Omit it to match all tools for that event.
