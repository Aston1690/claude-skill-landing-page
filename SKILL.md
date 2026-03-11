---
name: landing-page
description: "Build complete, deployment-ready landing pages from client websites and content documents (PDFs, Word docs, brand discovery docs). Use this skill whenever the user wants to create a landing page, redesign an existing website, build a sales page, create a one-page marketing site, or convert content documents into a web page. Also trigger when the user provides a website URL and asks for a redesign, gives you a PDF/doc and wants it turned into a web page, mentions 'landing page', 'sales page', 'marketing page', 'one-pager website', 'web redesign', or asks to deploy a static site to Vercel or Netlify. This skill handles the full pipeline: research, brand extraction, content structuring, image verification, responsive HTML/CSS build, and deployment."
---

# Landing Page Builder

Build high-quality, deployment-ready landing pages by extracting branding and content from client websites and documents, then producing a responsive HTML/CSS page with verified images and clean structure.

This skill exists because landing pages require careful coordination of branding, content, images, and responsive design — and the most common failure mode is treating source documents as text-only, missing the images that carry half the marketing message.

## The Golden Rule

**Images are content, not decoration.** When a marketing PDF shows a classroom photo next to a paragraph about student wellbeing, that photo IS the message. A landing page without those images is incomplete regardless of how good the copy is. Extract and integrate images in the first pass, every time.

---

## Workflow Overview

The build follows six phases. Do not skip or reorder them — each phase depends on the previous one.

1. **Research** — Scrape the client site for branding, assets, and design language
2. **Content Extraction** — Pull ALL content (text AND images) from provided documents
3. **Image Catalog** — Build a verified inventory of every usable image
4. **Build** — Create the HTML/CSS with proper structure and image integration
5. **Verify** — Test all images, responsiveness, and functionality
6. **Deploy** — Ship to Vercel (or user's preferred host)

---

## Phase 1: Research

Before writing any HTML, understand the client's existing brand and collect every asset you'll need.

### Brand Extraction

Fetch the client's website and extract:

- **Colors**: Inspect CSS custom properties, computed styles on key elements (headings, buttons, backgrounds, accents). Record as hex values.
- **Fonts**: Check Google Fonts links, `font-family` declarations, and `@font-face` rules. Do not assume — many sites use fonts that look like common ones but aren't.
- **Logo**: Find the logo image URL (usually in the header or footer). Get the highest-resolution version available.
- **Design language**: Note spacing patterns, border-radius usage, shadow styles, section background treatments.

### Asset Collection

This is critical. Crawl the site's image directories to build a complete catalog:

1. Fetch the homepage and key pages, extract all `<img>` `src` attributes and CSS `background-image` URLs
2. Look for patterns in the image paths (e.g., `/wp-content/uploads/YYYY/MM/` for WordPress sites)
3. For each image, record:
   - Full URL
   - Descriptive name (what does the image show?)
   - Dimensions (from the filename or by fetching headers)
   - Category (photo, illustration, icon, logo, sticker)

Save this catalog — you'll reference it throughout the build.

**Example catalog entry:**
```
URL: https://example.com/wp-content/uploads/2023/08/image-13-1024x768.jpeg
Description: Students working together in classroom
Dimensions: 1024x768
Category: photo
Use for: Problem section, Gallery
```

---

## Phase 2: Content Extraction

When the user provides a PDF, Word doc, or other content document:

### Text Content
- Extract all headings, body copy, statistics, quotes, and CTAs
- Preserve the document's section structure — it usually maps to page sections
- Note any specific phrasing that should be kept verbatim (taglines, endorsed claims, testimonial quotes)

### Image Content (DO NOT SKIP THIS)
- Identify every image in the document
- For each image, determine what it shows and which section it belongs to
- Match document images to actual hosted URLs from the client's website (from your Phase 1 catalog)
- If a document image doesn't match any cataloged URL, note it as "needs source" and ask the user

The reason this matters: marketing documents use images strategically. A PDF that shows character illustrations alongside brain science content is telling you those illustrations belong in the Brain Science section of the landing page. Ignoring them produces a text-heavy page that misses the point.

---

## Phase 3: Image Catalog & Verification

Before building anything, verify every image URL you plan to use.

### Verification Process

For each image URL:
1. Fetch the URL and check the HTTP status code
2. A 200 response with correct content-type means it's good
3. A 404 or other error means the URL is wrong

### Fixing Broken URLs

When an image URL returns 404:
1. Go back to the live site and search for the image by partial filename
2. Fetch the page source that originally contained the image
3. Look for the correct path — filenames often have slight variations (e.g., `GYM_Kid-at-Desk-300x295.png` vs `GYM_Kid_AtDesk-222x300.png`)
4. Never guess filenames. Always verify against the actual server.

### Final Catalog

Produce a verified list mapping each content section to its images:

```
Hero: logo.png (verified), character-teaching.png (verified), sticker-owl.png (verified)
Problem: classroom-photo.jpeg (verified)
Brain Science: character-1.png (verified), character-2.png (verified), character-3.png (verified), character-4.png (verified)
Shift: school-kits.jpg (verified), home-products.jpeg (verified)
Gallery: classroom.jpeg, confidence.png, founders.jpeg (all verified)
```

---

## Phase 4: Build

### File Structure

Keep it simple — a single directory with two files:

```
project-name/
├── index.html
└── styles.css
```

No build tools, no frameworks, no JavaScript dependencies. This makes deployment trivial and the page fast.

### Design System Setup (styles.css)

Start the stylesheet with the extracted brand system:

```css
:root {
  /* Brand colors — extracted from client site */
  --primary: #0f4661;
  --accent: #f37b78;
  /* ... all brand colors as custom properties */

  /* Utility tokens */
  --shadow-sm: 0 1px 3px rgba(0,0,0,0.08);
  --shadow-md: 0 4px 16px rgba(0,0,0,0.10);
  --radius-sm: 0.375rem;
  --radius-md: 0.75rem;
  --radius-lg: 1.25rem;
}

body {
  font-family: 'ExtractedFont', -apple-system, BlinkMacSystemFont, sans-serif;
  color: var(--primary);
  background: var(--background);
}
```

Use BEM naming: `.section__element--modifier`. This keeps specificity flat and styles predictable.

### Section Structure

Build these sections in order, adapting based on the content provided. Not every page needs every section — but this is the standard high-converting flow:

1. **Header** — Sticky nav with logo, section links, and primary CTA button
2. **Hero** — Headline, subheadline, CTA buttons, and a visual element (character illustration, product image, or background)
3. **Trust Bar** — Stats, endorsements, partner logos (builds immediate credibility)
4. **Problem** — Pain points the audience faces. Use a 2-column grid: text on one side, supporting photo on the other. Images here make the problem feel real, not abstract.
5. **Approach/Solution** — How the product/service addresses the problem. Cards or feature blocks work well.
6. **Vision** — The desired future state. Emotionally driven, often with a background image.
7. **Evidence/Science** — Data, research, methodology. If character illustrations or graphics exist, place them here — they make dry content approachable.
8. **Testimonials** — Social proof from real users. Cards with quotes, names, and roles.
9. **Offer/Pricing** — What the user gets. If there are two tiers, use a "Two Paths" comparison layout. Highlight the recommended option.
10. **Gallery** — If images are available, a masonry or grid gallery showcases the product/service in action.
11. **Contact/CTA** — Final conversion section. Form, email, phone, or booking link.
12. **Footer** — Logo, links, copyright, social media.

### Image Integration Rules

This is where most landing page builds fail. Follow these rules:

- **Problem section**: Always pair problem text with a relevant photo (classroom, workplace, real-world context). A 2-column grid (60% text, 40% image) works well.
- **Evidence/Science section**: If the client has character illustrations, mascots, or infographics, place them here. Use a horizontal flex row showing 3-4 characters with labels.
- **Offer section**: Show product photos or kit photos alongside the offer description.
- **Gallery**: Use a CSS grid (3 columns desktop, 2 tablet, 1 mobile) with `object-fit: cover` and consistent heights. Add hover zoom effects.

The general principle: every section that makes a claim should have a supporting image. "Our program is used in real classrooms" needs a classroom photo. "Kids love our characters" needs character illustrations.

### Responsive Design

Build mobile-first with these breakpoints:

```css
/* Tablet */
@media (max-width: 1024px) {
  /* 2-column grids → stack or reduce
     Character images → smaller (100px)
     Gallery → 2 columns */
}

/* Mobile */
@media (max-width: 768px) {
  /* Everything single column
     Character images → 80px
     Gallery → single column
     Hamburger menu active
     Hero → stack vertically */
}
```

Key responsive patterns:
- Side-by-side grids stack vertically on mobile
- Image heights reduce at each breakpoint (desktop 300px → tablet 260px → mobile 220px)
- Font sizes use `clamp()` for fluid scaling
- Container padding increases slightly on mobile for comfortable reading

### HTML Template

The HTML should follow this structure:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>[Page Title] — [Brand Name]</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=[Font]:[weights]&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <!-- Each section clearly commented -->
  <!-- ==================== HEADER ==================== -->
  <header class="header">...</header>

  <!-- ==================== HERO ==================== -->
  <section class="hero">...</section>

  <!-- ... remaining sections ... -->

  <!-- Minimal JS for hamburger menu and smooth scroll -->
  <script>
    // Hamburger toggle
    // Smooth scroll for anchor links
    // Sticky header shadow on scroll
  </script>
</body>
</html>
```

---

## Phase 5: Verify

After building, verify everything works before presenting to the user. This catches the silent failures (broken images, layout breaks) that undermine trust.

### Image Verification

Use the preview server to check every image:

1. Start a local server (`npx serve` or equivalent)
2. Take a screenshot to check overall appearance
3. For each image, check if it loaded:
   - In the preview, evaluate: `document.querySelectorAll('img').forEach(img => { if (img.naturalWidth === 0) console.log('BROKEN:', img.src) })`
   - Any image with `naturalWidth === 0` is broken — fix the URL
4. Force reload (`location.reload()`) before each screenshot to avoid stale cache

### Responsive Check

Resize the viewport and verify at three widths:
- **Desktop** (1280px): All grids show columns, images full-size
- **Tablet** (768px): Grids reduce columns, images scale down
- **Mobile** (375px): Single column, hamburger menu, readable text

### Fix Before Presenting

If any image is broken or any layout is wrong, fix it BEFORE showing the user. The user should see a polished result, not a work-in-progress. The typical fixes:
- Broken image → fetch correct URL from live site
- Layout overflow → add `overflow: hidden` or adjust grid
- Text overflow → reduce font size at breakpoint

---

## Phase 6: Deploy

### Vercel Deployment

When the user wants to deploy:

```bash
cd project-directory
npx vercel --yes --name [project-name] --prod
```

If the user wants a specific subdomain, use `--name` to set it (e.g., `--name growyourmind-redesign` creates `growyourmind-redesign.vercel.app`).

### Post-Deployment Verification

After deployment, verify the live URL:
1. Fetch the deployed URL to confirm it loads
2. Check that all images load on the live site (hotlinked images may have CORS or referrer issues)
3. Test responsive behavior on the live URL

---

## Common Pitfalls & How to Avoid Them

These are lessons from real projects. Each one caused a round of rework when missed.

| Pitfall | Prevention |
|---------|-----------|
| Treating PDFs as text-only | Extract images in the same pass as text. Map each image to its section. |
| Guessing image filenames | Never construct URLs from memory. Fetch the live page and extract actual `src` attributes. |
| Not verifying image URLs | Check every URL before using it. A 404 in production looks unprofessional. |
| Stale preview cache | Force `location.reload()` before every verification screenshot. |
| Missing responsive images | Test at 375px, 768px, and 1280px. Images that look fine at desktop can overflow on mobile. |
| Text-heavy sections | If a section makes a visual claim, it needs an image. "Real classroom results" without a classroom photo falls flat. |
| Assuming the font | Check the live site's actual font-family. Poppins and Inter look similar but aren't interchangeable. |

---

## Reference Files

For detailed section templates and CSS patterns, see:
- `references/section-patterns.md` — HTML/CSS templates for each section type
- `references/verification-checklist.md` — Step-by-step QA checklist

---

## Quick Start Checklist

When you receive a landing page request, run through this mentally:

- [ ] Do I have the client's website URL? (Need it for brand extraction)
- [ ] Do I have content documents? (PDF, doc, transcript)
- [ ] Have I extracted ALL images from those documents?
- [ ] Have I built a verified image catalog with working URLs?
- [ ] Have I mapped every image to its content section?
- [ ] Have I tested all three breakpoints?
- [ ] Have I verified every image loads?
- [ ] Does the user want deployment? Where?
