"""Tuần 01 · Bài 03: Chuẩn hóa địa chỉ IP.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Finding:
    rule: str
    severity: str
result = asdict(Finding("LAB-RULE", "medium"))
assert result is not None
print("03 - Chuẩn hóa địa chỉ IP:", result)
