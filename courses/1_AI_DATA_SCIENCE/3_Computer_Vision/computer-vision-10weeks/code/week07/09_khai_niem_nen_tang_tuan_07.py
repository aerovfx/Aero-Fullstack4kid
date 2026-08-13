"""computer-vision-10weeks · Tuần 07 · Bài 09.

Chủ đề: Khái niệm nền tảng tuần 07
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Khái niệm nền tảng tuần 07:', result)
