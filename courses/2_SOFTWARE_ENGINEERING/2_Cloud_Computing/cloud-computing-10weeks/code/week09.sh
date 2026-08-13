#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week09}"
mkdir -p "$output_dir"
cat > "$output_dir/prometheus.yml" <<'EOF'
global: {scrape_interval: 15s}
scrape_configs:
  - job_name: demo
    static_configs:
      - targets: ["host.docker.internal:9100"]
EOF
cat > "$output_dir/alert-rules.yml" <<'EOF'
groups:
  - name: availability
    rules:
      - alert: TargetDown
        expr: up == 0
        for: 2m
        labels: {severity: critical}
        annotations: {summary: "Target không phản hồi"}
EOF
echo "Đã sinh cấu hình metrics và alert. Ba tín hiệu cần theo dõi: metrics, logs, traces."

