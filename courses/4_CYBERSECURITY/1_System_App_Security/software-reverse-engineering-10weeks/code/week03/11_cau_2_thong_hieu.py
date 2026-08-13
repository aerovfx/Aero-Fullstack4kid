"""software-reverse-engineering-10weeks · Tuần 03 · Bài 11.

Chủ đề: Câu 2 (Thông hiểu)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Câu 2 (Thông hiểu):', result)
