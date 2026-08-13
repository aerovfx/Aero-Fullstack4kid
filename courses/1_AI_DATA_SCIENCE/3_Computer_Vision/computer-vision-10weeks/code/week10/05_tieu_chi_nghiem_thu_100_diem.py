"""computer-vision-10weeks · Tuần 10 · Bài 05.

Chủ đề: Tiêu chí nghiệm thu (100 điểm)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Tiêu chí nghiệm thu (100 điểm):', result)
