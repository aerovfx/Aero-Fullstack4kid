"""pico-stem-10weeks · Tuần 07 · Bài 17.

Chủ đề: Khởi động và mục tiêu tuần 07
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Khởi động và mục tiêu tuần 07:', result)
