# Cisco ASA Firewall Administration — 10 tuần

Khóa học chuyển hóa chuyên đề 31 video Cisco ASA thành lộ trình quản trị firewall có cấu trúc, tập trung vào cấu hình an toàn, kiểm chứng thay đổi và khả năng khôi phục hệ thống.

## Nguồn chuyên đề

- [Thư mục video Cisco ASA trên Google Drive](https://drive.google.com/drive/u/3/folders/1mJbu4Xoziw4ARxGu8MdTyb7CcdwnYopS)
- Nội dung nguồn gồm: tổng quan firewall, CLI, cấu hình interface, mật khẩu, backup/restore, nâng cấp ASA/ASDM, quản trị từ xa và DHCP.
- Video dùng làm tài liệu xem trước hoặc ôn tập; bài học Markdown bổ sung mục tiêu, lab, kiểm chứng và yêu cầu bảo mật.

## Điều kiện học

Học viên cần biết IPv4/subnet, TCP/UDP, mô hình OSI và thao tác terminal cơ bản. Lab dùng thiết bị ASA được cấp phép hoặc môi trường mô phỏng riêng của lớp; không thử cấu hình lên hệ thống sản xuất.

## Cấu trúc

- [Lịch trình 10 tuần](schedule.md)
- `lessons/week01.md` đến `week10.md`: bài học, lệnh mẫu và checklist kiểm chứng.

## Nguyên tắc an toàn

- Chỉ quản trị thiết bị thuộc quyền sở hữu hoặc có văn bản ủy quyền.
- Sao lưu và ghi nhận cấu hình trước mọi thay đổi.
- Telnet chỉ xuất hiện trong mạng lab để quan sát rủi ro; triển khai thật phải dùng SSH hoặc kênh quản trị bảo mật tương đương.
- Bài khôi phục mật khẩu chỉ áp dụng cho thiết bị được ủy quyền, có biên bản thay đổi và kế hoạch phục hồi.
- Mọi mật khẩu, IP và khóa trong ví dụ đều là dữ liệu giả; không commit bí mật thật.

## Đầu ra khóa học

Học viên có thể triển khai ASA theo zone, quản trị an toàn bằng SSH/ASDM, cấp DHCP, sao lưu/khôi phục, thực hiện nâng cấp có rollback và bàn giao runbook vận hành.

