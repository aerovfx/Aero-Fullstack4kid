"""software-reverse-engineering-10weeks · Tuần 02 · Bài 15.

Chủ đề: Câu 1 (Nhận biết)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Câu 1 (Nhận biết):', result)
