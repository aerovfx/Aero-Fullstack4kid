"""drone-diy-10weeks · Tuần 05 · Bài 05.

Chủ đề: Cable management
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Cable management:', result)
