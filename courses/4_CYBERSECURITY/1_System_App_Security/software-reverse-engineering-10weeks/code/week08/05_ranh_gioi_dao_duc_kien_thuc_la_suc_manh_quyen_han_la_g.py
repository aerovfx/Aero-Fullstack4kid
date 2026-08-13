"""software-reverse-engineering-10weeks · Tuần 08 · Bài 05.

Chủ đề: Ranh giới đạo đức: Kiến thức là sức mạnh, quyền hạn là giới hạn
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Ranh giới đạo đức: Kiến thức là sức mạnh, quyền hạn là giới hạn:', result)
