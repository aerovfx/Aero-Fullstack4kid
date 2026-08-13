"""crypto-10weeks · Tuần 06 · Bài 05.

Chủ đề: Tại Sao ECC Lại Vượt Trội Hơn RSA? / Why ECC Supersedes RSA
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Tại Sao ECC Lại Vượt Trội Hơn RSA? / Why ECC Supersedes RSA:', result)
