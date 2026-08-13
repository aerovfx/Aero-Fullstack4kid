"""computer-vision-10weeks · Tuần 05 · Bài 19.

Chủ đề: Tổ chức module tuần 05
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('19 - Tổ chức module tuần 05:', result)
