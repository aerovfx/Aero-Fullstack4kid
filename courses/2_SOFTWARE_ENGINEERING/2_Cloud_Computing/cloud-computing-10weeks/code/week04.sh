#!/usr/bin/env bash
set -euo pipefail

# Pipeline cục bộ: kiểm tra syntax trước khi build/deploy.
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
failed=0
for script in "$root_dir"/code/week*.sh; do
  if bash -n "$script"; then echo "[pass] $script"; else echo "[fail] $script"; failed=1; fi
done
test "$failed" -eq 0
echo "Quality gate đã đạt; pipeline có thể chuyển sang bước build."

