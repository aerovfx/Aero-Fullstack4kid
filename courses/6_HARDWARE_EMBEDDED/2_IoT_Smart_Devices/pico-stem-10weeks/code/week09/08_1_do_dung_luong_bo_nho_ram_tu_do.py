"""pico-stem-10weeks · Tuần 09 · Bài 08.

Chủ đề: 1: Đo Dung Lượng Bộ Nhớ RAM Tự Do
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - 1: Đo Dung Lượng Bộ Nhớ RAM Tự Do:', result)
