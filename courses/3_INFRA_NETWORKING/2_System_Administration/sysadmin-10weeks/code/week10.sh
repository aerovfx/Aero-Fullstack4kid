# ! Tuần 10: Hardening audit
#!/usr/bin/env bash
set -euo pipefail
echo '=== Hardening audit chỉ đọc ==='
printf 'Kernel: '; uname -sr
if command -v ufw >/dev/null; then ufw status 2>/dev/null || echo 'Cần quyền để đọc UFW'; fi
if command -v firewall-cmd >/dev/null; then firewall-cmd --state 2>/dev/null || true; fi
printf 'File world-writable trong thư mục chỉ định:\n'
target="${1:-.}"
find "$target" -xdev -type f -perm -0002 -print 2>/dev/null | head -n 20
printf 'Không tự động sửa; review từng phát hiện và chuẩn bị rollback.\n'
