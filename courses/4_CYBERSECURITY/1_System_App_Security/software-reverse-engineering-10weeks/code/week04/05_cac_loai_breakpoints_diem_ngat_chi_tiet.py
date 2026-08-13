"""software-reverse-engineering-10weeks · Tuần 04 · Bài 05.

Chủ đề: Các Loại Breakpoints (Điểm Ngắt) Chi Tiết
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Các Loại Breakpoints (Điểm Ngắt) Chi Tiết:', result)
