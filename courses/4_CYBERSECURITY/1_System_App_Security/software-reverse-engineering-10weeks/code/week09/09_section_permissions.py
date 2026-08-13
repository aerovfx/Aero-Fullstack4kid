"""software-reverse-engineering-10weeks · Tuần 09 · Bài 09.

Chủ đề: Section permissions
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Section permissions:', result)
