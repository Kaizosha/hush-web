# Hush website

The dependency-free static product site for Hush, Kaizōsha's native macOS AI
assistant.

The root route directly continues the expanded Hush product cell from
`kaizosha.org`. It preserves the shared frame, toolbar, status bar, two-tone
system, constructed Kaizōsha mark, typography, grid, and motion. Scrolling the
expanded surface reveals product details without switching to another visual
system. The originating product slot is rendered before first paint when the
main site passes `?slot=`.

The product claims intentionally distinguish local session storage from direct
OpenAI processing. HX08 is the latest packaged public download and requires
macOS 14.4 or later. The source repository is public, but no open-source license
is currently published.

## Local preview

```sh
python3 tools/dev-server.py 5173
```

## Production build

```sh
./tools/build-site.sh
```

## Cloudflare deployment

The repository is ready for Cloudflare Workers Builds with repository root `/`,
build command `./tools/build-site.sh`, and deploy command `npx wrangler deploy`.
Attach `hush.kaizosha.org` as the Worker's custom domain after the first deploy.

## Routes

- `/` — permanently expanded Hush product surface
- `/privacy` — Hush's canonical app privacy notice
- `/404.html` — unknown-route recovery
- `/site.webmanifest`, `/robots.txt`, and `/sitemap.xml` — app and search metadata

There is no package manager, frontend framework, TypeScript, runtime API,
database, account, analytics SDK, or build dependency in this website. The
explicit build allowlist produces `dist/client` plus the static Cloudflare
Worker entrypoint at `dist/server/index.js`.

The root metadata and production build include the 1200 × 630 product card at
`assets/media/social/hush-social-card.png`.

## Shared design

Kaizōsha's main website is the source of truth for `BRAND.md`,
`DESIGN_SYSTEM.md`, the shared CSS foundations, and the shared progressive
enhancements. Hush commits synchronized copies so its repository and Cloudflare
deployment remain independent. The long product surface uses the generic
`product-continuation.css` and `product-continuation.js` layers rather than
product-specific classes.

Visible branding uses the constructed HTML/CSS Kaizōsha mark. The shared
Kaizōsha raster icon is limited to favicon, Apple touch icon, web manifest, and
metadata use.
