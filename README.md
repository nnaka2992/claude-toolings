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
2. Add `.claude-plugin/plugin.json` with name, description, version, author, type, and files
3. Add the plugin's files (hooks, rules, skills, agents, etc.)
4. Add a `README.md` with install instructions and documentation
5. Register the plugin in `.claude-plugin/marketplace.json`

## Development

```bash
# Enter dev environment (provides bats, shellcheck, shfmt, jq)
nix develop --impure

# Enable pre-commit hook
git config core.hooksPath .githooks
```

## License

[MIT](LICENSE)
