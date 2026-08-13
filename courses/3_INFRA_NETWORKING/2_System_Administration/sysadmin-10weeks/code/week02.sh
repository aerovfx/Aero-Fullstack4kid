# ! Tuần 2: Quyền file và người dùng
#!/usr/bin/env bash
set -euo pipefail
target="${1:-.}"
[[ -e "$target" ]] || { echo "Không tồn tại: $target" >&2; exit 1; }
printf 'Quyền và owner của %s:\n' "$target"
find "$target" -maxdepth 1 -exec stat -f '%Sp %Su:%Sg %N' {} \; 2>/dev/null || find "$target" -maxdepth 1 -printf '%M %u:%g %p\n'
