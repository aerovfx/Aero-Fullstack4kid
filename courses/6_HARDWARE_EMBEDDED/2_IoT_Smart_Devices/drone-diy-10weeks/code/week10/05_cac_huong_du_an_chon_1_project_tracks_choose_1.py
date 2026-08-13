"""drone-diy-10weeks · Tuần 10 · Bài 05.

Chủ đề: Các Hướng Dự Án (Chọn 1) / Project Tracks (Choose 1)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Các Hướng Dự Án (Chọn 1) / Project Tracks (Choose 1):', result)
