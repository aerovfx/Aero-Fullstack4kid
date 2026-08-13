"""software-reverse-engineering-10weeks · Tuần 02 · Bài 01.

Chủ đề: Tuần 2 – Bài 2
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Tuần 2 – Bài 2:', result)
