# log_interaction

Logs Claude Code interactions to hourly log files organized by date.

## What it logs

| Event | Logged as |
|---|---|
| `UserPromptSubmit` | `[timestamp] USER: <prompt>` |
| `PostToolUse` | `[timestamp] TOOL: <tool_name> \| INPUT: <tool_input>` |
| `Stop` | `[timestamp] CLAUDE: <last_assistant_message>` |
| Other | `[timestamp] RAW: <raw_input>` |

## Log structure

```
<project>/.claude/logs/
└── YYYY/MM/DD/
    └── YYYY-MM-DDTHH.log
```

Each hour produces a separate log file.

## Dependencies

- `bash`
- `jq`

## Installation

1. Copy the script into your project:

```bash
cp hooks/log_interaction/log_interaction.sh /path/to/project/.claude/hooks/
```

2. Merge the hook entries from `settings.json.sample` into your `.claude/settings.local.json`.

3. Update the `command` paths to match where you placed the script.

## Notes

- The `LOG_DIR` in the script defaults to `<cwd>/.claude/logs/`. Update it if you prefer a different location.
- Hook input is received via stdin as JSON.
- Log files are appended to, so they accumulate across sessions within the same hour.
