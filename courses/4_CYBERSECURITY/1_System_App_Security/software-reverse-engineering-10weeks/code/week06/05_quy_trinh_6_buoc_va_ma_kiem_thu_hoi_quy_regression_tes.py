"""software-reverse-engineering-10weeks · Tuần 06 · Bài 05.

Chủ đề: Quy trình 6 Bước Vá Mã & Kiểm Thử Hồi Quy (Regression Testing)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Quy trình 6 Bước Vá Mã & Kiểm Thử Hồi Quy (Regression Testing):', result)
