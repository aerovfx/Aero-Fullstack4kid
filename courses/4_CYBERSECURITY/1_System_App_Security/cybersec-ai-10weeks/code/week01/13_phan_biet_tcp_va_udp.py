"""Tuần 01 · Bài 13: Phân biệt TCP và UDP.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Finding:
    rule: str
    severity: str
result = asdict(Finding("LAB-RULE", "medium"))
assert result is not None
print("13 - Phân biệt TCP và UDP:", result)
