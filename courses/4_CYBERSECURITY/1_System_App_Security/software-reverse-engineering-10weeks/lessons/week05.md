# Tuần 5: Audit branch và tìm root cause

## Nguồn

Bài 7 về reversing jump được chuyển thành phân tích control-flow phòng thủ.

## Mục tiêu

- Theo dõi dữ liệu dẫn tới conditional branch.
- Phân biệt symptom patch với root-cause fix.
- Phát hiện quyết định bảo mật chỉ nằm ở client.

## Case study lab

Toy app kiểm tra quyền bằng một boolean lấy từ file cấu hình. Học viên không đảo jump để “mở khóa”; thay vào đó phải trả lời:

- Giá trị được tạo, biến đổi và kiểm tra ở đâu?
- Input có được xác thực/chữ ký hay người dùng tự sửa được?
- Quyết định có được server hoặc trust boundary đáng tin xác minh lại không?
- Compiler optimization ảnh hưởng control flow thế nào?

## Fix ưu tiên

Đưa authorization tới thành phần tin cậy, ký dữ liệu cấu hình, xử lý fail-closed và thêm test tampering. Đảo một branch chỉ che symptom, không phải bản vá bảo mật.

## Bài tập

Vẽ control-flow graph cho hàm lab và viết finding gồm impact, evidence, root cause, fix từ source, regression tests và residual risk.

