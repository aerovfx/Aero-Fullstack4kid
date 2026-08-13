"""raspi4-autonomous-car-10weeks · Tuần 04 · Bài 17.

Chủ đề: Đánh Giá / Assessment Rubric
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Đánh Giá / Assessment Rubric:', result)
