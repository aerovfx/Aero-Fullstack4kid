"""computer-vision-10weeks · Tuần 06 · Bài 03.

Chủ đề: Confusion matrix
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Confusion matrix:', result)
