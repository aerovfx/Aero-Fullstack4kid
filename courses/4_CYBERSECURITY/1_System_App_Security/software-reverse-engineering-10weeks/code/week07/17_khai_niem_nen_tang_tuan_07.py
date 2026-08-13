"""software-reverse-engineering-10weeks · Tuần 07 · Bài 17.

Chủ đề: Khái niệm nền tảng tuần 07
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Khái niệm nền tảng tuần 07:', result)
