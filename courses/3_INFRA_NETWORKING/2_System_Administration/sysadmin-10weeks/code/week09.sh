# ! Tuần 9: Backup và kiểm tra phục hồi
#!/usr/bin/env bash
set -euo pipefail
archive="${1:-}"
[[ -n "$archive" && -f "$archive" ]] || { echo 'Cách dùng: week09.sh BACKUP.tar.gz' >&2; exit 2; }
tar -tzf "$archive" >/dev/null
checksum="$(shasum -a 256 "$archive" 2>/dev/null || sha256sum "$archive")"
printf 'Archive hợp lệ\nSHA-256: %s\n' "$checksum"
echo 'Bước tiếp theo: phục hồi vào VM cô lập và chạy kiểm thử dịch vụ.'
