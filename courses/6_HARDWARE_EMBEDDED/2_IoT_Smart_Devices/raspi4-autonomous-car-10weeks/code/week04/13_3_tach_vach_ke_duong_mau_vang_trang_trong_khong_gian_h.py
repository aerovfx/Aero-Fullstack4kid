"""raspi4-autonomous-car-10weeks · Tuần 04 · Bài 13.

Chủ đề: 3: Tách Vạch Kẻ Đường Màu Vàng & Trắng Trong Không Gian HSV
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 3: Tách Vạch Kẻ Đường Màu Vàng & Trắng Trong Không Gian HSV:', result)
