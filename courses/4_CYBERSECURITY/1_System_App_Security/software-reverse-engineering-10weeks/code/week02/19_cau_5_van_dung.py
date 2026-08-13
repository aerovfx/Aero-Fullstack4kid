"""software-reverse-engineering-10weeks · Tuần 02 · Bài 19.

Chủ đề: Câu 5 (Vận dụng)
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Câu 5 (Vận dụng):', result)
