#!/usr/bin/env bash
set -euo pipefail

# 00-setup.sh — Bootstrap the project environment
# DSC 011 Sp26 — DSC-011-Sp26-Baby-Names
#
# Run once after cloning the project or setting up a new machine.
# Creates the data directory scaffold and installs the Python environment.
#
# Usage (from any directory):
#   bash scripts/00-setup.sh

PROJ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJ_ROOT"

echo "=== 00-setup.sh: bootstrapping project environment ==="
echo "Project root: $PROJ_ROOT"
echo ""

# ── Create data directory scaffold ───────────────────────────────────────────
echo "--- Creating data directories ---"
mkdir -p data/raw data/processed data/clean
echo "✓ data/raw"
echo "✓ data/processed"
echo "✓ data/clean"
echo ""

# ── Install Python environment via uv ────────────────────────────────────────
echo "--- Installing Python environment (uv sync) ---"
uv sync
echo "✓ Python environment ready"
echo ""

# ── Environment diagnostics ───────────────────────────────────────────────────
echo "--- Environment ---"
echo "bash:    $BASH_VERSION"
echo "uv:      $(uv --version)"
echo "python:  $(uv run python --version)"
echo "git:     $(git --version)"
echo ""
echo "=== 00-setup.sh complete ==="
