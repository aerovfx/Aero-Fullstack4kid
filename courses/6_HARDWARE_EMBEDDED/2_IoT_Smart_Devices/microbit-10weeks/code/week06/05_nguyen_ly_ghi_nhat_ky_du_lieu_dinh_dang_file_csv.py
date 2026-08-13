"""microbit-10weeks · Tuần 06 · Bài 05.

Chủ đề: Nguyên Lý Ghi Nhật Ký Dữ Liệu & Định Dạng File CSV
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Nguyên Lý Ghi Nhật Ký Dữ Liệu & Định Dạng File CSV:', result)
