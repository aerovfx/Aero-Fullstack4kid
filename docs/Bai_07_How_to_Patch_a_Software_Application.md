# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 7

# How to Patch a Software Application

> Giáo trình được biên soạn theo chủ đề của bài học, tập trung vào khái
> niệm **patch** trong Reverse Engineering và Debugging nhằm phục vụ
> nghiên cứu, kiểm thử và phân tích phần mềm.

## 1. Mục tiêu

-   Hiểu khái niệm Patch trong Reverse Engineering.
-   Biết quy trình chỉnh sửa mã máy bằng x64dbg.
-   Hiểu sự khác nhau giữa Patch tạm thời và Patch lưu vào tệp.
-   Biết cách kiểm tra kết quả sau khi áp dụng Patch.
-   Nhận thức được các nguyên tắc sử dụng Patch trong môi trường nghiên
    cứu được phép.

## 2. Kiến thức chính

### Patch là gì?

Patch là việc thay đổi một hoặc nhiều lệnh máy (machine instructions)
của chương trình để thay đổi hành vi của nó.

### Quy trình Patch

1.  Mở chương trình bằng x64dbg.
2.  Phân tích vị trí cần chỉnh sửa.
3.  Quan sát Assembly và Registers.
4.  Thay đổi lệnh Assembly phù hợp.
5.  Kiểm tra chương trình sau khi chỉnh sửa.
6.  Lưu Patch vào tệp (nếu cần).

### Các thao tác thường dùng

-   Assemble
-   Patch
-   Restore Original Bytes
-   Copy to Executable
-   Save Patched File

### Kiểm tra sau khi Patch

-   Chương trình có chạy bình thường không.
-   Luồng thực thi có thay đổi như mong muốn không.
-   Có phát sinh lỗi hoặc ngoại lệ không.

## 3. Thuật ngữ

  Thuật ngữ            Ý nghĩa
  -------------------- --------------------------------
  Patch                Chỉnh sửa mã máy
  Assemble             Biên dịch lại lệnh Assembly
  Opcode               Mã lệnh máy
  NOP                  Lệnh không thực hiện thao tác
  Restore              Khôi phục mã gốc
  Copy to Executable   Áp dụng Patch vào tệp thực thi

## 4. Ví dụ minh họa

### Ví dụ 1

Quan sát một lệnh Assembly trong x64dbg và sử dụng **Assemble** để thay
đổi thành lệnh khác trong môi trường thực hành.

### Ví dụ 2

Lưu các thay đổi bằng **Copy to Executable** và kiểm tra chương trình
trong môi trường thử nghiệm.

## 5. Bài thực hành (Lab)

### Lab 1

-   Mở một chương trình mẫu bằng x64dbg.
-   Xác định vị trí cần nghiên cứu.
-   Thử thay đổi một lệnh Assembly trong môi trường Lab.

### Lab 2

-   Lưu Patch vào bản sao của tệp.
-   So sánh hành vi trước và sau khi chỉnh sửa.

### Lab 3

-   Khôi phục mã gốc và xác nhận chương trình trở lại trạng thái ban
    đầu.

## 6. Câu hỏi ôn tập

1.  Patch là gì?
2.  Khác nhau giữa Patch trong bộ nhớ và Patch lưu vào tệp?
3.  Chức năng của Assemble trong x64dbg?
4.  Khi nào nên Restore Original Bytes?
5.  Vì sao cần kiểm tra chương trình sau khi Patch?

## 7. Tổng kết

-   Hiểu khái niệm Patch.
-   Biết quy trình chỉnh sửa mã bằng x64dbg.
-   Thực hiện và kiểm tra Patch trong môi trường học tập.
-   Áp dụng kiến thức vào phân tích phần mềm và nghiên cứu bảo mật một
    cách có trách nhiệm.
