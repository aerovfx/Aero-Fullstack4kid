"""crypto-10weeks · Tuần 04 · Bài 17.

Chủ đề: 3: Mô Phỏng Tấn Công Khái Niệm Timing Side-Channel Trên Phép So Sánh HMAC
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 3: Mô Phỏng Tấn Công Khái Niệm Timing Side-Channel Trên Phép So Sánh HMAC:', result)
