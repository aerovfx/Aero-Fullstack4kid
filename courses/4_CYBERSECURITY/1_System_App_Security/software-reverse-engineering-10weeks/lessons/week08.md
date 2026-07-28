# Tuần 8: Phân tích ứng dụng GUI/event-driven

## Nguồn

Bài 10: GUI-based program analysis.

## Mục tiêu

- Hiểu message loop, callback/event handler và worker thread.
- Truy từ thao tác UI tới handler và business logic.
- Tránh nhầm UI validation với security boundary.

## Lab

Toy GUI có textbox, nút Submit và status label. Học viên dùng symbol/source map để:

1. Xác định event handler.
2. Theo dõi dữ liệu từ input tới parser/validator.
3. Kiểm tra lỗi input rỗng, quá dài, Unicode và cancel/retry.
4. Xác minh logic bảo mật không chỉ dựa vào trạng thái control UI.

## Finding mẫu

Nút bị disable không phải authorization: automation hoặc code path khác có thể gọi handler. Fix phải nằm trong service/business layer và được test độc lập UI.

## Bài tập

Lập event map `UI event → handler → validation → state change → output`, đánh dấu trust boundary và nơi cần logging mà không ghi secret.

