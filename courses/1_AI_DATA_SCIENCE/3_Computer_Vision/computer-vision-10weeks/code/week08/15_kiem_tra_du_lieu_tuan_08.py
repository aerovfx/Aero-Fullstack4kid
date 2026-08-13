"""computer-vision-10weeks · Tuần 08 · Bài 15.

Chủ đề: Kiểm tra dữ liệu tuần 08
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Kiểm tra dữ liệu tuần 08:', result)
