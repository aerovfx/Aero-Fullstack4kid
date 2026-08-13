# Đồ án cuối khóa: Nền tảng microservices có thể vận hành

## Bối cảnh

Một nhóm sản phẩm cần triển khai frontend, product API và order API. Hệ thống phải tái lập được từ code, có healthcheck, theo dõi lỗi và quy trình rollback. Có thể nghiệm thu hoàn toàn trên Docker/Kubernetes local; cloud là phần mở rộng.

## Chức năng tối thiểu

1. Ba service trả health endpoint và dùng cấu hình qua biến môi trường.
2. Nginx/Ingress định tuyến request tới đúng service.
3. Dockerfile không chạy ứng dụng bằng root nếu image cho phép.
4. Kubernetes Deployment/Service có requests, limits và probes.
5. Helm chart quản lý image tag và replica count.
6. CI kiểm tra syntax, test, build và scan trước deploy.
7. Prometheus scrape health/metrics và có ít nhất một alert.

## IaC, dữ liệu và bảo mật

- Terraform quản lý hạ tầng; không commit state chứa dữ liệu nhạy cảm.
- Secret được inject từ môi trường hoặc secret manager, không đặt trong YAML/Git.
- Database có backup/restore plan và migration có thể rollback.
- Ghi rõ tài nguyên cloud có thể phát sinh chi phí và lệnh hủy chúng.

## Các mốc

1. Kiến trúc, threat model và tiêu chí SLO.
2. Container và Compose local.
3. Kubernetes/Helm local.
4. CI/CD, scan và observability.
5. Diễn tập lỗi, rollback và bàn giao runbook.

## Sản phẩm phải nộp

- Source code, manifest, chart, IaC và pipeline.
- README có lệnh chạy/kiểm thử/xóa tài nguyên.
- Sáu kịch bản nghiệm thu: health, routing, scale, pod failure, bad image rollback và secret scan.
- Ảnh/dashboard hoặc log chứng minh alert hoạt động.

## Hướng dẫn chạy và nghiệm thu

1. Chạy toàn bộ quality gate của khóa học:

   ```bash
   for script in code/week*.sh exercises/week*/starter.sh; do bash -n "$script"; done
   bash code/week04.sh
   ```

2. Khởi động hệ thống local bằng Docker Compose, sau đó kiểm tra từng health endpoint bằng `curl`.
3. Render và kiểm tra manifest trước khi áp dụng:

   ```bash
   helm lint ./chart
   helm template demo ./chart > rendered.yaml
   kubectl apply --dry-run=client -f rendered.yaml
   ```

4. Nghiệm thu trên cluster local: xóa một Pod, xác nhận Deployment tự phục hồi; triển khai image tag sai và thực hiện rollback.
5. Khi dùng cloud, ghi lại budget, tài nguyên đã tạo và lệnh `destroy`/xóa tương ứng. Không kết thúc đồ án khi tài nguyên tính phí còn chạy.

## Rubric

| Tiêu chí | Trọng số |
|---|---:|
| Tính đúng và khả năng triển khai | 35% |
| Kiến trúc và chất lượng cấu hình | 25% |
| Kiểm thử, bảo mật và rollback | 20% |
| Tài liệu vận hành | 10% |
| Mở rộng cloud/HA | 10% |
