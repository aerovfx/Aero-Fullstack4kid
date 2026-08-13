"""software-reverse-engineering-10weeks · Tuần 02 · Bài 11.

Chủ đề: Quy trình Reverse Engineering chuẩn
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('11 - Quy trình Reverse Engineering chuẩn:', result)
