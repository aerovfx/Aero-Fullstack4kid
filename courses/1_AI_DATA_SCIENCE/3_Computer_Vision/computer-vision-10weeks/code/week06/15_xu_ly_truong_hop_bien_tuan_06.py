"""computer-vision-10weeks · Tuần 06 · Bài 15.

Chủ đề: Xử lý trường hợp biên tuần 06
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('15 - Xử lý trường hợp biên tuần 06:', result)
