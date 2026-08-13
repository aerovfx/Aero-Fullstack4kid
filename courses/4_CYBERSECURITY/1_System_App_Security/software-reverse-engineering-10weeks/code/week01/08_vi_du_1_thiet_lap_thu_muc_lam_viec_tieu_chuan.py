"""software-reverse-engineering-10weeks · Tuần 01 · Bài 08.

Chủ đề: Ví dụ 1: Thiết lập thư mục làm việc tiêu chuẩn
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Ví dụ 1: Thiết lập thư mục làm việc tiêu chuẩn:', result)
