"""crypto-10weeks · Tuần 03 · Bài 17.

Chủ đề: 3: Mô Phỏng Tấn Công Tái Sử Dụng Nonce (Nonce Reuse Attack Simulation)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 3: Mô Phỏng Tấn Công Tái Sử Dụng Nonce (Nonce Reuse Attack Simulation):', result)
