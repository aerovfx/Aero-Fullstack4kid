"""drone-diy-10weeks · Tuần 02 · Bài 05.

Chủ đề: Frame materials
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Frame materials:', result)
