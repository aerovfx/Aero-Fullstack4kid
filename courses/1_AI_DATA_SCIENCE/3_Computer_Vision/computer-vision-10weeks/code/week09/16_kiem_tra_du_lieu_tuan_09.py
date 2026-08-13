"""computer-vision-10weeks · Tuần 09 · Bài 16.

Chủ đề: Kiểm tra dữ liệu tuần 09
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Kiểm tra dữ liệu tuần 09:', result)
