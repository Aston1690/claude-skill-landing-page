#!/bin/bash
# Claude Code Skill Installer — Landing Page Builder
# Paste this in your terminal or Claude Code:
#   bash <(curl -sL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)

SKILL_NAME="landing-page"
SKILL_DIR="$HOME/.claude/skills/$SKILL_NAME"
REPO_URL="https://github.com/Aston1690/claude-skill-landing-page.git"

echo ""
echo "Installing Claude Code skill: /$SKILL_NAME"
echo "────────────────────────────────────────────"

if [ -d "$SKILL_DIR" ]; then
  echo "Updating existing installation..."
  cd "$SKILL_DIR" && git pull origin main 2>/dev/null || {
    echo "Replacing with fresh install..."
    rm -rf "$SKILL_DIR"
    git clone "$REPO_URL" "$SKILL_DIR"
  }
else
  echo "Installing to $SKILL_DIR..."
  mkdir -p "$(dirname "$SKILL_DIR")"
  git clone "$REPO_URL" "$SKILL_DIR"
fi

if [ -f "$SKILL_DIR/SKILL.md" ]; then
  echo ""
  echo "Installed! Restart Claude Code and type /landing-page to use it."
  echo ""
else
  echo ""
  echo "ERROR: Installation failed. Try manually:"
  echo "  git clone $REPO_URL $SKILL_DIR"
  echo ""
  exit 1
fi
