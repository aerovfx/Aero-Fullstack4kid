"""computer-vision-10weeks · Tuần 06 · Bài 07.

Chủ đề: Khởi động và mục tiêu tuần 06
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Khởi động và mục tiêu tuần 06:', result)
