#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week07}"
mkdir -p "$output_dir"

cat > "$output_dir/app.yaml" <<'EOF'
apiVersion: apps/v1
kind: Deployment
metadata: {name: cloud-demo}
spec:
  replicas: 2
  selector: {matchLabels: {app: cloud-demo}}
  template:
    metadata: {labels: {app: cloud-demo}}
    spec:
      containers:
        - name: web
          image: nginx:1.27-alpine
          ports: [{containerPort: 80}]
          resources:
            requests: {cpu: 50m, memory: 32Mi}
            limits: {cpu: 200m, memory: 128Mi}
          readinessProbe:
            httpGet: {path: /, port: 80}
---
apiVersion: v1
kind: Service
metadata: {name: cloud-demo}
spec:
  selector: {app: cloud-demo}
  ports: [{port: 80, targetPort: 80}]
EOF
echo "Kiểm tra client-side: kubectl apply --dry-run=client -f $output_dir/app.yaml"

