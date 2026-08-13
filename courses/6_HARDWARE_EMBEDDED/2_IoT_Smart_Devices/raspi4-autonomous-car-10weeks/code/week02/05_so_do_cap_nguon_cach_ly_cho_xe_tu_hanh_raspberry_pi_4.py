"""raspi4-autonomous-car-10weeks · Tuần 02 · Bài 05.

Chủ đề: Sơ Đồ Cấp Nguồn Cách Ly Cho Xe Tự Hành Raspberry Pi 4
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Sơ Đồ Cấp Nguồn Cách Ly Cho Xe Tự Hành Raspberry Pi 4:', result)
