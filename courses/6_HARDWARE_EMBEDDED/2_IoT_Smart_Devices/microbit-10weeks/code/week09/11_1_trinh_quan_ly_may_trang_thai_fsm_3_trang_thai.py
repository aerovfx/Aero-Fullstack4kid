"""microbit-10weeks · Tuần 09 · Bài 11.

Chủ đề: 1: Trình Quản Lý Máy Trạng Thái FSM 3 Trạng Thái
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - 1: Trình Quản Lý Máy Trạng Thái FSM 3 Trạng Thái:', result)
