"""software-reverse-engineering-10weeks · Tuần 04 · Bài 16.

Chủ đề: Tổng kết bài học
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Tổng kết bài học:', result)
