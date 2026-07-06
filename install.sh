#!/usr/bin/env bash
# Hermes Skill Installer — Landing Page Builder
# Paste this in your terminal:
#   bash <(curl -fsSL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)

set -euo pipefail

SKILL_NAME="landing-page"
HERMES_HOME="${HERMES_HOME:-$HOME/.hermes}"
SKILL_DIR="$HERMES_HOME/skills/$SKILL_NAME"
REPO_URL="https://github.com/Aston1690/claude-skill-landing-page.git"
TMP_DIR="${TMPDIR:-/tmp}/claude-skill-landing-page-install"

echo ""
echo "Installing Hermes skill: $SKILL_NAME"
echo "Target: $SKILL_DIR"
echo "────────────────────────────────────────────"

command -v git >/dev/null 2>&1 || {
  echo "ERROR: git is required to install this skill."
  exit 1
}

rm -rf "$TMP_DIR"
git clone --depth 1 "$REPO_URL" "$TMP_DIR"

mkdir -p "$SKILL_DIR"
rm -rf "$SKILL_DIR"/*
cp -R "$TMP_DIR"/* "$SKILL_DIR"/
rm -rf "$TMP_DIR"

if [ -f "$SKILL_DIR/SKILL.md" ]; then
  echo ""
  echo "Installed. In Hermes run:"
  echo "  /reload-skills"
  echo "  /skill landing-page"
  echo ""
  echo "Or restart Hermes, then run: /skill landing-page"
  echo ""
else
  echo ""
  echo "ERROR: Installation failed. Try manually:"
  echo "  git clone $REPO_URL /tmp/landing-page-skill && mkdir -p $SKILL_DIR && cp -R /tmp/landing-page-skill/* $SKILL_DIR/"
  echo ""
  exit 1
fi
