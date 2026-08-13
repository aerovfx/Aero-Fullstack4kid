# Viết mã, công thức và báo cáo bảo mật

## Clean Code cho công cụ phân tích

- Hàm làm một việc, tên diễn đạt mục đích và không che giấu side effect.
- Tách parser, rule đánh giá và formatter báo cáo để kiểm thử độc lập.
- Không dùng comment để bào chữa cho code khó hiểu; comment chỉ ghi lý do, giới hạn hoặc rủi ro.
- Mỗi secure patch cần test tái lập lỗi, test hồi quy và rollback test.

## Ký hiệu dùng trong báo cáo

- Boolean: A AND B, A OR B, NOT A.
- Chuyển trạng thái: S(t) -> S(t+1).
- Sai khác byte: delta = patched - original.
- Vector thanh ghi: r = [RAX, RBX, RCX, RDX].
- Ma trận bằng chứng: hàng là observation, cột là công cụ hoặc lần chạy.

Công thức phải đi kèm định nghĩa biến, đơn vị và giả định; không dùng ký hiệu để thay thế bằng chứng thực nghiệm.

## Mẫu vulnerability reporting

1. Kênh tiếp nhận do tổ chức công bố, không hard-code email cá nhân trong repo.
2. Xác nhận đã nhận báo cáo và cung cấp mã theo dõi.
3. Ghi phạm vi, phiên bản ảnh hưởng, mức độ và bước tái lập an toàn.
4. Nêu lịch cập nhật, phương án khắc phục và điều kiện công bố phối hợp.
5. Không gửi credential, dữ liệu cá nhân hoặc binary độc hại qua kênh không mã hóa.
