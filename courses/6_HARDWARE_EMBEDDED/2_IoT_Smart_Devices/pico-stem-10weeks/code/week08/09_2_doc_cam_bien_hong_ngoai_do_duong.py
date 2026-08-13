"""pico-stem-10weeks · Tuần 08 · Bài 09.

Chủ đề: 2: Đọc Cảm Biến Hồng Ngoại Dò Đường
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - 2: Đọc Cảm Biến Hồng Ngoại Dò Đường:', result)
