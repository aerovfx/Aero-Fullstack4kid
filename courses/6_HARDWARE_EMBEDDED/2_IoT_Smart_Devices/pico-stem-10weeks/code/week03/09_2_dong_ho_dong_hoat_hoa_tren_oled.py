"""pico-stem-10weeks · Tuần 03 · Bài 09.

Chủ đề: 2: Đồng Hồ Đồng Hoạt Họa Trên OLED
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - 2: Đồng Hồ Đồng Hoạt Họa Trên OLED:', result)
