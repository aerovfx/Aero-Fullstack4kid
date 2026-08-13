#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week06}"
mkdir -p "$output_dir"

# Gateway chỉ công khai /api và thêm request id để truy vết.
cat > "$output_dir/nginx.conf" <<'EOF'
events {}
http {
  upstream product_api { server product-api:3000; }
  server {
    listen 8080;
    location /api/products {
      proxy_set_header X-Request-ID $request_id;
      proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      proxy_pass http://product_api/products;
    }
  }
}
EOF
echo "Đã sinh $output_dir/nginx.conf; kiểm tra bằng: nginx -t -c $(pwd)/$output_dir/nginx.conf"

