"""computer-vision-10weeks · Tuần 01 · Bài 07.

Chủ đề: Thử thách cuối buổi
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thử thách cuối buổi:', result)
