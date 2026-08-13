"""software-reverse-engineering-10weeks · Tuần 07 · Bài 13.

Chủ đề: Peer-review lab
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Peer-review lab:', result)
