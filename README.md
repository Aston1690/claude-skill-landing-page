# landing-page — Hermes Skill

Build complete, deployment-ready landing pages from client websites and content documents.

## One-Line Install

Paste this into your terminal:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)
```

Then in Hermes run:

```text
/reload-skills
/skill landing-page
```

If it still does not show, restart Hermes and run `/skill landing-page` again.

## What It Does

Give it a business website URL + content document (PDF, Word doc, brand brief) and it will:

1. Scrape the site for branding (colors, fonts, logo, images)
2. Extract content from your document (text AND images)
3. Verify all image URLs actually load (no broken images)
4. Build a responsive `index.html` + `styles.css`
5. Preview and verify everything works
6. Deploy to Vercel with a custom subdomain

## Usage

```
/skill landing-page
```

Then provide:
- A website URL to extract branding from
- A content document (PDF, Google Doc, markdown) for page copy
- Optional: specific deployment preferences

## Requirements

- [Hermes Agent](https://hermes-agent.nousresearch.com/docs)
- git
- Node.js (for local preview server)
- Vercel CLI (optional, for deployment)

## Install Location

The installer copies this repository to:

```text
${HERMES_HOME:-~/.hermes}/skills/landing-page
```

Hermes only rescans skills after `/reload-skills` or a restart, so installing alone is not enough for an already-running session.
