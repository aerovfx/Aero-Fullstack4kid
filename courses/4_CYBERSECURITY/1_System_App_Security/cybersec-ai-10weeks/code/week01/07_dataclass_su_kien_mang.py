"""Tuần 01 · Bài 07: Dataclass sự kiện mạng.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("07 - Dataclass sự kiện mạng:", result)
