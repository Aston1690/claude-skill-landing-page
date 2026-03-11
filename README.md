# /landing-page — Claude Code Skill

Build complete, deployment-ready landing pages from client websites and content documents.

## One-Line Install

Paste this into your terminal:

```bash
bash <(curl -sL https://raw.githubusercontent.com/Aston1690/claude-skill-landing-page/main/install.sh)
```

Then restart Claude Code. Type `/landing-page` to use it.

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
/landing-page
```

Then provide:
- A website URL to extract branding from
- A content document (PDF, Google Doc, markdown) for page copy
- Optional: specific deployment preferences

## Requirements

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) CLI
- Node.js (for local preview server)
- Vercel CLI (optional, for deployment)
