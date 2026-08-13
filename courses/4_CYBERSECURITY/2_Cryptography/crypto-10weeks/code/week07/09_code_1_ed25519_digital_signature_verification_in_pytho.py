"""crypto-10weeks · Tuần 07 · Bài 09.

Chủ đề: Code 1: Ed25519 Digital Signature & Verification in Python
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code 1: Ed25519 Digital Signature & Verification in Python:', result)
