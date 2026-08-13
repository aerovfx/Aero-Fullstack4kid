"""drone-diy-10weeks · Tuần 10 · Bài 11.

Chủ đề: Danh Sách Kiểm Tra An Toàn / Safety Checklist for Final Demo Day
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Danh Sách Kiểm Tra An Toàn / Safety Checklist for Final Demo Day:', result)
