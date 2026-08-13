"""pico-stem-10weeks · Tuần 05 · Bài 08.

Chủ đề: 1: Đọc Địa Chỉ IP & MAC Của Pico W
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - 1: Đọc Địa Chỉ IP & MAC Của Pico W:', result)
