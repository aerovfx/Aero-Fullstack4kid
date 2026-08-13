"""computer-vision-10weeks · Tuần 01 · Bài 11.

Chủ đề: Thuật ngữ quan trọng tuần 01
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Thuật ngữ quan trọng tuần 01:', result)
