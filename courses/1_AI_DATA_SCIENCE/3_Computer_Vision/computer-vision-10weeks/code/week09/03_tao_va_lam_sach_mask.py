"""computer-vision-10weeks · Tuần 09 · Bài 03.

Chủ đề: Tạo và làm sạch mask
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Tạo và làm sạch mask:', result)
