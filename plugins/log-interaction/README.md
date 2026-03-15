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

## Manual installation

If you prefer not to use the plugin system:

1. Copy `log_interaction.sh` into your project (e.g., `.claude/hooks/`)
2. Add hook entries to `.claude/settings.local.json` referencing the script path — see `hooks.json` for the structure. Replace `$PLUGIN_DIR` with the actual path to the script (e.g., `/path/to/project/.claude/hooks`)
3. Update the `command` paths to match where you placed the script

## Notes

- Hooks run from the project root. The log directory (`.claude/logs/`) is created relative to the working directory at invocation time.
- When installed via the plugin system, `$PLUGIN_DIR` is set to the plugin's install path at runtime.
- Hook input is received via stdin as JSON.
- Log files are appended to, so they accumulate across sessions within the same hour.
