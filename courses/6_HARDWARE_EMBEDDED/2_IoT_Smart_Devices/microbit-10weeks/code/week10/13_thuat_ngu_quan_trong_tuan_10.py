"""microbit-10weeks · Tuần 10 · Bài 13.

Chủ đề: Thuật ngữ quan trọng tuần 10
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Thuật ngữ quan trọng tuần 10:', result)
