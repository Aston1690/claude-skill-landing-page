# Verification Checklist

Run through this checklist after building the page and before presenting to the user.

## 1. Image Verification

- [ ] Start a local preview server (`npx serve -p [port]` or equivalent)
- [ ] Force a page reload to clear cache
- [ ] Run image check script in browser console:
  ```javascript
  document.querySelectorAll('img').forEach(img => {
    if (img.naturalWidth === 0) console.log('BROKEN:', img.src);
    else console.log('OK:', img.src.split('/').pop(), img.naturalWidth + 'x' + img.naturalHeight);
  });
  ```
- [ ] For any broken image: fetch the live site page that contained it, find the correct URL
- [ ] Re-verify after fixing — reload first, then re-run the check

## 2. Responsive Layout

### Desktop (1280px)
- [ ] Header nav links visible, hamburger hidden
- [ ] Hero shows two-column layout
- [ ] Problem section shows text + image side by side
- [ ] Evidence characters display in horizontal row
- [ ] Gallery shows 3 columns
- [ ] All text readable, no overflow

### Tablet (1024px / 768px)
- [ ] Grids reduce to fewer columns
- [ ] Character images scale down (100px)
- [ ] Gallery shows 2 columns
- [ ] Side-by-side sections start stacking
- [ ] No horizontal scroll

### Mobile (375px)
- [ ] Hamburger menu visible and functional
- [ ] All content single column
- [ ] Character images at 80px
- [ ] Gallery single column
- [ ] Buttons full-width or comfortable tap targets (min 44px)
- [ ] Text readable without zooming
- [ ] No content clipped or overflowing

## 3. Functionality

- [ ] All navigation links scroll to correct sections
- [ ] Smooth scroll working
- [ ] Hamburger menu opens/closes correctly
- [ ] All external links open correctly
- [ ] CTA buttons point to correct targets
- [ ] Sticky header works on scroll

## 4. Typography & Brand

- [ ] Correct font loading (check Network tab for Google Fonts request)
- [ ] Brand colors match the client's site
- [ ] Font weights rendering correctly (light, regular, medium, bold)
- [ ] Heading hierarchy is logical (h1 → h2 → h3)

## 5. Performance

- [ ] All images use appropriate sizes (don't load 2000px images in 300px containers)
- [ ] Google Fonts uses `display=swap` to prevent FOIT
- [ ] `preconnect` hints present for external resources
- [ ] No unnecessary JavaScript libraries
- [ ] CSS is a single file, not split unnecessarily

## 6. Deployment Verification

After deploying to Vercel (or other host):

- [ ] Live URL loads correctly
- [ ] All images load on the live site (hotlinked images may have referrer restrictions)
- [ ] Responsive behavior works on live URL
- [ ] SSL certificate active (https)
- [ ] Page title and meta description correct
- [ ] Share the live URL with the user

## Common Fixes

| Issue | Fix |
|-------|-----|
| Image shows broken icon | Fetch correct URL from live site, update src |
| Image loads but is tiny | Check `object-fit` and container height |
| Layout breaks at tablet | Add/adjust `@media (max-width: 1024px)` rules |
| Font not loading | Verify Google Fonts URL, check weight values |
| Hamburger not working | Check JS event listener, ensure nav ID matches |
| Sticky header overlaps content | Add `scroll-padding-top` to `html` element |
| Gallery images distorted | Use `object-fit: cover` with fixed height |
| Stale preview | `location.reload()` before every screenshot |
