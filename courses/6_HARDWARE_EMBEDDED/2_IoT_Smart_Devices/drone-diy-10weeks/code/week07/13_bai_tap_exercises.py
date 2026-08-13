"""drone-diy-10weeks · Tuần 07 · Bài 13.

Chủ đề: Bài Tập / Exercises
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Bài Tập / Exercises:', result)
