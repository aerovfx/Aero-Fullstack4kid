# ! Tuần 4: Tiến trình và systemd
#!/usr/bin/env bash
set -euo pipefail
printf '%-8s %-6s %-6s %s\n' USER PID CPU COMMAND
if ! ps -Ao user=,pid=,%cpu=,comm= 2>/dev/null | sort -k3 -nr | head -n 10; then
  echo 'Không có quyền đọc process table trong môi trường hiện tại.'
fi
if command -v systemctl >/dev/null; then systemctl --failed --no-pager || true; else echo 'systemd không có trên máy này'; fi
