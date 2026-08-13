"""computer-vision-10weeks · Tuần 05 · Bài 05.

Chủ đề: Overfitting và cách theo dõi
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Overfitting và cách theo dõi:', result)
