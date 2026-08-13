"""drone-diy-10weeks · Tuần 08 · Bài 15.

Chủ đề: Tối Ưu Xử Lý Thời Gian Thực (Real-Time Processing Optimization)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Tối Ưu Xử Lý Thời Gian Thực (Real-Time Processing Optimization):', result)
