"""software-reverse-engineering-10weeks · Tuần 06 · Bài 17.

Chủ đề: Regression matrix
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Regression matrix:', result)
