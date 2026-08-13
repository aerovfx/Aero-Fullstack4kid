"""software-reverse-engineering-10weeks · Tuần 10 · Bài 05.

Chủ đề: Mô hình Xác thực License bằng Chữ ký số Ed25519
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Mô hình Xác thực License bằng Chữ ký số Ed25519:', result)
