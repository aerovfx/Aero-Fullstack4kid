# Tuần 6: Backup, restore và bảo vệ cấu hình

## Mục tiêu

- Sao lưu cấu hình qua phương thức được phê duyệt.
- Kiểm tra tính đầy đủ và khả năng restore của backup.
- Xử lý file cấu hình như dữ liệu nhạy cảm.

## Video nguồn

Video 9–12, 25–26 và 28: TFTP/FTP, ASDM, backup, restore và lưu cấu hình.

## Nguyên tắc

TFTP và FTP không mã hóa; chỉ dùng trong VLAN lab cô lập hoặc khi thiết bị cũ buộc phải dùng, kèm kiểm soát bù. Môi trường thật ưu tiên giao thức mã hóa và hệ thống backup quản trị tập trung nếu phiên bản hỗ trợ.

```text
show running-config
copy running-config tftp:
copy startup-config tftp:
verify /md5 <image-or-backup-file>
```

Cú pháp/checksum phụ thuộc phiên bản. Không coi “copy thành công” là đủ: phải kiểm tra kích thước, checksum, khả năng đọc, thời gian tạo và thực hiện restore drill định kỳ.

## Bảo vệ backup

- Mã hóa khi lưu và truyền; giới hạn quyền đọc.
- Che hoặc quản lý riêng secret, pre-shared key và community string.
- Dùng retention/versioning; ghi lại thiết bị và phiên bản ASA tương ứng.
- Không đưa file cấu hình thật vào repository khóa học.

## Bài tập

Thực hiện backup và restore trên thiết bị lab, so sánh cấu hình trước/sau và lập biên bản bằng chứng không chứa secret.

