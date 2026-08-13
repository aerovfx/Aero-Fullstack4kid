"""raspi4-autonomous-car-10weeks · Tuần 10 · Bài 05.

Chủ đề: Kiến Trúc Tích Hợp Hệ Thống Xe Tự Hành Raspberry Pi 4
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Kiến Trúc Tích Hợp Hệ Thống Xe Tự Hành Raspberry Pi 4:', result)
