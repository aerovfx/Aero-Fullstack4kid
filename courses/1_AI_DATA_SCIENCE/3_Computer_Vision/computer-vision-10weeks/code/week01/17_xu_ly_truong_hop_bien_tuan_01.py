"""computer-vision-10weeks · Tuần 01 · Bài 17.

Chủ đề: Xử lý trường hợp biên tuần 01
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Xử lý trường hợp biên tuần 01:', result)
