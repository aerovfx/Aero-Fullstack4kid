"""software-reverse-engineering-10weeks · Tuần 02 · Bài 05.

Chủ đề: Ưu điểm của Static Analysis
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Ưu điểm của Static Analysis:', result)
