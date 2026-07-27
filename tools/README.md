# Công Cụ Chuyển Đổi Markdown Sang Word (.docx) Chuẩn Nghị Định 30/2020/NĐ-CP

Công cụ CLI được viết bằng Python giúp chuyển đổi các tệp tài liệu Markdown (`.md`) sang định dạng Microsoft Word (`.docx`) với các thiết lập định dạng tuân thủ nghiêm ngặt **Nghị định 30/2020/NĐ-CP của Chính phủ về công tác văn thư**.

---

## 🏛️ Quy Chuẩn Văn Bản Nhà Nước (Nghị định 30/2020/NĐ-CP)

- **Khổ giấy**: A4 (210 mm × 297 mm).
- **Phông chữ**: Times New Roman (Bộ mã ký tự Unicode TCVN 6909:2001).
- **Căn lề trang**:
  - Lề trên (Top): **2.0 cm** (20 mm)
  - Lề dưới (Bottom): **2.0 cm** (20 mm)
  - Lề trái (Left): **3.0 cm** (30 mm - lề rộng để đóng sổ/hồ sơ)
  - Lề phải (Right): **2.0 cm** (20 mm)
- **Đoạn văn (Body Text)**:
  - Cỡ chữ: **13 pt** (hoặc 14 pt).
  - Căn lề: **Căn đều 2 bên (Justified)**.
  - Lùi đầu dòng (First line indent): **1.0 cm** (10 mm).
  - Giãn dòng (Line spacing): **1.3x** (từ 1.3 đến 1.5).
  - Giãn đoạn: Space After 4pt.
- **Tiêu đề (Headings)**:
  - **Heading 1**: 15pt, In hoa, In đậm, Căn giữa.
  - **Heading 2**: 14pt, In thường, In đậm, Căn trái.
  - **Heading 3**: 13pt, In thường, In đậm & Nghiêng, Căn trái.
- **Bảng biểu (Tables)**:
  - Căn giữa trang.
  - Dòng tiêu đề: Nền xám nhạt (`#F2F4F7`), In đậm, Căn giữa.
  - Đường viền: Nét đơn mảnh màu xám (`0.5pt`).
- **Đánh số trang**: Tự động đánh số trang ở giữa phần Footer/Header.

---

## 🚀 Hướng Dẫn Sử Dụng (Usage)

### 1. Chuyển đổi 1 tệp Markdown đơn lẻ:
```bash
./tools/md2docx path/to/file.md
# File xuất ra sẽ là path/to/file.docx
```

### 2. Chỉ định tên file Word đầu ra:
```bash
./tools/md2docx path/to/file.md -o path/to/output.docx
```

### 3. Chuyển đổi hàng loạt toàn bộ thư mục:
```bash
./tools/md2docx courses/4_CYBERSECURITY/1_System_App_Security/cybersec-ai-10weeks/lessons/ -o dist/docx_output/
```

### 4. Tùy chỉnh tham số định dạng (Tùy chọn):
```bash
./tools/md2docx file.md --font-size 14 --line-spacing 1.5 --margin-left 3.5 --margin-top 2.5
```

---

## 🛠️ Yêu Cầu Môi Trường
- Python 3.10+
- Các thư viện: `python-docx`, `markdown`, `beautifulsoup4`, `lxml` (đã được tự động cài đặt trong `.venv`).
