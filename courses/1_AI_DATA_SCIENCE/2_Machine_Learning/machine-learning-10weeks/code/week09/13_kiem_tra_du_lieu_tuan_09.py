"""machine-learning-10weeks · Tuần 09 · Bài 13.

Chủ đề: Kiểm tra dữ liệu tuần 09
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Kiểm tra dữ liệu tuần 09:', result)
