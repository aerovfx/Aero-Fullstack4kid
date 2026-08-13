"""software-reverse-engineering-10weeks · Tuần 04 · Bài 01.

Chủ đề: Tuần 4 – Bài 4
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Tuần 4 – Bài 4:', result)
