#!/usr/bin/env bash
set -euo pipefail

# 02-scrub.sh — Convert, parse, and clean raw baby name data
# DSC 011 Sp26 — DSC-011-Sp26-Baby-Names
#
# Step 1: Convert HTML files to plain text via Python (html2text)
# Steps 2+: added in future sessions
#
# Usage (from any directory):
#   bash scripts/02-scrub.sh
# Requirements:
#   - 00-setup.sh must have been run (.venv/ with html2text installed)
#   - 01-obtain.sh must have been run (14 HTML files in data/raw/)

PROJ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RAW_DIR="$PROJ_ROOT/data/raw"
PROC_DIR="$PROJ_ROOT/data/processed"

# ── Guard: require 01-obtain.sh to have run first ────────────────────────────
N_RAW=$(find "$RAW_DIR" -name 'names[12][890][0-9]0s.html' \
            2>/dev/null | wc -l | tr -d ' ')
if [[ "$N_RAW" -lt 14 ]]; then
    echo "ERROR: Expected 14 HTML files in data/raw/ but found $N_RAW." >&2
    echo "       Run 'bash scripts/01-obtain.sh' first." >&2
    exit 1
fi

# ── Step 1: Convert each HTML file to plain text ──────────────────────────────
echo "=== 02-scrub.sh Step 1: converting HTML to plain text ==="

for decade in {188..201}0; do
    html="$RAW_DIR/names${decade}s.html"
    text="$PROC_DIR/names${decade}s.txt"

    if [[ -f "$text" ]]; then
        echo "  skip: names${decade}s.txt already exists"
    else
        echo "  converting names${decade}s.html → names${decade}s.txt"
        uv run --project "$PROJ_ROOT" python \
            -c 'import sys, html2text; \
                print(html2text.html2text(sys.stdin.read()))' \
            < "$html" > "$text"
    fi
done

N_TXT=$(find "$PROC_DIR" -name 'names[12][890][0-9]0s.txt' \
            2>/dev/null | wc -l | tr -d ' ')
echo ""
echo "✓ $N_TXT text files in data/processed/"
echo "=== Step 1 complete ==="
