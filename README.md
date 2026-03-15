# claude-toolings

A Claude Code plugin marketplace — discover and install reusable hooks, rules, skills, and more.

## Usage

Add this marketplace to Claude Code:

```shell
/plugin marketplace add nnaka2992/claude-toolings
```

Browse and install plugins:

```shell
/plugin install log-interaction@claude-toolings
/plugin install git-rules@claude-toolings
```

## Available Plugins

| Plugin | Description |
|---|---|
| [log-interaction](plugins/log-interaction/) | Logs Claude Code interactions (prompts, tool calls, responses) to hourly log files |
| [git-rules](plugins/git-rules/) | Git workflow conventions — conventional commits, force push policy, concise messages |

## Structure

```
.claude-plugin/
└── marketplace.json         — Marketplace catalog
plugins/
└── <name>/
    ├── .claude-plugin/
    │   └── plugin.json      — Plugin manifest
    ├── hooks.json            — Hook definitions (if applicable)
    ├── rules/                — Rule files (if applicable)
    └── README.md             — Plugin documentation
```

## Contributing a Plugin

1. Create a directory under `plugins/<your-plugin-name>/`
2. Add `.claude-plugin/plugin.json` with the required fields (see schema below)
3. Add the plugin's files (hooks, rules, skills, agents, etc.)
4. Add a `README.md` with install instructions and documentation
5. Register the plugin in `.claude-plugin/marketplace.json` with `name` and `source`

### Plugin manifest schema (`plugin.json`)

| Field | Type | Required | Description |
|---|---|---|---|
| `name` | string | yes | Plugin identifier (kebab-case) |
| `description` | string | yes | Brief description of what the plugin does |
| `version` | string | yes | Semver version |
| `author` | object | yes | `{ "name": "..." }` |
| `type` | string | yes | Plugin type: `hooks`, `rules`, `skills`, `agents` |
| `files` | object | yes | Map of file categories to arrays of relative paths. Use `hooks` for hook config files, `scripts` for executables, `rules` for rule files, etc. |

Hook commands can reference `$PLUGIN_DIR` — this variable is set to the plugin's install path at runtime.

Marketplace entries (`marketplace.json`) only need `name` and `source`; all metadata is read from `plugin.json`. Plugins are versioned in their own manifest, not in the marketplace catalog.

## Development

```bash
# Enter dev environment (provides bats, shellcheck, shfmt, jq)
nix develop --impure

# Enable pre-commit hook
git config core.hooksPath .githooks
```

## License

[MIT](LICENSE)
