"""drone-diy-10weeks · Tuần 09 · Bài 15.

Chủ đề: Bài Về Nhà / Homework
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bài Về Nhà / Homework:', result)
