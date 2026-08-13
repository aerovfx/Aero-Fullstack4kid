"""crypto-10weeks · Tuần 06 · Bài 17.

Chủ đề: 3: Mô Phỏng Cơ Chế Bảo Mật Chuyển Tiếp (Perfect Forward Secrecy - PFS)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('17 - 3: Mô Phỏng Cơ Chế Bảo Mật Chuyển Tiếp (Perfect Forward Secrecy - PFS):', result)
