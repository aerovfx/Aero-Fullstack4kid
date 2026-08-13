"""drone-diy-10weeks · Tuần 06 · Bài 07.

Chủ đề: MAVProxy & Kết Nối / MAVProxy & Connection
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - MAVProxy & Kết Nối / MAVProxy & Connection:', result)
