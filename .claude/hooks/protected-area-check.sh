#!/usr/bin/env bash
# Hook: PreToolUse (Edit, Write)
# Checks if the file being edited is in a protected area.
# On feature branches (phase*): blocks if no spec exists, warns if spec exists.
# On main/develop: warns but allows.

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || echo ".")"

# Read the tool input from stdin (JSON with tool_name and tool_input)
INPUT="$(cat)"
TOOL_NAME="$(echo "$INPUT" | jq -r '.tool_name // empty')"
FILE_PATH="$(echo "$INPUT" | jq -r '.tool_input.file_path // empty')"

# Only check Edit and Write tools
if [[ "$TOOL_NAME" != "Edit" && "$TOOL_NAME" != "Write" ]]; then
  exit 0
fi

# No file path — nothing to check
if [[ -z "$FILE_PATH" ]]; then
  exit 0
fi

# Make path relative to repo root for matching
REL_PATH="${FILE_PATH#$REPO_ROOT/}"

# Protected path patterns
PROTECTED_PATTERNS=(
  "common/auth/"
  "common/guard/"
  "common/context/"
  "common/tenant/"
  "common/audit/"
  "common/acl/"
  "prisma/schema.prisma"
  "prisma/migrations/"
  "lib/auth/"
  "api/graphql-proxy/"
  "graphql-schema/"
  ".env"
)

# Check if the file matches any protected pattern
IS_PROTECTED=false
MATCHED_PATTERN=""
for pattern in "${PROTECTED_PATTERNS[@]}"; do
  if [[ "$REL_PATH" == *"$pattern"* ]]; then
    IS_PROTECTED=true
    MATCHED_PATTERN="$pattern"
    break
  fi
done

if [[ "$IS_PROTECTED" != "true" ]]; then
  exit 0
fi

# File is in a protected area — check branch context
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"

if [[ "$BRANCH" == phase* ]]; then
  # Feature branch — check for spec
  SPEC_FILE="$REPO_ROOT/specs/$BRANCH/spec.md"
  if [[ -f "$SPEC_FILE" ]]; then
    # Spec exists — warn but allow
    echo "WARN: Editing protected area [$MATCHED_PATTERN] on feature branch $BRANCH. Spec exists — proceeding with caution."
    exit 0
  else
    # No spec — block
    echo "BLOCK: Editing protected area [$MATCHED_PATTERN] on feature branch $BRANCH without a spec." >&2
    echo "Create specs/$BRANCH/spec.md first (use /specify)." >&2
    exit 2
  fi
else
  # main/develop — warn only
  echo "WARN: Editing protected area [$MATCHED_PATTERN] on $BRANCH. No enforcement on main/develop (hotfix path)."
  exit 0
fi
