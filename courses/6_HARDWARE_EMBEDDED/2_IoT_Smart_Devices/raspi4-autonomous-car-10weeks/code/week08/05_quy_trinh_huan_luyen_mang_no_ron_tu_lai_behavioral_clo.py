"""raspi4-autonomous-car-10weeks · Tuần 08 · Bài 05.

Chủ đề: Quy Trình Huấn Luyện Mạng Nơ-ron Tự Lái Behavioral Cloning
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Quy Trình Huấn Luyện Mạng Nơ-ron Tự Lái Behavioral Cloning:', result)
