"""software-reverse-engineering-10weeks · Tuần 03 · Bài 03.

Chủ đề: Vai trò các thanh ghi chính
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Vai trò các thanh ghi chính:', result)
