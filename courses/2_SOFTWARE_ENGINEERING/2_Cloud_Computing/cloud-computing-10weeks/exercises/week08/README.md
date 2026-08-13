# Bài tập tuần 8: Helm và triển khai Kubernetes

## Yêu cầu

Sao chép `starter.sh`, hoàn thiện các vị trí TODO và không thay đổi dữ liệu ngoài thư mục lab.

## Input và output

- Input: tham số dòng lệnh hoặc biến môi trường được mô tả trong starter.
- Output: báo cáo dễ đọc hoặc cấu hình có thể validate.
- Khi input sai, chương trình phải thoát khác 0 và in hướng dẫn.

## Test case

1. Chạy không tham số: dùng giá trị local an toàn hoặc hiện usage.
2. Chạy với đầu vào hợp lệ: tạo output đúng và có thể chạy lại.
3. Chạy với đầu vào sai: không thay đổi hệ thống và trả lỗi rõ ràng.

## Thử thách

- Cơ bản: bổ sung validation và thông báo lỗi.
- Nâng cao: thêm chế độ `--dry-run` hoặc bước rollback.

## Chấm điểm

Tính đúng 40%, an toàn/idempotent 25%, kiểm thử 20%, giải thích 15%.

