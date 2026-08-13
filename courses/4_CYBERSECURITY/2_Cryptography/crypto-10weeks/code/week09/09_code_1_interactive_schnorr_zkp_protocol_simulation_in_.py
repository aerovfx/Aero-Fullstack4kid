"""crypto-10weeks · Tuần 09 · Bài 09.

Chủ đề: Code 1: Interactive Schnorr ZKP Protocol Simulation in Python
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Code 1: Interactive Schnorr ZKP Protocol Simulation in Python:', result)
