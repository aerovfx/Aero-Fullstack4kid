"""software-reverse-engineering-10weeks · Tuần 01 · Bài 16.

Chủ đề: Mục tiêu bài học
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('16 - Mục tiêu bài học:', result)
