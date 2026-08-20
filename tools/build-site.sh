#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
DIST="$ROOT/dist"
CLIENT="$DIST/client"

rm -rf "$DIST"
mkdir -p "$CLIENT" "$DIST/server"

for file in _headers 404.html index.html privacy.html icon.png robots.txt \
  site.webmanifest sitemap.xml; do
  cp "$ROOT/$file" "$CLIENT/$file"
done

mkdir -p "$CLIENT/assets/styles" "$CLIENT/assets/scripts"

for file in brand.css markdown.css product-continuation.css; do
  cp "$ROOT/assets/styles/$file" "$CLIENT/assets/styles/$file"
done

for file in document-navigation.js site-motion.js product-continuation.js; do
  cp "$ROOT/assets/scripts/$file" "$CLIENT/assets/scripts/$file"
done

SOCIAL_CARD="$ROOT/assets/media/social/hush-social-card.png"
if [ -f "$SOCIAL_CARD" ]; then
  mkdir -p "$CLIENT/assets/media/social"
  cp "$SOCIAL_CARD" "$CLIENT/assets/media/social/hush-social-card.png"
fi

cp "$ROOT/tools/sites-static-worker.js" "$DIST/server/index.js"

printf 'Built static Hush site in %s\n' "$DIST"
