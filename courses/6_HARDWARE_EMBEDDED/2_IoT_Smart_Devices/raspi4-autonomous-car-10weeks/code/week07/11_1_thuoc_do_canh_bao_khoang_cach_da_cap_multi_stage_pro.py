"""raspi4-autonomous-car-10weeks · Tuần 07 · Bài 11.

Chủ đề: 1: Thước Đo Cảnh Báo Khoảng Cách Đa Cấp (Multi-Stage Proximity Warning)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Thước Đo Cảnh Báo Khoảng Cách Đa Cấp (Multi-Stage Proximity Warning):', result)
