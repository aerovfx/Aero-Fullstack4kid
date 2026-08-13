# Bài tập tuần 10: Hardening audit

Hoàn thiện `starter.sh` trong VM lab hoặc container riêng. Mặc định script phải chỉ đọc/dry-run; mọi thay đổi cần cờ `--apply`, xác nhận đầu vào, backup và rollback.

## Kiểm thử

- Happy path với dữ liệu lab hợp lệ.
- Đầu vào rỗng/sai phải thất bại có thông báo.
- Chạy lần hai không gây hỏng trạng thái (idempotent khi phù hợp).
- Không hard-code password, token, hostname hoặc IP production.

## Chấm điểm

Đúng chức năng 40%; an toàn/idempotency 30%; log và xử lý lỗi 20%; tài liệu 10%.
