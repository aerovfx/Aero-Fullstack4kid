"""pico-stem-10weeks · Tuần 04 · Bài 08.

Chủ đề: 1: Quét Tự Động Động Cơ Servo SG90
"""
records = [{"name": "mau-a", "value": 12}, {"name": "mau-b", "value": 28}]
result = [r for r in records if r["value"] >= 20]
assert result is not None
print('08 - 1: Quét Tự Động Động Cơ Servo SG90:', result)
