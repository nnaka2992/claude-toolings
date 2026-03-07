#!/usr/bin/env bats

setup() {
  export TEST_DIR
  TEST_DIR="$(mktemp -d)"
  export SCRIPT_PATH="$BATS_TEST_DIRNAME/log_interaction.sh"
  cd "$TEST_DIR" || return 1
}

teardown() {
  rm -rf "$TEST_DIR"
}

get_log_line() {
  local log_file
  log_file=$(find "$TEST_DIR/.claude/logs" -name "*.log" -type f 2>/dev/null | head -1)
  if [[ -n "$log_file" ]]; then
    tail -1 "$log_file"
  fi
}

@test "UserPromptSubmit logs user prompt with session_id" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "prompt": "Can you check whether nix package visible or not?"
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[3cb33e10-6fe1-4785-9177-95f148232562] USER: Can you check whether nix package visible or not?"* ]]
}

@test "PostToolUse logs tool name and input with session_id" {
  echo '{
    "hook_event_name": "PostToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "Bash",
    "tool_input": {
      "command": "which jq 2>&1",
      "description": "Check package visibility"
    }
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[3cb33e10-6fe1-4785-9177-95f148232562] TOOL: Bash | INPUT:"* ]]
  [[ "$result" == *'"command":"which jq 2>&1"'* ]]
}

@test "PostToolUse logs Read tool with file path" {
  echo '{
    "hook_event_name": "PostToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "Read",
    "tool_input": {
      "file_path": "/path/to/project/.claude/hooks/my_hook.sh"
    }
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"TOOL: Read | INPUT:"* ]]
  [[ "$result" == *"my_hook.sh"* ]]
}

@test "PostToolUse logs Edit tool with old/new strings" {
  echo '{
    "hook_event_name": "PostToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "Edit",
    "tool_input": {
      "file_path": "/path/to/project/src/main.sh",
      "old_string": "printf RAW",
      "new_string": "printf CLAUDE",
      "replace_all": false
    }
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"TOOL: Edit | INPUT:"* ]]
}

@test "PostToolUse logs ToolSearch tool" {
  echo '{
    "hook_event_name": "PostToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "ToolSearch",
    "tool_input": {
      "query": "select:WebFetch",
      "max_results": 1
    }
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"TOOL: ToolSearch | INPUT:"* ]]
  [[ "$result" == *"select:WebFetch"* ]]
}

@test "Stop logs assistant message with session_id" {
  echo '{
    "hook_event_name": "Stop",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "last_assistant_message": "Done. Added a **Stop** hook that captures last_assistant_message."
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[3cb33e10-6fe1-4785-9177-95f148232562] CLAUDE: Done. Added a **Stop** hook that captures last_assistant_message."* ]]
}

@test "unknown event logs raw input with session_id" {
  echo '{
    "hook_event_name": "PreToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "Bash",
    "tool_input": {"command": "rm -rf /"}
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[3cb33e10-6fe1-4785-9177-95f148232562] RAW:"* ]]
  [[ "$result" == *"PreToolUse"* ]]
}

@test "missing session_id produces empty bracket" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "prompt": "hello"
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[] USER: hello"* ]]
}

@test "missing hook_event_name falls through to raw" {
  echo '{
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "some_field": "value"
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  [[ "$result" == *"[3cb33e10-6fe1-4785-9177-95f148232562] RAW:"* ]]
}

@test "log file is created under .claude/logs/YYYY/MM/DD/" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "prompt": "test"
  }' | bash "$SCRIPT_PATH"

  local expected_dir
  expected_dir="$TEST_DIR/.claude/logs/$(date +%Y/%m/%d)"
  [[ -d "$expected_dir" ]]

  local log_file
  log_file=$(find "$expected_dir" -name "*.log" -type f | head -1)
  [[ -f "$log_file" ]]
}

@test "log file name matches YYYY-MM-DDTHH.log format" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "prompt": "test"
  }' | bash "$SCRIPT_PATH"

  local expected_file
  expected_file="$TEST_DIR/.claude/logs/$(date +%Y/%m/%d)/$(date +%Y-%m-%dT%H).log"
  [[ -f "$expected_file" ]]
}

@test "multiple events append to the same log file" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "prompt": "Can you check whether nix package visible or not?"
  }' | bash "$SCRIPT_PATH"

  echo '{
    "hook_event_name": "PostToolUse",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "tool_name": "Bash",
    "tool_input": {"command": "which jq 2>&1", "description": "Check package visibility"}
  }' | bash "$SCRIPT_PATH"

  echo '{
    "hook_event_name": "Stop",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "last_assistant_message": "The packages are visible."
  }' | bash "$SCRIPT_PATH"

  local log_file
  log_file=$(find "$TEST_DIR/.claude/logs" -name "*.log" -type f | head -1)
  local line_count
  line_count=$(wc -l < "$log_file")
  [[ "$line_count" -eq 3 ]]
}

@test "log line starts with timestamp in expected format" {
  echo '{
    "hook_event_name": "UserPromptSubmit",
    "session_id": "3cb33e10-6fe1-4785-9177-95f148232562",
    "prompt": "test"
  }' | bash "$SCRIPT_PATH"

  result="$(get_log_line)"
  # Match [YYYY-MM-DD HH:MM:SS]
  [[ "$result" =~ ^\[[0-9]{4}-[0-9]{2}-[0-9]{2}\ [0-9]{2}:[0-9]{2}:[0-9]{2}\] ]]
}
