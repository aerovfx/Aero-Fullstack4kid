"""computer-vision-10weeks · Tuần 08 · Bài 05.

Chủ đề: Chuẩn dữ liệu tự huấn luyện
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Chuẩn dữ liệu tự huấn luyện:', result)
