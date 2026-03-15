# log-interaction

Logs Claude Code interactions to hourly log files organized by date.

## Install

```shell
/plugin marketplace add nnaka2992/claude-toolings
/plugin install log-interaction@claude-toolings
```

## What it logs

| Event | Logged as |
|---|---|
| `UserPromptSubmit` | `[timestamp] [session_id] USER: <prompt>` |
| `PostToolUse` | `[timestamp] [session_id] TOOL: <tool_name> \| INPUT: <tool_input>` |
| `Stop` | `[timestamp] [session_id] CLAUDE: <last_assistant_message>` |
| Other | `[timestamp] [session_id] RAW: <raw_input>` |

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

## Notes

- The `LOG_DIR` in the script defaults to `<cwd>/.claude/logs/`. Update it if you prefer a different location.
- Hook input is received via stdin as JSON.
- Log files are appended to, so they accumulate across sessions within the same hour.
