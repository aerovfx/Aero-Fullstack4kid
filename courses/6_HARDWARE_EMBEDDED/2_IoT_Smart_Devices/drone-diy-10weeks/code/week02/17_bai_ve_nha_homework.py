"""drone-diy-10weeks · Tuần 02 · Bài 17.

Chủ đề: Bài Về Nhà / Homework
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Bài Về Nhà / Homework:', result)
