#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week08/chart}"
mkdir -p "$output_dir/templates"
cat > "$output_dir/Chart.yaml" <<'EOF'
apiVersion: v2
name: cloud-demo
version: 0.1.0
appVersion: "1.0"
EOF
cat > "$output_dir/values.yaml" <<'EOF'
replicaCount: 2
image: nginx:1.27-alpine
EOF
cat > "$output_dir/templates/deployment.yaml" <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: {name: {{ .Release.Name }}}
spec:
  replicas: {{ .Values.replicaCount }}
  selector: {matchLabels: {app: {{ .Release.Name }}}}
  template:
    metadata: {labels: {app: {{ .Release.Name }}}}
    spec:
      containers:
        - name: web
          image: {{ .Values.image }}
EOF
echo "Kiểm tra chart: helm lint $output_dir && helm template demo $output_dir"

