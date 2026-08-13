"""data-science-10weeks · Tuần 09 · Bài 17.

Chủ đề: Nội dung bài học: chọn biểu đồ phù hợp
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Nội dung bài học: chọn biểu đồ phù hợp:', result)
