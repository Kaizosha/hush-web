# Hush website

The dependency-free static product site for Hush, Kaizōsha's native macOS AI
assistant.

The root route directly continues the expanded Hush product cell from
`kaizosha.org`. It preserves the shared frame, toolbar, status bar, two-tone
system, constructed Kaizōsha mark, typography, grid, and motion. Scrolling the
expanded surface reveals product details without switching to another visual
system. When the main site passes `?slot=`, the synchronous continuation script
applies the originating product slot during the initial document render.

The product claims intentionally distinguish local session storage from direct
OpenAI processing. HX08 is the latest packaged public download and requires
macOS 14.4 or later. The source repository is public, but no open-source license
is currently published.

## Local preview

```sh
python3 tools/dev-server.py 5173
```

## Cloudflare Pages

The repository root is the deployable website. Connect this repository to a
Cloudflare Pages project with framework preset `None`, production branch
`main`, no build command, and build output directory `.`. Every push to `main`
publishes the committed static files directly; there is no generated output or
manual deployment command. Attach `hush.kaizosha.org` as the Pages custom
domain.

## Routes

- `/` — permanently expanded Hush product surface
- `/privacy` — Hush's canonical app privacy notice
- `/404.html` — unknown-route recovery
- `/site.webmanifest`, `/robots.txt`, and `/sitemap.xml` — app and search metadata

There is no package manager, frontend framework, TypeScript, runtime API,
database, account, analytics SDK, build dependency, or server process in this
website.

The root metadata references the committed 1200 × 630 product card at
`assets/media/social/hush-social-card.png`.

## Shared design

Kaizōsha's main website is the source of truth for `BRAND.md`,
`DESIGN_SYSTEM.md`, the shared CSS foundations, and the shared progressive
enhancements. Hush commits synchronized copies so its repository and Cloudflare
deployment remain independent. The long product surface uses the generic
`product-continuation.css` and `product-continuation.js` layers rather than
product-specific classes.

Visible branding uses the constructed HTML/CSS Kaizōsha mark. The shared SVG
keeps its Japanese glyphs as real text for supporting browsers; the PNG remains
the Apple, PWA, and metadata fallback.
