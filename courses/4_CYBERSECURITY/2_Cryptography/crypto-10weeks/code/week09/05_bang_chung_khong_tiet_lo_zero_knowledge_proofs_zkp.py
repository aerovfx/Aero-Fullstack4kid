"""crypto-10weeks · Tuần 09 · Bài 05.

Chủ đề: Bằng Chứng Không Tiết Lộ (Zero-Knowledge Proofs - ZKP)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Bằng Chứng Không Tiết Lộ (Zero-Knowledge Proofs - ZKP):', result)
