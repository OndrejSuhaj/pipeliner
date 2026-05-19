#!/usr/bin/env bash
# Hook: SessionStart
# Loads governance context at the start of every Claude Code session.

set -euo pipefail

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null || echo ".")"

echo "=== Session governance context ==="
echo ""

# Load first ~80 lines of key governance docs
for doc in \
  ".specify/memory/constitution.md" \
  "docs/governance/guardrails.md" \
  "docs/governance/trigger-matrix.md" \
  "docs/governance/definition-of-done.md"; do
  filepath="$REPO_ROOT/$doc"
  if [[ -f "$filepath" ]]; then
    echo "--- $doc (first 80 lines) ---"
    head -80 "$filepath"
    echo ""
  else
    echo "--- $doc: NOT FOUND ---"
    echo ""
  fi
done

# Show current branch
BRANCH="$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")"
echo "=== Current branch: $BRANCH ==="

# Check if spec/plan/tasks exist for current branch
if [[ "$BRANCH" == phase* ]]; then
  SPEC_DIR="$REPO_ROOT/specs/$BRANCH"
  echo ""
  if [[ -d "$SPEC_DIR" ]]; then
    echo "Spec directory: $SPEC_DIR"
    [[ -f "$SPEC_DIR/spec.md" ]]  && echo "  spec.md: EXISTS"  || echo "  spec.md: MISSING"
    [[ -f "$SPEC_DIR/plan.md" ]]  && echo "  plan.md: EXISTS"  || echo "  plan.md: MISSING"
    [[ -f "$SPEC_DIR/tasks.md" ]] && echo "  tasks.md: EXISTS" || echo "  tasks.md: MISSING"
  else
    echo "No spec directory found for branch $BRANCH"
  fi
fi

echo ""
echo "=== Governance context loaded ==="
