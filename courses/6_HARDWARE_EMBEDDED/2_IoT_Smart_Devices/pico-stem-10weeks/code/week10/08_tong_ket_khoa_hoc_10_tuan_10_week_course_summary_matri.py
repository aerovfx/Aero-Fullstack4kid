"""pico-stem-10weeks · Tuần 10 · Bài 08.

Chủ đề: Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - Tổng Kết Khóa Học 10 Tuần / 10-Week Course Summary Matrix:', result)
