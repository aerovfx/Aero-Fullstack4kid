"""microbit-10weeks · Tuần 10 · Bài 11.

Chủ đề: Khởi động và mục tiêu tuần 10
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Khởi động và mục tiêu tuần 10:', result)
