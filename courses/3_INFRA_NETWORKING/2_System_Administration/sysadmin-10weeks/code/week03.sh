# ! Tuần 3: Bash backup tự động
#!/usr/bin/env bash
set -euo pipefail
source_dir="${1:-}"
destination="${2:-}"
[[ -n "$source_dir" && -d "$source_dir" && -n "$destination" ]] || { echo 'Cách dùng: week03.sh SOURCE BACKUP.tar.gz [--apply]' >&2; exit 2; }
if [[ "${3:-}" != '--apply' ]]; then printf '[DRY-RUN] tar -czf %q %q\n' "$destination" "$source_dir"; exit 0; fi
tar -czf "$destination" -C "$(dirname "$source_dir")" "$(basename "$source_dir")"
tar -tzf "$destination" >/dev/null
echo 'Backup tạo và kiểm tra thành công.'
