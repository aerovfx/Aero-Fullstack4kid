"""raspi4-autonomous-car-10weeks · Tuần 10 · Bài 09.

Chủ đề: Đánh Giá Capstone & Capstone Race Rubric
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Đánh Giá Capstone & Capstone Race Rubric:', result)
