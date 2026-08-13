"""machine-learning-10weeks · Tuần 03 · Bài 01.

Chủ đề: Mục tiêu bài học
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Mục tiêu bài học:', result)
