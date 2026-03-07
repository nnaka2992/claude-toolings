#!/usr/bin/env bash
# Logs Claude Code interactions to an hourly log file

LOG_DIR=".claude/logs/$(date +%Y/%m/%d)"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/$(date +%Y-%m-%dT%H).log"
TIMESTAMP="$(date '+%Y-%m-%d %H:%M:%S')"

INPUT=$(cat)
EVENT=$(printf '%s' "$INPUT" | jq -r '.hook_event_name // empty' 2>/dev/null)
SESSION_ID=$(printf '%s' "$INPUT" | jq -r '.session_id // empty' 2>/dev/null)

case "$EVENT" in
  UserPromptSubmit)
    PROMPT=$(printf '%s' "$INPUT" | jq -r '.prompt // empty' 2>/dev/null)
    printf '[%s] [%s] USER: %s\n' "$TIMESTAMP" "$SESSION_ID" "$PROMPT" >> "$LOG_FILE"
    ;;
  PostToolUse)
    TOOL=$(printf '%s' "$INPUT" | jq -r '.tool_name // empty' 2>/dev/null)
    TOOL_IN=$(printf '%s' "$INPUT" | jq -c '.tool_input // empty' 2>/dev/null)
    printf '[%s] [%s] TOOL: %s | INPUT: %s\n' "$TIMESTAMP" "$SESSION_ID" "$TOOL" "$TOOL_IN" >> "$LOG_FILE"
    ;;
  Stop)
    MSG=$(printf '%s' "$INPUT" | jq -r '.last_assistant_message // empty' 2>/dev/null)
    printf '[%s] [%s] CLAUDE: %s\n' "$TIMESTAMP" "$SESSION_ID" "$MSG" >> "$LOG_FILE"
    ;;
  *)
    printf '[%s] [%s] RAW: %s\n' "$TIMESTAMP" "$SESSION_ID" "$INPUT" >> "$LOG_FILE"
    ;;
esac
