"""software-reverse-engineering-10weeks · Tuần 01 · Bài 03.

Chủ đề: Phân biệt mục đích sử dụng
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('03 - Phân biệt mục đích sử dụng:', result)
