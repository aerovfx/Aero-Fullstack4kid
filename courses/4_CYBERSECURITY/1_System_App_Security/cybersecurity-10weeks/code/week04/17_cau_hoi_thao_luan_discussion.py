"""cybersecurity-10weeks · Tuần 04 · Bài 17.

Chủ đề: Câu Hỏi Thảo Luận / Discussion
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - Câu Hỏi Thảo Luận / Discussion:', result)
