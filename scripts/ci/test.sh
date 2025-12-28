#!/usr/bin/env bash
set -euo pipefail

mkdir -p coverage
cat > coverage/summary.txt <<'REPORT'
No automated tests are defined yet. This placeholder file keeps coverage artifacts flowing through CI.
REPORT

echo "Test placeholder complete; see coverage/summary.txt"
