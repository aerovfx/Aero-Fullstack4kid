"""computer-vision-10weeks · Tuần 01 · Bài 05.

Chủ đề: Đọc webcam theo thời gian thực
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Đọc webcam theo thời gian thực:', result)
