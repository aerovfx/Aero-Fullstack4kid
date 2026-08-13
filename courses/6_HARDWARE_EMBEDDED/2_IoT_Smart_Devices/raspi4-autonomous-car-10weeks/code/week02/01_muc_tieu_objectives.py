"""raspi4-autonomous-car-10weeks · Tuần 02 · Bài 01.

Chủ đề: Mục Tiêu / Objectives
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('01 - Mục Tiêu / Objectives:', result)
