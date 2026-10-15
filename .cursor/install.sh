#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")/.."

bundle config set --local path 'vendor/bundle'
bundle config set --local without 'production'
bundle install --jobs 4 --retry 3

if [ -f package.json ]; then
  if [ -f package-lock.json ]; then
    npm ci
  else
    npm install
  fi
fi
