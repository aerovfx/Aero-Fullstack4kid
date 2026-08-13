"""cybersecurity-10weeks · Tuần 01 · Bài 13.

Chủ đề: Đánh Giá / Assessment Rubric Table
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Đánh Giá / Assessment Rubric Table:', result)
