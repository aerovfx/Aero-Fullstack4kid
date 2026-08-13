"""data-science-10weeks · Tuần 04 · Bài 15.

Chủ đề: Bài lab cụ thể
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Bài lab cụ thể:', result)
