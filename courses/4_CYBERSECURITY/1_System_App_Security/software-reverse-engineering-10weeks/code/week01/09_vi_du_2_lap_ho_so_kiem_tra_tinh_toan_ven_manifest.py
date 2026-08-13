"""software-reverse-engineering-10weeks · Tuần 01 · Bài 09.

Chủ đề: Ví dụ 2: Lập hồ sơ kiểm tra tính toàn vẹn (Manifest)
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('09 - Ví dụ 2: Lập hồ sơ kiểm tra tính toàn vẹn (Manifest):', result)
