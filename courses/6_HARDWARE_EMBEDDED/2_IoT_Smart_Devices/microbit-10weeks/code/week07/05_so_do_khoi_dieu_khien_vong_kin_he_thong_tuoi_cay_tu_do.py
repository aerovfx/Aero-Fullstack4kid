"""microbit-10weeks · Tuần 07 · Bài 05.

Chủ đề: Sơ Đồ Khối Điều Khiển Vòng Kín Hệ Thống Tưới Cây Tự Động
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Sơ Đồ Khối Điều Khiển Vòng Kín Hệ Thống Tưới Cây Tự Động:', result)
