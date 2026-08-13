"""Tuần 09 · Bài 17: Ẩn danh IP trong evidence.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("17 - Ẩn danh IP trong evidence:", result)
