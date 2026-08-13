"""computer-vision-10weeks · Tuần 07 · Bài 03.

Chủ đề: Giai đoạn 1: đóng băng backbone
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Giai đoạn 1: đóng băng backbone:', result)
