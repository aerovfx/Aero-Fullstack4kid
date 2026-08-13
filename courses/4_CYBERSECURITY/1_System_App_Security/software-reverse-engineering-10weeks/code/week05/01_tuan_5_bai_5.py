"""software-reverse-engineering-10weeks · Tuần 05 · Bài 01.

Chủ đề: Tuần 5 – Bài 5
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Tuần 5 – Bài 5:', result)
