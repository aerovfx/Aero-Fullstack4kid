"""drone-diy-10weeks · Tuần 05 · Bài 09.

Chủ đề: Maiden flight protocol
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Maiden flight protocol:', result)
