"""software-reverse-engineering-10weeks · Tuần 06 · Bài 19.

Chủ đề: Bài tập và rubric
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Bài tập và rubric:', result)
