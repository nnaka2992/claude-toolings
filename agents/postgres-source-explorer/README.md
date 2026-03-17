# postgres-source-explorer

A Claude Code agent that answers questions about PostgreSQL source code internals by searching, reading, and explaining the C codebase.

## Install

Copy the agent file to your user-level agents directory:

```bash
cp agents/postgres-source-explorer/postgres-source-explorer.md ~/.claude/agents/
```

## Setup

Set the `POSTGRES_SRC_DIR` environment variable to your local PostgreSQL source directory:

```bash
export POSTGRES_SRC_DIR=/path/to/postgresql
```

Add it to your shell profile (`.bashrc` / `.zshrc`) for persistence.

## What it does

- Searches and reads PostgreSQL C source code to answer questions about internals
- Traces call chains through parser, planner, executor, and storage subsystems
- Looks up official PostgreSQL documentation and mailing list archives for design rationale
- Fetches and switches to specific PostgreSQL release tags for version-specific questions
- References blogs from major PostgreSQL contributors (EDB, Crunchy Data, Cybertec, etc.)

## How it works

The agent runs on Sonnet for fast code exploration while your main conversation uses Opus for reasoning. It uses:

| Tool | Purpose |
|---|---|
| `Glob` | Find source files by name pattern |
| `Grep` | Search for function/struct definitions and code patterns |
| `Read` | Read source files and inline documentation |
| `Bash` | Git history, release tag switching, cscope/ctags |
| `WebSearch` | Find mailing list threads, blog posts, documentation |
| `WebFetch` | Retrieve specific documentation pages |

## Usage examples

```
How does PostgreSQL implement hash joins?
What happens during a VACUUM operation?
How does the WAL writer work in REL_17_4?
Why does the planner choose nested loop over hash join?
```
