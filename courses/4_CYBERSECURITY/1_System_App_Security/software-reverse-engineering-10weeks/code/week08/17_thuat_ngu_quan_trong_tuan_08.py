"""software-reverse-engineering-10weeks · Tuần 08 · Bài 17.

Chủ đề: Thuật ngữ quan trọng tuần 08
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Thuật ngữ quan trọng tuần 08:', result)
