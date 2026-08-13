"""computer-vision-10weeks · Tuần 05 · Bài 09.

Chủ đề: Khái niệm nền tảng tuần 05
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Khái niệm nền tảng tuần 05:', result)
