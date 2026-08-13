"""computer-vision-10weeks · Tuần 06 · Bài 08.

Chủ đề: Khái niệm nền tảng tuần 06
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Khái niệm nền tảng tuần 06:', result)
