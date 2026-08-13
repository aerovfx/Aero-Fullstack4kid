"""crypto-10weeks · Tuần 04 · Bài 05.

Chủ đề: 3 Tính Chất Cốt Lõi Của Hàm Băm Mật Mã / Core Properties
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - 3 Tính Chất Cốt Lõi Của Hàm Băm Mật Mã / Core Properties:', result)
