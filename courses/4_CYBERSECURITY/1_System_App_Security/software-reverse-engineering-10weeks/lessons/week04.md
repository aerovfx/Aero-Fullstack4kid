# Tuần 4: Stepping, call stack và breakpoint

## Nguồn

Bài 5–6: step into call function và breakpoint.

## Mục tiêu

- Phân biệt step into, step over, run-to-user-code và return.
- Dùng software/hardware/memory breakpoint có mục tiêu.
- Thu evidence mà không làm thay đổi trạng thái ngoài ý muốn.

## Lab

Trên toy application có symbol:

1. Đặt breakpoint tại `main` và hàm validation do lớp viết.
2. Dùng step over cho library call, step into cho code cần hiểu.
3. Ghi call stack, arguments, return value và thread ID.
4. Đặt breakpoint có điều kiện cho input test cụ thể.
5. Restart và xác nhận quy trình tái lập được.

## Lỗi thường gặp

- Đặt quá nhiều breakpoint làm sai timing hoặc khó đọc log.
- Nhầm exception first-chance với crash.
- Chỉnh register/memory rồi coi kết quả là hành vi nguyên bản.
- Không ghi ASLR module base nên địa chỉ không tái sử dụng được.

## Bài tập

Nộp debugging timeline có tối đa 10 bước, mỗi bước nêu câu hỏi, breakpoint, observation và kết luận.

