"""software-reverse-engineering-10weeks · Tuần 08 · Bài 13.

Chủ đề: Bài tập và rubric
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Bài tập và rubric:', result)
