# ! Tuần 1: Kiểm kê hệ điều hành
#!/usr/bin/env bash
set -euo pipefail
printf 'Host: %s\n' "$(hostname)"
printf 'Kernel: %s\n' "$(uname -sr)"
printf 'Architecture: %s\n' "$(uname -m)"
printf 'Disk root:\n'
df -h /
