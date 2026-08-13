"""machine-learning-10weeks · Tuần 03 · Bài 09.

Chủ đề: Chuẩn bị môi trường tuần 03
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Chuẩn bị môi trường tuần 03:', result)
