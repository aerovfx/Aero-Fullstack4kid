#!/usr/bin/env bash
set -euo pipefail

target="${1:-.}"
echo "DevSecOps scan plan cho: $target"

# Chỉ chạy công cụ đã cài; không tự tải hoặc gửi dữ liệu ra ngoài.
if command -v trivy >/dev/null 2>&1; then
  trivy fs --severity HIGH,CRITICAL --exit-code 1 "$target"
else
  echo "[skip] trivy chưa được cài"
fi

# Phát hiện nhanh secret mẫu; production nên dùng gitleaks/trufflehog.
if grep -RInE '(password|secret|token)[[:space:]]*=' "$target" --exclude='week10.sh'; then
  echo "Phát hiện chuỗi có thể là secret" >&2
  exit 1
fi
echo "Không phát hiện secret theo rule cơ bản."

