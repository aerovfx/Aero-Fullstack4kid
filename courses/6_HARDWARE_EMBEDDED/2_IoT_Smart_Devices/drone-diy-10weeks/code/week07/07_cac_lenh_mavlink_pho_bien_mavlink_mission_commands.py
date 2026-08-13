"""drone-diy-10weeks · Tuần 07 · Bài 07.

Chủ đề: Các Lệnh MAVLink Phổ Biến (MAVLink Mission Commands)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Các Lệnh MAVLink Phổ Biến (MAVLink Mission Commands):', result)
