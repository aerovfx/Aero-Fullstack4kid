"""Tuần 06 · Bài 12: Ngưỡng sự kiện.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("12 - Ngưỡng sự kiện:", result)
