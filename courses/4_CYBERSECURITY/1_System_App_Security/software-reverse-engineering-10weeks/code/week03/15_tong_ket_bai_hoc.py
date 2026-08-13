"""software-reverse-engineering-10weeks · Tuần 03 · Bài 15.

Chủ đề: Tổng kết bài học
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Tổng kết bài học:', result)
