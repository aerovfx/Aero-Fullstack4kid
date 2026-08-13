"""Tuần 10 · Bài 02: Chuẩn hóa event.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("02 - Chuẩn hóa event:", result)
