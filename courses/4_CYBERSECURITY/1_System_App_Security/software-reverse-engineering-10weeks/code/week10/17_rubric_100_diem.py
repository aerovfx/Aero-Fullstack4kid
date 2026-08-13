"""software-reverse-engineering-10weeks · Tuần 10 · Bài 17.

Chủ đề: Rubric 100 điểm
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Rubric 100 điểm:', result)
