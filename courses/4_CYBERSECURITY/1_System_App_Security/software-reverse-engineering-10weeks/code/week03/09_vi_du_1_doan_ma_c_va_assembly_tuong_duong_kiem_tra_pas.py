"""software-reverse-engineering-10weeks · Tuần 03 · Bài 09.

Chủ đề: Ví dụ 1: Đoạn mã C và Assembly tương đương kiểm tra Password
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Ví dụ 1: Đoạn mã C và Assembly tương đương kiểm tra Password:', result)
