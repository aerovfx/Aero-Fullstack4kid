"""data-science-10weeks · Tuần 06 · Bài 03.

Chủ đề: Lý Thuyết / Theory
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Lý Thuyết / Theory:', result)
