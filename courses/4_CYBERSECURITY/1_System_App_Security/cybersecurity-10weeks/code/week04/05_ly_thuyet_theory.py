"""cybersecurity-10weeks · Tuần 04 · Bài 05.

Chủ đề: Lý Thuyết / Theory
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Lý Thuyết / Theory:', result)
