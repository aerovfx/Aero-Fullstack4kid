"""cybersecurity-10weeks · Tuần 07 · Bài 07.

Chủ đề: Lý Thuyết / Theory
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Lý Thuyết / Theory:', result)
