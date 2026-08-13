"""drone-diy-10weeks · Tuần 06 · Bài 11.

Chủ đề: Bài Tập / Exercises
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Bài Tập / Exercises:', result)
