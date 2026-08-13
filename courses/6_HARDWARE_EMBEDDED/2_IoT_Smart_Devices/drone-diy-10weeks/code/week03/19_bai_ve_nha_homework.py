"""drone-diy-10weeks · Tuần 03 · Bài 19.

Chủ đề: Bài Về Nhà / Homework
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Bài Về Nhà / Homework:', result)
