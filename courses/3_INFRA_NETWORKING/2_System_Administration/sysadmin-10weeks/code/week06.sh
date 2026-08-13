# ! Tuần 6: Sinh cấu hình web server
#!/usr/bin/env bash
set -euo pipefail
server_name="${1:-app.example.test}"
upstream="${2:-127.0.0.1:8080}"
[[ "$server_name" =~ ^[a-zA-Z0-9.-]+$ && "$upstream" =~ ^[a-zA-Z0-9.:-]+$ ]] || { echo 'Đầu vào không hợp lệ' >&2; exit 1; }
printf 'server {\n  listen 80;\n  server_name %s;\n  location / { proxy_pass http://%s; }\n}\n' "$server_name" "$upstream"
