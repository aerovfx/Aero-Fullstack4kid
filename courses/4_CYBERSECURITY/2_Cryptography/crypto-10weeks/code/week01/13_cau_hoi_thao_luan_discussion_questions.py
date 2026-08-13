"""crypto-10weeks · Tuần 01 · Bài 13.

Chủ đề: Câu Hỏi Thảo Luận / Discussion Questions
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - Câu Hỏi Thảo Luận / Discussion Questions:', result)
