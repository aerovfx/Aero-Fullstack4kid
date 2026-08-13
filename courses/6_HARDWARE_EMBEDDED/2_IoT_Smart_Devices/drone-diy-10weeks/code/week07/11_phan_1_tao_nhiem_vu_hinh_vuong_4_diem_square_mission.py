"""drone-diy-10weeks · Tuần 07 · Bài 11.

Chủ đề: Phần 1: Tạo Nhiệm Vụ Hình Vuông 4 Điểm (Square Mission)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Phần 1: Tạo Nhiệm Vụ Hình Vuông 4 Điểm (Square Mission):', result)
