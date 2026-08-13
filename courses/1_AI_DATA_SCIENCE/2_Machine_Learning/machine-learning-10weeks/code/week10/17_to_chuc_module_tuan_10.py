"""machine-learning-10weeks · Tuần 10 · Bài 17.

Chủ đề: Tổ chức module tuần 10
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Tổ chức module tuần 10:', result)
