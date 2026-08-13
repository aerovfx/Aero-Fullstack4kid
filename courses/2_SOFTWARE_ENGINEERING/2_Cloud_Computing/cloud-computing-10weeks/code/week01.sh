#!/usr/bin/env bash
set -euo pipefail

# Kiểm kê môi trường cloud cục bộ mà không gọi API hoặc phát sinh chi phí.
commands=(aws gcloud terraform docker kubectl helm)
printf '%-12s %s\n' "Công cụ" "Trạng thái"
for command_name in "${commands[@]}"; do
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '%-12s %s\n' "$command_name" "đã cài"
  else
    printf '%-12s %s\n' "$command_name" "chưa cài"
  fi
done

cat <<'EOF'
Checklist an toàn:
- Bật MFA cho tài khoản quản trị.
- Không dùng access key của root.
- Đặt budget/cảnh báo chi phí trước khi tạo tài nguyên.
- Ưu tiên quyền tối thiểu (least privilege).
EOF

