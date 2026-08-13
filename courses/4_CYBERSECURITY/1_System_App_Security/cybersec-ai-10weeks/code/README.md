# Code minh họa — Cybersecurity & AI

Mỗi tuần có một thư mục riêng gồm 20 ví dụ, đánh số lại từ `01` đến `20`. Mỗi buổi học có thể chọn các ví dụ phù hợp với tốc độ của lớp.

| Tuần | Mã | Nội dung |
|---|---|---|
| 01 | 01–20 | Python, dữ liệu mạng và socket TCP localhost |
| 02 | 01–20 | Gói tin, recon có phạm vi và inventory localhost |
| 03 | 01–20 | Kiểu dữ liệu, con trỏ và RAII trong C++ |
| 04 | 01–20 | Đa luồng và xử lý bộ đệm an toàn |
| 05 | 01–20 | Kiểm kê hệ thống, phân tích kết quả Nmap mẫu |
| 06 | 01–20 | Phân tích traffic và phát hiện bất thường |
| 07 | 01–20 | Băm mật khẩu và metadata Wi-Fi giả lập |
| 08 | 01–20 | Prompt có cấu trúc và OSINT giả lập |
| 09 | 01–20 | Audit code và phân tích access log |
| 10 | 01–20 | Chấm điểm cảnh báo và pipeline SOC mini |

## Nguyên tắc chạy

- Chỉ dùng dữ liệu giả lập hoặc `127.0.0.1`.
- Không quét Internet, không thu thập credential và không gọi API bên ngoài.
- Chạy Python: `python3 code/weekXX/NN_ten_file.py`.
- Biên dịch C++: `c++ -std=c++17 code/week03/05_cpp_types.cpp -o /tmp/demo`.
