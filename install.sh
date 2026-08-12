#!/bin/bash
set -euo pipefail

SKILL_NAME="landing-page"
HERMES_ROOT="${HERMES_HOME:-$HOME/.hermes}"
SKILL_DIR="$HERMES_ROOT/skills/$SKILL_NAME"
REPO_URL="https://github.com/Aston1690/claude-skill-landing-page.git"

printf '\nInstalling Hermes skill: %s\n' "$SKILL_NAME"
printf '%s\n' '----------------------------------------'

if [ -d "$SKILL_DIR/.git" ]; then
  CURRENT_REMOTE="$(git -C "$SKILL_DIR" remote get-url origin 2>/dev/null || true)"
  if [ "$CURRENT_REMOTE" = "$REPO_URL" ] || [ "$CURRENT_REMOTE" = "${REPO_URL%.git}" ]; then
    git -C "$SKILL_DIR" pull --ff-only origin main
  else
    BACKUP="${SKILL_DIR}.backup.$(date +%Y%m%d%H%M%S)"
    printf 'Existing installation belongs to another repository; moved to %s\n' "$BACKUP"
    mv "$SKILL_DIR" "$BACKUP"
    git clone "$REPO_URL" "$SKILL_DIR"
  fi
elif [ -e "$SKILL_DIR" ]; then
  BACKUP="${SKILL_DIR}.backup.$(date +%Y%m%d%H%M%S)"
  printf 'Existing non-git installation moved to %s\n' "$BACKUP"
  mv "$SKILL_DIR" "$BACKUP"
  git clone "$REPO_URL" "$SKILL_DIR"
else
  mkdir -p "$(dirname "$SKILL_DIR")"
  git clone "$REPO_URL" "$SKILL_DIR"
fi

if [ ! -f "$SKILL_DIR/SKILL.md" ]; then
  printf 'ERROR: %s/SKILL.md was not installed.\n' "$SKILL_DIR" >&2
  exit 1
fi

printf '\nInstalled at %s\n' "$SKILL_DIR"
printf 'Inside Hermes, run:\n  /reload-skills\n  /skill %s\n\n' "$SKILL_NAME"
