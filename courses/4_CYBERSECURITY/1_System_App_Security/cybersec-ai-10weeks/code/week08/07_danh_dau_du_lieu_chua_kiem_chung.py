"""Tuần 08 · Bài 07: Đánh dấu dữ liệu chưa kiểm chứng.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("07 - Đánh dấu dữ liệu chưa kiểm chứng:", result)
