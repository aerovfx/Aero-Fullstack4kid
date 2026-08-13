# ! Tuần 5: SSH/DNS/DHCP audit
#!/usr/bin/env bash
set -euo pipefail
config="${1:-/etc/ssh/sshd_config}"
if [[ -r "$config" ]]; then
  grep -Ei '^(PermitRootLogin|PasswordAuthentication|PubkeyAuthentication)' "$config" || echo 'Directive dùng giá trị mặc định'
else echo "Không đọc được $config; truyền đường dẫn config lab để audit"; fi
command -v ssh-keygen >/dev/null && echo 'ssh-keygen: sẵn sàng'
