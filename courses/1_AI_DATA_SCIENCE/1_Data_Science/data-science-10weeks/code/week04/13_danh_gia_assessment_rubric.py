"""data-science-10weeks · Tuần 04 · Bài 13.

Chủ đề: Đánh Giá / Assessment Rubric
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Đánh Giá / Assessment Rubric:', result)
