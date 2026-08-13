"""software-reverse-engineering-10weeks · Tuần 07 · Bài 11.

Chủ đề: Hypothesis lifecycle
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Hypothesis lifecycle:', result)
