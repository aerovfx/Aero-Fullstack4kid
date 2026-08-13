"""computer-vision-10weeks · Tuần 10 · Bài 07.

Chủ đề: Thử thách cuối khóa
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thử thách cuối khóa:', result)
