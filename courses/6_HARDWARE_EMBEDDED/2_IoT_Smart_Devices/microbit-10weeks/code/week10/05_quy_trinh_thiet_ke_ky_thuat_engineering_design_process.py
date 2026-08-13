"""microbit-10weeks · Tuần 10 · Bài 05.

Chủ đề: Quy Trình Thiết Kế Kỹ Thuật (Engineering Design Process)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Quy Trình Thiết Kế Kỹ Thuật (Engineering Design Process):', result)
