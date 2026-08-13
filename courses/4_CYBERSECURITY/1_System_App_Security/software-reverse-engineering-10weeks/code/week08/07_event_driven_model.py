"""software-reverse-engineering-10weeks · Tuần 08 · Bài 07.

Chủ đề: Event-driven model
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Event-driven model:', result)
