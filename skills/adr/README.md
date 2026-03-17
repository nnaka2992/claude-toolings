# adr

Create Architecture Decision Records (ADRs) following Michael Nygard's template.

## Install

```shell
/plugin marketplace add nnaka2992/claude-toolings
/plugin install adr@nnaka2992-claude-toolings
```

## What it does

- Creates ADR files following the [Nygard template](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions)
- Auto-detects existing ADR directories (`docs/adr/`, `doc/adr/`, `adr/`, `docs/architecture/decisions/`)
- Auto-increments ADR numbers (zero-padded to 4 digits)
- Uses kebab-case filenames (e.g., `0003-use-redis-for-session-caching.md`)

## Usage

```
/adr Use category-based directory structure for plugin marketplace
```

## ADR template

Each ADR includes:

| Section | Content |
|---|---|
| Title | Short noun phrase |
| Date | Creation date |
| Status | Proposed, Accepted, Rejected, Deprecated, or Superseded |
| Context | Forces at play, constraints, alternatives |
| Decision | The change being adopted |
| Consequences | What becomes easier and harder |

## Manual installation

Copy the skill file:

```bash
# Project-scoped (shared with team)
cp skills/adr/adr.md /path/to/project/.claude/skills/

# User-scoped (personal, all projects)
cp skills/adr/adr.md ~/.claude/skills/
```
