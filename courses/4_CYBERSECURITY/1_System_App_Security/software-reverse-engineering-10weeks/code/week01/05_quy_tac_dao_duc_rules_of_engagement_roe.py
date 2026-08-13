"""software-reverse-engineering-10weeks · Tuần 01 · Bài 05.

Chủ đề: Quy tắc Đạo đức & Rules of Engagement (RoE)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Quy tắc Đạo đức & Rules of Engagement (RoE):', result)
