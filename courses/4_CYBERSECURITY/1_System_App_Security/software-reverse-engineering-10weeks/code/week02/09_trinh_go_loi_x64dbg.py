"""software-reverse-engineering-10weeks · Tuần 02 · Bài 09.

Chủ đề: Trình gỡ lỗi x64dbg
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Trình gỡ lỗi x64dbg:', result)
