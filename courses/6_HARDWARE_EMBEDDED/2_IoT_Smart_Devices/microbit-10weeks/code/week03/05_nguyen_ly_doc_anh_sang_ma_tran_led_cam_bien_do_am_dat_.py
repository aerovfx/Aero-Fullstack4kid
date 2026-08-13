"""microbit-10weeks · Tuần 03 · Bài 05.

Chủ đề: Nguyên Lý Đọc Ánh Sáng Ma Trận LED & Cảm Biến Độ Ẩm Đất Dung Kháng
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Nguyên Lý Đọc Ánh Sáng Ma Trận LED & Cảm Biến Độ Ẩm Đất Dung Kháng:', result)
