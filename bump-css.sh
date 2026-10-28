#!/bin/sh
# Stamps styles.css with a content hash so browsers refetch it after a deploy
cd "$(dirname "$0")" || exit 1
v=$(shasum styles.css | cut -c1-8)
for f in index.html privacy.html; do
  sed -i '' -E "s#href=\"styles\.css(\?v=[0-9a-f]+)?\"#href=\"styles.css?v=$v\"#" "$f"
done
echo "styles.css?v=$v"
