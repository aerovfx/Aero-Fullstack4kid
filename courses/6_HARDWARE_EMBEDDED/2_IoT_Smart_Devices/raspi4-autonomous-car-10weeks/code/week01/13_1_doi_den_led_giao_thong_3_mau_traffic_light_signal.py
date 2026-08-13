"""raspi4-autonomous-car-10weeks · Tuần 01 · Bài 13.

Chủ đề: 1: Đội Đèn LED Giao Thông 3 Màu (Traffic Light Signal)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 1: Đội Đèn LED Giao Thông 3 Màu (Traffic Light Signal):', result)
