"""computer-vision-10weeks · Tuần 04 · Bài 05.

Chủ đề: Đánh giá thay vì chỉ “nhìn thấy chạy”
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Đánh giá thay vì chỉ “nhìn thấy chạy”:', result)
