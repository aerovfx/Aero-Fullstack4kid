# Đồ Án Cuối Khoá: Triển Khai Hệ Thống E-commerce Microservices Trên Cloud

## Đề Bài
Học viên được cung cấp mã nguồn của một ứng dụng E-commerce được chia thành 4 Microservices (Frontend, Product API, Order API, Payment API). Yêu cầu thiết kế hạ tầng và tự động hoá toàn bộ quy trình triển khai lên AWS/GCP.

## Các Yêu Cầu Kỹ Thuật (Requirements)
1. **Infrastructure**: Sử dụng Terraform để khởi tạo một cụm Managed Kubernetes (Amazon EKS hoặc Google GKE).
2. **Containerization**: Viết Dockerfile cho từng service và đẩy image lên Container Registry (Docker Hub / AWS ECR).
3. **CI/CD**: Xây dựng GitHub Actions Pipeline tự động chạy test, build Docker image và apply cấu hình lên K8s mỗi khi có code mới được merge vào nhánh \`main\`.
4. **Orchestration**: Viết K8s YAML manifests cho Deployment, Service, ConfigMap, Secrets. Triển khai Nginx Ingress Controller làm API Gateway.
5. **Monitoring**: Tích hợp Prometheus và Grafana để giám sát CPU/Memory của các Pod.

## Tiêu Chí Đánh Giá
- Website chạy ổn định, có thể truy cập qua domain/IP Public từ trình duyệt.
- Quá trình deploy hoàn toàn tự động (Zero-touch deployment).
- Hệ thống tự động phục hồi (Self-healing) khi một Pod bị xóa đột ngột.
