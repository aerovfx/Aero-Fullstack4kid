"""software-reverse-engineering-10weeks · Tuần 07 · Bài 15.

Chủ đề: code minh họa của tuần
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - code minh họa của tuần:', result)
