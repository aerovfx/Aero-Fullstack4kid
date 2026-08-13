# Tuần 10: High Availability và DevSecOps

## Mục tiêu

- Hiểu và giải thích được health check, scaling, secret scanning, vulnerability scanning và rollback.
- Chạy code mẫu an toàn trên máy local trước khi áp dụng lên cloud.
- Ghi lại bằng chứng kiểm tra và phân tích lỗi thay vì chỉ sao chép lệnh.

## Kiến thức trọng tâm

health check, scaling, secret scanning, vulnerability scanning và rollback. Mọi thao tác có thể tạo chi phí hoặc thay đổi hạ tầng phải đi qua bước review, dry-run/plan và nguyên tắc quyền tối thiểu. Không lưu secret trong Git.

## Code mẫu

- [Mở week10.sh](../code/week10.sh)
- Chạy: `bash code/week10.sh`
- Script mặc định ưu tiên kiểm tra hoặc sinh cấu hình; hãy đọc code trước khi cấp quyền cao hơn.

## Thực hành từng bước

1. Đọc chú thích và dự đoán đầu ra.
2. Chạy script trong thư mục khóa học.
3. Kiểm tra file được sinh trong `generated/week10` nếu có.
4. Dùng công cụ validate/dry-run được gợi ý trong output.
5. Ghi lại một lỗi, nguyên nhân và cách khắc phục.

## Bài tập

- [Bài tập tuần 10](../exercises/week10/README.md)

## Lỗi phổ biến

- Chạy lệnh sửa hạ tầng khi chưa xem plan/diff.
- Hard-code credential, IP hoặc tên môi trường.
- Bỏ qua exit code, healthcheck hay giới hạn tài nguyên.

## Tự kiểm tra

Giải thích code bằng lời, đưa ra ba tình huống kiểm thử và chỉ ra cách rollback nếu bước triển khai thất bại.

## Tiêu chí hoàn thành

Code/syntax hợp lệ, không có secret, có bằng chứng dry-run hoặc validate và hoàn thành cả thử thách cơ bản lẫn nâng cao.
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.

<!-- AUTO-GENERATED-WEEKLY-CODE -->
## 20 code minh họa của tuần

- [Mở mục lục code tuần 10](../code/week10/README.md), học lần lượt từ `01_...` đến `20_...`.
