"""crypto-10weeks · Tuần 02 · Bài 17.

Chủ đề: 3: Mô Phỏng Trực Quan Hóa Lỗi Mã Hóa Chế Độ ECB (ECB Image Visualizer)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 3: Mô Phỏng Trực Quan Hóa Lỗi Mã Hóa Chế Độ ECB (ECB Image Visualizer):', result)
