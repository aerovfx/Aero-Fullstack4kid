"""software-reverse-engineering-10weeks · Tuần 07 · Bài 05.

Chủ đề: Ma Trận Quản Lý Chứng Cứ (Evidence Index Table)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Ma Trận Quản Lý Chứng Cứ (Evidence Index Table):', result)
