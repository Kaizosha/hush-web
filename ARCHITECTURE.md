# Hush Site Architecture

Hush uses the same dependency-free static architecture and visual contract as
`kaizosha.org`.

## Public routes

| Route | Role | Page family |
| --- | --- | --- |
| `/` | Expanded Hush product continuation | `directory` |
| `/privacy` | Canonical Hush app privacy notice | `document` |
| `/404.html` | Unknown-route recovery | `error` |

## Root experience

The main Kaizōsha homepage expands Hush in one physical product cell before the
scroll handoff. The destination renders that state immediately:

- the same `home-main` frame, top and bottom bars, drafting grid, tokens, and
  constructed compact Kaizōsha mark;
- the same active-cell grid-track geometry, rendered in its settled state with
  no entry, exit, or slot transition;
- the main site's exact Hush lead copy;
- one accessible scroll region that continues through About, Capabilities,
  Privacy, and Availability without opening a second interface.

The main site can pass the active product slot as `?slot=top-left`,
`?slot=top-right`, `?slot=bottom-left`, or `?slot=bottom-right`. The synchronous
Worker renders that slot directly into the returned root HTML so the first
browser frame matches the originating Kaizōsha quadrant. The small plain-
JavaScript controller retains the same swap as a static-hosting fallback and
removes only the temporary `slot` parameter. Direct visits use Hush's canonical
`bottom-left` position.

## Shared layers

- `assets/styles/brand.css` and `assets/styles/markdown.css` are synchronized
  byte-for-byte from the Kaizōsha shared-design source.
- `assets/styles/product-continuation.css` provides the generic long active-cell
  continuation used by a product subsite without product-specific selectors.
- `assets/scripts/site-motion.js` and `document-navigation.js` are the shared
  optional progressive enhancements used by Kaizōsha.
- `assets/scripts/product-continuation.js` provides generic static-hosting slot
  fallback and URL cleanup. All content remains available without JavaScript.

The shared Kaizōsha raster icon is metadata-only. The visible Kaizōsha brand remains the
constructed text and CSS mark.

## Build and hosting

`tools/build-site.sh` recreates `dist/` from an explicit allowlist. Public files
are copied to `dist/client/`, and `tools/sites-static-worker.js` becomes
`dist/server/index.js`. The optional social card is copied only when present.

The Worker renders the requested root product slot before first paint and
handles HTTPS, canonical redirects, GET/HEAD restriction, cache policy,
security headers, and 404 no-index headers. Cloudflare static assets are bound
as `ASSETS` through `wrangler.jsonc`.

There is no frontend dependency, package manager, TypeScript, framework,
runtime API, database, account, or analytics service in the website.
