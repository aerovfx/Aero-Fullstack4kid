"""computer-vision-10weeks · Tuần 06 · Bài 13.

Chủ đề: Ví dụ cơ bản tuần 06
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Ví dụ cơ bản tuần 06:', result)
