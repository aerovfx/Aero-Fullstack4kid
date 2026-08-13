# Bổ sung: xử lý subtitle thành văn bản

Ví dụ [subtitle_to_text.py](../code/tools/subtitle_to_text.py) minh họa đọc file an toàn, biểu thức chính quy, tách hàm thuần và giao diện dòng lệnh.

- Chỉ chấp nhận đầu vào SRT hoặc VTT.
- Tách timestamp, số thứ tự và header WEBVTT.
- Ghi UTF-8 vào đường dẫn đầu ra do người dùng chỉ định.
- Nên thêm test cho subtitle rỗng, Unicode và timestamp sai định dạng.
