"""crypto-10weeks · Tuần 10 · Bài 05.

Chủ đề: Kiến Trúc Mã Hóa Đầu-Cuối (E2EE Architecture)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Kiến Trúc Mã Hóa Đầu-Cuối (E2EE Architecture):', result)
