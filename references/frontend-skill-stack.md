# Frontend skill stack for landing pages

Use this reference when deciding which screenshot-listed frontend skills participate in a landing-page task.

## Role boundaries

| Skill | Role | Required? | Do not use it for |
|---|---|---:|---|
| `frontend-design` | Art direction: subject grounding, visual thesis, type, palette, layout, signature moment, restrained motion | Yes for new builds and visual redesigns | Mechanical QA or deployment |
| `design-taste-frontend` | Anti-slop implementation: architecture, responsive mechanics, components, states, accessibility, performance, pre-flight | Yes | Replacing source-brand facts or approved content |
| `imagegen-frontend-web` | Section-level website reference imagery and visual exploration | Conditional | Production code, factual client assets, or automatic ceremony |
| `design-taste-frontend-v1` | Compatibility for projects pinned to v1 behaviour | Legacy only | Running beside current Design Taste |
| `imagegen-frontend-mobile` | Separate mobile-app screen image concepts | No for websites | Responsive landing-page breakpoints or code |
| `Aidesigner Frontend` | Optional second design critique if actually installed/discoverable | Optional | A hard dependency or an assumed capability |

## Selection logic

### New landing page with a defined brand
1. Inspect the actual brand, source copy, references, and assets.
2. Use `frontend-design` to form one subject-specific direction.
3. Use current `design-taste-frontend` to convert it into an implementation system.
4. Use `imagegen-frontend-web` only if the page is image-led, the visual composition remains ambiguous, or the user asks for visual mockups.
5. Use this landing-page skill to structure, build, QA, deploy, and live-verify.

### New landing page without a defined brand
1. Resolve audience, offer, conversion goal, and factual content.
2. Develop no more than two meaningfully different art directions.
3. Generate web reference images if they will help the user choose; label generated visuals as concepts, not client assets.
4. After approval, lock one direction and build it consistently.

### Existing branded page or template
1. Audit first. Preserve approved copy, assets, structure, runtime, and brand grammar.
2. Use `frontend-design` for a targeted visual thesis, not a wholesale aesthetic reset.
3. Use `design-taste-frontend` for implementation quality and literal defect correction.
4. Do not introduce generated reference imagery when real approved media already exists unless the user asks for new art direction.

### Mobile handling
Responsive mobile web is implemented in the same page and checked at real browser widths. Do not invoke `imagegen-frontend-mobile` for this. Invoke it only when the deliverable is a separate native/cross-platform app screen concept.

## Conflict resolution

1. User instructions and approved client facts win.
2. Project/client `CLAUDE.md` and source material win over generic visual recipes.
3. Preservation requirements win over redesign instincts.
4. `frontend-design` owns the art-direction thesis.
5. Current `design-taste-frontend` owns implementation taste and pre-flight discipline.
6. This skill owns workflow completion, QA evidence, deployment, and live verification.
7. Generated references never override real brand assets or factual content.

When two skills suggest contradictory aesthetics, do not average them. Return to the source brand and chosen thesis, select the rule that best serves those constraints, and keep the page coherent.

## Availability check

Before claiming a supporting skill was used, confirm it is discoverable in the current skill registry. Screenshot labels can show duplicates or skills that are not installed in the active environment. Treat duplicate rows as UI/index duplication, not a reason to invoke the same skill twice.

At the time this routing was authored, `frontend-design`, current/v1 `design-taste-frontend`, `imagegen-frontend-web`, and `imagegen-frontend-mobile` were discoverable. `Aidesigner Frontend` was not found in the active Claude or Hermes skill directories, so it remains an optional future integration rather than a dependency.

## Evidence required before handoff

- Build/test command succeeds for the chosen stack.
- Desktop, tablet, and mobile screenshots were inspected, not merely captured.
- No horizontal overflow, broken media, obvious clipping, or console errors.
- Interactive controls were exercised.
- Copy/assets are traceable to approved sources; generated material is identified.
- If deployed, the exact alias was opened and inspected on desktop and mobile.