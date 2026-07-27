# Lịch Trình Chi Tiết 10 Tuần Công Cụ Lập Trình / 10-Week Developer Tools Schedule

---

## 🗓️ Lịch Trình Chi Tiết / Detailed Schedule

| Tuần / Week | Buổi / Session | Nội Dung Học / Topics | Hoạt Động Thực Hành / Labs & Tasks |
|-------------|----------------|-----------------------|-----------------------------------|
| **Tuần 1** | Buổi 1 | Giới thiệu Hệ thống Quản lý Phiên bản (VCS)| Cấu hình Git config (username, email) và init repo |
| | Buổi 2 | Quy trình Git Core: Add, Commit, Status, Log | Thực hành tạo commit, quay ngược lịch sử dùng reset |
| **Tuần 2** | Buổi 3 | Quản lý nhánh (Branching) & Trộn nhánh (Merging)| Tạo nhánh tính năng, trộn nhánh Fast-forward |
| | Buổi 4 | Giải quyết xung đột mã nguồn (Merge Conflicts)| Giả lập xung đột dòng code và giải quyết trên VS Code |
| **Tuần 3** | Buổi 5 | Làm việc với Remote Repository (GitHub/GitLab)| Đẩy code lên GitHub, clone dự án và đồng bộ pull/push |
| | Buổi 6 | Quy trình GitHub Flow: Fork, Pull Request (PR)| Tạo PR gửi đóng góp mã nguồn cho dự án cộng tác |
| **Tuần 4** | Buổi 7 | Xem xét mã nguồn (Code Review) & Rebase | Đánh giá PR, bình luận dòng code và gộp nhánh nâng cao |
| | Buổi 8 | Tagging & Quản lý phát hành phiên bản (Releases)| Tạo thẻ tag phiên bản (v1.0.0) và tạo GitHub Release |
| **Tuần 5** | Buổi 9 | Giới thiệu Tự động hóa CI/CD | Tìm hiểu cơ chế và cấu hình file YAML |
| | Buổi 10 | GitHub Actions: Viết workflow đầu tiên | Tạo workflow tự động kiểm tra định dạng và chạy test code |
| **Tuần 6** | Buổi 11 | Giới thiệu Công nghệ Container & Ảo hóa | Cài đặt Docker Desktop và kiểm tra các lệnh chạy thử |
| | Buổi 12 | Làm việc với Docker Image từ Docker Hub | Pull và chạy các container Nginx, Node, Python có sẵn |
| **Tuần 7** | Buổi 13 | Tự xây dựng Docker Image thông qua Dockerfile | Viết Dockerfile đóng gói ứng dụng Node.js/Python của riêng bạn |
| | Buổi 14 | Quản lý Dữ liệu (Volumes) & Mạng (Networks) | Thiết lập chia sẻ thư mục và liên kết mạng giữa các container|
| **Tuần 8** | Buổi 15 | Giới thiệu Docker Compose | Viết file docker-compose.yml khởi chạy nhiều dịch vụ |
| | Buổi 16 | Cấu hình cụm dịch vụ Web + Database bằng Compose | Chạy song song ứng dụng Node.js kết nối tới MongoDB local |
| **Tuần 9** | Buổi 17 | Đóng gói môi trường Production và Development | Tối ưu hóa Dockerfile sử dụng kỹ thuật Multi-stage build |
| | Buổi 18 | Đẩy Docker Image tự tạo lên Docker Hub | Tạo tài khoản, tag image và push lên Docker Registry |
| **Tuần 10**| Buổi 19 | Tích hợp GitHub Actions build Docker Image | Viết pipeline tự động build và push Image khi push code |
| | Buổi 20 | Triển khai ứng dụng container lên môi trường VPS | Đưa container chạy ổn định trên máy chủ VPS đám mây |

---

## 🎯 Checklist Sản Phẩm Đầu Ra / Weekly Deliverables

- [ ] **Tuần 1**: Repository cá nhân chứa lịch sử commit rõ ràng.
- [ ] **Tuần 2**: Nhánh tính năng được gộp thành công vào nhánh main không lỗi.
- [ ] **Tuần 3**: Pull Request hoàn chỉnh chứa mô tả thay đổi chi tiết.
- [ ] **Tuần 4**: Phiên bản phát hành v1.0.0 có đính kèm file changelog.
- [ ] **Tuần 5**: Pipeline GitHub Actions chạy tự động mỗi khi đẩy mã nguồn.
- [ ] **Tuần 6**: Chạy thành công container Nginx hiển thị trang HTML tùy biến.
- [ ] **Tuần 7**: File Dockerfile chạy thử nghiệm ứng dụng cục bộ thành công.
- [ ] **Tuần 8**: Lưu được cơ sở dữ liệu MongoDB ngay cả khi xóa container.
- [ ] **Tuần 9**: Docker Compose khởi chạy cụm 3 container đồng thời.
- [ ] **Tuần 10**: Pipeline CI/CD hoàn chỉnh tự động build image và cập nhật VPS.
