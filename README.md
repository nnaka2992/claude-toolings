# claude-toolings

A Claude Code plugin marketplace — discover and install reusable hooks, rules, skills, and more.

## Usage

Add this marketplace to Claude Code:

```shell
/plugin marketplace add nnaka2992/claude-toolings
```

Browse and install plugins:

```shell
/plugin install log-interaction@nnaka2992-claude-toolings
/plugin install git-rules@nnaka2992-claude-toolings
/plugin install review-changes@nnaka2992-claude-toolings
```

## Available Plugins

| Plugin | Description |
|---|---|
| [log-interaction](hooks/log_interaction/) | Logs Claude Code interactions (prompts, tool calls, responses) to hourly log files |
| [git-rules](rules/git/) | Git workflow conventions — conventional commits, force push policy, concise messages |
| [review-changes](skills/review/) | Code review skill covering quality, performance, tests, docs, and security |

## Structure

```
.claude-plugin/
└── marketplace.json         — Marketplace catalog
hooks/
└── <name>/
    ├── .claude-plugin/
    │   └── plugin.json      — Plugin manifest
    ├── hooks.json            — Hook definitions
    └── README.md
rules/
└── <name>/
    ├── .claude-plugin/
    │   └── plugin.json      — Plugin manifest
    ├── *.md                  — Rule files
    └── README.md
skills/
└── <name>/
    ├── .claude-plugin/
    │   └── plugin.json      — Plugin manifest
    ├── *.md                  — Skill files
    └── README.md
```

## Contributing a Plugin

1. Create a directory under the appropriate category (`hooks/`, `rules/`, `skills/`, `agents/`)
2. Add `.claude-plugin/plugin.json` with the required fields (see schema below)
3. Add the plugin's files (hooks, rules, skills, agents, etc.)
4. Add a `README.md` with install instructions and documentation
5. Register the plugin in `.claude-plugin/marketplace.json` (see marketplace schema below)

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

### Marketplace catalog schema (`marketplace.json`)

Each plugin entry requires `name`, `description`, and `source`. Additional fields (`version`, `author`, `category`) are recommended.

| Field | Type | Required | Description |
|---|---|---|---|
| `name` | string | yes | Plugin identifier (must match `plugin.json` name) |
| `description` | string | yes | Brief description |
| `source` | string | yes | Relative path to the plugin directory |
| `version` | string | no | Semver version |
| `author` | object | no | `{ "name": "..." }` |
| `category` | string | no | Plugin category (e.g., `productivity`, `development`, `security`) |

## Development

```bash
# Enter dev environment (provides bats, shellcheck, shfmt, jq)
nix develop --impure

# Enable pre-commit hook
git config core.hooksPath .githooks
```

## License

[MIT](LICENSE)
