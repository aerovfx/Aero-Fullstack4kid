"""machine-learning-10weeks · Tuần 01 · Bài 11.

Chủ đề: Cấu trúc chương trình tuần 01
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Cấu trúc chương trình tuần 01:', result)
