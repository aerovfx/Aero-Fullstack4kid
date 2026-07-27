import os

BASE_DIR = "/Users/dangvietchung/Aero-Fullstack4kid/courses/9_CLOUD_DEVOPS/cloud-devops-10weeks"

lessons = [
    ("Nhập môn DevOps & Cloud Computing", "Khái niệm DevOps (CAMS), mô hình IaaS/PaaS/SaaS, so sánh AWS và GCP, làm quen Console, IAM, và Virtual Machines (EC2/Compute Engine)."),
    ("Quản trị Linux Server & Bash Scripting", "Kiến trúc Linux, quản lý Users/Groups, SSH keys, phân quyền (chmod/chown), viết Bash script tự động hoá cronjobs."),
    ("Infrastructure as Code (IaC) với Terraform", "Cài đặt Terraform, viết cấu hình HCL (HashiCorp Configuration Language), quản lý State, triển khai cụm VPC và máy ảo lên AWS."),
    ("Version Control & CI/CD Pipelines", "Git Branching Strategy, thiết lập CI/CD pipeline tự động build và test mã nguồn với GitHub Actions / GitLab CI."),
    ("Containerization với Docker", "Kiến trúc Docker Engine, viết Dockerfile tối ưu (Multi-stage build), quản lý mạng ảo và volumes, Docker Compose."),
    ("Kiến trúc Microservices & API Gateway", "Thiết kế Monolithic vs Microservices, giao tiếp liên dịch vụ (REST/gRPC/Message Broker), thiết lập Nginx API Gateway."),
    ("Điều phối Container với Kubernetes (K8s)", "Kiến trúc Master-Node của K8s, viết YAML cấu hình Pod, ReplicaSet, Deployment, Service (ClusterIP/NodePort/LoadBalancer)."),
    ("Triển khai K8s trên Cloud & Helm", "Thiết lập cụm Amazon EKS / Google GKE, quản lý tài nguyên ứng dụng phức tạp bằng Helm Charts, Ingress Controller."),
    ("Hệ thống Monitoring & Observability", "Giám sát số liệu (Metrics) với Prometheus, vẽ biểu đồ với Grafana, và quản lý log tập trung với ELK Stack (Elasticsearch, Logstash, Kibana)."),
    ("High Availability & DevSecOps", "Thiết kế kiến trúc hệ thống tính sẵn sàng cao, Auto Scaling, kết hợp bảo mật vào quy trình CI/CD (Trivy quét lỗ hổng container).")
]

def create_directory(path):
    os.makedirs(path, exist_ok=True)

def write_file(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

def main():
    print(f"Creating DevOps course at {BASE_DIR}")
    create_directory(BASE_DIR)
    create_directory(os.path.join(BASE_DIR, "lessons"))
    create_directory(os.path.join(BASE_DIR, "projects"))

    # INDEX.md
    index_content = """# Cloud & DevOps: Kubernetes & Microservices

Khóa học 10 tuần chuyên sâu về thiết kế, triển khai và vận hành hệ thống máy chủ phân tán. Phù hợp cho những ai muốn trở thành Cloud Engineer, DevOps Engineer, hoặc Platform Engineer.

## Mục Tiêu Khóa Học
- Làm chủ tư duy DevOps và tự động hoá quy trình phát triển phần mềm (CI/CD).
- Triển khai hạ tầng dưới dạng mã (IaC) sử dụng Terraform trên nền tảng AWS/GCP.
- Thành thạo Docker để đóng gói ứng dụng (Containerization).
- Vận hành kiến trúc Microservices quy mô lớn trên hệ thống điều phối Kubernetes (K8s, EKS/GKE).
- Xây dựng hệ thống giám sát (Monitoring) và Logging chuyên nghiệp.

## Cấu trúc thư mục
- `schedule.md`: Lộ trình chi tiết 10 tuần.
- `lessons/`: Các bài giảng lý thuyết, bài tập Lab (Terraform, Docker, K8s).
- `projects/`: Đồ án thực hành triển khai cụm Microservices trên Cloud.
"""
    write_file(os.path.join(BASE_DIR, "INDEX.md"), index_content)

    # schedule.md
    schedule_content = "# Lộ trình Cloud & DevOps 10 Tuần\n\n"
    for i, (title, desc) in enumerate(lessons):
        schedule_content += f"## Tuần {i+1}: {title}\n- {desc}\n- [Chi tiết bài học](lessons/week{i+1:02d}.md)\n\n"
    write_file(os.path.join(BASE_DIR, "schedule.md"), schedule_content)

    # lessons
    for i, (title, desc) in enumerate(lessons):
        week_num = i + 1
        lesson_content = f"""# Tuần {week_num}: {title}

## 1. Lý Thuyết & Kiến Trúc
- {desc}
- Các Best Practices (Thực hành tốt nhất) theo chuẩn công nghiệp.

## 2. Lab Thực Hành (Hands-on Lab)
- **Mục tiêu**: Xây dựng kịch bản tự động hoặc triển khai lên môi trường Cloud/Local.
- **Yêu cầu**: 
  1. Viết code cấu hình (YAML, HCL, Bash).
  2. Thực thi lệnh triển khai (`terraform apply`, `docker build`, `kubectl apply`).
  3. Kiểm tra tính ổn định của hệ thống.

## 3. Câu Lệnh & Cấu Hình Cần Nhớ
- Các snippets mã nguồn quan trọng.

## 4. Đọc Thêm (References)
- AWS/GCP Documentation.
- Terraform / Kubernetes Official Docs.
"""
        write_file(os.path.join(BASE_DIR, "lessons", f"week{week_num:02d}.md"), lesson_content)

    # final_project.md
    project_content = """# Đồ Án Cuối Khoá: Triển Khai Hệ Thống E-commerce Microservices Trên Cloud

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
"""
    write_file(os.path.join(BASE_DIR, "projects", "final_project.md"), project_content)

    print("Successfully generated DevOps course files.")

if __name__ == "__main__":
    main()
