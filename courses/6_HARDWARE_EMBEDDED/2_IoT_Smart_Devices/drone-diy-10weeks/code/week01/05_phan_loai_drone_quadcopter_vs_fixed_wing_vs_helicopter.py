"""drone-diy-10weeks · Tuần 01 · Bài 05.

Chủ đề: Phân loại Drone / Quadcopter vs fixed-wing vs helicopter differences
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Phân loại Drone / Quadcopter vs fixed-wing vs helicopter differences:', result)
