#!/usr/bin/env bash
set -euo pipefail

# Script kiểm tra server; mặc định chỉ đọc trạng thái và không sửa hệ thống.
check_command() {
  local command_name="$1"
  command -v "$command_name" >/dev/null 2>&1 && echo "[ok] $command_name" || echo "[missing] $command_name"
}

echo "Host: $(hostname)"
echo "Kernel: $(uname -sr)"
echo "Disk:"
df -h .
echo "Memory:"
if command -v free >/dev/null 2>&1; then free -h; else vm_stat 2>/dev/null || true; fi
for item in ssh curl git; do check_command "$item"; done

# Không tự động apt install/chmod/chown; học viên phải review trước khi chạy quyền sudo.

