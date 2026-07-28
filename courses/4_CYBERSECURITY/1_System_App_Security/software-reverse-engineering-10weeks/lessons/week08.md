# Tuần 8: Phân tích ứng dụng GUI và event-driven flow

## Nguồn bài học

- **Introduction to Cracking Graphical User Interface based programs** được chuyển thành phân tích GUI phòng thủ. Target là ứng dụng lớp tự viết có source/symbol.

## Chuyên đề: Phía Sau Màn Hình "Serial Key" — 3 Sự Thật Về Việc Phân Tích Phần Mềm Giao Diện (GUI)

### 1. Bản chất của GUI: Từ "Chớp nhoáng" đến "Vòng lặp tương tác"

Sự khác biệt cốt lõi giữa chương trình dòng lệnh (CLI) và chương trình giao diện (GUI) nằm ở cơ chế vận hành bên trong hệ điều hành. Các chương trình CLI thường hoạt động theo lối tuyến tính: thực thi nhiệm vụ rồi kết thúc ngay lập tức, tạo ra hiện tượng "chạy và dừng" (*flash and go*). Nếu không khởi chạy thông qua CMD, bạn sẽ chẳng kịp thấy điều gì ngoài một vệt đen mờ nhạt trên màn hình.

Ngược lại, phần mềm GUI được xây dựng dựa trên cơ chế **tương tác hướng sự kiện (event-driven interaction)**. Thay vì kết thúc sau khi chạy, nó duy trì một **vòng lặp sự kiện (event-loop)** để chờ đợi phản hồi từ người dùng. Đây chính là lý do vì sao trong các môi trường phân tích như Windows 7 / Windows 10, khi khởi chạy các ứng dụng thử nghiệm như "Crack Me", chúng ta thấy một thực thể hiện hữu, có thể di chuyển và tương tác được.

> *"Đây là chương trình giao diện người dùng đồ họa... bạn có thể di chuyển nó xung quanh, bạn có thể đọc thông tin trên đó... cảm giác giống như bạn có thể thực sự chạm vào nó vậy."*

Chính đặc tính "có thể chạm vào" này khiến việc phân tích GUI trở nên thú vị hơn: bạn không chỉ đối đầu với các dòng code, mà còn đối đầu với cách mà lập trình viên trình bày logic bảo mật của họ thông qua các nút bấm và ô nhập liệu.

### 2. Giải mã rào cản: Khi Serial Key trở thành mục tiêu phân tích

Trong khi việc xử lý CLI thường chỉ xoay quanh việc "patch" (vá) các lệnh trả về, thì phân tích GUI đòi hỏi một quy trình bài bản hơn, bắt đầu từ việc mổ xẻ cấu trúc tệp **PE (Portable Executable)**. Đây là định dạng tệp thực thi chuẩn trên Windows, chứa đựng mọi thông tin về cách chương trình tương tác với hệ thống.

Khi một ô nhập Serial Key hiện ra, đó chính là "điểm chạm" đầu tiên của quá trình Reverse Engineering (Kỹ thuật đảo ngược). Mục tiêu của người phân tích không phải là phá hoại, mà là truy tìm những "kho báu" được giấu kín trong mã nguồn Binary (nhị phân):
- **Flag (Cờ đánh dấu)**: Những tín hiệu cho thấy trạng thái bảo mật đã được vượt qua.
- **Serial phrase (Cụm từ nối tiếp)**: Chuỗi ký tự thực sự mà chương trình đang mong đợi.
- **Mật mã ẩn**: Các thuật toán kiểm tra tính đúng đắn được lập trình viên cài cắm phía sau giao diện.

Việc hiểu rõ cấu trúc PE file giúp chúng ta nhận diện được cách ứng dụng gọi các hàm hệ thống để kiểm tra mã nhập vào, từ đó tìm ra chìa khóa giải mã rào cản.

### 3. Ranh giới đạo đức: Kiến thức là sức mạnh, quyền hạn là giới hạn

Là một chuyên gia bảo mật, ranh giới giữa một nhà nghiên cứu và một kẻ phá hoại thường rất mong manh. Việc phân tích phần mềm, đặc biệt là phân tích GUI, phải luôn đặt trong khuôn khổ **mục đích giáo dục (educational purposes)**.

Kiến thức về cách phần mềm vận hành và cách các lớp bảo mật bị xuyên thủng là vô giá để xây dựng những hệ thống tốt hơn. Tuy nhiên, quyền sở hữu trí tuệ là bất khả xâm phạm. Bạn có thể nghiên cứu để học hỏi, nhưng không được phép gây thiệt hại cho sản phẩm của người khác khi chưa có sự cho phép.

> *"Bạn cần nắm vững kiến thức về cách phần mềm hoạt động và cách nó bị bẻ khóa... nhưng trừ khi bạn có đặc quyền, hoặc bạn cần phải đọc kỹ các điều khoản và điều kiện của ứng dụng trước khi định gây ra bất kỳ tổn hại nào cho nó."*

Việc đọc kỹ **Terms and Conditions** (Điều khoản và Điều kiện) không chỉ là thủ tục pháp lý, mà là đạo đức nghề nghiệp. Hãy nhớ rằng: Mục đích cuối cùng của việc hiểu về kỹ thuật đảo ngược là để trở thành một lập trình viên có tư duy bảo mật sắc bén hơn, chứ không phải để trở thành kẻ đi ngược lại lợi ích của cộng đồng công nghệ.

---

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

