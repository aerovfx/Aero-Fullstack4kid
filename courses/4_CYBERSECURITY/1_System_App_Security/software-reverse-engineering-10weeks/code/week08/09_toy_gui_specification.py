"""software-reverse-engineering-10weeks · Tuần 08 · Bài 09.

Chủ đề: Toy GUI specification
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Toy GUI specification:', result)
