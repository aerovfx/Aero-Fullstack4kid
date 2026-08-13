"""data-science-10weeks · Tuần 09 · Bài 19.

Chủ đề: Khởi động và mục tiêu tuần 09
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Khởi động và mục tiêu tuần 09:', result)
