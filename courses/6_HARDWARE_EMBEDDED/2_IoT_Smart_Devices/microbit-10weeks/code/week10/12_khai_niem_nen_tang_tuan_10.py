"""microbit-10weeks · Tuần 10 · Bài 12.

Chủ đề: Khái niệm nền tảng tuần 10
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - Khái niệm nền tảng tuần 10:', result)
