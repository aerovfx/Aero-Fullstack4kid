"""data-science-10weeks · Tuần 04 · Bài 17.

Chủ đề: Cắt lát mảng
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Cắt lát mảng:', result)
