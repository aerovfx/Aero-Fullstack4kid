"""raspi4-autonomous-car-10weeks · Tuần 06 · Bài 05.

Chủ đề: Dải Màu HSV Cho Đèn Giao Thông & Biển Báo
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Dải Màu HSV Cho Đèn Giao Thông & Biển Báo:', result)
