"""pico-stem-10weeks · Tuần 04 · Bài 09.

Chủ đề: 2: Bộ Hàm Di Chuyển Khung Xe 2 Bánh
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - 2: Bộ Hàm Di Chuyển Khung Xe 2 Bánh:', result)
