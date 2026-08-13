"""software-reverse-engineering-10weeks · Tuần 04 · Bài 09.

Chủ đề: Ví dụ 1: Đặt Software Breakpoint tại điểm kiểm tra Serial
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Ví dụ 1: Đặt Software Breakpoint tại điểm kiểm tra Serial:', result)
