"""computer-vision-10weeks · Tuần 03 · Bài 05.

Chủ đề: Lỗi thường gặp
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Lỗi thường gặp:', result)
