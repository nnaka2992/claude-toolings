# claude-toolings

A Claude Code plugin marketplace — discover and install reusable hooks, rules, skills, and more.

## Usage

Add this marketplace to Claude Code:

```shell
/plugin marketplace add nnaka2992/claude-toolings
```

Browse and install plugins:

```shell
/plugin install review-changes@nnaka2992-claude-toolings
/plugin install adr@nnaka2992-claude-toolings
```

## Available Plugins

| Plugin | Type | Description |
|---|---|---|
| [review-changes](skills/review/) | skill | Code review skill covering quality, performance, tests, docs, and security |
| [adr](skills/adr/) | skill | Create Architecture Decision Records (ADRs) following Michael Nygard's template |

## Other Resources

These are not installable via the marketplace but can be used manually by copying files.

| Resource | Type | Description |
|---|---|---|
| [log-interaction](hooks/log_interaction/) | hook | Logs Claude Code interactions (prompts, tool calls, responses) to hourly log files |
| [git-rules](rules/git/) | rule | Git workflow conventions — conventional commits, force push policy, concise messages |

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
    ├── skills/
    │   └── <name>/
    │       └── SKILL.md      — Skill prompt
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
| `version` | string | no | Semver version |
| `author` | object | yes | `{ "name": "..." }` |

The plugin system auto-discovers components from conventional directories (`hooks/`, `skills/`, `commands/`, `agents/`). See the [official reference](https://code.claude.com/docs/en/plugins-reference.md) for the full schema.

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
