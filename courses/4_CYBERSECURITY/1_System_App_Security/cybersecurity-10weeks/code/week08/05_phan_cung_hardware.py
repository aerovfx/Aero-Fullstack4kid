"""cybersecurity-10weeks · Tuần 08 · Bài 05.

Chủ đề: Phần Cứng / Hardware
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Phần Cứng / Hardware:', result)
