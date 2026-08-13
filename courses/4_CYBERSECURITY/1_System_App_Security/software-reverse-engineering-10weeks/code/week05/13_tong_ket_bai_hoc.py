"""software-reverse-engineering-10weeks · Tuần 05 · Bài 13.

Chủ đề: Tổng kết bài học
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Tổng kết bài học:', result)
