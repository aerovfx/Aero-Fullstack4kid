# Dự án cuối khóa: Hạ tầng doanh nghiệp mô phỏng

Trong các VM lab, triển khai một load balancer, hai web server, một database và hệ thống giám sát. Thiết lập firewall và tự động backup database.

## Sản phẩm bắt buộc

- Sơ đồ hệ thống, inventory, runbook và ma trận quyền truy cập.
- Script idempotent, mặc định dry-run, không chứa secret và có log.
- Dashboard/cảnh báo CPU, RAM, disk, HTTP health và database.
- Backup theo 3-2-1; diễn tập phục hồi cô lập, ghi RPO/RTO.
- Hardening checklist, kế hoạch vá lỗi và rollback.

## Chấm điểm

Triển khai 25%; tự động hóa 20%; giám sát 15%; backup/restore 20%; bảo mật 10%; tài liệu/demo 10%.
