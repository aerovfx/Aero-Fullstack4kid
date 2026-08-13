"""pico-stem-10weeks · Tuần 01 · Bài 12.

Chủ đề: 1: Trình Chớp Tắt LED Trái Tim Onboard
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('12 - 1: Trình Chớp Tắt LED Trái Tim Onboard:', result)
