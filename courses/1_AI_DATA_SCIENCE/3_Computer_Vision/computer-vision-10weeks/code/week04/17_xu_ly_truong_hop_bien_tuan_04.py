"""computer-vision-10weeks · Tuần 04 · Bài 17.

Chủ đề: Xử lý trường hợp biên tuần 04
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Xử lý trường hợp biên tuần 04:', result)
