#!/usr/bin/env bash
set -euo pipefail

# 01-obtain.sh — Download raw SSA baby name HTML files
# DSC 011 Sp26 — DSC-011-Sp26-Baby-Names
#
# Downloads one HTML file per decade (1880s–2010s) from SSA.
# Idempotent: skips files that already exist.
# Sleeps 1 second between new downloads (polite to SSA's server).
#
# Usage (from any directory):
#   bash scripts/01-obtain.sh

PROJ_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
RAW_DIR="$PROJ_ROOT/data/raw"

echo "=== 01-obtain.sh: downloading raw HTML files ==="

EXISTING=$(find "$RAW_DIR" -name 'names[12][890][0-9]0s.html' \
               2>/dev/null | wc -l | tr -d ' ')

if [[ "$EXISTING" -eq 14 ]]; then
    echo "All 14 HTML files already present — skipping downloads."
    exit 0
fi

echo "Downloading ($EXISTING of 14 already present)..."
echo ""

for decade in {188..201}0; do
    html="$RAW_DIR/names${decade}s.html"
    url="https://www.ssa.gov/oact/babynames/decades/names${decade}s.html"

    if [[ -f "$html" ]]; then
        echo "  skip: names${decade}s.html"
    else
        echo "  downloading names${decade}s.html ..."
        sleep 1
        wget --quiet --output-document="$html" "$url"
        echo "  saved:  names${decade}s.html"
    fi
done

N=$(find "$RAW_DIR" -name 'names[12][890][0-9]0s.html' \
        2>/dev/null | wc -l | tr -d ' ')
echo ""
echo "✓ $N HTML files in data/raw/"
echo "=== 01-obtain.sh complete ==="
