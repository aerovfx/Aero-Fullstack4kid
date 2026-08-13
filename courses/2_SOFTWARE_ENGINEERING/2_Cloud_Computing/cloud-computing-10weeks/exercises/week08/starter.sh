#!/usr/bin/env bash
set -euo pipefail

# TODO tuần 8: Helm và triển khai Kubernetes
# 1. Kiểm tra input.
# 2. Thực hiện hoặc mô phỏng tác vụ theo chế độ dry-run.
# 3. In kết quả và exit code rõ ràng.

mode="${1:---dry-run}"
case "$mode" in
  --dry-run) echo "[dry-run] Chưa thay đổi hệ thống" ;;
  *) echo "Usage: $0 [--dry-run]" >&2; exit 2 ;;
esac

