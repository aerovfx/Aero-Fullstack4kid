"""cybersecurity-10weeks · Tuần 03 · Bài 17.

Chủ đề: Các bước (Steps)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Các bước (Steps):', result)
