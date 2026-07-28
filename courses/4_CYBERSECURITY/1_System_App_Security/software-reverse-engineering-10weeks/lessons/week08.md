# Tuần 8: Phân tích ứng dụng GUI và event-driven flow

## Nguồn bài học

**Introduction to Cracking Graphical User Interface based programs** được chuyển thành phân tích GUI phòng thủ. Target là ứng dụng lớp tự viết có source/symbol.

## Kết quả cần đạt

- Mô tả message loop, window procedure/event handler và worker thread.
- Truy một thao tác UI tới validation, business logic và state change.
- Phân biệt UI affordance với authorization.
- Test input rỗng, dài, Unicode, retry/cancel và race condition cơ bản.

## 1. Event-driven model

```text
User input → OS message/event → UI handler → parser/validation
→ service/business logic → state/storage → UI result
```

Trong framework khác nhau, tên callback khác nhau nhưng câu hỏi giống nhau: ai tạo event, dữ liệu đi đâu, thread nào xử lý và quyết định bảo mật nằm ở trust boundary nào?

## 2. UI không phải security boundary

- Nút disable không ngăn handler được gọi từ code path khác.
- Hidden field/control không làm dữ liệu thành secret.
- Client-side validation cải thiện UX nhưng server/service vẫn phải xác minh.
- Message text “Access denied” không chứng minh authorization đúng.

## 3. Toy GUI specification

Ứng dụng có:

- Textbox nhập project ID.
- Button `Load`.
- Checkbox `Use offline cache`.
- Status label.
- Service layer giả lập trả `Allowed`, `Denied`, `Unavailable`.

Handler phải validate length/format, không block UI thread, xử lý cancel và không fail-open khi service unavailable.

## 4. Lab

1. Lập event inventory bằng thao tác black-box.
2. Dùng symbol để tìm handler `OnLoad` hoặc callback tương đương.
3. Đặt breakpoint tại handler và service boundary, không tại mọi UI API.
4. Ghi thread ID, input đã normalize và return state.
5. Test empty, 256+ chars, combining Unicode, double-click và cancel.
6. Xác minh logging không ghi token/secret/full user input.
7. Vẽ event map và đánh dấu điểm cần fix.

## 5. Test matrix

| Case | UI expected | Service called? | Security expected |
|---|---|---:|---|
| Empty ID | validation error | No | no state change |
| Valid ID/Allowed | success | Yes | authorized state |
| Valid ID/Denied | denied | Yes | fail closed |
| Service timeout | retry/cancel | Yes | fail closed |
| Double click | one operation | Once/idempotent | no duplicate action |

## Lỗi thường gặp

- Debug UI thread rồi hiểu nhầm app “treo”.
- Không theo worker thread/callback completion.
- Tập trung message box string thay vì decision source.
- Bỏ qua Unicode/normalization.
- Sửa enabled/visible state thay cho authorization fix.

## Bài tập và rubric

Nộp event map, test matrix, debugging timeline và một source-level hardening change. Chấm: event flow 25, trust boundary 25, tests 20, fix 20, evidence 10.

