"""software-reverse-engineering-10weeks · Tuần 09 · Bài 17.

Chủ đề: Thuật ngữ quan trọng tuần 09
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Thuật ngữ quan trọng tuần 09:', result)
