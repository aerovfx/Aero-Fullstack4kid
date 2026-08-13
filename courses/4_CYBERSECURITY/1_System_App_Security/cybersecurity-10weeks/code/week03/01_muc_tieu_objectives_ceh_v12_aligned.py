"""cybersecurity-10weeks · Tuần 03 · Bài 01.

Chủ đề: Mục Tiêu / Objectives (CEH v12 Aligned)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Mục Tiêu / Objectives (CEH v12 Aligned):', result)
