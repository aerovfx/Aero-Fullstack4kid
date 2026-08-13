"""cybersecurity-10weeks · Tuần 04 · Bài 09.

Chủ đề: Lập trình Phòng thủ & C++ An toàn (Defensive Programming & Safe C++)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Lập trình Phòng thủ & C++ An toàn (Defensive Programming & Safe C++):', result)
