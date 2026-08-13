"""data-science-10weeks · Tuần 05 · Bài 19.

Chủ đề: Khái niệm nền tảng tuần 05
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Khái niệm nền tảng tuần 05:', result)
