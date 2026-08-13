"""drone-diy-10weeks · Tuần 08 · Bài 09.

Chủ đề: Các Cơ Bản Về OpenCV (OpenCV Basics)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Các Cơ Bản Về OpenCV (OpenCV Basics):', result)
