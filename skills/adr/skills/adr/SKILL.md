---
name: adr
description: >
  Create Architecture Decision Records (ADRs) following Michael Nygard's template.
  Use this skill whenever the user wants to create an ADR, document an architecture decision,
  record a technical decision, or capture the reasoning behind a design choice. Trigger on
  phrases like "create an ADR", "document this decision", "architecture decision record",
  "record this technical decision", "write up a decision record", "ADR for ...", or any
  request to formally capture why a particular technical or architectural path was chosen.
allowed-tools: Read, Write, Glob, Bash(date:*)
---

# Architecture Decision Record (ADR) Creator

Create ADRs using Michael Nygard's well-known template from
[Documenting Architecture Decisions](https://github.com/joelparkerhenderson/architecture-decision-record).

## Workflow

### Step 1: Extract information from the user's message

The user will provide the information needed for the ADR in their message. Extract these pieces:

1. **Title** — A short noun phrase describing the decision (e.g., "Use PostgreSQL for persistence"). If the user gave a topic but not a crisp title, derive one from their description.
2. **Status** — One of: `Proposed`, `Accepted`, `Rejected`, `Deprecated`, `Superseded`. Default to `Proposed` if not specified.
3. **Context** — The forces at play: what problem or situation is motivating this decision, constraints, alternatives considered.
4. **Decision** — The change being proposed or adopted.
5. **Consequences** — What becomes easier and what becomes harder.

If any critical piece is missing (especially context, decision, or consequences), ask the user to provide it before writing. But do your best to work with what's given — users often describe decisions conversationally and all the pieces are there, just not neatly labeled.

### Step 2: Locate or create the ADR directory

Look for an existing ADR directory by checking these paths in order:

1. `docs/adr/`
2. `doc/adr/`
3. `adr/`
4. `docs/architecture/decisions/`

Use the Glob tool to search for files matching `**/[0-9][0-9][0-9][0-9]-*.md` within these directories. If you find existing ADRs, use that directory.

If no ADR directory exists, ask the user where they'd like to store ADRs. Suggest `docs/adr/` as the default. Create the directory when confirmed.

### Step 3: Determine the next ADR number

If existing ADR files are found, extract the highest number and increment by one. ADR numbers are zero-padded to four digits (`0001`, `0002`, etc.).

If this is the first ADR, start at `0001`.

### Step 4: Write the ADR file

**Filename convention:** `NNNN-title-in-kebab-case.md`

Convert the title to kebab-case: lowercase, spaces to hyphens, strip punctuation.

Example: `0003-use-redis-for-session-caching.md`

**File content — use this exact template:**

```markdown
# [Number]. [Title]

Date: [YYYY-MM-DD]

## Status

[Status]

## Context

[Context — the forces at play, the problem, constraints, and alternatives considered]

## Decision

[The decision, stated affirmatively: "We will ..."]

## Consequences

[What becomes easier and what becomes harder as a result of this decision]
```

Use the Bash tool to run `date +%Y-%m-%d` to get today's date for the Date field.

Write the context, decision, and consequences sections in clear, professional prose. These should be substantive paragraphs, not bullet lists of keywords. However, bullet lists are fine when listing specific alternatives considered or specific consequences.

### Step 5: Confirm with the user

After writing the file, show the user the path and a summary of what was written. Ask if they'd like any changes.
