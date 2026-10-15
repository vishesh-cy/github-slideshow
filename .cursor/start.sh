#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

PORT=4000
HOST=0.0.0.0

if curl -fsS "http://127.0.0.1:${PORT}/" >/dev/null 2>&1; then
  echo "Jekyll already listening on port ${PORT}"
  exit 0
fi

bundle exec jekyll serve --host "${HOST}" --port "${PORT}" --livereload --detach

for _ in $(seq 1 60); do
  if curl -fsS "http://127.0.0.1:${PORT}/" >/dev/null 2>&1; then
    echo "Jekyll is ready at http://${HOST}:${PORT}/"
    exit 0
  fi
  sleep 1
done

echo "Timed out waiting for Jekyll on port ${PORT}" >&2
exit 1
