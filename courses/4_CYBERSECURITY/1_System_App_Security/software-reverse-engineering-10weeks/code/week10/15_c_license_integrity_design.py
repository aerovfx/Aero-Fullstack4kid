"""software-reverse-engineering-10weeks · Tuần 10 · Bài 15.

Chủ đề: C. License integrity design
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - C. License integrity design:', result)
