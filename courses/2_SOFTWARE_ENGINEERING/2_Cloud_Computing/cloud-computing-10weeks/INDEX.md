# Cloud Computing & DevOps — 10 tuần

Khóa học thực hành dành cho người đã biết terminal, Git và kiến thức web căn bản. Mục tiêu là xây quy trình triển khai có thể lặp lại, quan sát được và an toàn trước khi đưa lên AWS/GCP.

## Điều kiện tiên quyết

- Linux/macOS hoặc WSL, Bash và Git.
- Docker, Terraform, kubectl và Helm được cài theo từng tuần cần dùng.
- Tài khoản cloud là tùy chọn; lab mặc định chạy local/dry-run để tránh chi phí.

## Cấu trúc

- `lessons/`: 10 bài học.
- `code/`: 10 entry point Bash có chú thích tiếng Việt.
- `exercises/`: starter và đề bài cho từng tuần.
- `projects/final_project.md`: đồ án nền tảng microservices.
- `references/`: tài liệu nguồn còn giá trị tham khảo.

## Quy tắc an toàn

Không commit credential; luôn xem `plan`, diff hoặc dry-run; đặt budget cloud; xóa tài nguyên lab sau buổi học; không chạy script với `sudo` khi chưa đọc toàn bộ.

## Lộ trình

Xem [schedule.md](schedule.md). Mỗi tuần chạy `bash code/weekNN.sh`, sau đó hoàn thành `exercises/weekNN/`.

| Tuần | Bài học | Code | Bài tập |
|---:|---|---|---|
| 1 | [Cloud, DevOps và IAM](lessons/week01.md) | [week01.sh](code/week01.sh) | [week01](exercises/week01/README.md) |
| 2 | [Linux và Bash](lessons/week02.md) | [week02.sh](code/week02.sh) | [week02](exercises/week02/README.md) |
| 3 | [Terraform IaC](lessons/week03.md) | [week03.sh](code/week03.sh) | [week03](exercises/week03/README.md) |
| 4 | [Git và CI/CD](lessons/week04.md) | [week04.sh](code/week04.sh) | [week04](exercises/week04/README.md) |
| 5 | [Docker](lessons/week05.md) | [week05.sh](code/week05.sh) | [week05](exercises/week05/README.md) |
| 6 | [Microservices và Gateway](lessons/week06.md) | [week06.sh](code/week06.sh) | [week06](exercises/week06/README.md) |
| 7 | [Kubernetes](lessons/week07.md) | [week07.sh](code/week07.sh) | [week07](exercises/week07/README.md) |
| 8 | [Helm](lessons/week08.md) | [week08.sh](code/week08.sh) | [week08](exercises/week08/README.md) |
| 9 | [Observability](lessons/week09.md) | [week09.sh](code/week09.sh) | [week09](exercises/week09/README.md) |
| 10 | [HA và DevSecOps](lessons/week10.md) | [week10.sh](code/week10.sh) | [week10](exercises/week10/README.md) |

## Đồ án

[Nền tảng microservices có CI/CD, Kubernetes và observability](projects/final_project.md).
