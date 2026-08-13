"""software-reverse-engineering-10weeks · Tuần 01 · Bài 01.

Chủ đề: Tuần 1 – Bài 1 & 2
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Tuần 1 – Bài 1 & 2:', result)
