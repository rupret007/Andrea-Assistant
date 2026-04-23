#!/usr/bin/env bash
# Andrea — bootstrap script
# Installs Andrea on a fresh Mac (or re-syncs an existing setup)
# Usage:  bash setup.sh

set -e

ANDREA_HOME="${ANDREA_HOME:-$(pwd)}"
SKILLS_DIR="$HOME/.claude/skills"
PROJECT_DIR="$HOME/.claude/projects/andrea"

echo "🌟 Andrea — bootstrap"
echo ""
echo "Source: $ANDREA_HOME"
echo "Skills will install to: $SKILLS_DIR"
echo "Memory will install to: $PROJECT_DIR"
echo ""

# Confirm we're in the right place
if [ ! -f "$ANDREA_HOME/CLAUDE.md" ] || [ ! -d "$ANDREA_HOME/skills" ]; then
  echo "❌  Can't find CLAUDE.md or skills/ in $ANDREA_HOME"
  echo "    Run this from the Andrea repo root (where README.md lives)."
  exit 1
fi

echo "✓ Found Andrea repo at $ANDREA_HOME"
echo ""

# Create target directories
mkdir -p "$SKILLS_DIR"
mkdir -p "$PROJECT_DIR/memory"

# Install skills
echo "Installing skills..."
cp -r "$ANDREA_HOME/skills/"* "$SKILLS_DIR/"
SKILL_COUNT=$(ls -1 "$SKILLS_DIR" | wc -l | tr -d ' ')
echo "  ✓ $SKILL_COUNT skills installed"

# Install memory
echo "Installing memory..."
cp "$ANDREA_HOME/CLAUDE.md" "$PROJECT_DIR/"
cp "$ANDREA_HOME/TASKS.md" "$PROJECT_DIR/" 2>/dev/null || echo "  (no TASKS.md — will be created on first use)"
cp -r "$ANDREA_HOME/memory/"* "$PROJECT_DIR/memory/" 2>/dev/null || true
echo "  ✓ Memory copied to $PROJECT_DIR"

# Check Cowork is installed
echo ""
echo "Post-install checklist:"
echo ""
echo "  1. Restart the Claude desktop app to load the new skills"
echo "  2. Open Cowork → new task"
echo "  3. First message: /andrea"
echo "  4. She should greet you in her voice"
echo ""
echo "  Note: if you haven't yet connected Gmail, Calendar, Drive, Exa, or"
echo "  Zapier in Cowork, many of her skills will work but some scheduled"
echo "  rituals will need connector access. See README for details."
echo ""

# Check git status if we're in a repo
if [ -d "$ANDREA_HOME/.git" ]; then
  cd "$ANDREA_HOME"
  BRANCH=$(git branch --show-current 2>/dev/null || echo "unknown")
  echo "  Repo status: branch '$BRANCH', $(git rev-list --count HEAD 2>/dev/null || echo "?") commits"
  echo "  To update in the future: cd $ANDREA_HOME && git pull && bash setup.sh"
  echo ""
fi

echo "✓ Andrea bootstrapped. Say hi."
echo ""
echo "      — Andrea"
