"""crypto-10weeks · Tuần 05 · Bài 03.

Chủ đề: English
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - English:', result)
