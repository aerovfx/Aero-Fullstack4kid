"""Tuần 09 · Bài 08: Phát hiện SQL string concat.

Ví dụ phòng thủ, chạy offline với dữ liệu giả lập; không quét hay gọi dịch vụ ngoài.
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Finding:
    rule: str
    severity: str
result = asdict(Finding("LAB-RULE", "medium"))
assert result is not None
print("08 - Phát hiện SQL string concat:", result)
