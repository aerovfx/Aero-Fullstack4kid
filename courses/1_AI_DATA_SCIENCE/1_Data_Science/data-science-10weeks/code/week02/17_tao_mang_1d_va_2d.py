"""data-science-10weeks · Tuần 02 · Bài 17.

Chủ đề: Tạo mảng 1D và 2D
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Tạo mảng 1D và 2D:', result)
