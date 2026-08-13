"""drone-diy-10weeks · Tuần 03 · Bài 09.

Chủ đề: Flight Controller deep dive
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Flight Controller deep dive:', result)
