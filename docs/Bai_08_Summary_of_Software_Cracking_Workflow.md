# Giáo trình Cyber Security -- Reverse Engineering

## Tuần 1 -- Bài 8

# Summary of Software Cracking Workflow

> Bài học tổng kết quy trình phân tích phần mềm trong môi trường Reverse
> Engineering và Ethical Hacking.

## 1. Mục tiêu

-   Hiểu toàn bộ quy trình Software Cracking Workflow.
-   Biết cách kết hợp Static Analysis và Dynamic Analysis.
-   Xây dựng quy trình phân tích chuẩn.
-   Biết ghi chép và lập báo cáo.

## 2. Kiến thức chính

### Quy trình tổng quát

1.  Thu thập mẫu chương trình.
2.  Static Analysis (DIE, PE analysis).
3.  Kiểm tra Compiler, Architecture và Packer.
4.  Dynamic Analysis với x64dbg.
5.  Đặt Breakpoint.
6.  Theo dõi Registers, Stack, Memory.
7.  Phân tích CALL, CMP và Jump.
8.  Thực hiện Patch trong môi trường được phép.
9.  Kiểm thử và lập báo cáo.

### Workflow đề xuất

``` text
Sample
↓
Detect It Easy
↓
x64dbg
↓
Breakpoint
↓
Step Into / Step Over
↓
CMP + Jump
↓
Patch
↓
Test
↓
Report
```

## 3. Thuật ngữ

  Thuật ngữ          Ý nghĩa
  ------------------ --------------------
  Workflow           Quy trình làm việc
  Static Analysis    Phân tích tĩnh
  Dynamic Analysis   Phân tích động
  Breakpoint         Điểm dừng
  Patch              Chỉnh sửa mã máy
  Report             Báo cáo

## 4. Ví dụ minh họa

Ví dụ quy trình phân tích một file EXE:

-   Xác định PE64 bằng DIE.
-   Mở bằng x64dbg.
-   Đặt Breakpoint tại Entry Point.
-   Theo dõi các lệnh CALL, CMP và Jump.
-   Ghi chú kết quả và lập báo cáo.

## 5. Bài thực hành (Lab)

-   Thực hiện đầy đủ quy trình với một chương trình mẫu.
-   Ghi lại ảnh chụp màn hình từng bước.
-   Viết báo cáo tóm tắt kết quả phân tích.

## 6. Câu hỏi ôn tập

1.  Workflow chuẩn gồm những bước nào?
2.  Vì sao cần kết hợp Static và Dynamic Analysis?
3.  Vai trò của Breakpoint trong quy trình?
4.  Khi nào nên thực hiện Patch?
5.  Báo cáo phân tích nên gồm những nội dung gì?

## 7. Tổng kết

-   Hiểu toàn bộ Software Cracking Workflow.
-   Kết hợp các kỹ thuật đã học trong các bài trước.
-   Áp dụng quy trình phân tích có hệ thống trong nghiên cứu và kiểm thử
    bảo mật.
