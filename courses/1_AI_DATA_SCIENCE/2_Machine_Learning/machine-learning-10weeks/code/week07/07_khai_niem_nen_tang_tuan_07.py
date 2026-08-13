"""machine-learning-10weeks · Tuần 07 · Bài 07.

Chủ đề: Khái niệm nền tảng tuần 07
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Khái niệm nền tảng tuần 07:', result)
