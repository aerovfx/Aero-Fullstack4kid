# ! Tuần 8: Giám sát tài nguyên
#!/usr/bin/env bash
set -euo pipefail
printf 'Load: '; uptime
printf 'Memory:\n'
if command -v free >/dev/null; then free -h; else vm_stat 2>/dev/null | head -n 6 || true; fi
usage="$(df -P / | awk 'NR==2 {gsub("%", "", $5); print $5}')"
printf 'Disk root: %s%%\n' "$usage"
(( usage < 90 )) || { echo 'CẢNH BÁO: disk >= 90%' >&2; exit 1; }
