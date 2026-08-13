"""microbit-10weeks · Tuần 08 · Bài 05.

Chủ đề: Nguyên Lý Cảm Biến Hồng Ngoại Dò Đường & Thuật Toán Bám Vạch
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Nguyên Lý Cảm Biến Hồng Ngoại Dò Đường & Thuật Toán Bám Vạch:', result)
