"""Tuần 01 · Bài 08: Logging thay cho print.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Finding:
    rule: str
    severity: str
result = asdict(Finding("LAB-RULE", "medium"))
assert result is not None
print("08 - Logging thay cho print:", result)
