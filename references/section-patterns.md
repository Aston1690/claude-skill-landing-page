# Section Patterns Reference

HTML/CSS templates for each standard landing page section. Adapt colors, fonts, and content to match the client's brand.

## Table of Contents
1. [Header](#header)
2. [Hero](#hero)
3. [Trust Bar](#trust-bar)
4. [Problem Section](#problem-section)
5. [Approach/Solution](#approachsolution)
6. [Vision](#vision)
7. [Evidence/Science](#evidencescience)
8. [Testimonials](#testimonials)
9. [Offer/Pricing](#offerpricing)
10. [Gallery](#gallery)
11. [Contact/CTA](#contactcta)
12. [Footer](#footer)

---

## Header

Sticky navigation with logo, section links, CTA button, and hamburger for mobile.

```html
<header class="header" id="header">
  <div class="container header__inner">
    <a href="#" class="header__logo">
      <img src="[LOGO_URL]" alt="[Brand Name]" class="header__logo-img">
      <div>
        <span class="header__title">[Brand Name]</span>
        <span class="header__tagline">[Tagline]</span>
      </div>
    </a>
    <nav class="header__nav" id="nav">
      <a href="#section1" class="header__link">[Link 1]</a>
      <a href="#section2" class="header__link">[Link 2]</a>
      <!-- ... -->
    </nav>
    <a href="#cta-section" class="btn btn--primary header__cta">[CTA Text]</a>
    <button class="header__hamburger" id="hamburger" aria-label="Toggle menu">
      <span></span><span></span><span></span>
    </button>
  </div>
</header>
```

```css
.header {
  position: sticky;
  top: 0;
  z-index: 1000;
  background: var(--white);
  box-shadow: var(--shadow-sm);
  padding: 0.75rem 0;
}
.header__inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 1.5rem;
}
.header__logo {
  display: flex;
  align-items: center;
  gap: 0.75rem;
}
.header__logo-img { height: 2.5rem; width: auto; }
.header__nav { display: flex; gap: 1.5rem; }
.header__link {
  font-size: 0.85rem;
  font-weight: 500;
  transition: color 0.2s;
}
.header__link:hover { color: var(--accent); }

/* Hamburger — hidden on desktop */
.header__hamburger { display: none; }

@media (max-width: 768px) {
  .header__nav { display: none; /* JS toggles */ }
  .header__cta { display: none; }
  .header__hamburger { display: block; }
}
```

---

## Hero

Two-column layout: text content left, visual element right.

```html
<section class="hero">
  <div class="container hero__inner">
    <div class="hero__content">
      <h1 class="hero__heading">
        <span class="hero__line">[Primary headline]</span>
        <span class="hero__line hero__line--accent">[Accent line]</span>
      </h1>
      <p class="hero__sub">[Subheadline — 2-3 sentences expanding on the headline]</p>
      <div class="hero__actions">
        <a href="#offer" class="btn btn--primary btn--lg">[Primary CTA]</a>
        <a href="#secondary" class="btn btn--outline btn--lg">[Secondary CTA]</a>
      </div>
      <p class="hero__endorsement">[Social proof line]</p>
    </div>
    <div class="hero__visual">
      <img src="[HERO_IMAGE]" alt="[Description]" class="hero__img">
    </div>
  </div>
</section>
```

```css
.hero {
  padding: 5rem 0 4rem;
  background: var(--background);
}
.hero__inner {
  display: grid;
  grid-template-columns: 1.1fr 0.9fr;
  align-items: center;
  gap: 3rem;
}
.hero__heading {
  font-size: clamp(2rem, 1.5rem + 2vw, 3.2rem);
  font-weight: 800;
  line-height: 1.15;
}
.hero__line--accent { color: var(--accent); }
.hero__sub {
  font-size: 1.05rem;
  line-height: 1.7;
  color: var(--text-muted);
  margin: 1.5rem 0;
}
.hero__actions { display: flex; gap: 1rem; flex-wrap: wrap; }

@media (max-width: 768px) {
  .hero__inner { grid-template-columns: 1fr; text-align: center; }
  .hero__actions { justify-content: center; }
}
```

---

## Trust Bar

Horizontal strip of stats and credential badges.

```html
<section class="trust-bar">
  <div class="container">
    <div class="trust-bar__inner">
      <div class="trust-bar__stat">
        <span class="trust-bar__number">[Number]</span>
        <span class="trust-bar__label">[Label]</span>
      </div>
      <div class="trust-bar__badges">
        <span class="trust-bar__badge">[Credential 1]</span>
        <span class="trust-bar__badge">[Credential 2]</span>
      </div>
    </div>
  </div>
</section>
```

```css
.trust-bar {
  background: var(--primary);
  color: var(--white);
  padding: 1.25rem 0;
}
.trust-bar__inner {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 2rem;
}
.trust-bar__number { font-size: 1.8rem; font-weight: 800; }
.trust-bar__badges { display: flex; gap: 1rem; flex-wrap: wrap; }
.trust-bar__badge {
  background: rgba(255,255,255,0.15);
  padding: 0.4rem 1rem;
  border-radius: var(--radius-sm);
  font-size: 0.78rem;
  font-weight: 500;
}
```

---

## Problem Section

Two-column grid with text and supporting image. The image makes the problem tangible.

```html
<section class="problem" id="problem">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading">[Problem Headline]</h2>
    <div class="problem__grid">
      <div class="problem__text">
        <p>[Problem description paragraphs]</p>
        <ul class="problem__list">
          <li>[Pain point 1]</li>
          <li>[Pain point 2]</li>
        </ul>
      </div>
      <div class="problem__image">
        <img src="[CONTEXT_PHOTO]" alt="[Description]" class="problem__img">
      </div>
    </div>
  </div>
</section>
```

```css
.problem { padding: 5rem 0; }
.problem__grid {
  display: grid;
  grid-template-columns: 1.2fr 0.8fr;
  gap: 3rem;
  align-items: center;
  margin-top: 2rem;
}
.problem__image {
  border-radius: var(--radius-lg);
  overflow: hidden;
  box-shadow: var(--shadow-md);
}
.problem__img {
  width: 100%;
  height: 320px;
  object-fit: cover;
}

@media (max-width: 1024px) {
  .problem__grid { grid-template-columns: 1fr; }
}
```

---

## Approach/Solution

Feature cards in a grid layout.

```html
<section class="approach" id="approach">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading section-heading--center">[Solution Headline]</h2>
    <div class="approach__grid">
      <div class="approach__card">
        <div class="approach__icon">[Icon/Emoji]</div>
        <h3 class="approach__title">[Feature Title]</h3>
        <p class="approach__desc">[Feature Description]</p>
      </div>
      <!-- Repeat cards -->
    </div>
  </div>
</section>
```

```css
.approach { padding: 5rem 0; background: var(--pale); }
.approach__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
}
.approach__card {
  background: var(--white);
  padding: 2rem;
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  text-align: center;
}
.approach__icon { font-size: 2.5rem; margin-bottom: 1rem; }
.approach__title { font-size: 1.1rem; font-weight: 700; margin-bottom: 0.5rem; }
```

---

## Evidence/Science

Content section with character illustrations or graphics. Characters make dry content approachable and memorable.

```html
<section class="evidence" id="evidence">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading">[Evidence Headline]</h2>
    <div class="evidence__characters">
      <div class="evidence__character">
        <img src="[CHARACTER_1]" alt="[Name]" class="evidence__character-img">
        <span class="evidence__character-label">[Name]</span>
      </div>
      <!-- Repeat for each character -->
    </div>
    <div class="evidence__body">
      <p>[Evidence content]</p>
    </div>
  </div>
</section>
```

```css
.evidence { padding: 5rem 0; }
.evidence__characters {
  display: flex;
  justify-content: center;
  gap: 2.5rem;
  margin: 2rem 0 3rem;
  flex-wrap: wrap;
}
.evidence__character {
  display: flex;
  flex-direction: column;
  align-items: center;
  gap: 0.5rem;
}
.evidence__character-img {
  width: 120px;
  height: 120px;
  object-fit: contain;
  transition: transform 0.3s;
}
.evidence__character-img:hover { transform: scale(1.1); }
.evidence__character-label {
  font-size: 0.75rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.08em;
  color: var(--accent);
}

@media (max-width: 1024px) {
  .evidence__character-img { width: 100px; height: 100px; }
}
@media (max-width: 768px) {
  .evidence__character-img { width: 80px; height: 80px; }
  .evidence__characters { gap: 1rem; }
}
```

---

## Testimonials

Cards with quotes, attribution, and optional school/company info.

```html
<section class="testimonials" id="testimonials">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading section-heading--center">[Testimonials Headline]</h2>
    <div class="testimonials__grid">
      <blockquote class="testimonial">
        <p class="testimonial__quote">"[Quote text]"</p>
        <footer class="testimonial__author">
          <strong>[Name]</strong>
          <span>[Role, Organization]</span>
        </footer>
      </blockquote>
      <!-- Repeat -->
    </div>
  </div>
</section>
```

```css
.testimonials { padding: 5rem 0; background: var(--pale); }
.testimonials__grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 2rem;
  margin-top: 3rem;
}
.testimonial {
  background: var(--white);
  padding: 2rem;
  border-radius: var(--radius-lg);
  box-shadow: var(--shadow-sm);
  border-left: 4px solid var(--accent);
}
.testimonial__quote {
  font-style: italic;
  line-height: 1.7;
  margin-bottom: 1.5rem;
}
.testimonial__author strong { display: block; }
.testimonial__author span { font-size: 0.85rem; color: var(--text-muted); }
```

---

## Offer/Pricing

Two-paths comparison layout for tiered offerings.

```html
<section class="offer" id="offer">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading section-heading--center">[Offer Headline]</h2>
    <div class="offer__paths">
      <div class="offer__path">
        <h3 class="offer__path-title">[Option 1 Name]</h3>
        <p class="offer__path-desc">[Description]</p>
        <ul class="offer__features">
          <li>[Feature]</li>
        </ul>
        <a href="#contact" class="btn btn--outline">[CTA]</a>
      </div>
      <div class="offer__path offer__path--featured">
        <div class="offer__badge">Recommended</div>
        <h3 class="offer__path-title">[Option 2 Name]</h3>
        <p class="offer__path-desc">[Description]</p>
        <ul class="offer__features">
          <li>[Feature]</li>
        </ul>
        <a href="#contact" class="btn btn--primary">[CTA]</a>
      </div>
    </div>
  </div>
</section>
```

---

## Gallery

Grid of images showcasing the product/service in action. Use `object-fit: cover` for consistent sizing and hover effects for interactivity.

```html
<section class="gallery" id="gallery">
  <div class="container">
    <span class="section-label">[Label]</span>
    <h2 class="section-heading section-heading--center">[Gallery Headline]</h2>
    <div class="gallery__grid">
      <div class="gallery__item gallery__item--wide">
        <img src="[IMAGE]" alt="[Description]" class="gallery__img">
        <div class="gallery__overlay">
          <span class="gallery__label">[Caption]</span>
        </div>
      </div>
      <!-- Repeat items. Use gallery__item--wide for span-2 items -->
    </div>
  </div>
</section>
```

```css
.gallery { padding: 5rem 0; }
.gallery__grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  gap: 1rem;
  margin-top: 3rem;
}
.gallery__item {
  position: relative;
  border-radius: var(--radius-md);
  overflow: hidden;
  height: 240px;
}
.gallery__item--wide { grid-column: span 2; }
.gallery__img {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s;
}
.gallery__item:hover .gallery__img { transform: scale(1.05); }
.gallery__overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  padding: 1rem;
  background: linear-gradient(transparent, rgba(0,0,0,0.5));
}
.gallery__label {
  color: var(--white);
  font-size: 0.78rem;
  font-weight: 600;
  text-transform: uppercase;
  letter-spacing: 0.06em;
}

@media (max-width: 1024px) {
  .gallery__grid { grid-template-columns: repeat(2, 1fr); }
}
@media (max-width: 768px) {
  .gallery__grid { grid-template-columns: 1fr; }
  .gallery__item { height: 200px; }
  .gallery__item--wide { grid-column: span 1; }
}
```

---

## Contact/CTA

Final conversion section with contact details and form or booking link.

```html
<section class="contact" id="contact">
  <div class="container">
    <div class="contact__inner">
      <div class="contact__text">
        <span class="section-label">[Label]</span>
        <h2 class="section-heading">[CTA Headline]</h2>
        <p>[Supporting text]</p>
      </div>
      <div class="contact__actions">
        <a href="mailto:[email]" class="btn btn--primary btn--lg">[Email CTA]</a>
        <a href="tel:[phone]" class="btn btn--outline btn--lg">[Phone CTA]</a>
      </div>
    </div>
  </div>
</section>
```

---

## Footer

Simple footer with logo, nav links, and copyright.

```html
<footer class="footer">
  <div class="container footer__inner">
    <div class="footer__brand">
      <img src="[LOGO]" alt="[Brand]" class="footer__logo">
      <p class="footer__tagline">[Tagline]</p>
    </div>
    <nav class="footer__nav">
      <a href="#section1">[Link]</a>
      <!-- ... -->
    </nav>
    <p class="footer__copy">&copy; [Year] [Brand Name]. All rights reserved.</p>
  </div>
</footer>
```
