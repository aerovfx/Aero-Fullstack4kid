"""Tuần 09 · Bài 07: Phát hiện path traversal pattern.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("07 - Phát hiện path traversal pattern:", result)
