"""crypto-10weeks · Tuần 07 · Bài 13.

Chủ đề: 1: Module Ký Số & Xác Thực Hợp Đồng Ed25519 (Ed25519 Document Signer)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('13 - 1: Module Ký Số & Xác Thực Hợp Đồng Ed25519 (Ed25519 Document Signer):', result)
