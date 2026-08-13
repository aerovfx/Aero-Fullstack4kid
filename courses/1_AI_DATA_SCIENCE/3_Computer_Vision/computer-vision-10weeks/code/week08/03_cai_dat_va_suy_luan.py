"""computer-vision-10weeks · Tuần 08 · Bài 03.

Chủ đề: Cài đặt và suy luận
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Cài đặt và suy luận:', result)
