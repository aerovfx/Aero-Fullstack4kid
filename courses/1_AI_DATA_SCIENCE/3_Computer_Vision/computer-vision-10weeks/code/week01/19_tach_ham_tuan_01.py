"""computer-vision-10weeks · Tuần 01 · Bài 19.

Chủ đề: Tách hàm tuần 01
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Tách hàm tuần 01:', result)
