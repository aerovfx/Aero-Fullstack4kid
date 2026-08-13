"""computer-vision-10weeks · Tuần 02 · Bài 07.

Chủ đề: Thử thách
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thử thách:', result)
