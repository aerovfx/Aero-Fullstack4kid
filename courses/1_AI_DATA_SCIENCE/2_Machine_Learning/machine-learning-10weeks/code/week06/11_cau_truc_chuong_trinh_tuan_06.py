"""machine-learning-10weeks · Tuần 06 · Bài 11.

Chủ đề: Cấu trúc chương trình tuần 06
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Cấu trúc chương trình tuần 06:', result)
