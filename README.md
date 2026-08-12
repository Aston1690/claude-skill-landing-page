# Landing Page Skill

A reusable Claude Code and Hermes skill for researching, art-directing, building, testing, and deploying production-ready landing pages.

## Install in Hermes

```bash
bash <(curl -sL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)
```

Then run inside Hermes:

```text
/reload-skills
/skill landing-page
```

## Install in Claude Code

```bash
git clone https://github.com/Aston1690/claude-skill-landing-page.git ~/.claude/skills/landing-page
```

Restart Claude Code, then invoke `/landing-page` or describe the landing-page task naturally.

## What it does

The skill coordinates a seven-phase workflow:

1. Read project/client context and research the real brand.
2. Extract approved copy and document imagery.
3. Verify asset provenance and availability.
4. Establish a coherent frontend direction and implementation blueprint.
5. Build with the simplest suitable stack while preserving existing frameworks.
6. Perform browser QA across desktop, tablet, and mobile, including interactions and errors.
7. Deploy when requested and verify the exact live alias in a browser.

## Frontend skill routing

The workflow integrates the screenshot-listed tools deliberately:

- `frontend-design`: visual thesis, type, palette, composition, and motion intent.
- `design-taste-frontend`: anti-slop implementation, responsive mechanics, accessibility, and pre-flight QA.
- `imagegen-frontend-web`: optional section-level visual references when they materially reduce ambiguity.
- `design-taste-frontend-v1`: legacy compatibility only; never loaded with the current version.
- `imagegen-frontend-mobile`: reserved for separate mobile-app screen concepts, not responsive websites.
- `Aidesigner Frontend`: optional future critique layer if that exact skill is installed.

See `references/frontend-skill-stack.md` for role boundaries and conflict resolution.

## Update

Hermes installation:

```bash
bash <(curl -sL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)
```

Git clone installation:

```bash
git -C ~/.claude/skills/landing-page pull origin main
```

## Repository files

```text
SKILL.md
README.md
install.sh
references/
  frontend-skill-stack.md
  section-patterns.md
  verification-checklist.md
```

## Requirements

- Claude Code or Hermes Agent
- A browser-capable workflow for visual QA
- Node.js/Vercel CLI only when the chosen project stack or deployment requires them

## License

MIT
