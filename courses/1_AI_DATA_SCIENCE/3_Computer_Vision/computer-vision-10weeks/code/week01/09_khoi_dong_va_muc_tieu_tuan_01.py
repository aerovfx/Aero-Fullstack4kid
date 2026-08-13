"""computer-vision-10weeks · Tuần 01 · Bài 09.

Chủ đề: Khởi động và mục tiêu tuần 01
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Khởi động và mục tiêu tuần 01:', result)
