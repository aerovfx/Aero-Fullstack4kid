"""Tuần 10 · Bài 17: Metrics MTTD MTTR.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from collections import Counter
records = ["tcp", "dns", "tcp", "icmp"]
result = dict(Counter(records))
assert result is not None
print("17 - Metrics MTTD MTTR:", result)
