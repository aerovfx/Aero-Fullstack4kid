"""crypto-10weeks · Tuần 01 · Bài 17.

Chủ đề: 2: Cài Đặt Trình Giải Mã Vigenère (Vigenère Decryptor)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 2: Cài Đặt Trình Giải Mã Vigenère (Vigenère Decryptor):', result)
