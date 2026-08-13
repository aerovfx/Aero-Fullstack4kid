"""microbit-10weeks · Tuần 09 · Bài 19.

Chủ đề: code minh họa của tuần
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - code minh họa của tuần:', result)
