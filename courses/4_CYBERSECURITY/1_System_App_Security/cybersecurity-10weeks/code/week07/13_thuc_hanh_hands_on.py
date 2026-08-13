"""cybersecurity-10weeks · Tuần 07 · Bài 13.

Chủ đề: Thực Hành / Hands-On
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Thực Hành / Hands-On:', result)
