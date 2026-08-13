#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week05}"
mkdir -p "$output_dir"

cat > "$output_dir/index.html" <<'EOF'
<!doctype html><html lang="vi"><meta charset="utf-8"><title>Cloud Lab</title>
<h1>Container đang hoạt động</h1></html>
EOF
cat > "$output_dir/Dockerfile" <<'EOF'
FROM nginx:1.27-alpine
COPY index.html /usr/share/nginx/html/index.html
HEALTHCHECK CMD wget -qO- http://127.0.0.1/ || exit 1
EOF
cat > "$output_dir/compose.yaml" <<'EOF'
services:
  web:
    build: .
    ports: ["8080:80"]
    read_only: true
    tmpfs: ["/var/cache/nginx", "/var/run"]
EOF

echo "Đã sinh Docker lab. Chạy: docker compose -f $output_dir/compose.yaml up --build"

