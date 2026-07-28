# Tuần 7: Nâng cấp và phục hồi hệ điều hành

## Mục tiêu

- Lập kế hoạch upgrade ASA/ASDM có kiểm tra tương thích.
- Xác minh image và boot variable.
- Diễn tập rollback khi image mới không hoạt động.

## Video nguồn

Video 14, 27 và 29: phục hồi hệ điều hành, nâng cấp bằng TFTP/ASDM.

## Pre-flight checklist

1. Xác nhận model, RAM/flash, phiên bản hiện tại và đường nâng cấp được hỗ trợ.
2. Đọc release notes, known issues và thay đổi cấu hình.
3. Backup running/startup config, image và ASDM đang chạy.
4. Xác minh checksum image từ nguồn tin cậy.
5. Đảm bảo console/out-of-band access và maintenance window.
6. Định nghĩa health check cùng ngưỡng rollback.

## Lệnh quan sát

```text
show version
show inventory
show flash:
show running-config boot
show failover
```

Không cung cấp một chuỗi upgrade “dùng cho mọi máy”: boot command, compatibility và HA sequencing phụ thuộc model/version. Học viên phải ghi nguồn tài liệu vendor dùng cho quyết định.

## Bài tập

Viết Method of Procedure gồm pre-check, change, validation và rollback cho một phiên bản giả định; nhóm khác thực hiện tabletop review trước khi lab.

