"""raspi4-autonomous-car-10weeks · Tuần 09 · Bài 05.

Chủ đề: Kiến Trúc Mạng Truyền Thông ROS 2 Nodes & Topics
"""
from collections import Counter
records = ["basic", "practice", "basic", "review"]
result = dict(Counter(records))
assert result is not None
print('05 - Kiến Trúc Mạng Truyền Thông ROS 2 Nodes & Topics:', result)
