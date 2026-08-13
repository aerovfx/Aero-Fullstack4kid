#!/usr/bin/env bash
set -euo pipefail

output_dir="${1:-./generated/week03}"
mkdir -p "$output_dir"

# Sinh Terraform local_file để học HCL/state mà không cần tài khoản cloud.
cat > "$output_dir/main.tf" <<'EOF'
terraform {
  required_version = ">= 1.6.0"
  required_providers {
    local = { source = "hashicorp/local", version = "~> 2.5" }
  }
}
variable "environment" { type = string; default = "dev" }
resource "local_file" "inventory" {
  filename = "${path.module}/inventory.txt"
  content  = "environment=${var.environment}\nmanaged_by=terraform\n"
}
output "inventory_path" { value = local_file.inventory.filename }
EOF

echo "Đã sinh $output_dir/main.tf"
echo "Chạy: terraform -chdir=$output_dir init && terraform -chdir=$output_dir plan"

