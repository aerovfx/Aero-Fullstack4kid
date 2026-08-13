"""software-reverse-engineering-10weeks · Tuần 02 · Bài 07.

Chủ đề: Thao tác gỡ lỗi cơ bản trong Dynamic Analysis
"""
from dataclasses import asdict, dataclass
@dataclass(frozen=True)
class Record:
    lesson: str
    completed: bool
result = asdict(Record("lab", True))
assert result is not None
print('07 - Thao tác gỡ lỗi cơ bản trong Dynamic Analysis:', result)
