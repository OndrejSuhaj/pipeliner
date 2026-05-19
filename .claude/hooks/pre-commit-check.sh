#!/usr/bin/env bash
# Hook: PreToolUse (Bash)
# Intercepts git commit commands on feature branches.
# Blocks if spec.md is missing. Warns if plan.md is missing.
# Not enforced on main/develop.

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || echo ".")"

# Read the tool input from stdin (JSON with tool_name and tool_input)
INPUT="$(cat)"
TOOL_NAME="$(echo "$INPUT" | jq -r '.tool_name // empty')"
COMMAND="$(echo "$INPUT" | jq -r '.tool_input.command // empty')"

# Only check Bash tool
if [[ "$TOOL_NAME" != "Bash" ]]; then
  exit 0
fi

# Only intercept git commit commands
if ! echo "$COMMAND" | grep -qE '\bgit\s+commit\b'; then
  exit 0
fi

# Check branch
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"

# Not enforced on main/develop
if [[ "$BRANCH" == "main" || "$BRANCH" == "develop" ]]; then
  exit 0
fi

# Only enforce on feature branches (phase*)
if [[ "$BRANCH" != phase* ]]; then
  exit 0
fi

SPEC_DIR="$REPO_ROOT/specs/$BRANCH"
SPEC_FILE="$SPEC_DIR/spec.md"
PLAN_FILE="$SPEC_DIR/plan.md"

if [[ ! -f "$SPEC_FILE" ]]; then
  echo "BLOCK: Cannot commit on feature branch $BRANCH without a spec." >&2
  echo "Create specs/$BRANCH/spec.md first (use /specify)." >&2
  exit 2
fi

if [[ ! -f "$PLAN_FILE" ]]; then
  echo "WARN: Committing on $BRANCH without a plan.md. Consider adding specs/$BRANCH/plan.md."
fi

exit 0
