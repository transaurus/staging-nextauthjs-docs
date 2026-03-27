#!/usr/bin/env bash
set -euo pipefail

# Rebuild script for nextauthjs/docs
# Runs on existing source tree (no clone). Installs deps, runs pre-build steps, builds.

# --- Node version ---
# Docusaurus 2.0.0-beta.9, .nvmrc: 16. Requires Node 16+.
export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    # shellcheck source=/dev/null
    . "$NVM_DIR/nvm.sh"
    nvm install 16
    nvm use 16
fi

# --- Package manager + dependencies ---
# Uses npm (package-lock.json present). Requires --legacy-peer-deps.
npm install --legacy-peer-deps
npm install react-is --legacy-peer-deps

# --- Build ---
npm run build

echo "[DONE] Build complete."
