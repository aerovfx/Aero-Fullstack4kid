"""machine-learning-10weeks · Tuần 09 · Bài 07.

Chủ đề: Khái niệm nền tảng tuần 09
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Khái niệm nền tảng tuần 09:', result)
