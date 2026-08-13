"""drone-diy-10weeks · Tuần 01 · Bài 01.

Chủ đề: Mục Tiêu / Learning Objectives
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Mục Tiêu / Learning Objectives:', result)
